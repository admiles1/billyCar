<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<!-- 부트스트랩 CSS 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Chart.js CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js">


<!-- 관리자 페이지 스타일 -->
<style>
  /* 추가적인 스타일링 */
  .card {
    margin-bottom: 20px;
  }
   /* 추가적인 스타일링 */
  .nav-link {
    white-space: nowrap;
  }
  .card-text {
    white-space: nowrap;
  	
  }
  
</style>
</head>
<body>
<main class="container">


    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="./">관리자 페이지</a>
    </nav>

  <!-- 사이드바 -->
  <div class="container-fluid">
    <div class="row">
      <jsp:include page="sidebar.jsp" />

      <!-- 메인 컨텐츠 영역 -->
      <main role="main" class="col-md-10 col-lg-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">관리자 메인</h1>
        </div>

        <!-- 메인 페이지의 내용 추가 -->
        <div class="row">
          <div class="col-md-12 px-0">
            <div class="card">
              <div class="card-body">
                <canvas id="myChart"></canvas>
              </div>
            </div>
          </div>
          
        </div>
        <div class="row">
            <div class="card col-md-4">
              <div class="card-body">
                <h5 class="card-title">회원 정보</h5>
                <hr>
                <p class="card-text">총 회원 수 : ${totalMember }</p>
                <p class="card-text">당일 가입 회원 수 : ${todayMember }</p>
              </div>
            </div>
            <div class="card col-md-4">
              <div class="card-body">
                <h5 class="card-title">차량 정보</h5>
                <hr>
                <p class="card-text">총 차량 수 : ${allCarCount }</p>
                <p class="card-text">현재 대여 가능 차량수 : ${rentCarCount }</p>
              </div>
            </div>
            <div class="card col-md-4">
              <div class="card-body">
                <h5 class="card-title">게시판 정보</h5>
                
                <hr>
                <p class="card-text">총 리뷰 수 : ${allReview }</p>
                <p class="card-text">평균 별점 : ${reviewAvg }</p>
              </div>
            </div>
        </div>
        
        
        
      </main>
    </div>
  </div>
</main>
  <!-- jQuery, Popper.js, 부트스트랩 JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- Chart.js JS -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    // 차트 데이터 생성
    var paymentAmount = ${paymentAmount};
    console.log(paymentAmount);
    //2D 그래픽 컨텍스트를 가져온다
    var ctx = document.getElementById('myChart').getContext('2d');
    
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['1월', '2월', '3월', '4월', '5월', '6월','7월', '8월', '9월', '10월', '11월', '12월'],
            datasets: [{
                label: '매출 현황',
                data: paymentAmount,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
  </script>
</body>
</html>