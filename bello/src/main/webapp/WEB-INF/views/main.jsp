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
		   var socket = new WebSocket('ws://172.30.1.22:8083/ws'); // WebSocket 서버의 주소로 변경

	        // 연결이 열린 경우
	        socket.addEventListener('open', function (event) {
	            console.log('WebSocket 연결이 열렸습니다.');
	            
	            // 메시지 전송 예제
	            var message = '안녕하세요, WebSocket 서버!';
	            socket.send(message);
	            console.log('보낸 메시지:', message);
	        });

	        // 메시지 수신 시
	        socket.addEventListener('message', function (event) {
	            console.log('서버에서 받은 메시지:', event.data);
	        });

	        // 연결이 닫힌 경우
	        socket.addEventListener('close', function (event) {
	            console.log('WebSocket 연결이 닫혔습니다.');
	        });

	        // 에러 발생 시
	        socket.addEventListener('error', function (event) {
	            console.error('WebSocket 에러:', event);
	        });
	</script>

</body>
</html>