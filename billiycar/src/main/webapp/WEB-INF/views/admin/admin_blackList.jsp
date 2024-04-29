<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>블랙 리스트 관리</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
                    <a class="nav-link" href="#"><i class="fas fa-list"></i> 회원 목록 조회</a>
                  </li>
                  <!-- 블랙리스트 관리 -->
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user-lock"></i> 블랙리스트 관리</a>
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
                    <a class="nav-link" href="#"><i class="fas fa-list"></i> 차량 목록 조회</a>
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
      <main role="main" class="col-md-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">블랙 리스트 관리</h1>
        </div>

        <!-- 회원 목록 검색 기능 -->
        <form class="form-inline mb-3">
          <div class="form-group mr-2">
            <input type="text" class="form-control" placeholder="검색어 입력">
          </div>
          <div class="form-group mr-2">
            <select class="form-control">
              <option value="">전체</option>
              <option value="active">활성 회원</option>
              <option value="inactive">비활성 회원</option>
            </select>
          </div>
          <button type="submit" class="btn btn-primary">검색</button>
        </form>

        <!-- 회원 목록 테이블 -->
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>가입일</th>
                <th>상태</th>
                <th>조작</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>홍길동</td>
                <td>hong@example.com</td>
                <td>2024-04-17</td>
                <td>활성</td>
                <td>
                  <a href="#" class="btn btn-sm btn-primary">기간 수정</a>
                  <button class="btn btn-sm btn-danger">삭제</button>
                </td>
              </tr>
              <!-- 다른 회원들의 정보도 동일한 형식으로 추가 -->
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>
</main>
<!-- jQuery, Popper.js, 부트스트랩 JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>