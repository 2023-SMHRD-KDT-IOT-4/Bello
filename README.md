# Project : Bello
<br>
> 스마트그리드기반 IoT융합 SW전문가 과정 핵심프로젝트 <br>
> IoT기반 스마트 도어벨 서비스 : Bello

</br>

## 1. 제작 기간 & 참여 인원
- 2024년 01월 04일 ~ 01월 15일
- 팀 프로젝트(5명)
- 팀장: 이승재(PM, Rasberrypi, Python-Flask)
- 팀원: 유민지(Frontend : JavaScript, HTML, CSS)
- 팀원: 김현정(Frontend : JavaScript, HTML, CSS)
- 팀원: 김한솔(DB : MySQL, Backend : Java - Spring, WebSocket)
- 팀원: 전호성(Backend : Java - Spring, WebSocket)

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - Spring 4
  - Spring Boot
  - Maven
  - WebSocket
  - Python
  - Flask
  - MySQL
  - Javascript (ajax, DOM함수 일부)
#### `Front-end`
  - JavaScript
#### `IoT`
  - Rasberrypi
  - Flask
  - Picamera2
  - OpenCV
  - RPi.GPIO

</br>

## 3. 설계과정

### 3-1. 서비스 흐름도
![서비스흐름도](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/a58e8a40-a25a-4a09-84be-6d3cc4fdd4ab)
<details>
  <summary><b>서비스 흐름도 설명 펼치기</b></summary>
    <div markdown="1">
      ...
    </div>
</details>

### 3-2. 유스케이스 다이어그램
![유스케이스](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/75a1250d-3351-4504-a283-d0852edc94f4)
### 3-3. ER 다이어그램
![ER](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/1a55b668-e57e-4b7e-822d-f950fd0c8bcf)
<details>
  <summary><b>EER 다이어그램 설명 펼치기</b></summary>
    <div markdown="1">
      product_info에서 제품의 시리얼키인 doorbell_num을 확인 후 회원가입을 할 때
      Foreign Key 사용 시 회원 가입에 문제가 생겨서 Trigger를 사용하여 회원가입 시 입력한 정보를 doorbell_info에 자동으       로 입력되는 튜플이 생성되도록 함 (doorbell_num, user_id 나머지는 default값 지정)
    </div>
</details>
### 3-4. IoT 회로도
![회로도](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/a3692510-8051-48ee-a6d4-55a9673df24a)
### 3-5. 웹 페이지 설계
![메뉴구성](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/6ddfb345-8349-479c-950e-7bcf8b73832f)
### 3-6. 화면 설계
![화면설계](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/1d14459d-cd5d-4077-b48f-a7cc6b7ab7b3)

## 4. 시연영상
https://youtu.be/67ULc5qw4nA


## 5. 핵심 기능
벨로서비스는 도어벨의 필수기능은 현관 밖 스트리밍 서비스를 제공하며,<br>
핵심기능은 방문자와 사용자간의 양방향 메세지 소통 기능입니다.<br>
또, 현관 밖에서 동작감지를 통해 영상을 녹화하고 저장하는 기능을 제공합니다.
<br>
![주요기능](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/1f7aeecc-0a18-432b-abdc-78b7f007a567)


### 5.1 회원가입 시 아이디, 시리얼키 중복 확인
https://github.com/2023-SMHRD-KDT-IOT-4/Bello/blob/e1da0f188c11406dee765539d6427b7a836b9dc0/bello/src/main/java/com/smhrd/bello/MemberController.java#L87
https://github.com/2023-SMHRD-KDT-IOT-4/Bello/blob/e1da0f188c11406dee765539d6427b7a836b9dc0/bello/src/main/webapp/WEB-INF/views/join.jsp#L46
비동기 통신을 이용한 아이디 중복 확인 (메서드, 자바스크립트 ajax)

https://github.com/2023-SMHRD-KDT-IOT-4/Bello/blob/e1da0f188c11406dee765539d6427b7a836b9dc0/bello/src/main/java/com/smhrd/bello/MemberController.java#L100
https://github.com/2023-SMHRD-KDT-IOT-4/Bello/blob/e1da0f188c11406dee765539d6427b7a836b9dc0/bello/src/main/webapp/WEB-INF/views/join.jsp#L67
비동기 통신을 이용한 제품 시리얼 키 확인 (메서드, 자바스크립트 ajax)

### 5.2. 메세지 및 알림기능
![메세지소통](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/0b865a77-7dea-4a72-8e8f-7dd59abc5b05)

### 5.3. 스트리밍 기능
![스트리밍](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/8b299de4-421a-4c62-a89c-07b582f6bed2)

### 5.4. 설정 기능
![설정](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/eed80171-fd8f-462c-b5f4-a846acde7b3f)


## 6. 발전방향
![발전방향](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/d3517f22-aeac-46d4-b8f1-1acfe6399939)
<hr>

### 6.1. ~측면 ~발전


## 7. 트러블 슈팅
![트러블슈팅](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/49870111-fc74-471a-9cfb-1d0311092092)
<hr>

### 7.1. Frontend
...
### 7.2. Backend
...
### 7.3. IoT
...
## 8. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/
