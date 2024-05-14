<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forgot_pw3.css">
</head>
<style>
.g-recaptcha-container {
   	display: flex;
   	justify-content: left; /* 가로 중앙 정렬 */
  	align-items: center; /* 세로 중앙 정렬 */
   	margin-top: 20px; /* 상단 여백 조정 */
   	margin-left: 15px;
}

</style>
<header><jsp:include page="../inc/top.jsp"></jsp:include></header>

<body>
	<form method="post" action="forgot_pw3">
	    <div class="container">
	        <div class="button">
	            <a href="forgot_id" class="forgot_id">아이디 찾기</a> |
	            <a class="forgot_pw">비밀번호 찾기</a>
	        </div>
			<hr>
	   		 <input type="hidden" value="${member_id}" name="member_id">
	        <div>
				<input type="password" placeholder="새 비밀번호"  name="member_passwd"/><br>
			</div>
			<div>
				<input type="password" placeholder="새 비밀번호 확인" name="member_passwd2" /><br>
			</div>
			<div class="g-recaptcha-container">
	        	<div class="g-recaptcha" data-sitekey="6LfQ8swpAAAAAMfwmMU-_UGqKZL_96D04eJGk2CA"></div>
		    </div>
	        <div class="next">
	        <input type="submit" value="완료">
	        </div>
	    </div>
    </form>
    <footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
    
</body>
</html>
