<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    .sidebar {
        background-color: #f8f9fa;
        color: #333;
    }
    .nav-link {
        color: #007bff;
        font-size: 16px; /* 기본 글자 크기 */
    }
    .nav-link.main-category {
        font-size: 18px; /* 메인 카테고리 글씨 크기 */
        font-weight: bold; /* 글자 굵기 추가 */
    }
    #memberMenu .nav-link, #carMenu .nav-link, #customerMenu .nav-link {
        font-size: 14px; /* 하위 메뉴 글자 크기 */
    }
    @media (max-width: 768px) {
        .sidebar {
            position: absolute;
            width: 100%;
            height: 100%;
            left: -100%;
            transition: all 0.3s;
        }
        .sidebar.active {
            left: 0;
        }
    }
</style>
<nav class="col-md-2 d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active main-category" href="admin"><i class="fas fa-tachometer-alt"></i> 관리자 메인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link main-category" href="#" data-toggle="collapse" data-target="#memberMenu" aria-expanded="false" aria-controls="memberMenu"><i class="fas fa-users"></i> 회원 관리</a>
                <div id="memberMenu" class="collapse">
                    <ul class="nav flex-column pl-3">
                        <li class="nav-item">
                            <a class="nav-link" href="adminMember"><i class="fas fa-address-book"></i> 회원 목록 조회</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_license?license="><i class="fas fa-user-lock"></i> 면허 인증 관리</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link main-category" href="#" data-toggle="collapse" data-target="#carMenu" aria-expanded="false" aria-controls="carMenu"><i class="fas fa-car"></i> 차량 관리</a>
                <div id="carMenu" class = "collapse">
                    <ul class="nav flex-column pl-3">
                        <li class="nav-item">
                            <a class="nav-link" href="admin_car"><i class="fas fa-list-ul"></i> 차량 목록 조회</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_car_registration"><i class="fas fa-plus-circle"></i> 신규 차량 등록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin_car_reservation"><i class="fas fa-calendar-alt"></i> 예약 차량 관리</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link main-category" href="#" data-toggle="collapse" data-target="#customerMenu" aria-expanded="false" aria-controls="customerMenu"><i class="fas fa-user"></i> 고객 관리</a>
                <div id="customerMenu" class="collapse">
                    <ul class="nav flex-column pl-3">
                        <li class="nav-item">
                            <a class="nav-link" href="admin_counsel"><i class="fas fa-comments"></i> 자주 묻는 질문</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="adminAnswerList"><i class= "fas fa-reply"></i> 답변 내역</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="couponList"><i class="fas fa-star"></i> 쿠폰 관리 </a>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</nav>
