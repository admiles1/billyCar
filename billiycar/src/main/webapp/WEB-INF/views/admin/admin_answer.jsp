<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        <a class="navbar-brand" href="#">관리자 페이지</a>
    </nav>

  <!-- 사이드바 -->
  <div class="container-fluid">
    <div class="row">
      <nav class="col-md-2 d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
          <ul class="nav flex-column">
            <!-- 관리자 페이지 메뉴 -->
            <li class="nav-item">
              <a class="nav-link active" href="admin_main.jsp"><i class="fas fa-tachometer-alt"></i> 관리자 메인</a>
            </li>
            <!-- 회원 관리 메뉴 -->
            <li class="nav-item">
              <a class="nav-link" href="#" data-toggle="collapse" data-target="#memberMenu" aria-expanded="false" aria-controls="memberMenu"><i class="fas fa-users"></i> 회원 관리</a>
              <div id="memberMenu" class="collapse">
                <ul class="nav flex-column pl-3">
                  <!-- 회원 목록 조회 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_member.jsp"><i class="fas fa-list"></i> 회원 목록 조회</a>
                  </li>
                  <!-- 블랙리스트 관리 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_blackList.jsp"><i class="fas fa-user-lock"></i> 블랙리스트 관리</a>
                  </li>
                </ul>
              </div>
            </li>
            <!-- 차량 관리 메뉴 -->
            <li class="nav-item">
              <a class="nav-link" href="#" data-toggle="collapse" data-target="#carMenu" aria-expanded="false" aria-controls="carMenu"><i class="fas fa-car"></i> 차량 관리</a>
              <div id="carMenu" class="collapse">
                <ul class="nav flex-column pl-3">
                  <!-- 차량 목록 조회 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_car.jsp"><i class="fas fa-list"></i> 차량 목록 조회</a>
                  </li>
                  <!-- 신규 차량 등록 -->
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-car"></i> 신규 차량 등록</a>
                  </li>
                  <!-- 예약 차량 관리 -->
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-calendar-alt"></i> 예약 차량 관리</a>
                  </li>
                </ul>
              </div>
            </li>
            <!-- 고객 관리 메뉴 -->
            <li class="nav-item">
              <a class="nav-link" href="#" data-toggle="collapse" data-target="#customerMenu" aria-expanded="false" aria-controls="customerMenu"><i class="fas fa-user"></i> 고객 관리</a>
              <div id="customerMenu" class="collapse">
                <ul class="nav flex-column pl-3">
                  <!-- 1:1 문의 상담 내역 -->
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-comments"></i> 1:1 문의 상담 내역</a>
                  </li>
                  <!-- 답변 내역 -->
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-reply"></i> 답변 내역</a>
                  </li>
                  <!-- 리뷰 관리 -->
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-star"></i> 리뷰 관리</a>
                  </li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </nav>

      <!-- 메인 컨텐츠 영역 -->
      <main role="main" class="col-md-10 col-lg-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">답변하기</h1>
        </div>

       <!-- 메인 페이지의 내용 추가 -->
		<div class="container">
		  <div class="row">
		    <div class="col-md-8 offset-md-2">
		      <div class="card">
		        <div class="card-body">
		          <h5 class="card-title">1:1 상담 내역</h5>
		          <!-- 각 문의를 반복하여 보여줍니다. -->
		          <!-- 데모를 위해 단일 문의에 대한 정적 폼을 만듭니다. -->
		          <form id="responseForm">
		            <!-- 문의 내용 -->
		            <div class="form-group">
		              <label for="inquiry">문의 내용:</label>
		              <textarea class="form-control" id="inquiry" rows="3" readonly>고객이 작성한 문의 내용이 여기에 표시됩니다.</textarea>
		            </div>
		            <!-- 답변 입력 -->
		            <div class="form-group">
		              <label for="response">답변:</label>
		              <textarea class="form-control" id="response" rows="3"></textarea>
		            </div>
		            <!-- 제출 버튼 -->
		            <div class="form-group text-center">
			            <button type="submit" class="btn btn-primary">답변하기</button>
		            </div>
		          </form>
		        </div>
		      </div>
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
</body>
</html>