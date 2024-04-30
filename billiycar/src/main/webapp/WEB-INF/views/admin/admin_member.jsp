<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 목록 조회</title>
<!-- 부트스트랩 CSS 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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

   <div class="container-fluid">
    <div class="row">
      <jsp:include page="sidebar.jsp" />

      <!-- 메인 컨텐츠 영역 -->
      <main role="main" class="col-md-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">회원 목록 조회</h1>
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
                  <a href="#" class="btn btn-sm btn-primary">상세보기</a>
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