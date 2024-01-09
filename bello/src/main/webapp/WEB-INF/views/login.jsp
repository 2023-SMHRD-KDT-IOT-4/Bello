<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/assets/css/login.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Join</title>
</head>
<body >
    <div id="header">
        <div class="inner">
            <!-- <span class="icon solid major fa-cloud"></span> -->
            <span class="icon solid major fa-solid fa-bell"></span>
            <h1>로그인</h1>
           
            <form action="member/login.do" method="post">
                <input type="text" name="user_id" placeholder="아이디를 입력해주세요.">
                <br>
                <input type="password" name="user_pw" placeholder="비밀번호를 입력해주세요.">
                <br>
                <input type="submit" value="로그인" >
            </form>

        </div>
    </div>

</body>
</html>