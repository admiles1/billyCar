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
<!-- <link rel="stylesheet" href="../css/index.css"> -->
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/ef42a902c7.js" crossorigin="anonymous"></script>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
		<div class="row g-5">
	    	<div class="col-md-7 col-lg-8 order-md-last">
           			<div class="main">
           				<div class="title">
           					<h4 class="d-flex justify-content-between align-items-center mb-3">
          						<span class="text-primary"><b>회원정보 수정</b></span>
        					</h4>
        					<hr>
        				</div>
           			<div>
           				<article class="content">
           				<div class="insert-info">
							<input type="password" class="passwd" size=50 maxlength=15 placeholder="비밀번호를 입력하세요"><br><br>
							<input type="button" class="next" value="다음">
						</div>
						</article>
					</div>
					</div>
			</div>
	      <div class="col-md-5 col-lg-4">
	        <form>
	        	<nav class="sidebar">
					<div class="text">마이페이지</div>
					<ul>
						<li>
							<a href="#" class="myInfo-btn"><b>나의 정보관리</b>
								<span class="fas fa-caret-down first"></span>
							</a>
							<ul class="myInfo-show">
								<li><a href="#">- 회원정보수정</a></li>
								<li><a href="#">- 비밀번호 변경</a></li>
								<li><a href="#">- 면허 등록 및 갱신</a></li>
							</ul>
						</li>
						<li>
							<a href="#" class="myResv-btn"><b>나의 예약관리</b>
								<span class="fas fa-caret-down second"></span>
							</a>
							<ul class="myResv-show">
								<li><a href="#">- 현재 예약내역</a></li>
								<li><a href="#">- 과거 예약내역</a></li>
							</ul>
						</li>
						<li>
							<a href="#" class="inquiry-btn"><b>나의 문의내역</b>
								<span class="fas fa-caret-down third"></span>
							</a>
							<ul class="inquiry-show">
								<li><a href="#">- 1:1 문의내역</a></li>
								<li><a href="#">- FAQ</a></li>
							</ul>
						</li>
						<li><a href="#"><b>로그아웃</b>
							<span class="fas fa-right-from-bracket"></span>
							</a>
						</li>
						<li><a href="#"><b>회원탈퇴</b>
							<span class="fas fa-user-slash"></span>
							</a>
						</li>
					</ul>
				</nav>
	          </form>
	      </div>
	    </div>
  <footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</div>
<script>
	$(".myInfo-btn").click(function() {
		$("nav ul .myInfo-show").toggleClass("show");
		$("nav ul .first").toggleClass("rotate");
	});
	
	$(".myResv-btn").click(function() {
		$("nav ul .myResv-show").toggleClass("show1");
		$("nav ul .second").toggleClass("rotate");
	});
	
	$(".inquiry-btn").click(function() {
		$("nav ul .inquiry-show").toggleClass("show2");
		$("nav ul .third").toggleClass("rotate");
	});
	
	
	$("nav ul li").click(function() {
		$(this).addClass("active").siblings().removeClass("active");
	});

</script>




<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>