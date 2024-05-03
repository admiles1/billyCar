<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 차량 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .status-available { color: green; font-weight: bold; }
        .status-reserved { color: red; font-weight: bold; }
        .status-maintenance { color: orange; font-weight: bold; }
        .nav-link { white-space: nowrap; }
        .input-group { width: 40%; } /* 검색 영역 너비 조정 */
        .form-select { margin-right: 2px; } /* 셀렉트 박스와 입력 필드 사이의 간격 조정 */
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
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">예약 차량 관리</h1>
                </div>
                <!-- 검색 및 필터링 영역 -->
                <div class="d-flex justify-content-end mb-3">
                    <div class="input-group">
                        <select class="form-select" id="searchCategory">
                            <option value="member">회원</option>
                            <option value="car">차량</option>
                        </select>
                        <input type="text" class="form-control" id="searchInput" placeholder="검색어 입력">
                        <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>차량 모델</th>
                                <th>차량 번호</th>
                                <th>상태</th>
                                <th>예약한 회원</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>현대 아반떼</td>
                                <td>11가 1111</td>
                                <td><span class="status-reserved">예약됨</span></td>
                                <td>홍길동</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>기아 K5</td>
                                <td>22나 2222</td>
                                <td><span class="status-available">가능</span></td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>르노삼성 SM6</td>
                                <td>33다 3333</td>
                                <td><span class="status-maintenance">점검 중</span></td>
                                <td>-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Optional: JavaScript 로직 추가 가능
</script>
</body>
</html>
