<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <title>Video Board</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="resources/assets/css/video.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="resources/assets/js/video.js"></script>
</head>

<body class="is-preload">
    <div id="wrap">

        <!-- Header -->
        <header id="header">
            <div class="header_wrap">
                <a href="main2.html"><span class="icon solid major fa-solid fa-bell fa-2x "></span>
                    <span class="logo">BELLO</span></a>
                    <a href="home.html" class="logout">LOGOUT</a>
            </div>
            <div class="pg_nav">
                <nav>
                    <ul>
                        <li><a href="/message2.html" class="menu">MESSAGE</a></li>
                        <li><a href="/setting.html" class="menu">SETTING</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="title"><h1>📼 VIDEO</h1></div>

        <div id="wrapper">
            <!-- 비디오 게시판 -->
            <div class="msg" >
                <br>
                <br>
                <h2> VIDEO LIST</h2>
                <br>
                <table class="videoList" id="videoList">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                    </tr>

                    <!-- 행번호 추가 리스트는 자바스크립트로 사용했습니다 -->
                </table>

                <br>
                <br>
                <!-- 페이지 이동(5개씩 정렬) 위한 버튼 -->
                <div class="center">
                    <button onclick="prevPage()">◀ 이전 페이지</button>
                    <button onclick="nextPage()">다음 페이지 ▶</button>
                </div>

                <hr>

                <!-- 비디오 재생을 위한 모달 -->
                <div id="videoModal" class="modal">
                    <span class="close" onclick="closeVideoModal()">&times;</span>
                    <video id="videoPlayer" width="480" height="315" controls>
                        Your browser does not support the video tag.
                    </video>
                </div>

               
               
                <!-- 스트리밍 페이지로 이동할 버튼 -->
                <div id="streamBtnWrap">
                    <h2> STREAMING</h2> <br>
                    <button class="streamBtn" type="button" id="streamBtn">
                        스트리밍 보기
                    </button>
                </div>

               
            </div>
        </div>

        <!-- 푸터수정하기! -->
        <!-- Footer -->
        <footer id="footer">
           
            <ul class="copyright">
                <li>&copy; BELLO</li>
                
            </ul>
        </footer>
    </div>

    <!-- Scripts -->
    <script src=".resources/asset/js/jquery.min.js"></script>
    <script src=".resources/assets/js/jquery.scrolly.min.js"></script>
    <script src=".resources/assets/js/browser.min.js"></script>

    <!-- 모달 뜨도록 자바스크립트 연결 -->
    <script src="resources/assets/js/video.js"></script>

    <script>
        // 버튼 클릭 시 스트리밍 페이지를 새 창에서 열기
        document.getElementById("streamBtn").addEventListener("click", function () {
            // 스트리밍 페이지의 URL을 여기에 입력하세요 
            var streamingPageURL = "http://172.30.1.6:8000";

            // 새 창에서 열기
            window.open(streamingPageURL, "_blank");
        });
    </script>
    </body>