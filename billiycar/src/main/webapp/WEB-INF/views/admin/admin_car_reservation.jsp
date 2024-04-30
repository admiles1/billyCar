<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 차량 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .reserved {
            color: red;
            font-weight: bold;
        }

        .available {
            color: green;
            font-weight: bold;
        }

        .nav-link {
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
      <jsp:include page="sidebar.jsp" />
            <main role="main" class="col-md-10 ml-sm-auto px-4">
                <div
                        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">예약 차량 관리</h1>
                </div>
                <div class="form-inline mb-3">
                    <div class="form-group mr-2">
                        <input type="text" class="form-control" id="searchInput"
                               placeholder="차량 검색">
                    </div>
                    <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>차량 모델</th>
                            <th>차량 번호</th>
                            <th>예약 상태</th>
                            <th>예약한 회원</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- Hard-coded data for demonstration -->
                        <tr>
                            <td>1</td>
                            <td>현대 소나타</td>
                            <td> 1 </td>
                            <td><span class="reserved">예약불가능</span></td>
                            <td>김철수</td>
                        </tr>
                        <!-- 추가된 예약 데이터 -->
                        <!-- More rows here, add 20 more reservations with random names -->
                        <tr>
                            <td>2</td>
                            <td>기아 K5</td>
                            <td> 4 </td>
                            <td><span class="available">예약가능</span></td>
                            <td>이영희</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>르노삼성 SM6</td>
                            <td> 14 </td>
                            <td><span class="reserved">예약불가능</span></td>
                            <td>박준혁</td>
                        </tr>
                        <!-- Add more rows up to 20 -->
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
