<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forgot_pw1.css">
</head>
<header><jsp:include page="../inc/top.jsp"></jsp:include></header>

<body>
    <div class="container">
        <div class="button">
            <a href="forgot_id" class="forgot_id">아이디 찾기</a> |
            <a href="forgot_pw" class="forgot_pw">비밀번호 찾기</a>
        </div>
        <hr>
        <div class="insert_id">
    	<input type="text" placeholder="아이디를 입력하세요">
    	</div>
        <div class="next">
        <input type="button" value="다음" onclick="location.href='forgot_pw2'">
        </div>
    </div>
        <footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
    
</body>
</html>
