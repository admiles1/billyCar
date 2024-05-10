<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지-회원면허정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/ef42a902c7.js" crossorigin="anonymous"></script>
</head>
<body>
	<header><jsp:include page="../../inc/top.jsp"></jsp:include></header>
    <div class="container">
        <div class="row g-5">
            <div class="col-md-7 col-lg-8 order-md-last">
			    <jsp:include page="../jsp/Member_License_Info.jsp"></jsp:include>   
			</div>
            <div class="col-md-5 col-lg-4">
                <jsp:include page="../jsp/sidebar.jsp"></jsp:include>
            </div>
        </div>
    </div>
	<footer><jsp:include page="../../inc/bottom.jsp"></jsp:include></footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
