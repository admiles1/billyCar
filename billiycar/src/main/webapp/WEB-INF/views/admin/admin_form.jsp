<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빌리카 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_form.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
 	<div class="sign-in-container">
    	<form action="adminPro" method="post">
 		<a href="./" class="logo">Billycar</a>
     		 <label>관리자 로그인</label>
      		 <input type="text" name="admin_id" placeholder="아이디" />
     		 <input type="password" name="admin_passwd" placeholder="비밀번호" />
      		 <input type="submit" value="로그인" class="btn btn-4">
   		</form>
 	 </div>
</body>
</html>

