<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h1>Websocket 예제</h1>
<p>
<pre>
<span>[안내]</span>
websocket 기능을 지원하는 브라우저에서 동작이 가능함.
웹소켓 브라우저 확인 서비스 : http://websocketstest.com/ <a href="http://websocketstest.com/" >[이동]</a>

<span>[참고]</span>
본 예제는 기능동작 테스트 단계의 셈플입니다.
서비스를 위한 예외처리 등의 보완이 필요합니다.

</pre>
</p>

<div>
	<ul id="menu">
		<li><a href="<c:out value='echo-ws.jsp' />">/echo-ws.jsp</a>: Stomp 에코 예제</li><br />
		<li><a href="<c:out value='chat-ws.jsp' />">/chat-ws.jsp</a>: Stomp 채팅 예제</li>
	</ul>
</div>

</body>
</html>
