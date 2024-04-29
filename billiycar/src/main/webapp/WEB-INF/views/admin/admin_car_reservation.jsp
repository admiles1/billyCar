<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 차량 관리</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            <nav class="col-md-2 d-md-block bg-light sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <!-- 관리자 페이지 메뉴 -->
                        <li class="nav-item"><a class="nav-link active"
                                                href="admin_main.jsp"><i class="fas fa-tachometer-alt"></i>
                                관리자 메인</a></li>
                        <!-- 회원 관리 메뉴 -->
                        <li class="nav-item"><a class="nav-link" href="#"
                                                data-toggle="collapse" data-target="#memberMenu"
                                                aria-expanded="false" aria-controls="memberMenu"><i
                                        class="fas fa-users"></i> 회원 관리</a>
                            <div id="memberMenu" class="collapse">
                                <ul class="nav flex-column pl-3">
                                    <!-- 회원 목록 조회 -->
                                    <li class="nav-item"><a class="nav-link"
                                                            href="admin_member.jsp"><i class="fas fa-list"></i> 회원 목록
                                            조회</a></li>
                                    <!-- 블랙리스트 관리 -->
                                    <li class="nav-item"><a class="nav-link"
                                                            href="admin_blackList.jsp"><i class="fas fa-user-lock"></i>
                                            블랙리스트 관리</a></li>
                                </ul>
                            </div></li>
                        <!-- 차량 관리 메뉴 -->
                        <li class="nav-item"><a class="nav-link" href="#"
                                                data-toggle="collapse" data-target="#carMenu"
                                                aria-expanded="false" aria-controls="carMenu"><i
                                        class="fas fa-car"></i> 차량 관리</a>
                            <div id="carMenu" class="collapse">
                                <ul class="nav flex-column pl-3">
                                    <li class="nav-item"><a class="nav-link"
                                                            href="admin_car.jsp"><i class="fas fa-list"></i> 차량 목록 조회</a>
                                    </li>
                                    <!-- 신규 차량 등록 -->
                                    <li class="nav-item"><a class="nav-link" href="#"><i
                                                class="fas fa-car"></i> 신규 차량 등록</a></li>
                                    <!-- 차량 수정 및 삭제 -->
                                    <li class="nav-item"><a class="nav-link" href="#"><i
                                                class="fas fa-edit"></i> 차량 수정 및 삭제</a></li>
                                    <!-- 예약 차량 관리 -->
                                    <li class="nav-item"><a class="nav-link" href="#"><i
                                                class="fas fa-calendar-alt"></i> 예약 차량 관리</a></li>
                                </ul>
                            </div></li>
                        <!-- 고객 관리 메뉴 -->
                        <li class="nav-item"><a class="nav-link" href="#"
                                                data-toggle="collapse" data-target="#customerMenu"
                                                aria-expanded="false" aria-controls="customerMenu"><i
                                        class="fas fa-user"></i> 고객 관리</a>
                            <div id="customerMenu" class="collapse">
                                <ul class="nav flex-column pl-3">
                                    <!-- 1:1 문의 상담 내역 -->
                                    <li class="nav-item"><a class="nav-link" href="#"><i
                                                class="fas fa-comments"></i> 1:1 문의 상담 내역</a></li>
                                    <!-- 답변 내역 -->
                                    <li class="nav-item"><a class="nav-link" href="#"><i
                                                class="fas fa-reply"></i> 답변 내역</a></li>
                                    <!-- 리뷰 관리 -->
                                    <li class="nav-item"><a class="nav-link" href="#"><i
                                                class="fas fa-star"></i> 리뷰 관리</a></li>
                                </ul>
                            </div></li>
                    </ul>
                </div>
            </nav>
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
