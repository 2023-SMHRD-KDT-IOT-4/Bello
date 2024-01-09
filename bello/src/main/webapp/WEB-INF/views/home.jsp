<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- <link rel="stylesheet" href="assets/css/home.css" /> -->
        <link rel="stylesheet" href="resources/assets/css/home.css">
        <!-- <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript> -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> 
		        <script>
		    // JSP 페이지 상단에 JavaScript 코드를 추가
		    $(document).ready(function () {
		        var joinResult = '<%= request.getParameter("joinResult") %>'; // joinResult 파라미터 값 받기
		
		        if (joinResult === 'fail') {
		            // 회원가입 실패 시 알람 메시지 띄우기
		            alert('회원가입에 실패했습니다. 다시 시도해주세요.');
		        } else if (joinResult === 'fail1'){
		            alert('회원가입에 실패했습니다. 유효한 시리얼키와 아이디를 확인해주세요.');

		        } else if (joinResult === 'success'){
		            alert('회원가입에 성공했습니다.');
		
		        }
		    });
				</script>   
        <title>BELLO HOME</title>
    </head>
    <body class="is-preload"> <!-- 로드될 때 화면 움직이고 싶을 때 is-preload -->
        <div id="header">
            <div class="inner">
                <!-- <span class="icon solid major fa-cloud"></span> -->
                <span class="icon solid major fa-solid fa-bell"></span>
                <h1>Hi, I'm <strong>BELLO</strong>.<br /></h1>
                <p>벨로와 함께 하는 Smart Life</p>
                <ul class="actions special">
                <li><a href="login" class="button scrolly">Login</a></li>
                <li><a href="join"  class="button scrolly">Join</a></li>
                   
                </ul>
            </div>
        </div>
        <!-- Scripts -->
                <script src="resources/assets/js/jquery.min.js"></script>
                <script src="resources/assets/js/jquery.scrolly.min.js"></script>
                <script src="resources/assets/js/browser.min.js"></script>
                <script src="resources/assets/js/breakpoints.min.js"></script>
                <script src="resources/assets/js/util.js"></script>
                <script src="resources/assets/js/main.js"></script>
    </body>
</html>
