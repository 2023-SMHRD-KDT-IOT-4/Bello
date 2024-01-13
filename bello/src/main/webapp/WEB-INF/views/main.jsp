<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/assets/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>BELLO HOME</title>
</head>

<body class="is-preload">
	<!-- 로드될 때 화면 움직이고 싶을 때 is-preload -->

	<div id="header">
		<span><a href="member/logout" id="logout">LOGOUT</a></span>
		<div class="inner">
			<!-- <a href="member/logout" class="logout">LOGOUT</a> -->

			<span class="icon solid major fa-solid fa-bell"></span>
			<h1>
				<strong>${member.user_name }</strong> 님
			</h1>
			<br>
			<h1>환영합니다.</h1>
			<p>시작하려면 메뉴를 선택해주세요</p>
			<ul class="actions special">
				<li><a
					onclick="sendDbn_mes('http://172.30.1.6:8002/setting/message')"
					class="button scrolly">MESSAGE</a></li>
				<li><a onclick="videoStream('http://172.30.1.6:8000')"
					class="button scrolly">STREAMING</a></li>
				<li><a onclick="sendDbn_set('http://172.30.1.6:8002/setting')"
					class="button scrolly">SETTING</a></li>
			</ul>
			
			<fieldset class="chatwrap">
            <legend>chat</legend>
            <div class="chat-container">
                 <!-- Websocket Server URL :  -->
                 <input type="hidden" type="text" id="serverUrl" value="ws://172.30.1.22:8083/ex-Websocket/chat-ws" style="width: 400px">
                  
                 
                 
                 <input type="hidden" type="button" id="enterBtn" value="Enter">
                 <input type="hidden" id="exitBtn" value="Exit">
                 <fieldset>
                     <legend><h2>Chatting Area</h2></legend>
                     <div id="chatArea">
                       <div id="chatMessageArea"></div>
                     </div>
                 </fieldset>
                 <br />
                 <input type="text" id="message">
                 <input type="button" id="sendBtn" value="Send Message">
            </div>
         </fieldset>
				
		</div>
	</div>

	<footer> </footer>
	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>
	<script>
	var user_id = encodeURIComponent('<%=session.getAttribute("user_id")%>');

		function sendDbn_mes(url) {
			console.log(user_id);
			openExternalURL(url + '?user_id=' + encodeURIComponent(user_id));

		}
		function sendDbn_set(url) {
			console.log(user_id);
			openExternalURL(url + '?user_id=' + encodeURIComponent(user_id));
		}
		function openExternalURL(url) {
			window.location.href = url;
		}
		function videoStream(url) {
			window.open(url, '_blank');
		}
		
		 function displayMessage(message) {
             $('#chatMessageArea').append('<p>' + message + '</p>');
         }

	     $(document).ready(function () {
	                let socket;
	                // WebSocket 연결을 생성합니다.
	                // Enter 버튼 클릭 시 WebSocket 연결
	                 $(document).ready(function () {
	                    socket = new WebSocket($('#serverUrl').val());

	                    // 연결이 열릴 때 실행되는 이벤트 핸들러
	                    socket.addEventListener('open', (event) => {
	                        console.log('WebSocket 연결이 열렸습니다.');
	                        socket.send('Connected.');
	                    });

	                    // 메시지를 받았을 때 실행되는 이벤트 핸들러
	                    socket.addEventListener('message', (event) => {
	                        console.log('서버로부터 메시지를 받았습니다:', event.data);
	                        // 이곳에서 받은 메시지를 처리할 수 있습니다.
	                        displayMessage(event.data);
	                    });

	                    // 연결이 닫힐 때 실행되는 이벤트 핸들러
	                    socket.addEventListener('close', (event) => {
	                        console.log('WebSocket 연결이 닫혔습니다.');
	                    });

	                    // 에러가 발생했을 때 실행되는 이벤트 핸들러
	                    socket.addEventListener('error', (event) => {
	                        console.error('WebSocket 에러가 발생했습니다:', event);
	                    });
	                   
	                });

	                // Exit 버튼 클릭 시 WebSocket 연결 종료
	                $('#exitBtn').click(function () {
	                    if (socket) {
	                        socket.close();
	                    }
	                });

	                // Send 버튼 클릭 시 메시지 전송
	                $('#sendBtn').click(function () {
	                    if (socket && socket.readyState === WebSocket.OPEN) {
	                        const message = $('#message').val();
	                        
	                        socket.send("Host : "+message);
	                        $('#message').val(''); // 메시지 전송 후 입력창 초기화
	                    }
	              })

	      });
	          
	       </script>
</body>
</html>