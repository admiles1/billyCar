<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/join_form.css" rel="stylesheet">
<meta charset="UTF-8">
<title>빌리카 회원가입</title>
<link rel="stylesheet" href="css/join_form.css">
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<!--  메인 시작 -->
	<article class="sign-up-container">
		<form action="joinPro" class="box2_form" method="post">
			<div class="title">
				<b style="color: #00AAFF">Billycar</b>
			</div>
			<div id = "id_1">
				<input type="text" placeholder="아이디" class="id_box" name="member_id"/>
				<input type="button" class="id_check" value="중복확인"><br>
				<div></div>
			</div>
			<div>
				<input type="password" placeholder="비밀번호" name="member_passwd" /><br>
			</div>
			<div>
				<input type="password" placeholder="비밀번호 확인" /><br>
			</div>
			<div>
				<input type="email" placeholder="Email" name="member_email"/><br>
			</div>
			<br>
			<div>
				<input type="text" placeholder="이름" name="member_name"/><br>
			</div>
			<div>
				<input type="text" placeholder="생년월일 8자리" name="member_birth" />
			</div>
	<!-- 		<div class="check_gender"> -->
	<!-- 			<input type="checkbox" value="여자" class="gender woman">여자 -->
	<!-- 			<input type="checkbox" value="남자" class="gender man">남자 -->
	<!-- 		</div> -->
			<div class="tel">
				<select class="telecom">
					<option>통신사</option>
					<option>SKT</option>
					<option>KT</option>
					<option>LG U+</option>
					<option>SKT 알뜰폰</option>
					<option>KT 알뜰폰</option>
					<option>LG U+ 알뜰폰</option>
				</select>
				<input type="text" placeholder="전화번호" class="telephone_num" name="member_phone"/>
				<input type="button" class="check_tel" value="인증하기"><br>
			</div>
			<div>
				<input type="text" placeholder="인증번호"/>
			</div>
				<div>
				<input type="text" placeholder="추천인 아이디" name="inviter"/>
			</div>
			<div>
				<input type="submit" value="회원가입" class="btn btn-4" onsubmit="submit()">
<!-- 				<button class="btn btn-4">회원가입</button> -->
			</div>
		</form>
	</article>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>









