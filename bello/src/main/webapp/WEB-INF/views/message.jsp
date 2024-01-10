<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Message</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/msg2.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body class="is-preload">
         <div id="wrap">

            <!-- Header -->
                <header id="header">
                   
                    <div class="header_wrap">
                        <a href=""><span class="icon solid major fa-solid fa-bell fa-2x "></span>
                        <span class="logo">BELLO</span></a>
                        <a href="" class="logout">LOGOUT</a>
                    </div>
                    <div class="pg_nav">
                        <nav>
                            <ul>
                                <li><a href="" class="menu">VIDEO</a></li>
                                <li><a href="" class="menu">SETTING</a></li>
                            </ul>
                        </nav>
                    </div>
                </header>
                <div class="title"><h1>✉ MESSAGE</h1></div>
                <div id="wrapper">

                    <div class="msg">
                        <h2>전송할 메시지를 선택해주세요😀</h2>
                        <br>
                        <br>
                        <form action="">
                            
                            <!-- <label for="delivery_option" >배송 옵션 선택</label>  -->
                            
                            <select id="delivery_option" name="delivery_option">
                                <option value="" selected>메시지를 선택하세요</option>
                                <option value="door">문 앞에 두고 가주세요</option>
                                <option value="dog">강아지가 있어 벨 누르지 말아주세요</option>
                                <option value="baby">아기가 있어 벨 누르지 말아주세요</option>
                                <option value="custom_message">직접입력</option>
                               
                            </select>
                            <br>
                            

                            <label style="display: none;" id="custom_message_label">
                                직접입력<br>
                                <textarea id="custom_message" name="custom_message"  placeholder="배송메모를 입력해주세요"  cols="30" rows="5" maxlength="500"></textarea>
                            </label>
                            <br>

                            <input type="submit" value="Send">
                        </form>
                    </div>
                </div>
    
            <!-- 푸터수정하기! -->
            <!-- Footer -->
                <footer id="footer">
                   
                    <ul class="copyright">
                        <li>&copy; BELLO</li>
                        <!-- <li>Design: <a href="http://html5up.net">HTML5 UP</a></li> -->
                    </ul>
                </footer>
        </div>


		<!-- Scripts -->
        		<script src="resources/assets/js/jquery.min.js"></script>
                <script src="resources/assets/js/jquery.scrolly.min.js"></script>
                <script src="resources/assets/js/browser.min.js"></script>
                <script src="resources/assets/js/breakpoints.min.js"></script>
                <script src="resources/assets/js/util.js"></script>
                <script src="resources/assets/js/main.js"></script>
			<!-- 메세지보내기 -->
        		<script src="resources/assets/js/custom_messaga.js"></script>
	</body>
</html>