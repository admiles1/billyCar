<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
	<form method="post" action="forgot_pw_step3" name="fr">
	    <div class="container">
	        <div class="button">
	            <a href="forgot_id" class="forgot_id">아이디 찾기</a> |
	            <a class="forgot_pw">비밀번호 찾기</a>
	        </div>
			<hr>
	   		 <input type="hidden" value="${member_id}" name="member_id">
	        <div>
				<input type="password" placeholder="새 비밀번호"  name="member_passwd" id="member_passwd" required/><br>
			</div>
			<div>
				<input type="password" placeholder="새 비밀번호 확인" name="member_passwd2" required/><br>
				<div id="checkPwResult"></div>
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
    
    
    
 <script type="text/javascript">
	let checkPasswdResult = false;
	let checkPasswd2Result = false;
	let id = '${sessionScope.member_id}';

	$(function() {
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
		    
			if(passwd.search(id) > -1) {
				msg = "비밀번호에 아이디가 포함되었습니다.";
				color = "RED";
				
				checkPasswdResult = false;
		    }    
			
			
			$("#checkPwResult").text(msg);
			$("#checkPwResult").css("color", color);
			
		}); //비밀번호 유효성 검사 끝
		
		$("#member_passwd2").keyup(checkSamePasswd); // 비밀번호 일치 확인
		$("#member_passwd").change(checkSamePasswd); // 비밀번호 변경시 일치 확인
	
	}); 
	
	
	function checkSamePasswd() { // 비밀번호 확인 일치 검사
		let passwd = $("#member_passwd").val(); 
		let passwd2 = $("#member_passwd2").val();
		
		if(passwd == passwd2) { // 패스워드 일치
	    	$("#checkPwResult").text("*비밀번호가 일치합니다.");
			$("#checkPwResult").css("color", "BLUE");
	    	
	    	checkPasswd2Result = true;
		} else { // 패스워드 불일치
	    	$("#checkPwResult").text("*비밀번호가 일치하지 않습니다.");
			$("#checkPwResult").css("color", "RED");
	    	
	    	checkPasswd2Result = false;
		}
	}
	
	document.fr.onsubmit = function() {
	    let response = grecaptcha.getResponse();
	    if (response.length == 0) { // reCAPTCHA가 확인 안 된 경우
	        alert("자동입력 방지 체크를 완료해주세요!");
	        return false; 
	    }
	    
// 	    let currentPassword = $("#currentPassword").val();
// 	    let newPassword = $("#newPassword").val();
// 	    let confirmPassword = $("#confirmPassword").val();

// 	 	// 현재 비밀번호와 새로운 비밀번호가 일치하는지 확인
// 	    if (currentPassword == newPassword) {
// 	        alert("변경하려는 비밀번호가 현재 비밀번호와 일치합니다.");
// 	        $("#newPassword").focus(); 
// 	        return false; 
// 	    }
	    
		if(!checkPasswdResult) { // 비밀번호 확인
			alert("새 비밀번호를 확인해주세요!");
			document.fr.member_passwd.focus();
			return false;
		} else if(!checkPasswd2Result) { // 비밀번호 일치확인 
			alert("비밀번호가 일치하지 않습니다!");
			document.fr.member_passwd2.focus();
			return false;
		} 
		return true;
	}


</script>
</body>
</html>
