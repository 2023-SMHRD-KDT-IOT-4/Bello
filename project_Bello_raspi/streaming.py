# streaming.py
import io
import logging
import os
import socketserver
from http import server
from threading import Condition
import threading
import wave
import pyaudio
import cv2
from datetime import datetime
from picamera2 import Picamera2
from picamera2.encoders import JpegEncoder
from picamera2.outputs import FileOutput
from flask import Flask, render_template, Response
from flask_socketio import SocketIO

app = Flask(__name__)
socketio = SocketIO(app)

# Get the directory of the script
script_dir = os.path.dirname(os.path.realpath(__file__))

# Load the index.html template
with open(os.path.join(script_dir, 'templates', 'index.html'), 'r') as f:
    PAGE = f.read()

class VideoStream:
    def __init__(self, max_files=10):
        self.max_files = max_files
        self.file_count = self.get_latest_file_count() + 1
        self.video_writer = self.create_video_writer()

    def get_latest_file_count(self):
        files = [f for f in os.listdir() if f.startswith("video_") and f.endswith(".avi")]
        if files:
            latest_file = max(files, key=lambda x: int(x.split('_')[1].split('.')[0]))
            return int(latest_file.split('_')[1].split('.')[0])
        else:
            return 0

    def create_video_writer(self):
        file_name = f'video_{self.file_count}.avi'
        return cv2.VideoWriter(file_name, cv2.VideoWriter_fourcc(*'XVID'), 20.0, (640, 480))

    def write_frame(self, frame):
        if self.file_count > self.max_files:
            self.release()
            self.file_count = 1
            self.video_writer = self.create_video_writer()
        self.video_writer.write(frame)
        self.file_count += 1

    def release(self):
        self.video_writer.release()
        self.delete_old_files()

    def delete_old_files(self):
        #files = [f for f in os.listdir() if f.startswith("video_") and f.endswith(".avi")]
        #files.sort(key=lambda x: int(x.split('_')[1].split('.')[0]), reverse=True)
        #num_files_to_delete = max(0, len(files) - self.max_files)
        #for i in range(num_files_to_delete):
        #    file_to_delete = files[i]
        #    os.remove(file_to_delete)
        pass
    
class AudioStream:
    def __init__(self, device_index=2):
        self.p = pyaudio.PyAudio()
        self.stream = self.p.open(format=pyaudio.paInt16,
                                  channels=1,
                                  rate=48000,
                                  input=True,
                                  frames_per_buffer=1024,
                                  input_device_index=device_index)

    def read_audio(self):
        while True:
            yield self.stream.read(1024)

def create_audio_file():
    wf = wave.open(f'audio_{datetime.now().strftime("%Y%m%d%H%M%S")}.wav', 'wb')
    wf.setnchannels(1)
    wf.setsampwidth(2)
    wf.setframerate(44100)
    return wf

def update_audio_file(wf, audio_data):
    wf.writeframes(audio_data)

def close_audio_file(wf):
    wf.close()

class StreamingOutput(io.BufferedIOBase):
    def __init__(self):
        self.frame = None
        self.condition = Condition()
        #self.video_stream = VideoStream()
        # self.ws_server = WebSocketServer('172.30.1.6', 8001)  # WebSocketServer 추가

    def write(self, buf):
        with self.condition:
            self.frame = buf
            self.condition.notify_all()
            # Save the frame to video
            #frame_array = np.frombuffer(buf, dtype=np.uint8)
            #frame = cv2.imdecode(frame_array, cv2.IMREAD_COLOR)
            #self.video_stream.write_frame(frame)
            # Send the frame to WebSocket clients
            # asyncio.run(self.ws_server.send_message(buf))
            
    def release(self):
        # Uncomment the following line to release the video writer
        #self.video_stream.release()
        pass
        

class StreamingHandler(server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(301)
            self.send_header('Location', '/index.html')
            self.end_headers()
        elif self.path == '/index.html':
            content = PAGE.encode('utf-8')
            self.send_response(200)
            self.send_header('Content-Type', 'text/html')
            self.send_header('Content-Length', len(content))
            self.end_headers()
            self.wfile.write(content)
        elif self.path == '/stream.mjpg':
            self.send_response(200)
            self.send_header('Age', 0)
            self.send_header('Cache-Control', 'no-cache, private')
            self.send_header('Pragma', 'no-cache')
            self.send_header('Content-Type', 'multipart/x-mixed-replace; boundary=FRAME')
            self.end_headers()
            try:
                while True:
                    with output.condition:
                        output.condition.wait()
                        frame = output.frame
                    self.wfile.write(b'--FRAME\r\n')
                    self.send_header('Content-Type', 'image/jpeg')
                    self.send_header('Content-Length', len(frame))
                    self.end_headers()
                    self.wfile.write(frame)
                    self.wfile.write(b'\r\n')
            except Exception as e:
                logging.warning(
                    'Removed streaming client %s: %s',
                    self.client_address, str(e))
        elif self.path == '/audio.wav':
            self.send_response(200)
            self.send_header('Content-Type', 'audio/wav')
            self.end_headers()

            # audio_stream = AudioStream()
            # wf = create_audio_file()
            #save_audio = False  # WAV 파일에 저장할지 여부를 결정하는 플래그

            try:
                pass

            except Exception as e:
                logging.warning(
                    'Removed audio streaming client %s: %s',
                    self.client_address, str(e))
            finally:
                # close_audio_file(wf)  # 주석 처리: WAV 파일 닫기  # WAV 파일 닫기
                pass

        else:
            self.send_error(404)
            self.end_headers()

class StreamingServer(socketserver.ThreadingMixIn, server.HTTPServer):
    allow_reuse_address = True
    daemon_threads = True

if __name__ == '__main__':
    picam2 = Picamera2(0)
    picam2.configure(picam2.create_video_configuration(main={"size": (1280, 720)}))
    output = StreamingOutput()
    picam2.start_recording(JpegEncoder(), FileOutput(output))

    try:
        address = ('172.30.1.6', 8000)
        server = StreamingServer(address, StreamingHandler)

        # 여러 마이크 중 선택하려면 device_index를 적절한 값으로 설정
        selected_device_index = 2
        audio_stream = AudioStream(device_index=selected_device_index)

        audio_thread = threading.Thread(target=server.serve_forever)
        audio_thread.start()

        # Start Flask with SocketIO
        socketio.run(app, host='172.30.1.6', port=8001, use_reloader=False, debug=False)

    finally:
        picam2.stop_recording()
        output.release()
        audio_thread.join()
