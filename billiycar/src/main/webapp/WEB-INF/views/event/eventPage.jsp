<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.subject{
		color:  #00AAFF;
	}
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RentCar Events</title>
    
<!--     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
    	<h1 class="subject mt-5 mb-3" >빌리카 이벤트</h1>
    	
    	<!-- 글쓰기 글 -->
    	<div style="margin-left:1220px; margin-bottom:40px">
			<input type="button" value="글쓰기" style="background-color: #00aaff; color:white; border: none" onclick="location.href='eventWrite'">
    	</div>
    	
    	<div class="row">
        	<div class="col-md-4">
        		<div class="card">
                	<img src="resources/event_images/envent_page_event1-1.webp" class="card-img-top" alt="이벤트 이미지 1" width="300" height="300">
                    <div class="card-body">
                    	<h5 class="card-title">유아용 카시트 무료 이벤트!</h5>
                    	<p class="card-text">다자녀 고객 당신은 애국자! 애국자한테 드리는 유아용 카시트 무료 이벤트!(자녀2이상일 경우)</p>
                    	<a href="event1" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img src="resources/event_images/envent_page_event2-1.webp" class="card-img-top" alt="이벤트 이미지 2" width="300" height="300">
					<div class="card-body">
						<h5 class="card-title" >현대차 렌트 할인 이벤트!</h5>
						<p class="card-text">현대차 렌트 시 5000원 할인 이벤트!</p><br>
						<a href="event2" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img src="resources/event_images/envent_page_event3-1.webp" class="card-img-top" alt="이벤트 이미지 1" width="300" height="300">
					<div class="card-body">
						<h5 class="card-title">첫 고객 할인 이벤트!</h5>
						<p class="card-text">빌리카가 쏜다! 첫 고객 할인 이벤트!</p><br>
						<a href="event3" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!-- 부트스트랩 자바스크립트 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>