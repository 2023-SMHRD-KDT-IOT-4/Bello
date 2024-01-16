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
- 팀원: <a href="https://github.com/1SSoll2/HSKimPF">김한솔</a><br>(DB설계, 테이블 생성 및 관리, 트리거 설정, DB관련 문서 작성<br>
회원 관리, WebSoket 연결, 서버 운용)
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
      <br><br>
      user_info의 비밀번호는 MD5 함수를 사용하여 암호화 하였고 doorbell_num은 UUID함수를 사용하여 난수화된 상태의 키를         시리얼 키로 사용하였다.
    </div>
</details>

### 3-4. IoT 회로도
![회로도](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/a3692510-8051-48ee-a6d4-55a9673df24a)

### 3-5. 웹 페이지 설계
![메뉴구성](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/6ddfb345-8349-479c-950e-7bcf8b73832f)
<details>
  <summary><b>웹 페이지 설계 설명 펼치기</b></summary>
    <div>
      Bello의 홈페이지에서 회원가입 후 로그인하면 메인화면으로 이동하게 된다.<br>메인화면에서는 사용자의 집에서 사용하는 LCD 화면과 연동되는 기능들로 실시간으로 밖 상황을 확인할 수 있는 스트리밍, 벨의 소리크기와 벨 소리 선택 기능, 실시간으로 집에 방문하는 외부인과 소통할 수 있는 채팅 기능을 통해 LCD에 사용자가 입력한 문구를 띄우고 방문자는 LCD에서 방문 목적을 남겨서 시간과 메시지를 남길 수 있다.
    </div>
</details>

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


### 5.1. 회원가입 시 아이디, 시리얼키 중복 확인
https://github.com/2023-SMHRD-KDT-IOT-4/Bello/blob/e1da0f188c11406dee765539d6427b7a836b9dc0/bello/src/main/java/com/smhrd/bello/MemberController.java#L87
https://github.com/2023-SMHRD-KDT-IOT-4/Bello/blob/e1da0f188c11406dee765539d6427b7a836b9dc0/bello/src/main/webapp/WEB-INF/views/join.jsp#L46

 - 비동기 통신을 이용한 아이디 중복 확인 (메서드, 자바스크립트 ajax)

https://github.com/2023-SMHRD-KDT-IOT-4/Bello/blob/e1da0f188c11406dee765539d6427b7a836b9dc0/bello/src/main/java/com/smhrd/bello/MemberController.java#L100
https://github.com/2023-SMHRD-KDT-IOT-4/Bello/blob/e1da0f188c11406dee765539d6427b7a836b9dc0/bello/src/main/webapp/WEB-INF/views/join.jsp#L67

 - 비동기 통신을 이용한 제품 시리얼 키 확인 (메서드, 자바스크립트 ajax)

### 5.2. 메세지 및 알림기능 (websocket)
![메세지소통](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/0b865a77-7dea-4a72-8e8f-7dd59abc5b05)
<details>
  <summary><b>설명 펼치기</b></summary>
    <div markdown="1">

#### 웹소켓 컨트롤러 <br><br>

  - ChatWebSocketHandler 클래스:<br>
    Spring에서 기본 제공되는 TextWebSocketHandler를 확장(상속)하여 웹소켓 메시지를 처리하는 핸들러.<br>
      *cf) TextWebSocketHandler는 Spring Framework에서 제공하는 추상 클래스로, 텍스트 기반의 WebSocket 통신을 처리하는데 필요한 메서드들을 제공.<br> 
    ChatWebSocketHandler의 handleTextMessage 메서드는 클라이언트로부터 텍스트 메시지를 수신하면 호출되며, 수신한 메시지를 그대로 클라이언트에게 반환한다.<br><br>

#### 웹소켓 관련 config 클래스: <br><br>   
  - WsConfig 클래스:<br>
    Spring 웹 소켓을 활용하여 WebSocket 기능을 설정하는 클래스.<br>
    @EnableWebSocket 어노테이션을 통해 Spring의 WebSocket 지원을 활성화하고,  WebSocketConfigurer 인터페이스를 구현하여 WebSocket 핸들러를 등록한다.<br><br>

#### WebSocket 핸들러 등록 (== 위 두 클래스의 실질적인 양방향 연결 수행 과정): <br><br>
   
   - LCD page(방문객 페이지 (벨로 기기에 출력되는 페이지))측 연결<br>
    "/chat-ws" 경로로 들어오는 WebSocket 연결에 대해 ChatWebSocketHandler를 등록.<br>
    클라이언트가 메시지를 전송하면 해당 핸들러가 메시지를 처리하고, 결과를 다시 클라이언트에게 보냄.<br><br>

   - Main page(관리자 메인 페이지 (웹앱 컨트롤센터 페이지))측 연결 <br>
    "/main" 경로로 들어오는 WebSocket 연결을 처리할 핸들러를 chatWebSocketHandler로 정의하였으며 @Bean 어노테이션을 사용하여 ChatWebSocketHandler의 빈을 생성하고 있다. 해당 핸들러는 registerWebSocketHandlers 메서드에서 "/main" 경로로 들어오는 WebSocket 연결에 대해 ChatWebSocketHandler를 등록한다.<br><br>

#### Main, LCD page 웹페이지에서 WebSocket을 사용(구현)하는 JS코드 설명 <br><br>

   - WebSocket 초기화:<br>
    $(document).ready(function () { ... }); >>>> 웹페이지가 렌더링되면 실행되는 함수로 WebSocket을 초기화하고 이벤트핸들러를 등록.<br>
    socket = new WebSocket($('#serverUrl').val()); >>>> 페이지에서 설정한 서버의 URL을 이용하여 WebSocket 객체를 생성합니다.<br><br>

   - WebSocket 이벤트핸들링:<br><br>
    open 이벤트 핸들러     >>>> WebSocket 연결이 열리면 실행되는 코드입니다. 콘솔에 연결이 열리면 'Connected.'라는 메시지를 서버로 전송.<br>
    message 이벤트 핸들러  >>>> 서버로부터 메시지를 받으면 실행되는 코드.<br>
                               콘솔에 메시지를 출력하고, displayMessage 함수를 호출하여 받은 메시지를 페이지에 표시.<br>
    close 이벤트 핸들러    >>>> WebSocket 연결이 닫히면 콘솔에 메시지를 출력하는 코드.<br>
    error 이벤트 핸들러    >>>> WebSocket 에러가 발생하면 콘솔에 메시지를 출력하는 코드.<br><br>

   - 버튼 클릭 이벤트 핸들링 (기능은 있지만 HTML에서 hidden속성 적용하여 일반적 상황에서 사용불가):<br>
    Exit 버튼 >>>> 클릭 시 WebSocket 연결을 종료합니다.<br>
    Send 버튼 >>>> 클릭 시 입력된 메시지를 서버로 전송하며, 입력 창을 초기화합니다.<br><br>
    - displayMessage 함수 (== HTML 버튼과 연결하여 실질적으로 메시지 send하는 함수):<br>
    jQuery를 사용하여 #chatMessageArea라는 HTML 요소를 선택하고, 해당 요소에 P태그로 감싼 새로운 메시지를 추가함.<br>
     결과적으로 함수 호출을 통해 받은 메시지가 페이지에 동적으로 표시됨.<br><br>

                                                                                              > written by 전호성 
    
    
  
</details><br><br><br>

### 5.3. 스트리밍 기능
![스트리밍](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/8b299de4-421a-4c62-a89c-07b582f6bed2)
<details>
  <summary><b>스트리밍 설명 펼치기</b></summary>
    <div markdown="1">
        - Main페이지에서 STREAMING버튼을 클릭하면 Streaming page로 redirect된다.<br>
        - 스트리밍서버는 라즈베리파이에서 Python-Flask, SocketIO에서 제공한다.<br>
        - VideoStream Class에서 영상스트리밍을 제공한다.<br>
        - AudioStream Class에서 음성스트리밍을 제공한다.<br>
        - StreamingOutput Class에서 이미지 프레임을 담고있는 버퍼를 제공한다.<br>
        - write Method를 통해 이미지 프레임을 버퍼에 쓰고, 이를 기다리는 클라이언트에 알리기위해 'condition'을 사용한다.<br>
        - StreamingHandler Class는 HTTP요청에 대한 핸들러 클래스 이다.<br>
            - index.html, stream.mjpg, audio.wav등의 경로에 대한 요청을 처리하고 이미지와 음성 스트리밍을 처리한다.<br>
        - StreamingServer Class는 멀티 스레딩을 지원하는 HTTP서버를 생성한다.<br>
            - 메인코드에서 Picamera를 초기화하고 스트리밍을 시작한 후 Flask, SocketIO, 오디오스트리밍을 시작한다.<br>
        - Streaming코드의 주된 목적은 영상을 웹페이지에 스트리밍하고, 동시에 오디오를 읽어들여 웹페이지에서 듣기 기능을 제공하는 것이다.
    </div>
</details>

### 5.4. 설정 기능
![설정](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/eed80171-fd8f-462c-b5f4-a846acde7b3f)
<details>
  <summary><b>설정 기능 설명 펼치기</b></summary>
    <div markdown="1">
        - 라즈베리파이에서 Python-Flask서버를 통해 설정값을 DB에 저장한다.<br>
        - 볼륨 바 조정를 조정하여 변경하기를 누르면 해당 정수값이 DB에 UPDATE되고 LCD페이지에 해당 값을 SELECT하여 Pyaudio라이브러리를 통해 라즈베리파이에 반영된다.<br>
        - 벨소리를 지정하여 변경하기를 누르면 해당 음악파일의 경로가 DB에 UPDATE되고 LCD페이지에 해당 파일을 SELECT하여 반영된다.<br>
    </div>
</details>

## 6. 발전방향
![발전방향](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/d3517f22-aeac-46d4-b8f1-1acfe6399939)
<hr>
<details>
  <summary><b>IoT측면 발전 방향 설명 펼치기</b></summary>
    <div markdown="1">
        - 메인페이지로 부터 라즈베리파이에서 실행되는 서버로 접근할 때 쿼리스트링으로 user_id를 받아오는데, 아이디가 URL에 노출됨.             <br>
            - 아이디를 넘겨받는 방식을 POST방식으로 받거나 암호화해서 넘겨받고 Flask에서 해당값을 확인하는 과정이 필요할 것으로 사료                됨. <br>
        - 스트리밍페이지를 유저별로 생성하여 실행되는 로직 필요.<br>
        - 현재 스트리밍페이지의 URL은 라즈베리파이의 내부아이피를 노출시키므로 Reverse Proxy를 사용하거나, 무작위 값으로 바인딩 하는           등의 로직이 필요함.<br>
        - 동작감지의 예민도를 조정하여 실사용에 적합한 조정값을 찾는 과정 필요.
    </div>
</details>



## 7. 트러블 슈팅
![트러블슈팅](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/49870111-fc74-471a-9cfb-1d0311092092)
<hr>

### 7.1. Frontend
...
### 7.2. Backend

<details>
  <summary><b>백엔드 트러블슈팅</b></summary>
    <div markdown="1">
      - 당초 개발환경을 통일하기 위해 Visual Studio를 사용하여 환경을 구축<br>
      - Maven 방법으로 만들기 위하여 Eclipse를 사용하여 다시 구축<br>
      - 알림을 받아오는 핵심 기능을 구현하기 위하여 다시 Spring으로 환경을 구축<br>
      - Spring 환경을 구축 후에도 알림을 받아올 방법을 고심하면서 Boot를 연동해서 시도<br>
     (배우지 못했던 부분이라 톰캣 서버가 자주 망가짐)<br>
      - WebSoket이라는 방법을 통하여 구현<br><br>
      - 개발 시작시 필요한 도구와 목표를 100% 이해하지 못하여 환경을 구축하는 데에 시간을 크게 할애하여 기능을 더 구현하지 못한 부분에 대해서 아쉽게 생각한다.
    </div>
</details>

### 7.3. IoT
...
## 8. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/
