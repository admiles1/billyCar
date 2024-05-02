<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(function() {
		document.form.id.onblur = function() {
		    let id = $("#member_id").val();
		    
		    if(id.length >= 8 && id.length <= 12) {
//			    	document.querySelector("#checkIdResult").innerText = "사용 가능";
//			    	document.querySelector("#checkIdResult").style.color = "GREEN";
				$("#checkIdResult").text("사용 가능222");
				$("#checkIdResult").css("color", "green");
		    	
		    	// ID 규칙 검사 적합 여부 저장 변수에 true(적합)값 저장
		    	checkIdResult = true;
		    } else {
//			    	document.querySelector("#checkIdResult").innerText = "4~8글자만 사용 가능합니다";
//			    	document.querySelector("#checkIdResult").style.color = "RED";
				$("#checkIdResult").text("4~8글자만 사용 가능합니다222");
				$("#checkIdResult").css("color", "red");
		    	
		    	// ID 규칙 검사 적합 여부 저장 변수에 false(부적합)값 저장
		    	checkIdResult = false;
		    }
		}

		
		
		
	});


</script>
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
				<input type="text" placeholder="아이디" class="id_box" name="member_id" id="member_id"/>
				<input type="button" class="id_check" value="중복확인"><br>
				<div></div>
			</div>
			<div>
				<input type="password" placeholder="비밀번호" name="member_passwd" id="member_passwd"/><br>
			</div>
			<div>
				<input type="password" placeholder="비밀번호 확인" /><br>
			</div>
			<div>
				<input type="email" placeholder="Email" name="member_email" id="member_email"/><br>
			</div>
			<br>
			<div>
				<input type="text" placeholder="이름" name="member_name" id="member_name"/><br>
			</div>
			<div>
				<input type="text" placeholder="생년월일 8자리" name="member_birth" id="member_birth"/>
			</div>
	<!-- 		<div class="check_gender"> -->
	<!-- 			<input type="checkbox" value="여자" class="gender woman">여자 -->
	<!-- 			<input type="checkbox" value="남자" class="gender man">남자 -->
	<!-- 		</div> -->
			<div class="tel">
				<select class="telecom">
					<option>통신사</option>
					<option value="SKT">SKT</option>
					<option value="KT">KT</option>
					<option value="LGU+">LG U+</option>
					<option value="SKTaff">SKT 알뜰폰</option>
					<option value="KTaff">KT 알뜰폰</option>
					<option value="LGU+aff">LG U+ 알뜰폰</option>
				</select>
				<input type="text" placeholder="전화번호" class="telephone_num" name="member_phone" id="member_phone"/>
				<input type="button" class="check_tel" value="인증하기"><br>
			</div>
			<div>
				<input type="text" placeholder="인증번호"/>
			</div>
				<div>
				<input type="text" placeholder="추천인 아이디" name="inviter" id="member_inviter"/>
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









