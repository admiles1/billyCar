<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function(){
		
		
	    $("#modifyBtn").on("click", function() {
	        if(confirm("삭제하시겠습니까?")) {
	            location.href = "eventDelete?event_idx=${event.event_idx}";
	        } else {
	            return false;
	        }
	    });
	    
	});
	
	function couponIssue(){
		var member_id = "${sessionScope.member_id}";
    	var coupon_id = 1;
     }

</script>
<meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${event.event_title}</title>
    <!-- Bootstrap CSS -->
<!--     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .important { color: #d32f2f; }
        .container { margin-top: 20px; }
    </style>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
		<h1 class="text-center my-4"> 🎉 ${event.event_title} 🎉</h1>
		
    	<c:if test="${sessionScope.member_id eq 'admin'}">
	    	<div style="margin-left: 1200px; margin-bottom: 20px;">
				<input type="button" value="수정" style="background-color: #00aaff; color:white; border: none" onclick="location.href='eventModify?event_idx=${event.event_idx}'">
				<input type="button" value="삭제" style="background-color: #00aaff; color:white; border: none" id="modifyBtn">
	    	</div>
    	</c:if>
		<div class="card">
			<div class="card-body" style="text-align: center;">
				<div> ${event.event_content}</div>
			</div>
		</div>
		<a onclick="couponIssue()" class="btn btn-primary">쿠폰 받기</a>
		<p class="mt-3">추가 문의사항이 있는 경우 이벤트 문의 메일(itwillbs_3@itwillbs.co.kr)로 연락 주시기 바랍니다.</p>
	</div>

    <!-- Bootstrap JS and dependencies -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>