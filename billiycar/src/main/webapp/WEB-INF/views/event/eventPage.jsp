<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>이벤트페이지</title>
    
<!--     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
    	<h1 class="subject mt-5 mb-3" >빌리카 이벤트</h1>
    	
    	<!-- 글쓰기 글 -->
    	<c:if test="${sessionScope.member_id eq 'admin'}">
	    	<div style="margin-left:1220px; margin-bottom:40px">
				<input type="button" value="글쓰기" style="background-color: #00aaff; color:white; border: none" onclick="location.href='eventWrite'">
	    	</div>
    	</c:if>
    	
    	<!-- 이벤트 목록 -->
    	
    	
    	<div class="row">
    		<c:forEach var="eventList" items="${eventList}" >
	        	<div class="col-md-4" style="margin-top: 20px;">
	        		<div class="card">
	                	<img src="<%= request.getContextPath() %>/resources/upload/${eventList.event_image}" class="card-img-top" alt="이벤트 이미지 1" width="300" height="300">
	                    <div class="card-body">
	                    	<h5 class="card-title">${eventList.event_title}</h5>
	                    	<a href="eventContent?event_idx=${eventList.event_idx}" class="btn btn-primary">자세히 보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

    <!-- 부트스트랩 자바스크립트 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>