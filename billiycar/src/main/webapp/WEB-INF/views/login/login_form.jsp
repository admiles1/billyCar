<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빌리카 로그인</title>
<!-- 네이버 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_form.css">
</head>
<body>
 	<div class="sign-in-container">
    	<form action="login" method="post">
     		 <a href="./" class="logo">Billycar</a>
      		 <input type="text" placeholder="아이디" name="member_id" class="member_id" required/>
     		 <input type="password" placeholder="비밀번호" name="member_passwd" class="member_passwd" required/>
      		 <div class="forgot">
	      		 <a href="forgot_id"><b>아이디찾기</b></a> | 
	      		 <a href="forgot_pw_step1"><b>비밀번호찾기</b></a> | 
	      		 <a href="join"><b>회원가입</b></a>
      		 </div>
			 <input type="submit" class="btn btn-4" value ="로그인">
      		 <div class="social-container">
	      		 <a href="#"><img src="${pageContext.request.contextPath}/resources/images/kakao.png" onclick="showAlert()"></a> 
	      		 <a href="#"><img src="${pageContext.request.contextPath}/resources/images/google.png" onclick="showAlert()"></a> 
	      		 <a id="naverIdLogin_loginButton" href="javascript:void(0)">
        			  <img src="${pageContext.request.contextPath}/resources/images/naver.png">
    			 </a>

	      		 
      		</div>
   		</form>
 	 </div>
 	 
 	<!-- 네이버 스크립트 -->
 	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
 	<script>

 	var naverLogin = new naver.LoginWithNaverId({
 	    clientId: "dtYVNfR1ilNVmL2AEeWl", // 내 애플리케이션 정보에 cliendId를 입력해줍니다.
 	    callbackUrl: "http://localhost:8081/billycar/login", // 내 애플리케이션 API설정의 Callback URL을 입력해줍니다.
 	    isPopup: false,
 	    callbackHandle: true
 	});

 	naverLogin.init();

 	window.addEventListener('load', function () {
 	    naverLogin.getLoginStatus(function (status) {
 	        if (status) {
 	            var email = naverLogin.user.getEmail(); // 필수로 설정할 것을 받아옵니다.
 	            var name = naverLogin.user.getName(); // 필수로 설정할 것을 받아옵니다.

 	            console.log(naverLogin.user);

 	            if (email == undefined || email == null) {
 	                alert("이메일은 필수 정보입니다. 정보 제공에 동의해주세요.");
 	                naverLogin.reprompt();
 	                return;
 	            }

 	            if (name == undefined || name == null) {
 	                alert("이름은 필수 정보입니다. 정보 제공에 동의해주세요.");
 	                naverLogin.reprompt();
 	                return;
 	            }
 	        } else {
 	            console.log("네이버 로그인 상태 확인에 실패하였습니다.");
 	        }
 	    });
 	});


 	var testPopUp;
 	function openPopUp() {
 	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
 	}
 	function closePopUp(){
 	    testPopUp.close();
 	}

 	function naverLogout() {
 		openPopUp();
 		setTimeout(function() {
 			closePopUp();
 			}, 1000);
 	}
 	
 	function showAlert() {
		alert("서비스 준비중 입니다.");
	}
 	</script>
 	 
 	 
</body>
</html>
