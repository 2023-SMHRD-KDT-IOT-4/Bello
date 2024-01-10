<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="resources/assets/css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>BELLO HOME</title>
    </head>
    
    <body class="is-preload"> <!-- 로드될 때 화면 움직이고 싶을 때 is-preload -->
        
        <div id="header">
        	<span><a href="member/logout" id="logout">LOGOUT</a></span>
            <div class="inner">
                <!-- <a href="member/logout" class="logout">LOGOUT</a> -->
                
                <span class="icon solid major fa-solid fa-bell"></span>
                <h1><strong>${member.user_name }</strong> 님 </h1> <br> <h1>환영합니다.</h1>
                <p>시작하려면 메뉴를 선택해주세요</p>
                <ul class="actions special">
                    <li><a href="#" class="button scrolly">MESSAGE</a></li>
                    <li><a href="#" onclick="openExternalURL('http://172.30.1.6:8000')" class="button scrolly">VIDEO</a></li>
                    <li><a href="#" class="button scrolly">SETTING</a></li>
                </ul>
            </div>
        </div>
        <footer>

        </footer>
        <!-- Scripts -->
                 <script src="resources/assets/js/jquery.min.js"></script>
                <script src="resources/assets/js/jquery.scrolly.min.js"></script>
                <script src="resources/assets/js/browser.min.js"></script>
                <script src="resources/assets/js/breakpoints.min.js"></script>
                <script src="resources/assets/js/util.js"></script>
                <script src="resources/assets/js/main.js"></script>
   <script>
            function openExternalURL(url) {
                window.open(url, '_blank');
            }
        </script>
    </body>
</html>