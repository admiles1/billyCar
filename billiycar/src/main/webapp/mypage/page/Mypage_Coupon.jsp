<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/ef42a902c7.js" crossorigin="anonymous"></script>
</head>
<body>
	<header><jsp:include page="/inc/top.jsp"></jsp:include></header>
    <div class="container">
        <div class="row g-5">
            <div class="col-md-7 col-lg-8 order-md-last">
			    <jsp:include page="../jsp/coupon.jsp"></jsp:include>   
			</div>
            <div class="col-md-5 col-lg-4">
                <jsp:include page="../jsp/sidebar.jsp"></jsp:include>
            </div>
        </div>
    </div>
    <footer><jsp:include page="/inc/bottom.jsp"></jsp:include></footer>
</body>
</html>
