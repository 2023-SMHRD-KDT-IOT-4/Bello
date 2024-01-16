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
### 3-2. 유스케이스 다이어그램
![유스케이스](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/75a1250d-3351-4504-a283-d0852edc94f4)
### 3-3. ER 다이어그램
![ER](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/1a55b668-e57e-4b7e-822d-f950fd0c8bcf)
### 3-4. IoT 회로도
![회로도](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/a3692510-8051-48ee-a6d4-55a9673df24a)

## 4. 시연 및 화면설계

### 4-1. 시연영상
https://youtu.be/67ULc5qw4nA

### 4-2. 화면설계
![화면설계](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/1d14459d-cd5d-4077-b48f-a7cc6b7ab7b3)

## 5. 핵심 기능
벨로서비스는 도어벨의 필수기능은 현관 밖 스트리밍 서비스를 제공하며,
핵심기능은 방문자와 사용자간의 양방향 메세지 소통 기능입니다.
또, 현관 밖에서 동작감지를 통해 영상을 녹화하고 저장하는 기능을 제공합니다.

### 5.1. 메세지 및 알림기능
![메세지소통](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/0b865a77-7dea-4a72-8e8f-7dd59abc5b05)

### 5.2. 스트리밍 기능
![스트리밍](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/8b299de4-421a-4c62-a89c-07b582f6bed2)

### 5.3. 설정 기능
![설정](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/eed80171-fd8f-462c-b5f4-a846acde7b3f)

### 5.4. Service

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_service1.png)

- **Http 프로토콜 추가 및 trim()** :pushpin: [코드 확인]()
  - 사용자가 URL 입력 시 Http 프로토콜을 생략하거나 공백을 넣은 경우,  
  올바른 URL이 될 수 있도록 Http 프로토콜을 추가해주고, 공백을 제거해줍니다.

- **URL 접속 확인** :pushpin: [코드 확인]()
  - 화면단에서 모양새만 확인한 URL이 실제 리소스로 연결되는지 HttpUrlConnection으로 테스트합니다.
  - 이 때, 빠른 응답을 위해 Request Method를 GET이 아닌 HEAD를 사용했습니다.
  - (HEAD 메소드는 GET 메소드의 응답 결과의 Body는 가져오지 않고, Header만 확인하기 때문에 GET 메소드에 비해 응답속도가 빠릅니다.)

  ![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_service2.png)

- **Jsoup 이미지, 제목 파싱** :pushpin: [코드 확인]()
  - URL 접속 확인결과 유효하면 Jsoup을 사용해서 입력된 URL의 이미지와 제목을 파싱합니다.
  - 이미지는 Open Graphic Tag를 우선적으로 파싱하고, 없을 경우 첫 번째 이미지와 제목을 파싱합니다.
  - 컨텐츠에 이미지가 없을 경우, 미리 설정해둔 기본 이미지를 사용하고, 제목이 없을 경우 생략합니다.


### 5.5. Repository

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_repo.png)

- **컨텐츠 저장** :pushpin: [코드 확인]()
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

</div>
</details>

</br>

## 6. 발전방향
![발전방향](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/d3517f22-aeac-46d4-b8f1-1acfe6399939)

## 6. 트러블 슈팅
![트러블슈팅](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/49870111-fc74-471a-9cfb-1d0311092092)
<hr>

## 6. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/
