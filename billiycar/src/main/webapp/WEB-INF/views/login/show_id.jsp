<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾음</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/show_id.css">
</head>
<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
<body>
    <div class="container">
        <div class="button">
            <a>아이디 찾기</a>
<!--             <a href="#">비밀번호 찾기</a> -->
        </div>
        <hr>
        
    	<fieldset>
        <div class="id_list">
    	<h4>아이디</h4>
    	</div>
    	</fieldset>
        <div class="next">
        <input type="button" value="로그인하기" onclick="location.href='login'">
        <input type="button" value="비밀번호찾기" onclick="location.href='forgot_pw'">
        </div>
    </div>
</body>
</html>
