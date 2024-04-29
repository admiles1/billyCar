<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="col-md-2 d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
          <ul class="nav flex-column">
            <!-- 관리자 페이지 메뉴 -->
            <li class="nav-item">
              <a class="nav-link active" href="admin"><i class="fas fa-tachometer-alt"></i> 관리자 메인</a>
            </li>
            <!-- 회원 관리 메뉴 -->
            <li class="nav-item">
              <a class="nav-link" href="#" data-toggle="collapse" data-target="#memberMenu" aria-expanded="false" aria-controls="memberMenu"><i class="fas fa-users"></i> 회원 관리</a>
              <div id="memberMenu" class="collapse">
                <ul class="nav flex-column pl-3">
                  <!-- 회원 목록 조회 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_member"><i class="fas fa-list"></i> 회원 목록 조회</a>
                  </li>
                  <!-- 블랙리스트 관리 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_blackList"><i class="fas fa-user-lock"></i> 블랙리스트 관리</a>
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
                    <a class="nav-link" href="admin_car"><i class="fas fa-list"></i> 차량 목록 조회</a>
                  </li>
                  <!-- 신규 차량 등록 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_car_registration"><i class="fas fa-car"></i> 신규 차량 등록</a>
                  </li>
                  <!-- 예약 차량 관리 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_car_reservation"><i class="fas fa-calendar-alt"></i> 예약 차량 관리</a>
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
                    <a class="nav-link" href="admin_counsel"><i class="fas fa-comments"></i> 1:1 문의 상담 내역</a>
                  </li>
                  <!-- 답변 내역 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_answerList"><i class="fas fa-reply"></i> 답변 내역</a>
                  </li>
                  <!-- 리뷰 관리 -->
                  <li class="nav-item">
                    <a class="nav-link" href="admin_review"><i class="fas fa-star"></i> 리뷰 관리</a>
                  </li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </nav>