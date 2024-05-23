<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">

	let checkPasswdResult = false;
	let checkPasswd2Result = false;
	let serverAuthNum = ${auth_num};
	
	$(function() {
		
		document.querySelector("#member_id").onclick = function() { //아이디 중복체크&유효성검사 새창 오픈
			window.open("check_id", "아이디 중복확인", "width=600, height=300, top=150, left=650");
		};
		
		document.querySelector("#member_inviter").onclick = function() { // 추천인 아이디 검색
			window.open("check_inviter", "추천인 아이디 검색", "width=600, height=300, top=150, left=650");
		};
		
// 		document.querySelector("#member_email").onclick = function() { //아이디 중복체크&유효성검사 새창 오픈
// 			window.open("check_id", "이메일 인증", "width=600, height=300, top=150, left=650");
// 		};
		
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
						msg = "영문 대소문자,숫자,특수문자 중 2개 이상을 포함시켜주세요."; 
						color = "RED"; 
						checkPasswdResult = false;
				}
		    	
		    } else {
				msg = "영문 대소문자,숫자,특수문자 중 2개 이상을 포함시켜주세요."; 
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
		    	document.fr.member_phone.focus();
		    	return false;
		    } else if (serverAuthNum == "") { // 인증번호 요청 확인
		        alert("인증번호 요청을 먼저 해주세요.");
		        document.fr.member_phone.focus();
		        return false;
		    } else if ($("#auth_num").val() == "") {
		    	alert("인증번호를 입력해주세요");
		    	document.fr.auth_num.focus();
		        return false; 
		    } else if ($("#auth_num").val() != ${auth_num}) {
		    	alert("인증번호가 일치하지 않습니다.");
		    	document.fr.auth_num.focus();
		        return false; 
		    }
		}
		
	}); // document 객체의 ready 이벤트 끝
	
	function checkSamePasswd() { // 비밀번호 확인 일치 검사
		let passwd = document.fr.member_passwd.value; 
		let passwd2 = document.fr.member_passwd2.value;
		
		if(passwd == passwd2) { // 패스워드 일치
	    	$("#checkPwResult2").text("*비밀번호가 일치합니다.");
			$("#checkPwResult2").css("color", "BLUE");
	    	
	    	checkPasswd2Result = true;
		} else { // 패스워드 불일치
	    	$("#checkPwResult2").text("*비밀번호가 일치하지 않습니다.");
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

	function sendAuthMail() {
		// 아이디 입력 텍스트박스에 입력된 아이디 가져오기
		let eMail = $("#member_email").val();
		
		if(!isValidEmail(eMail)) { // 이메일 확인
	        alert("E-Mail을 정확히 입력해주세요.");
	        document.fr.member_email.focus();
	        return false;
	    } 
		
		// 이메일이 입력되지 않았을 경우 경고창 출력
		if(eMail == "") {
			alert("이메일을 입력해주세요!");
			$("#member_email").focus();
			return;
		}
		
		// SendAuthMail 서블릿 주소 요청 => 파라미터로 아이디 전달
		
		location.href = "SendAuthMail?member_email=" + eMail;
	}
	
	function phoneAuth() {
		let member_phone = $("#member_phone").val();
		
		if (!isValidPhoneNumber(member_phone) || member_phone == "") {
			alert("전화번호를 확인해주세요.");
			document.fr.member_phone.focus();
			return false;
		}
		
		$.ajax({
			
			type : "POST",
			url : "send-one",
			data : {
				"member_phone" : member_phone
			},
			dataType :"json",
			success : function(response){
		        if (response.success) {
		            serverAuthNum = ${auth_num};  // 서버에서 받은 인증번호를 저장
		            console.log(${auth_num});
		            alert("인증번호가 전송되었습니다.");
		        } else {
		            alert("인증번호 전송에 실패했습니다.");
		        }
				
			},
			error : function() {
				alert("전화번호 인증에 실패했습니다. 다시 시도해주세요.");
			}
			
		});
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
				<input type="password" placeholder="비밀번호(8-12자리 특수문자 !@#$%^&* 사용가능)" name="member_passwd" id="member_passwd" maxlength="12"/><br>
				<div id="checkPwResult"></div>
			</div>
			<div>
				<input type="password" placeholder="비밀번호 확인" name="member_passwd2" id="member_passwd2" maxlength="12"/><br>
				<div id="checkPwResult2"></div>
			</div>
			<div class = "email">
				<input type="email" placeholder="E-Mail" name="member_email" id="member_email"/>
<!-- 				<input type="button" class="check_eMail" id="check_eMail" name ="check_eMail" value="인증하기" onclick="sendAuthMail()"><br> -->
			</div>
			<br>
			<div>
				<input type="text" placeholder="이름" name="member_name" id="member_name" maxlength="5"/><br>
			</div>
			<div>
				<input type="text" placeholder="생년월일 8자리" name="member_birth" id="member_birth" maxlength="8"/>
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
				<input type="text" placeholder="전화번호(숫자만입력)" class="telephone_num" name="member_phone" id="member_phone" maxlength="11"/>
				<input type="button" class="check_tel" value="인증하기" onclick="phoneAuth()"><br>
			</div>
			<div>
				<input type="text" placeholder="인증번호" id="auth_num" name="auth_num"/>
			</div>
				<div>
				<input type="text" placeholder="추천인 아이디(선택)" name="inviter" id="member_inviter" maxlength="12"/>
			</div>
			<div>
				<input type="submit" value="회원가입" class="btn btn-4" onsubmit="submit()">
			</div>
		</form>
	</article>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>









