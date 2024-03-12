# Project : Bello
<br>

![벨로소개서](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/c7813fda-e3de-4f08-b43c-4ad0359bf5cc)


</br>

## 1. 제작 기간 & 참여 인원
- 2024년 01월 04일 ~ 01월 15일
- 팀 프로젝트(5명)
- 팀장: <a href="https://github.com/tmdwo10">이승재</a><br>(PM, Rasberrypi, Python-Flask : RaspberryPi 스트리밍 기능 구현, 웹 서비스 설정페이지 기능 구현, 동잠감지-녹화 기능 구현)
- 팀원: <a href="https://github.com/MinJiYu/portfolio.git">유민지</a><br>(Frontend : JavaScript, HTML, CSS : 회원가입 페이지 구현, 메인페이지 구현, 설정 페이지 구현, 메세지 페이지 구현, ppt 작성)
- 팀원:<a href="https://github.com/lamruth/portfolio">김현정</a><br>(Frontend, JavaScript,HTML,CSS : 로그인 페이지 구현,비디오 페이지 기획(게시판형식,모달),<br> 웹페이지 템플릿 제작, 프로젝트 소개서 및 ppt 기획 및 작성)
- 팀원: <a href="https://github.com/1SSoll2/HSKimPF">김한솔</a><br>(DB설계, 테이블 생성 및 관리, 트리거 설정, DB관련 문서 작성<br>
회원 관리, WebSoket 연결, 서버 운용)
- 팀원: <a href="https://github.com/hosungjoun">전호성</a><br>(Back-end, Spring: 회원 관리 및 관련기능 구현, websocket 구현,<br>
 Back-front 연동(이식), 요구사항 정의서 작성)
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
  - HTML/CSS
  - JavaScript
#### `IoT`
  - Rasberrypi
  - Flask
  - SoketIO
  - WebSocket
  - Picamera2
  - OpenCV

</br>

## 3. 설계과정

### 3-1. 서비스 흐름도

![서비스흐름도](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/a58e8a40-a25a-4a09-84be-6d3cc4fdd4ab)

<details>
  <summary><b>서비스 흐름도 설명 펼치기</b></summary>
	    
#### 사용자는 Bello기기의 시리얼키로 인증하여 서비스에 가입하고 DB에 정보를 저장 할 수 있다.
	    
#### 사용자는 Main페이지에서 회원정보를 수정하고 DB에 저장 할 수 있다.

#### 사용자는 Main페이지에서 방문자와 소통 할 수 있다.

#### 사용자는 Main페이지에서 Setting페이지로 접근하여 설정(벨소리, 음량)값을 변경하고 DB에 저장 할 수 있다.

#### 사용자는 Main페이지에서 Streaming을 클릭하여 스트리밍서버(Flask)에 접근 할 수 있다.

#### 방문자는 라즈베리파이에 연결된 LCD를 통해 사용자와 소통 할 수 있다.

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
<details>

  <summary><b>회로도 설명 펼치기</b></summary>
    
- 터치스크린(LCD): 라즈베리파이에 26Pin과 HDMI로 연결되어 있고, 방문자에게 사용자와의 소통을 제공한다.<br>
- V2카메라:        라즈베리파이에 12Pin으로 연결되어 있고 Picamera2 라이브러리를 사용해 스트리밍을 담당한다.<br>
- WEB CAM:        라즈베리파이에 USB로 연결되어 있고 OpenCV 라리브러리를 통해 영상 녹화를 담당한다.<br>
- 동작감지센서:    라즈베리파이에 GPIO Pin으로 연결되어 있고 전원은 UNO에서 공급한다. 동작 감지가 트리거되면 WEB CAM에서 녹화 로직이 작동한다.<br>
- UNO R3:         동작감지센서에 전원을 공급한다.<br>

</details>

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
<details>
  <summary><b>화면 설계 설명 펼치기</b></summary>
    <div markdown="1">
    화면 설계 시 사용자 편리성을 중점으로 두어 웹 앱사이즈(width 480px)페이지 구현<br>
    로그인 성공 시 메인 페이지로 이동 위해 버튼 구현<br>
    메인 페이지에서 버튼 클릭 시 각각 메시지,스트리밍,설정 페이지로 이동 위한 버튼 구현<br>
    채팅 구간(fieldset,legend태그) 및 알림 확인과 메시지 보내는 기능(form,submit태그)<br>
    사용자용 LCD페이지 상단 부분 버튼 구현(종 모양),연결여부 상태 확인창 및 전송메시지 버튼 구현<br>
    모든 버튼들은 사용자가 터치, 클릭 할 경우 hover기능<br>
    </div>
</details>

## 4. 시연영상
https://youtu.be/67ULc5qw4nA


## 5. 핵심 기능
#### 벨로서비스는 도어벨의 필수기능은 현관 밖 스트리밍 서비스를 제공하며,<br>
#### 핵심기능은 방문자와 사용자간의 양방향 메세지 소통 기능입니다.<br>
#### 또, 현관 밖에서 동작감지를 통해 영상을 녹화하고 저장하는 기능을 제공합니다.
<br>

![주요기능](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/b83188ae-034d-4960-8542-ec620523fe11)




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

![스트리밍](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/6cb6870c-be06-4d98-92a0-d6fc493f95d9)


<details>
  <summary><b>스트리밍 설명 펼치기</b></summary>

- Main페이지에서 STREAMING버튼을 클릭하면 Streaming page로 redirect된다.<br>
- Python-Flask, SocketIO에서 웹 요청을 처리하고 WebSocket연결을 관리한다.<br>
- AudioStream Class:
    - PyAudio를 사용하여 오디오 입력을 캡쳐한다.
    - read_audio Method는 계속해서 오디오 데이터를 생성한다.
- StreamingOutput Class:
    - io.BufferedIOBase를 상속받아 버퍼에 프레임을 씌운다.
- StreamingHandler Class:
    - server.BaseHTTPRequestHandler를 상속받아 주소를 재사용하고 스레드를 데몬으로 실행한다.
- 메인 로직:
    - __main__ 블록에서 Picamera2를 초기화하고 스트리밍을 위한 설정을 구성한다.
    - 서버를 시작하고, 오디오 스트리밍을 위한 스레드를 시작하고, Flask-SocketIO를 사용하여 웹서버를 실행한다.
    - 마지막으로, 프로그램이 종료될때, 리소스를 정리하고 스레드를 종료한다.
    
</details>

### 5.4. 설정 기능
![설정](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/eed80171-fd8f-462c-b5f4-a846acde7b3f)
<details>

  <summary><b>설정 기능 설명 펼치기</b></summary>


- 라즈베리파이에서 Python-Flask서버를 통해 설정값을 DB에 저장한다.<br>

- 볼륨 바 조정를 조정하여 변경하기를 누르면 해당 정수값이 DB에 UPDATE되고 LCD페이지에 해당 값을 SELECT하여 alsaaudio라이브러리를 통해 라즈베리파이에 반영된다.<br>

- 벨소리를 지정하여 변경하기를 누르면 해당 음악파일의 경로가 DB에 UPDATE되고 LCD페이지에 해당 파일을 SELECT하여 반영된다.<br>

</details>

## 6. 발전방향
![발전방향](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/d3517f22-aeac-46d4-b8f1-1acfe6399939)
<hr>
<details>
  <summary><b>IoT측면 발전 방향 설명 펼치기</b></summary>

- 메인페이지로 부터 라즈베리파이에서 실행되는 서버로 접근할 때 쿼리스트링으로 user_id를 받아오는데, 아이디가 URL에 노출됨. <br>
    - 아이디를 넘겨받는 방식을 POST방식으로 받거나 암호화해서 넘겨받고 Flask에서 해당값을 확인하는 과정이 필요할 것으로 사료됨. <br>
- 스트리밍페이지를 유저별로 생성하여 실행되는 로직 필요.<br>
- 현재 스트리밍페이지의 URL은 라즈베리파이의 내부아이피를 노출시키므로 Reverse Proxy를 사용하거나, 무작위 값으로 바인딩 하는 등의 로직이 필요함.<br>
- 동작감지의 예민도를 조정하여 실사용에 적합한 조정값을 찾는 과정 필요.

</details>

## 7. 트러블 슈팅
![트러블슈팅](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847551/49870111-fc74-471a-9cfb-1d0311092092)
<hr>

### 7.1. Frontend
<details>
  <summary><b>프론트엔드 트러블 슈팅</b></summary>
    <div markdown="1">
   <h3>1. CSS 적용</h3>
   1) 프론트는 vsCode에서 개발을 진행하여 작성한 코드를 팀원들이 사용하는 Spring에 넣어 실행하니 실제 웹페이지에서 적용되지 않음<br>
   2) 경로가 잘 못 되어있는 줄 알고 경로를 다시 지정하였지만 적용되지 않음<br>
   3) 찾아보니 브라우저에 캐시가 남아있기 때문이라는 걸 발견 이후 남아있는 캐시를 모두 지우고 새로고침했더니 수정된 CSS가 웹 페이지에 적용됨
   <br>
   <h3>2. 라즈베리파이와의 연동 오류</h3>
   1) 비디오 페이지 목록(form태그) 클릭 시 팝업창으로 동영상이 열리도록(modal) 구현<br>
   2) 실제 적용 시 서버값을 불러오지 못해 저장된 동영상파일을 읽어오지 못하는 문제점 발생<br> 
   3) 시간적 한계로 해결하지 못하고 모달 기능 사용 X,  페이지 형태로만 사용하게 됨
	 <details>
  	<summary><b>비디오페이지 구현 설명 펼치기</b></summary>
	<summary><b>비디오페이지부분 </b></summary>
     	|![video](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847569/881a96bc-d856-4ea0-bf50-c8b40043a81a)
	<summary><b>모달연결부분 </b></summary>
	![모달연결](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847569/bff2dcb9-a22c-44fa-b2bd-4037967a4ac2)
	<summary><b>모달팝업부분 코드</b></summary>
	![비디오재생모달](https://github.com/2023-SMHRD-KDT-IOT-4/Bello/assets/152847569/ecb3136f-ca1b-4c0a-a9a8-8175c06deab4)
    </div>
</details>

### 7.2. Backend

<details>
  <summary><b>백엔드 트러블슈팅</b></summary>
    <div markdown="1">
      - 당초 개발환경을 통일하기 위해 Visual Studio를 사용하여 환경을 구축<br>
      - Maven 방법으로 만들기 위하여 Eclipse를 사용하여 다시 구축 (회원관리 구현)<br>
      - 알림을 받아오는 핵심 기능을 구현하기 위하여 다시 Spring으로 환경을 구축 <br>
	(비동기 통신 사용 필요성 체감, 비동기 통신 사용 가능하게 되어 추가기능인 시리얼키, 아이디 중복 검사 기능 구현) <br>
      - Spring 환경을 구축 후에도 알림을 받아올 방법을 고심하면서 Boot를 연동해서 시도<br>
     (배우지 못했던 부분이라 톰캣 서버가 자주 망가짐)<br>
      - WebSoket이라는 방법을 통하여 구현<br><br>
      - 개발 시작시 필요한 도구와 목표를 100% 이해하지 못하여 환경을 구축하는 데에 시간을 크게 할애하여 기능을 더 구현하지 못한 부분에 대해서 아쉽게 생각한다.
    </div>
</details>

### 7.3. IoT

<details>
  <summary><b>IoT 트러블슈팅</b></summary>

- 교육과정 커리큘럼상 라즈베리파이를 배우기 이전에 프로젝트에서 라즈베리파이를 활용하게되었다.
  라즈베리파이에 대한 지식이 전무하다보니 OS설정이나 Linux명령어, Python코딩법 등의 정보를 책이나 구글링으로
  익히는데 시간이 오래걸렸다.
  <br>
- 기초를 어느정도 잡고나서는 프로젝트에 적합한 활용법을 알아내는 것도 난관이었는데, RasbianOS가 업데이트 되면서
  구글링해서 얻은 스트리밍에 대한 코드들이 현 OS버전에서는 작동하지 않는 문제가 발생되었다.
  - 대중적인 라이브러리(OpenCV, Picamera)들은 스트리밍을 실행시키는데 실패하고 현 OS버전에서 새로이 제공하는 Picamera2라이브러리를 활용해서 스트리밍을 성공시켰다.
  - picamera2는 이번 RasbianOS에서 제공하는 새로운 카메라 라이브러리인데 https://github.com/raspberrypi/picamera2/blob/main/examples/mjpeg_server.py 에서 소스코드를 얻어 몇가지 로직을 추가하였다.
  <br>
- 스트리밍을 성공시킨 후 동작감지-영상녹화 로직을 추가시키려 했는데 스트리밍 로직과 충돌이 일어나며 두 기능중 하나만 작동하는 상황이 발생하였다.
  - 처음엔, streaming.py 내에서 녹화(OpenCV)와 스트리밍(Picamera2)의 라이브러리를 구분해서 로직을 수정했는데, 이 방법 역시 카메라 모듈의 충돌문제를 해결하지 못하였다.
  - 마지막으로, 두가지 로직을 아예 다른 Py파일로 나누고 실행환경도 나누어 주니 카메라 모듈이 충돌하지 않게 되었다.
  - 결과적으로, 스트리밍은 Streaming.py에서 Picamera2라이브러리로 전역에서 실행시키는 형태가 되었다.
  - 동작감지-녹화는 capture_video.py에서 OpenCV라이브러리로 가상환경에서 실행시키는 형태가 되었다.

</details>

## 8. 회고 / 느낀점

<details>
 <summary><b>프론트엔드 회고</b></summary>
       <div markdown="1">
    <div> 1) 기존 계획에 비해 완성도에 대한 아쉬움
	    - 프론트는 처음 개발 목표였던 메뉴에서 메세지를 페이지와 비디오목록을 볼 수 있는 페이지를 따로 코딩하였으나 <br> 
              프로젝트 시간이 부족하여 기능은 실제로 구현되지 않아 최종결과물에서는 빠지게 되었습니다. <br> 이를 통해 프로젝트 시간 관리와 팀원간 소통이 얼마나 중요한지도 알게되었습니다.
	     <br>
	   2) 템플릿 활용도 미흡에 대한 아쉬움
	    - 웹 앱페이지의 완성도를 위해 템플릿을 적용하였으나 내재된 코드들을 뜯어보고 살피는 과정에서 필요한 기능만 골라내어 활용해야했습니다 .<br>
	     자바스크립트에 대해서 배운 내용보다 더 심층적인 기능들이 적용되어 있어 100%의 템플릿의 진면목은 사용하지 못한 것 같습니다. <br>
	    그러나 코드를 쪼개보고 원하는 기능들을 구글링하며 이 기능이 구상한대로 구현하기 위한 과정들 속에서 자바스크립트의 중요성에 대해 깨닫게 되었습니다. <br>
	    단순히 뼈대인 Html, 꾸며주는 CSS, 효과를 주는 JAVASCRIPT라는 인식에서 벗어나 보다 실전적인 배움을 얻었던 좋은 기회였습니다.
    </div>
</details>

<details>
  <summary><b>백엔드 회고</b></summary>
  <p style="font-size: 1.2em;">초기 구상 당시 동기 통신으로만 벨로의 기능을 전부 구현 할 수 있다고 판단하고 개발을 시작하였습니다.
  또한, 기존에 주로 사용하던 이클립스에서 벗어나 새로운 개발 <b>Tool</b>인 Visual Studio를 사용해 개발을 진행하고자 하였습니다.</p>
  
  <p style="font-size: 1.2em;">그러나 기존 수업시간에 MVC패턴을 이클립스로만 연습해 보았기에 라이브러리 셋팅 등에서 어려움을 겪고 다시 익숙한 이클립스에서 Maven MVC 프로젝트를 구축하고자 하였습니다.
  Maven MVC로 기본적인 회원가입 틀과 로그인 기능은 구현하였지만, 아이디와 시리얼키<sup>1</sup> 중복 검사 기능을 웹페이지를 이동하지 않고 alert 기능만을 사용하여 구현하고자 하였습니다.</p>
  
  <p style="font-size: 1.2em;"><sup>1</sup> 벨로의 기본적인 보안 및 사용자의 기기를 좀 더 편리하게 관리하기 위해 구상한 시리얼키 (기기당 고유한 20자 정도의 랜덤 문자열)</p>

  <p style="font-size: 1.2em;">동기 통신으로는 해당 기능의 구현이 어렵다는 것을 인지한 후 보다 동기통신을 구현하기 편하고 참조할 예제들이 많은 <b>Spring</b>으로 다시 개발 <b>Tool</b>을 변경하게 되었습니다.
  <b>Spring</b> 기반 해당 중복 기능의 예제들을 검색하며 ajax로 간단하게 구현할 수 있다는 것도 이 때 인지할 수 있었습니다.</p>
  
  <p style="font-size: 1.2em;">결국 성공적으로 비동기 통신으로 해당 기능을 추가하였지만, 생각보다 초기 개발 환경의 설정에 시간이 많이 소요되었다고 생각합니다.</p>
  
  <p style="font-size: 1.2em;">그러나 그 과정에서 <b>VS</b>, <b>eclipse</b>, <b>spring (3,4)</b>, <b>spring boot</b> 등 여러 개발 환경의 장단점과 차이점에 대해 인지 할 수 있었습니다.
  이번 프로젝트를 통해 개발환경 초기 선택의 중요성을 몸소 깨달았기 때문에, 추후 프로젝트에서는 목표한 기능을 철저히 세분화하고 이에 따라 개발환경 선택또한 좀 더 신중하게 진행하면 더욱 효율적인 프로젝트를 진행할 수 있을 것이라 생각합니다.</p>
</details>

<details>

  <summary><b>IoT 회고</b></summary>



- 라즈베리파이를 독학으로 배우는 과정이 순탄하지는 않았지만(OS포멧을 10번넘게...) 하나 하나 배우고 어느 기점을 넘기고서 부터는 즐겁게 할 수 있었다.
- 라이브러리에 대한 소스코드를 얻고 활용하는 법을 알게되니 어떤 모듈을 사용하더라도 실행시킬수 있는 자신감이 생겼다.
- Python코딩을 기초문법 정도만 배우고 시작해 Python에 대한 이해도가 낮았는데, 서버를 운용하고 로직을 추가, 분리, 수정하는 과정을 거치고나니 Python에 대한 이해도가 높아졌다.

</details>
