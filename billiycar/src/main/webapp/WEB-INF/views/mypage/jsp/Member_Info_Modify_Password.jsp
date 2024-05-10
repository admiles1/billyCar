<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>


<style>
#passwd-modify {
	margin-top: 30px;
    background:#fff;
	border:1px solid #ccc;
	border-radius: 8px;
    padding: 30px;
	width: 100%;	
	height: 100%;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   }
   
h2 {
    font-size: 32px;
    margin-bottom: 20px;
}
   
input[type="password"], input[type="text"] {
    width: 50%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}
   
.passwd-notice {
	border: 1px solid #ccc;
	border-radius: 12px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	line-height: 15px;
	padding: 15px;
}

   
#passwd-modify button {
	display: block; /* 블록 요소로 지정하여 다른 요소와 가로로 정렬되도록 합니다. */ 
	margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬합니다. */
	border: none;
	border-radius: 20px;
	font-size: 16px;
	letter-spacing: 1px;
	padding: 7px 0;
	width: 160px;
	background-color: #00AAFF; /* 배경색 지정 */
	color: white; /* 글자색 지정 */
	margin-top: 50px;
}
   
#passwd-modify button:hover {
    background-color: #555;
}
   
#passwd-modify em {
   	font-size: 13px; /* 원하는 크기로 조절하세요 */
   	color: red; /* 빨간색으로 변경 */
   	letter-spacing: -1px;
}

.passwd-info {
   	text-align: center;
   	margin-top: 50px;
}
 	
#passwordMatchMsg {
    color: blue;
    font-size: 12px;
}

#passwordMismatchMsg {
    color: red;
    font-size: 12px;
}

.g-recaptcha-container {
   	display: flex;
   	justify-content: center; /* 가로 중앙 정렬 */
  	align-items: center; /* 세로 중앙 정렬 */
   	margin-top: 20px; /* 상단 여백 조정 */
}

.g-recaptcha {
    display: inline-block; /* 가운데 정렬을 위해 인라인 블록으로 설정 */
}
        
</style>
</head>
<body>

<form id="passwd-modify" method="post" action="modifyPasswd"  name="fr">
    <h2>비밀번호 변경</h2>
    <hr>
    <div class="passwd-notice">
	    <p>안전한 비밀번호로 내정보를 보호하세요</p>
	    <p class="contxt-list">
	    	<em>다른 아이디/사이트에서 사용한 적 없는 비밀번호</em>
	    </p>
	    <p class="contxt-list">
	    	<em>이전에 사용한 적 없는 비밀번호</em>
	    	가 안전합니다.
	    </p>
    </div>
    <div class="passwd-info">
	    <input type="password" id="currentPassword" placeholder="현재 비밀번호" name="member_passwd">
	    <input type="password" id="newPassword" placeholder="새로운 비밀번호" name = "newMember_passwd">
	    <input type="password" id="confirmPassword" placeholder="새로운 비밀번호 확인">
	   	<div id="passwordMatchMsg"></div>
<!--         <span id="passwordMismatchMsg"></span> -->
       	<div class="g-recaptcha-container">
        	<div class="g-recaptcha" data-sitekey="6LfQ8swpAAAAAMfwmMU-_UGqKZL_96D04eJGk2CA"></div>
	    </div>
	    <button type="submit">비밀번호 변경</button>
	</div>
</form>

<script type="text/javascript">
// 	var newPasswordInput = document.getElementById("newPassword");
// 	var confirmPasswordInput = document.getElementById("confirmPassword");
// 	var matchMsg = document.getElementById("passwordMatchMsg");
// 	var mismatchMsg = document.getElementById("passwordMismatchMsg");
	let checkPasswdResult = false;
	let checkPasswd2Result = false;
	let id = '${sessionScope.member_id}';

	$(function() {
		$("#newPassword").keyup(function() { // 비밀번호 유효성 검사
			
		    let passwd = $("#newPassword").val();
			
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
			
			
		    $("#passwordMatchMsg").text(msg);
			$("#passwordMatchMsg").css("color", color);
			
		}); //비밀번호 유효성 검사 끝
		
		$("#confirmPassword").keyup(checkSamePasswd); // 비밀번호 일치 확인
		$("#newPassword").change(checkSamePasswd); // 비밀번호 변경시 일치 확인
	
	}); 
	
	
	function checkSamePasswd() { // 비밀번호 확인 일치 검사
		let passwd = document.fr.newPassword.value; 
		let passwd2 = document.fr.confirmPassword.value;
		
		if(passwd == passwd2) { // 패스워드 일치
	    	$("#passwordMatchMsg").text("*비밀번호가 일치합니다.");
			$("#passwordMatchMsg").css("color", "BLUE");
	    	
	    	checkPasswd2Result = true;
		} else { // 패스워드 불일치
	    	$("#passwordMatchMsg").text("*비밀번호가 일치하지 않습니다.");
			$("#passwordMatchMsg").css("color", "RED");
	    	
	    	checkPasswd2Result = false;
		}
	}
	
// 	newPasswordInput.addEventListener('input', function() {
// 	    checkPasswordMatch();
// 	});
	
// 	confirmPasswordInput.addEventListener('input', function() {
// 	    checkPasswordMatch();
// 	});

// 	function checkPasswordMatch() {
// 	    var newPassword = newPasswordInput.value;
// 	    var confirmPassword = confirmPasswordInput.value;
	
//	    if (newPassword === confirmPassword) {
// 	        matchMsg.innerText = "*비밀번호가 일치합니다.";
// 	        mismatchMsg.innerText = "";
// 	        matchMsg.style.display = "block";
// 	        mismatchMsg.style.display = "none";
// 	        checkPasswd2Result = true;
// 	    } else {
// 	        mismatchMsg.innerText = "*비밀번호가 일치하지 않습니다.";
// 	        matchMsg.innerText = "";
// 	        mismatchMsg.style.display = "block";
// 	        matchMsg.style.display = "none";
// 	        checkPasswd2Result = false;
// 	    }
// 	}
	
	
	document.fr.onsubmit = function() {
		if(!checkPasswdResult) { // 비밀번호 확인
			alert("새 비밀번호를 확인해주세요!");
			document.fr.newPassword.focus();
			return false;
		} else if(!checkPasswd2Result) { // 비밀번호 일치확인 
			alert("비밀번호가 일치하지 않습니다!");
			document.fr.confirmPassword.focus();
			return false;
		} 
		return true;
	}
	
	$(function() {
        $("form").submit(function(event) {
            // reCAPTCHA가 확인 체크
            var response = grecaptcha.getResponse();
            if (response.length == 0) { // reCAPTCHA가 확인안된 경우
                alert("자동입력 방지 체크를 완료해주세요!");
                event.preventDefault();
            }
        });
    });
	
</script>
</body>
</html>