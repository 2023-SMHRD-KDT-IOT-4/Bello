<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>SETTING</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/setting.css" />
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
                                <li><a href="" class="menu">MESSAGE</a></li>
                                <li><a href="" class="menu">VIDEO</a></li>
                            </ul>
                        </nav>
                    </div>
                </header>
                <div class="title"><h1>⚙ SETTING</h1></div>
                <div id="wrapper">

                    <div class="sound">
                        <h2>사용하실 벨소리를 선택해주세요🎵</h2>
                        <br>
                        <form action="">
                            <label class="box-radio-input"><input type="radio" name="sound" value="sound1"  checked> <span>SOUND1</span></label>
                            <br>
                            <label class="box-radio-input"><input type="radio" name="sound" value="sound2"  checked> <span>SOUND2</span></label>
                            <br>
                            <label class="box-radio-input"><input type="radio" name="sound" value="sound3"  checked> <span>SOUND3</span></label>
                            <br>
                            <label class="box-radio-input"><input type="radio" name="sound" value="sound4"  checked> <span>SOUND4</span></label>
                            <br>
                            <label class="box-radio-input"><input type="radio" name="sound" value="sound5"  checked> <span>SOUND5</span></label>
                            <!-- <input type="radio" name="sound" value="sound5"> <span>벨소리5</span> -->
                            <br>
                            <br>
                            <span class="volume_control">음량조절🔈</span><input type="range" min="0" max="100" id="ex-in"><span id="ex-out"></span>
                            <br>
                            <br>
                            <input type="submit" value="변경하기">
                        </form>
                    </div>
                    

                </div>
    
            <!-- 푸터수정하기! -->
            <!-- Footer -->
                <footer id="footer">
                    <!-- <ul class="icons">
                        <li><a href="#" class="icon brands alt fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon brands alt fa-facebook-f"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon brands alt fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon brands alt fa-github"><span class="label">GitHub</span></a></li>
                        <li><a href="#" class="icon solid alt fa-envelope"><span class="label">Email</span></a></li>
                    </ul> -->
                    <ul class="copyright">
                        <li>&copy; Untitled</li>
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

        <script src="resources/assets/js/sound.js"></script>
        <!-- 음량조절 -->
        <!-- <script>
            document.querySelector('#ex-in').addEventListener('input',e=>{
                document.querySelector('#ex-out').innerHTML= e.target.value;
            });
        </script> -->
        
	</body>
</html>