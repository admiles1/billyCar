<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
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

<form id="passwd-modify" method="post" action="processPasswordChange" >
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
	    <input type="password" id="currentPassword" placeholder="현재 비밀번호">
	    <input type="password" id="newPassword" placeholder="새로운 비밀번호">
	    <input type="password" id="confirmPassword" placeholder="새로운 비밀번호 확인">
	   	<span id="passwordMatchMsg"></span>
        <span id="passwordMismatchMsg"></span>
       	<div class="g-recaptcha-container">
        	<div class="g-recaptcha" data-sitekey="6LfQ8swpAAAAAMfwmMU-_UGqKZL_96D04eJGk2CA"></div>
	    </div>
	    <button type="submit">비밀번호 변경</button>
	</div>
</form>

<script>
	var newPasswordInput = document.getElementById("newPassword");
	var confirmPasswordInput = document.getElementById("confirmPassword");
	var matchMsg = document.getElementById("passwordMatchMsg");
	var mismatchMsg = document.getElementById("passwordMismatchMsg");
	
	newPasswordInput.addEventListener('input', function() {
	    checkPasswordMatch();
	});
	
	confirmPasswordInput.addEventListener('input', function() {
	    checkPasswordMatch();
	});

	function checkPasswordMatch() {
	    var newPassword = newPasswordInput.value;
	    var confirmPassword = confirmPasswordInput.value;
	
	    if (newPassword === confirmPassword) {
	        matchMsg.innerText = "*비밀번호가 일치합니다.";
	        mismatchMsg.innerText = "";
	        matchMsg.style.display = "block";
	        mismatchMsg.style.display = "none";
	    } else {
	        mismatchMsg.innerText = "*비밀번호가 일치하지 않습니다.";
	        matchMsg.innerText = "";
	        mismatchMsg.style.display = "block";
	        matchMsg.style.display = "none";
	    }
	}
	
</script>
</body>
</html>