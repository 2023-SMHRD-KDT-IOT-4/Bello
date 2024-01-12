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
					class="button scrolly">VIDEO</a></li>
				<li><a onclick="sendDbn_set('http://172.30.1.6:8002/setting')"
					class="button scrolly">SETTING</a></li>
			</ul>
		</div>
	</div>
	Websocket Server URL :
	<input type="text" id="serverUrl"
		value="ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat-ws"
		style="width: 400px">
	<br> NickName :
	<input type="text" id="nickname">
	<input type="button" id="enterBtn" value="Enter">
	<input type="button" id="exitBtn" value="Exit">

	<h1>Chatting Area</h1>
	<div id="chatArea">
		<div id="chatMessageArea"></div>
	</div>
	<br />
	<input type="text" id="message">
	<input type="button" id="sendBtn" value="Send Message">
	<footer> </footer>
	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>
	<script>
	var user_id = encodeURIComponent('<%= session.getAttribute("user_id") %>');
		
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
		var wsocket;
		
		function connect() {
			wsocket = new WebSocket("ws://localhost:8083/ex-Websocket/chat-ws");
			var serverUrl = $("#serverUrl").val();
			alert("Call Websocket URL : "+serverUrl);
			
			
			wsocket.onopen = onOpen;
			wsocket.onmessage = onMessage;
			wsocket.onclose = onClose;
		}
		
		function disconnect() {
			wsocket.close();
		}
		function onOpen(evt) {
			appendMessage("Connected~!");
		}
		function onMessage(evt) {
			var data = evt.data;
			if (data.substring(0, 4) == "msg:") {
				appendMessage(data.substring(4));
			}
		}
		function onClose(evt) {
			appendMessage("Websocket Closed !!!");
		}
		
		function send() {
			var nickname = $("#nickname").val();
			var msg = $("#message").val();
			wsocket.send("msg:"+nickname+":" + msg);
			$("#message").val("");
		}

		function appendMessage(msg) {
			$("#chatMessageArea").append(msg+"<br>");
			var chatAreaHeight = $("#chatArea").height();
			var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			$("#chatArea").scrollTop(maxScroll);
		}

		$(document).ready(function() {
			$('#message').keypress(function(event){
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if(keycode == '13'){
					send();	
				}
				event.stopPropagation();
			});
			$('#sendBtn').click(function() { send(); });
			$('#enterBtn').click(function() { connect(); });
			$('#exitBtn').click(function() { disconnect(); });
		});
	</script>

</body>
</html>