<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빌리카 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_form.css">
</head>
<body>
 	<div class="sign-in-container">
    	<form action="#">
     		 <a href="./" class="logo">Billycar</a>
      		 <input type="text" placeholder="아이디" />
     		 <input type="password" placeholder="비밀번호" />
      		 <div class="forgot">
	      		 <a href="#"><b>아이디찾기</b></a> | 
	      		 <a href="#"><b>비밀번호찾기</b></a> | 
	      		 <a href="#"><b>회원가입</b></a>
      		 </div>
			 <a href="loginPro" class="btn btn-4">로그인</a> 
      		 <div class="social-container">
	      		 <a href="https://www.kakaocorp.com/page/"><img src="${pageContext.request.contextPath}/resources/images/kakao.png"></a> 
	      		 <a href="https://www.google.com"><img src="${pageContext.request.contextPath}/resources/images/google.png"></a> 
	      		 <a href="https://www.naver.com"><img src="${pageContext.request.contextPath}/resources/images/naver.png"></a> 
      		</div>
   		</form>
 	 </div>
</body>
</html>

