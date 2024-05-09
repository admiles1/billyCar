<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">

	let checkPasswdResult = false;
	let checkPasswd2Result = false;
	
	$(function() {
		
		document.querySelector("#member_id").onclick = function() { //아이디 중복체크&유효성검사 새창 오픈
			window.open("check_id", "아이디 중복확인", "width=600, height=300, top=150, left=650");
		};
		
		document.querySelector("#member_inviter").onclick = function() { // 추천인 아이디 검색
			window.open("check_inviter", "추천인 아이디 검색", "width=600, height=300, top=150, left=650");
		};
		
		$("#member_passwd").keyup(function() { // 비밀번호 유효성 검사
			
		    let passwd = $("#member_passwd").val();
			
		    let msg = "";
			let color = "";
			
			let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		    
		    if(lengthRegex.exec(passwd)) {
		    	let engUpperRegex = /[A-Z]/; // 대문자
		    	let engLowerRegex = /[a-z]/; // 소문자
		    	let numRegex = /\d/; // / [0-9]
		    	let specRegex = /[!@#$%^&*]/; // 특수문자
		    	
		    	let count = 0;
		    	
		    	if(engUpperRegex.exec(passwd)) { count++; } // 대문자 포함할 경우
		    	if(engLowerRegex.exec(passwd)) { count++; } // 소문자 포함할 경우
		    	if(numRegex.exec(passwd)) { count++; }      // 숫자 포함할 경우
		    	if(specRegex.exec(passwd)) { count++; }     // 특수문자 포함할 경우
 		    	
		    	switch (count) {
					case 4: msg = "안전"; color = "GREEN"; checkPasswdResult = true; break;
					case 3: msg = "보통"; color = "ORANGE"; checkPasswdResult = true; break;
					case 2: msg = "위험"; color = "RED"; checkPasswdResult = true; break;
					case 1:
					case 0: 
						msg = "사용 불가능한 패스워드"; 
						color = "RED"; 
						checkPasswdResult = false;
				}
		    	
		    } else {
				msg = "사용 불가능한 패스워드"; 
				color = "RED";
				
		    	checkPasswdResult = false;
		    }
		    
			if(passwd.search($("#member_id").val()) > -1) {
				msg = "비밀번호에 아이디가 포함되었습니다.";
				color = "RED";
				
				checkPasswdResult = false;
		    }    
			
			
		    $("#checkPwResult").text(msg);
			$("#checkPwResult").css("color", color);
			
		}); //비밀번호 유효성 검사 끝
		
		$("#member_passwd2").keyup(checkSamePasswd); // 비밀번호 일치 확인
		$("#member_passwd").change(checkSamePasswd); // 비밀번호 변경시 일치 확인
		

		//회원가입 버튼 클릭시 발생하는 이벤트 
		document.fr.onsubmit = function() {
			if(document.fr.member_id.value == "") { // 아이디 확인
				alert("아이디를 확인해주세요!");
				document.fr.member_id.focus();
				return false;
			} else if(!checkPasswdResult) { // 비밀번호 확인
				alert("비밀번호를 확인해주세요!");
				document.fr.member_passwd.focus();
				return false;
			} else if(!checkPasswd2Result) { // 비밀번호 일치확인 
				alert("비밀번호가 일치하지 않습니다!");
				document.fr.member_passwd2.focus();
				return false;
			} else if(!isValidEmail($("#member_email").val())) { // 이메일 확인
		        alert("E-Mail을 확인해주세요.");
		        document.fr.member_email.focus();
		        return false;
		    } else if (!isValidName($("#member_name").val())) { // 이름 확인
		    	alert("이름을 확인해주세요.");
		        document.fr.member_name.focus();
		        return false;
		    } else if (!isValidBirth($("#member_birth").val())) { // 생일 확인
		    	alert("생년월일을 확인해주세요.");
		    	document.fr.member_birth.focus();
		    	return false;
		    } else if ($("#telecom").val() == "") {
		    	alert("통신사를 선택해주세요.");
		    	document.fr.telecom.focus();
		    	return false;
		    } else if (!isValidPhoneNumber($("#member_phone").val())) {
		    	alert("전화번호를 확인해주세요.");
		    	document.fr.telephone_num.focus();
		    	return false;
		    }
			
		}
		
	}); // document 객체의 ready 이벤트 끝
	
	function checkSamePasswd() { // 비밀번호 확인 일치 검사
		let passwd = document.fr.member_passwd.value; 
		let passwd2 = document.fr.member_passwd2.value;
		
		if(passwd == passwd2) { // 패스워드 일치
	    	$("#checkPwResult2").text("비밀번호 일치");
			$("#checkPwResult2").css("color", "BLUE");
	    	
	    	checkPasswd2Result = true;
		} else { // 패스워드 불일치
	    	$("#checkPwResult2").text("비밀번호 불일치");
			$("#checkPwResult2").css("color", "RED");
	    	
	    	checkPasswd2Result = false;
		}
	}

	function isValidEmail(email) { //이메일 유효성 검사
	    return /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email);
	}
	
	function isValidName(name) { // 이름 유효성 검사
		return  /^[가-힣&&[^ㄱ-ㅎㅏ-ㅣ]{2,5}$/.test(name);
	}
	
	function isValidBirth(birth) { // 생일 유효성 검사
	    return /^[0-9]{8}$/.test(birth);
	}
	
	function isValidPhoneNumber(phoneNumber) { // 휴대폰 번호 유효성 검사
		return /^[0-9]{10,11}$/.test(phoneNumber);
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
		<form action="join" class="box2_form" method="post" name="fr">
			<div class="title">
				<b style="color: #00AAFF">Billycar</b>
			</div>
<!-- 			<div id = "id_1"> -->
				<input type="text" placeholder="아이디" class="id_box" name="member_id" id="member_id" readonly/>
<!-- 				<input type="button" class="id_check" value="중복확인" id="btnCheckId"><br> -->
<!-- 				<div id="checkIdResult"></div> -->
<!-- 			</div> -->
			<div>
				<input type="password" placeholder="비밀번호(8-12자리 특수문자 !@#$%^&* 포함)" name="member_passwd" id="member_passwd"/><br>
				<div id="checkPwResult"></div>
			</div>
			<div>
				<input type="password" placeholder="비밀번호 확인" name="member_passwd2" id="member_passwd2"/><br>
				<div id="checkPwResult2"></div>
			</div>
			<div>
				<input type="email" placeholder="E-Mail" name="member_email" id="member_email"/><br>
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
				<select class="telecom" id="telecom" name="telecom">
					<option value="">통신사</option>
					<option value="SKT">SKT</option>
					<option value="KT">KT</option>
					<option value="LGU+">LG U+</option>
					<option value="SKTaff">SKT 알뜰폰</option>
					<option value="KTaff">KT 알뜰폰</option>
					<option value="LGU+aff">LG U+ 알뜰폰</option>
				</select>
				<input type="text" placeholder="전화번호(숫자만입력)" class="telephone_num" name="member_phone" id="member_phone"/>
				<input type="button" class="check_tel" value="인증하기"><br>
			</div>
			<div>
				<input type="text" placeholder="인증번호"/>
			</div>
				<div>
				<input type="text" placeholder="추천인 아이디(선택)" name="inviter" id="member_inviter"/>
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









