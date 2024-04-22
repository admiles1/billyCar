<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/css/sidebar.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/ef42a902c7.js" crossorigin="anonymous"></script>
</head>
<body>
     <div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
              <!-- 왼쪽 메뉴 -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <!-- 왼쪽 메뉴 영역 -->
                    </div>
                </div>
            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <div class="left_sub_menu">
                <div class="sub_menu">
                    
                    <h2>마이페이지</h2>
                    <ul class="big_menu">
                        <li>나의 정보관리 <i class="arrow fas fa-angle-right"></i>
                            <ul class="small_menu">
                                <li><a href="#">회원정보 수정</a></li>
                                <li><a href="#">비밀번호 변경</a></li>
                                <li><a href="#">면허등록 및 갱신</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="big_menu">
                        <li>나의 예약관리 <i class="arrow fas fa-angle-right"></i>
                            <ul class="small_menu">
                                <li><a href="#">현재 예약내역</a></li>
                                <li><a href="#">과거 예약내역</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="big_menu">
                        <li>나의 문의내역 <i class="arrow fas fa-angle-right"></i>
                        	<ul class="small_menu"> 
                                <li><a href="#">1:1 문의내역</a></li>
                                <li><a href="#">FAQ</a></li>
                        	</ul>
                        </li>
                    </ul>
                    <ul class="big_menu">
                        <li class="no-drop"><a href="#">로그아웃<i class="fas fa-right-from-bracket"></i></a></li>
                    </ul>
                    <ul class="big_menu">
                        <li class="no-drop"><a href="#">회원탈퇴<i class="fas fa-user-slash"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            // 클릭 시 드롭다운 메뉴 토글
            $(".big_menu").click(function () {
                var $smallMenu = $(".small_menu", this);
                $smallMenu.slideToggle(300);

                // small menu가 열려있는 경우에만 clicked 클래스 추가
                if ($smallMenu.is(":visible")) {
                    $smallMenu.addClass("clicked");
                } else {
                    $smallMenu.removeClass("clicked");
                }
            });

            // small menu의 각 항목 클릭 시 글자색 변경
            $(".small_menu li").click(function() {
                $(this).siblings().removeClass("clicked");
                $(this).addClass("clicked");

                // 드롭다운 메뉴가 열려있는 상태에서 항목을 클릭해도 메뉴를 닫지 않음
                return false;
            });
            
           

            // 왼쪽 서브 메뉴를 나타내도록 fadeIn
            $(".left_sub_menu").hide();
            $(".left_sub_menu").fadeIn(300);
        });
    </script>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>