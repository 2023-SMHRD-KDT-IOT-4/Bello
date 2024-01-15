import RPi.GPIO as GPIO
import time

# GPIO 핀 번호 설정
SPKR_PIN = 16

# GPIO 설정
GPIO.setmode(GPIO.BCM)
GPIO.setup(SPKR_PIN, GPIO.OUT)

try:
    while True:
        # 스피커를 활성화 (ON) 상태로 설정
        GPIO.output(SPKR_PIN, GPIO.HIGH)
        print("스피커 ON")
        
        # 1초 동안 대기
        time.sleep(1)

        # 스피커를 비활성화 (OFF) 상태로 설정
        GPIO.output(SPKR_PIN, GPIO.LOW)
        print("스피커 OFF")

        # 1초 동안 대기
        time.sleep(1)

except KeyboardInterrupt:
    # Ctrl+C를 누르면 예외 처리하여 GPIO 설정을 정리
    GPIO.cleanup()
    print("프로그램 종료")
