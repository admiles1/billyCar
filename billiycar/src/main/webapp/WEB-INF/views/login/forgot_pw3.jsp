<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forgot_pw3.css">
</head>
<body>
    <div class="container">
        <div class="button">
            <a href="forgot_id" class="forgot_id">아이디 찾기</a> |
            <a class="forgot_pw">비밀번호 찾기</a>
        </div>
		<hr>
   
        <div>
			<input type="password" placeholder="새 비밀번호" /><br>
		</div>
		<div>
			<input type="password" placeholder="새 비밀번호 확인" /><br>
		</div>

        <div class="next">
        <input type="submit" value="완료" onclick="location.href='login'">
        </div>
    </div>
</body>
</html>
