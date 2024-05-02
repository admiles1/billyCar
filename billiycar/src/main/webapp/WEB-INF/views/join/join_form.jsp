<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
	let checkIdResult = false;
	let checkPasswdResult = false;
	let checkPasswd2Result = false;
	
	$(function() {
// 		debugger;
		document.querySelector("#btnCheckId").onclick = function() {
			window.open("check_id.jsp", "check_id", "width=500, height=400");
		};

		document.fr.member_id.onblur = function() {
			
	    	if(checkID($("#member_id").val())){
	    		$("#checkIdResult").text("사용 가능한 아이디 입니다.");
				$("#checkIdResult").css("color", "blue");
				
				 checkIdResult = true;
	    	} 
		}
		
		
		
		
		
		
		
		document.fr.onsubmit = function() {
			if(document.fr.member_name.value == "") {
				alert("이름 입력 필수!");
				document.fr.member_name.focus();
				return false;
			} else if(checkIdResult == false) { // 아이디 규칙 부적합(길이 체크 포함됨)
				alert("아이디 확인 필수!");
				document.fr.member_id.focus();
				return false;
			} 
			
		}
		
	}); // document 객체의 ready 이벤트 끝
	
	function checkID(member_id){ //아아디 유효성검사
	    
	    if(! /^[a-z0-9_-]{8,12}$/.test(member_id)){

	        $("#checkIdResult").text("8~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			$("#checkIdResult").css("color", "red");
	        id.focus();
	        return false;
	    }    
	    let checkNumber = member_id.search(/[0-9]/g);
	    let checkEnglish = member_id.search(/[a-z]/ig);
	    if(checkNumber <0 || checkEnglish <0){
	        $("#checkIdResult").text("숫자와 영문자를 혼용하여야 합니다.");
			$("#checkIdResult").css("color", "red");
	        member_id.focus();

	        return false;
	    }
	    if(/(\w)\1\1\1/.test(member_id)){
	        $("#checkIdResult").text("같은 문자를 4번 이상 사용하실 수 없습니다.");
			$("#checkIdResult").css("color", "red");
	        member_id.focus();

	        return false;
	    }
	    
	    return true;
	}

	
</script>
<link href="${pageContext.request.contextPath}/resources/css/join_form.css" rel="stylesheet">
<meta charset="UTF-8">
<title>빌리카 회원가입</title>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<!--  메인 시작 -->
	<article class="sign-up-container">
		<form action="joinPro" class="box2_form" method="post" name="fr">
			<div class="title">
				<b style="color: #00AAFF">Billycar</b>
			</div>
			<div id = "id_1">
				<input type="text" placeholder="아이디" class="id_box" name="member_id" id="member_id"/>
				<input type="button" class="id_check" value="중복확인" id="btnCheckId"><br>
				<div id="checkIdResult"></div>
				<div id="checkIdResult2"></div>
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









