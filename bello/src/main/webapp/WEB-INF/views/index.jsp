<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	
	</head>
	<body>
		<!-- Wrapper -->
		<div id="wrapper">
		<!-- Header -->
		<header id="header" class="alt">
			<a href="index.html" class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a>
			<nav>
				<c:choose>
					<c:when test="${empty member }">
						<a href="#menu">로그인</a>
					</c:when>
					<c:otherwise>
						<c:if test="${member.user_id eq 'admin'}">
							<a href="select">전체회원정보</a>
						</c:if>
						<a href="update">회원정보 수정</a>
						<a href="member/logout">로그아웃</a>
					</c:otherwise>
					</c:choose>
				
				<!-- 로그인 후 Logout.jsp로 이동할 수 있는'로그아웃'링크와 '개인정보수정'링크를 출력하시오. -->
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">	
			<ul class="links">
				<li><h5>로그인</h5></li>
				<form action="member/login.do" method="post">
				 	<li><input type="text" name="user_id" placeholder="Email을 입력하세요"></li>
					<li><input type="password" name="user_pw" placeholder="PW를 입력하세요"></li>
					<li><input type="submit" value="LogIn" class="button fit"></li>
					</form>
			</ul>
			<ul class="actions vertical">
				<li><h5>회원가입</h5></li>
				<!-- 현재 경로 : localhost:8083/myapp/ -->
				<!-- 회원가입 요청 : localhost:8083/myapp/member/join.do -->
				<form action="member/join.do" method="post">
					<li><input type="text" id="user_id" name="user_id" placeholder="Email을 입력하세요" >
					<button type="button" onclick="checkDuplicateId()">중복 확인</button></li>
					    <div id="emailError"></div>
					
    
					<li><input type="password" name="user_pw"  placeholder="PW를 입력하세요" ></li>
					<li><input type="text" name="user_name"  placeholder="닉네임을 입력하세요" ></li>
					<li><input type="text" name="doorbell_num"  placeholder="씨리얼키를 입력하세요" ></li>
					<button type="button" onclick="checkDuplicateSkey()">시리얼키 확인</button>
					 <div id="serialkeyError"></div>
					<li><input type="submit" value="JoinUs" class="button fit"></li>
				</form>
			</ul>
		</nav>			
		<!-- Banner -->
			<section id="banner" class="major">
				<div class="inner">
				<header class="major">
				<c:choose>
					<c:when test="${empty member }">
						<h1>로그인 한 세션아이디를 출력해주세요</h1>
					</c:when>
					<c:otherwise>
						<h1>${member.user_name }</h1>
					
					</c:otherwise>
					</c:choose>
				
					
					<!-- 로그인 후 로그인 한 사용자의 세션아이디로 바꾸시오.ex)smart님 환영합니다 -->
				</header>
				<div class="content">
					<p>아래는 지금까지 배운 웹 기술들입니다.<br></p>
					<ul class="actions">
						<li><a href="#one" class="button next scrolly">확인하기</a></li>
					</ul>
				</div>
				</div>
			</section>

		<!-- Main -->
			<div id="main">
			<!-- One -->
			<section id="one" class="tiles">
				<article>
					<span class="image">
						<img src="resources/images/pic01.jpg" alt="" />
					</span>
					<header class="major">
						<h3><a href="#" class="link">HTML</a></h3>
						<p>홈페이지를 만드는 기초 언어</p>
					</header>
				</article>
				<article>
					<span class="image">
						<img src="resources/images/pic02.jpg" alt="" />
					</span>
					<header class="major">
						<h3><a href="#" class="link">CSS</a></h3>
						<p>HTML을 디자인해주는 언어</p>
					</header>
				</article>
				<article>
					<span class="image">
						<img src="resources/images/pic03.jpg" alt="" />
					</span>
					<header class="major">
						<h3><a href="#" class="link">Servlet/JSP</a></h3>
						<p>Java를 기본으로 한 웹 프로그래밍 언어/스크립트 언어</p>
					</header>
				</article>
				<article>
					<span class="image">
						<img src="resources/images/pic04.jpg" alt="" />
					</span>
					<header class="major">
						<h3><a href="#" class="link">JavaScript</a></h3>
						<p>HTML에 기본적인 로직을 정의할 수 있는 언어</p>
					</header>
				</article>
				<article>
					<span class="image">
						<img src="resources/images/pic05.jpg" alt="" />
					</span>
					<header class="major">
						<h3><a href="#" class="link">MVC</a></h3>
						<p>웹 프로젝트 중 가장 많이 사용하는 디자인패턴</p>
					</header>
				</article>
				<article>
					<span class="image">
						<img src="resources/images/pic06.jpg" alt="" />
					</span>
					<header class="major">
						<h3><a href="#" class="link">Web Project</a></h3>
						<p>여러분의 최종프로젝트에 웹 기술을 활용하세요!</p>
					</header>
				</article>
			</section>
			<!-- Two -->
			<section id="two">
				<div class="inner">
					<header class="major">
						<h2>나에게 온 메세지 확인하기</h2>
					</header>
					<p></p>
					<ul class="actions">
						<li>로그인을 하세요.</li>
						<li><a href="#" class="button next scrolly">전체삭제하기</a></li>
					</ul>
				</div>
			</section>
			</div>

			<!-- Contact -->
			<section id="contact">
				<div class="inner">
				<section>
					<form>
						<div class="field half first">
							<label for="name">Name</label>
							<input type="text"  id="name" placeholder="보내는 사람 이름" />
						</div>
						<div class="field half">
							<label for="email">Email</label>
							<input type="text"  id="email" placeholder="보낼 사람 이메일"/>
						</div>
						<div class="field">
							<label for="message">Message</label>
							<textarea  id="message" rows="6"></textarea>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send Message" class="special" /></li>
							<li><input type="reset" value="Clear" /></li>
						</ul>
					</form>
				</section>
				<section class="split">
					<section>
						<div class="contact-method">
							<span class="icon alt fa-envelope"></span>
							<h3>Email</h3>
							<c:choose>
					<c:when test="${empty member }">
						<h1>로그인 한 사람의 이메일 출력해주세요</h1>
					</c:when>
					<c:otherwise>
						<h1>${member.user_id }</h1>
					
					</c:otherwise>
					</c:choose>
							<!-- 로그인 한 사용자의 이메일을 출력하시오 -->
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon alt fa-phone"></span>
							<h3>Phone</h3>
								<c:choose>
					<c:when test="${empty member }">
						<h1>로그인 한사람의 전화번호를 출력해주세요</h1>
					</c:when>
					<c:otherwise>
						<h1>${member.user_id }</h1>
					
					</c:otherwise>
					</c:choose>
							<!-- 로그인 한 사용자의 전화번호를 출력하시오 -->
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon alt fa-home"></span>
							<h3>Address</h3>
								<c:choose>
					<c:when test="${empty member }">
						<h1>로그인 한 사람의 주소를 출력해주세요</h1>
					</c:when>
					<c:otherwise>
						<h1>${member.user_id }</h1>
					
					</c:otherwise>
					</c:choose>
							<!-- 로그인 한 사용자의 집주소를 출력하시오 -->
						</div>
					</section>
				</section>					
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<ul class="icons">
						<li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
						<li><a href="#" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</footer>
			</div>

		<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="resources/assets/js/skel.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="resources/assets/js/main.js"></script>

<script>
    function checkDuplicateId() {
        var user_id = encodeURIComponent($('#user_id').val());

        // AJAX 호출
        $.ajax({
            url: 'member/checkDuplicateId?user_id=' + user_id,
            type: 'GET',
            
            success: function (checkDuplicateId) {
            	console.log(checkDuplicateId);

                if (checkDuplicateId == 'duplicate') {
                    $('#emailError').text('이미 사용 중인 이메일입니다.');
                } else {
                    $('#emailError').text('사용 가능한 이메일입니다.');
                }
            },
            error: function (xhr, status, error) {
                console.error('AJAX 호출 실패:', status, error);
                // 서버에서 에러 응답이 오면 콘솔에 상세한 정보 출력
            }
        });
    }
    
    function checkDuplicateSkey() {
        var product_num = encodeURIComponent($('#product_num').val());

        // AJAX 호출
        $.ajax({
            url: 'member/checkDuplicateSkey?product_num=' + product_num,
            type: 'GET',
            
            success: function (checkDuplicateSkey) {
            	console.log(checkDuplicateSkey);

                if (checkDuplicateSkey == 'duplicate') {
                    $('#serialkeyError').text('사용할 수 있는 기기입니다.');
                } else {
                    $('#serialkeyError').text('유효한 시리얼키를 입력해주세요.');
                }
            },
            error: function (xhr, status, error) {
                console.error('AJAX 호출 실패:', status, error);
                // 서버에서 에러 응답이 오면 콘솔에 상세한 정보 출력
            }
        });
    }   
    
</script>


	</body>
</html>

