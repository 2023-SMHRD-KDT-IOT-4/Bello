<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="resources/assets/css/LCD.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <title>LCD</title>
</head>
<body>
   <div class="wrapper">
      <div class="bellcontainer">
         <a id="bellBtn" class="button btnPush btnLightBlue" >
            <i class="fa-solid fa-bell fa-10x"></i>
         </a>
      </div>
      <div class="msgcontainer">
      
            <!-- chat Area 영역 -->
            <div class="chatarea">

                <input type="hidden" type="text" id="serverUrl" value="ws://172.30.1.22:8083/ex-Websocket/chat-ws" style="width: 400px">

                <input type="hidden" id="enterBtn" value="Enter" >
                <input  type="hidden" type="button" id="exitBtn" value="Exit">

                    <div id="chatArea">
                        <div id="chatMessageArea"></div>
                    </div>
                    <input type="hidden" id="message">
                    <input type="hidden" id="sendBtn" value="Send Message">
            </div>
            <!-- chat Area 영역 끝 -->
        </div>
      <div class="sendmsg">
         <p>남기실 메세지를 선택해 주세요😀</p>
         <ol class="list">
            <a id="fixedMsgBtn1" ><li>문 앞에 두고 갑니다.</li></a>
            <a id="fixedMsgBtn2" ><li>다시 방문 하겠습니다.</li></a>
            <a id="fixedMsgBtn3" ><li>전송 메세지 3</li></a>
            <a id="fixedMsgBtn4" ><li>전송 메세지 4</li></a>
            <a id="fixedMsgBtn5" ><li>전송 메세지 5</li></a>
         </ol>
      </div>

    
        

    <footer></footer>
    <!-- Scripts -->
    <script src="resources/assets/js/jquery.min.js"></script>
    <script src="resources/assets/js/jquery.scrolly.min.js"></script>
    <script src="resources/assets/js/browser.min.js"></script>
    <script src="resources/assets/js/breakpoints.min.js"></script>
    <script src="resources/assets/js/util.js"></script>
    <script src="resources/assets/js/main.js"></script>

    <script>

        $(document).ready(function () {
            // WebSocket 연결을 생성합니다.
            let socket;
            // Enter 버튼 클릭 시 WebSocket 연결
             $(document).ready(function () {
                socket = new WebSocket($('#serverUrl').val());

                // 연결이 열릴 때 실행되는 이벤트 핸들러
                socket.addEventListener('open', (event) => {
                    console.log('WebSocket 연결이 열렸습니다.');
                    socket.send('Connected.');
                });

                // 메시지를 받았을 때 실행되는 이벤트 핸들러
                socket.addEventListener('message', (event) => {
                    console.log('서버로부터 메시지를 받았습니다:', event.data);
                    // 이곳에서 받은 메시지를 처리할 수 있습니다.
                    displayMessage(event.data);
                });

                // 연결이 닫힐 때 실행되는 이벤트 핸들러
                socket.addEventListener('close', (event) => {
                    console.log('WebSocket 연결이 닫혔습니다.');
                });

                // 에러가 발생했을 때 실행되는 이벤트 핸들러
                socket.addEventListener('error', (event) => {
                    console.error('WebSocket 에러가 발생했습니다:', event);
                });
               
            });

            // Exit 버튼 클릭 시 WebSocket 연결 종료
            $('#exitBtn').click(function () {
                if (socket) {
                    socket.close();
                }
            });

            // Send 버튼 클릭 시 메시지 전송
            $('#sendBtn').click(function () {
                if (socket && socket.readyState === WebSocket.OPEN) {
                    const message = $('#message').val();
                    socket.send(message);
                    $('#message').val(''); // 메시지 전송 후 입력창 초기화

               
                }
            });
            // 벨버튼 메시지 전송
            $('#bellBtn').click(function () {
               var today = new Date();   

               var hours = ('0' + today.getHours()).slice(-2); 
               var minutes = ('0' + today.getMinutes()).slice(-2);
               var seconds = ('0' + today.getSeconds()).slice(-2); 

               var timeString = hours + ':' + minutes  + ':' + seconds;

                if (socket && socket.readyState === WebSocket.OPEN) {
                    const message ="손님 왔어요~"+timeString;
                    socket.send(message);
                
                    var chatArea = document.getElementById('chatArea');
                    chatArea.scrollTop = chatArea.scrollHeight;
                    $('#message').val(''); // 메시지 전송 후 입력창 초기화


                }
            });
            // 고정버튼 메시지 전송 1~5
            $('#fixedMsgBtn1').click(function () {
              var today = new Date();   

               var hours = ('0' + today.getHours()).slice(-2); 
            var minutes = ('0' + today.getMinutes()).slice(-2);
              var seconds = ('0' + today.getSeconds()).slice(-2); 

             var timeString = hours + ':' + minutes  + ':' + seconds;

            if (socket && socket.readyState === WebSocket.OPEN) {
                 const message = "Guest:"+"문 앞에 두고 갑니다. "+timeString;
                socket.send(message);
               
                    var chatArea = document.getElementById('chatArea');
                    chatArea.scrollTop = chatArea.scrollHeight;
                    $('#message').val(''); // 메시지 전송 후 입력창 초기화

               
                 
             }
           });
            $('#fixedMsgBtn2').click(function () {
                  var today = new Date();   

                   var hours = ('0' + today.getHours()).slice(-2); 
                var minutes = ('0' + today.getMinutes()).slice(-2);
                  var seconds = ('0' + today.getSeconds()).slice(-2); 

                 var timeString = hours + ':' + minutes  + ':' + seconds;

                if (socket && socket.readyState === WebSocket.OPEN) {
                     const message = "Guest:"+"다시 방문 하겠습니다. "+timeString;
                    socket.send(message);
                    
                        var chatArea = document.getElementById('chatArea');
                    chatArea.scrollTop = chatArea.scrollHeight;
                        $('#message').val(''); // 메시지 전송 후 입력창 초기화

               
                 }
               });
            $('#fixedMsgBtn3').click(function () {
                  var today = new Date();   

                   var hours = ('0' + today.getHours()).slice(-2); 
                var minutes = ('0' + today.getMinutes()).slice(-2);
                  var seconds = ('0' + today.getSeconds()).slice(-2); 

                 var timeString = hours + ':' + minutes  + ':' + seconds;

                if (socket && socket.readyState === WebSocket.OPEN) {
                     const message = "Guest:"+"전송 메세지. "+timeString;
                    socket.send(message);
                     
                        var chatArea = document.getElementById('chatArea');
                    chatArea.scrollTop = chatArea.scrollHeight;
                        $('#message').val(''); // 메시지 전송 후 입력창 초기화

              
                 }
               });
            $('#fixedMsgBtn4').click(function () {
                  var today = new Date();   

                   var hours = ('0' + today.getHours()).slice(-2); 
                var minutes = ('0' + today.getMinutes()).slice(-2);
                  var seconds = ('0' + today.getSeconds()).slice(-2); 

                 var timeString = hours + ':' + minutes  + ':' + seconds;

                if (socket && socket.readyState === WebSocket.OPEN) {
                     const message = "Guest:"+"전송 메세지4. "+timeString;
                    socket.send(message);
                    
                        var chatArea = document.getElementById('chatArea');
                    chatArea.scrollTop = chatArea.scrollHeight;
                        $('#message').val(''); // 메시지 전송 후 입력창 초기화

                   
                 }
               });
            $('#fixedMsgBtn5').click(function () {
                  var today = new Date();   

                   var hours = ('0' + today.getHours()).slice(-2); 
                var minutes = ('0' + today.getMinutes()).slice(-2);
                  var seconds = ('0' + today.getSeconds()).slice(-2); 

                 var timeString = hours + ':' + minutes  + ':' + seconds;

                if (socket && socket.readyState === WebSocket.OPEN) {
                     const message = "Guest:"+"전송 메세지5. "+timeString;
                    socket.send(message);
                   
                        var chatArea = document.getElementById('chatArea');
                    chatArea.scrollTop = chatArea.scrollHeight;
                        $('#message').val(''); // 메시지 전송 후 입력창 초기화

           
                 }
               });
            // 추가: 채팅창에 메시지를 표시하는 함수
            function displayMessage(message) {
                $('#chatMessageArea').append('<p>' + message + '</p>');
                var chatArea = document.getElementById('chatArea');
                chatArea.scrollTop = chatArea.scrollHeight;
            }

            // 추가: 버튼 클릭 시 메시지 전송
            function send() {
                if (socket && socket.readyState === WebSocket.OPEN) {
                    const message = "버튼으로 전송한 메시지!";
                    socket.send(message);

                   
                }
            }
            
         

          
        });
    </script>
</body>
</html>