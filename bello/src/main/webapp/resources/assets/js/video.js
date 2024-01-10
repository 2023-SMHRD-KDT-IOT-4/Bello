// 동영상리스트 행번호추가
var rowCount = 0;

function addVideoRow(title, date, url) {
  rowCount++;
  var table = document.getElementById("videoList");
  var row = table.insertRow();
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);

  cell1.innerHTML = rowCount;
  cell2.innerHTML = `<a href="#" class="video" onclick="openVideoModal('${url}'); return false;">${title}</a>`;
  cell3.innerHTML = date;
}
// 동영상리스트 표 안 출력 내용
var videoData = [
  { title: "belloVideo1", date: "2024-01-03", url: "./video/cat.mp4" },
  { title: "belloVideo2", date: "2024-01-04", url: "./video/cat.mp4" },
  { title: "belloVideo3", date: "2024-01-05", url: "./video/cat.mp4" },
  { title: "belloVideo4", date: "2024-01-06", url: "./video/cat.mp4" },
  { title: "belloVideo5", date: "2024-01-07", url: "./video/cat.mp4" },
  { title: "belloVideo6", date: "2024-01-08", url: "./video/cat.mp4" }

];

for (var i = 0; i < videoData.length; i++) {
  addVideoRow(videoData[i].title, videoData[i].date, videoData[i].url);
}



var rowCount = 0;

function addVideoRow(title, date, url) {
  rowCount++;
  var table = document.getElementById("videoList");
  var row = table.insertRow();
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);

  cell1.innerHTML = rowCount;
  cell2.innerHTML = `<a href="#" class="video" onclick="openVideoModal('${url}'); return false;">${title}</a>`;
  cell3.innerHTML = date;
}

// 동영상리스트 표 안 출력 내용
var videoData = [
  { title: "belloVideo1", date: "2024-01-03", url: "./video/cat.mp4" },
  { title: "belloVideo2", date: "2024-01-04", url: "./video/cat.mp4" },
  { title: "belloVideo3", date: "2024-01-05", url: "./video/cat.mp4" },
  { title: "belloVideo4", date: "2024-01-06", url: "./video/cat.mp4" },
  { title: "belloVideo5", date: "2024-01-07", url: "./video/cat.mp4" },
  { title: "belloVideo6", date: "2024-01-08", url: "./video/cat.mp4" }
];

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



