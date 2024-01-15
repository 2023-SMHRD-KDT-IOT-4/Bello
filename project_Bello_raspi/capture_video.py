import RPi.GPIO as GPIO
import cv2
import time
import os

# GPIO 핀 번호 설정
motion_sensor_pin = 12

# 녹화 시작 및 종료 플래그
recording = False

# 녹화 파일의 시작 번호
file_number = 1

# 원하는 디렉토리 설정
output_directory = '/home/bello/project_test/static/video'

# 생성된 디렉토리가 없다면 생성
os.makedirs(output_directory, exist_ok=True)

# GPIO 초기화
GPIO.setmode(GPIO.BOARD)
GPIO.setup(motion_sensor_pin, GPIO.IN)

# 카메라 초기화
cap = cv2.VideoCapture('/dev/video2')  # 카메라 디바이스 번호가 0일 경우 /dev/video0을 사용합니다.

try:
    while True:
        # 동작 감지 센서에서 신호를 받으면 녹화 시작
        if GPIO.input(motion_sensor_pin) and not recording:
            print("Motion detected! Recording started.")
            
            # 녹화 시작
            recording = True
            start_time = time.time()

            # 새로운 녹화 파일을 위해 파일 번호 증가
            file_number += 1

            # 녹화 파일 설정
            video_file_name = f'video_{file_number}.avi'
            video_file_path = os.path.join(output_directory, video_file_name)

            fourcc = cv2.VideoWriter_fourcc(*'XVID')
            out = cv2.VideoWriter(video_file_path, fourcc, 25.0, (640, 480))

        # 동작 감지 센서에서 신호가 없으면 녹화 중지
        elif not GPIO.input(motion_sensor_pin) and recording:
            print("Motion stopped! Recording stopped.")
            
            # 녹화 중지
            recording = False

            # 녹화 파일 닫기
            out.release()

        # 녹화 중일 때
        if recording:
            # 프레임 읽기
            ret, frame = cap.read()

            # 프레임이 정상적으로 읽혔는지 확인
            if not ret:
                print("Error: Failed to grab frame.")
                break

            # 녹화 파일에 프레임 추가
            out.write(frame)

            # 10초 동안 녹화
            if time.time() - start_time > 30:
                print("Recording time exceeded. Recording stopped.")
                recording = False

except KeyboardInterrupt:
    pass

finally:
    # GPIO 및 카메라 정리
    GPIO.cleanup()
    cap.release()
    if recording:
        out.release()
    cv2.destroyAllWindows()
