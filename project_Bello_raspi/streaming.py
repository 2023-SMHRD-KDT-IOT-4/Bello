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
from datetime import datetime
from picamera2 import Picamera2
from picamera2.encoders import JpegEncoder
from picamera2.outputs import FileOutput
from flask import Flask
from flask_socketio import SocketIO

app = Flask(__name__)
socketio = SocketIO(app)

# Get the directory of the script
script_dir = os.path.dirname(os.path.realpath(__file__))

# Load the index.html template
with open(os.path.join(script_dir, 'templates', 'index.html'), 'r') as f:
    PAGE = f.read()

    
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

    def write(self, buf):
        with self.condition:
            self.frame = buf
            self.condition.notify_all()
            
    def release(self):

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


            try:
                pass

            except Exception as e:
                logging.warning(
                    'Removed audio streaming client %s: %s',
                    self.client_address, str(e))
            finally:

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

 
        selected_device_index = 2
        audio_stream = AudioStream(device_index=selected_device_index)

        audio_thread = threading.Thread(target=server.serve_forever)
        audio_thread.start()

        socketio.run(app, host='172.30.1.6', port=8001, use_reloader=False, debug=False)

    finally:
        picam2.stop_recording()
        output.release()
        audio_thread.join()
