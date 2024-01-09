<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/assets/css/join.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <title>기기등록 및 회원가입 - Bello</title>
</head>
<body >
    <div id="header">
        <div class="inner">
            <!-- <span class="icon solid major fa-cloud"></span> -->
            <span class="icon solid major fa-solid fa-bell"></span>
            <h1>기기등록 및 회원가입</h1>
           
            <form action="member/join.do" method="post">
                <div class="input-group">
                    <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." >
                    <button type="button" class="cbtn" onclick="checkDuplicateId()">아이디<br>중복확인</button>
                </div>
                	<div id="emailError"></div>
                <input type="password" name="user_pw" placeholder="비밀번호를 입력해주세요.">
                <br>
                <input type="password" placeholder="비밀번호를 다시 입력해주세요.">
                <br>
                <input type="text" name="user_name" id="user_name" placeholder="이름을 입력해주세요.">
                <br>
                <div class="input-group">
                    <input type="text" id="doorbell_num" name="doorbell_num" placeholder="시리얼번호를 입력해주세요.">
                    <button type="button" class="cbtn" onclick="checkDuplicateSkey()">시리얼<br>번호확인</button>
                </div>
                	<div id="serialkeyError"></div>
                <br>
                <input type="submit" value="회원가입" >
            </form>

        </div>
    </div>

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
        var doorbell_num = encodeURIComponent($('#doorbell_num').val());

        // AJAX 호출
        $.ajax({
            url: 'member/checkDuplicateSkey?doorbell_num=' + doorbell_num,
            type: 'GET',
            
            success: function (checkDuplicateSkey) {
            	console.log(checkDuplicateSkey);

                if (checkDuplicateSkey == 'available') {
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