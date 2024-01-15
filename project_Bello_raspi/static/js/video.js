//video.js
//비디오 리스트 for문
var videoData = [];

//날짜 date
var todayDate = new Date(); // 현재날짜 얻기 위한 Date 객체 생성
var year = todayDate.getFullYear();
var month = todayDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
var day = todayDate.getDate();
var today = '오늘'





for (let i = 1; i <= 10 ; i++) {
  const url = `/static/video/video_${i}.avi`;

  const date = today;
  const title = `video_${i}`;

  // 배열에 요소 추가
  videoData.push({
      title: title,
      date: date,
      url: url
  });
}

//------------------------------------------------------------------------------------ 


// 페이지당 보여질 동영상 개수
var videosPerPage = 5;

// 현재 페이지 번호
var currentPage = 1;

// 페이지 로드 시 비디오 목록 테이블에 추가
document.addEventListener("DOMContentLoaded", function () {
  showVideos(currentPage);
});

// 비디오 목록에 행 추가 함수
function addVideoRow(title, date, url, index) {
  var table = document.getElementById("videoList");
  var row = table.insertRow();
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);

  // 현재 페이지와 시작 인덱스를 이용하여 행 번호 계산
  var rowNumber = (currentPage - 1) * videosPerPage + index + 1;

  cell1.innerHTML = rowNumber;
  cell2.innerHTML = `<a href="#" class="video" onclick="openVideoModal('${url}'); return false;">${title}</a>`;
  cell3.innerHTML = date;
}
// 특정 페이지의 동영상을 보여주는 함수
function showVideos(page) {

  // 표 초기화
  clearTable();

  // 시작 인덱스와 끝 인덱스 계산
  var startIndex = (page - 1) * videosPerPage;
  var endIndex = startIndex + videosPerPage;

  // 현재 페이지에 해당하는 동영상만 추가
  for (var i = startIndex; i < endIndex && i < videoData.length; i++) {
      addVideoRow(videoData[i].title, videoData[i].date, videoData[i].url, i - startIndex);
  }
}

// 표 초기화 함수
function clearTable() {
  var table = document.getElementById("videoList");
  // 첫 번째 행을 남기고 모두 제거
  for (var i = table.rows.length - 1; i > 0; i--) {
    table.deleteRow(i);
  }
}







// 이전 페이지로 이동하는 함수
function prevPage() {
  if (currentPage > 1) {
    currentPage--;
    showVideos(currentPage);
  }
}

// 다음 페이지로 이동하는 함수
function nextPage() {
  var totalPages = Math.ceil(videoData.length / videosPerPage);
  if (currentPage < totalPages) {
    currentPage++;
    showVideos(currentPage);
  }
}

//모달함수
function openVideoModal(videoPath) {
  var videoModal = document.getElementById("videoModal");
  var videoPlayer = document.getElementById("videoPlayer");

  // 동영상 소스 변경
  videoPlayer.src = videoPath;

  // 모달 창 열기
  videoModal.style.display = "block";

  // 동영상 재생
  videoPlayer.play();
}

function closeVideoModal() {
  var videoModal = document.getElementById("videoModal");
  var videoPlayer = document.getElementById("videoPlayer");

  // 동영상 일시 정지
  videoPlayer.pause();

  // 동영상 소스 초기화
  videoPlayer.src = "";

  // 모달 창 닫기
  videoModal.style.display = "none";
}



