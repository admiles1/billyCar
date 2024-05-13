<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빌리카 로그인</title>
<!-- 네이버 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_form.css">
</head>
<body>
 	<div class="sign-in-container">
    	<form action="login" method="post">
     		 <a href="./" class="logo">Billycar</a>
      		 <input type="text" placeholder="아이디" name="member_id" class="member_id"/>
     		 <input type="password" placeholder="비밀번호" name="member_passwd" class="member_passwd"/>
      		 <div class="forgot">
	      		 <a href="forgot_id"><b>아이디찾기</b></a> | 
	      		 <a href="forgot_pw"><b>비밀번호찾기</b></a> | 
	      		 <a href="join"><b>회원가입</b></a>
      		 </div>
			 <input type="submit" class="btn btn-4" value ="로그인">
      		 <div class="social-container">
	      		 <a href="https://www.kakaocorp.com/page/"><img src="${pageContext.request.contextPath}/resources/images/kakao.png"></a> 
	      		 <a href="https://www.google.com"><img src="${pageContext.request.contextPath}/resources/images/google.png"></a> 
	      		 <img src="${pageContext.request.contextPath}/resources/images/naver.png" id="naverIdLogin">
      		</div>
   		</form>
 	 </div>
 	 
 	<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "dtYVNfR1ilNVmL2AEeWl",
  			// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
			callbackUrl: "http://localhost:8081/billycar/loginNaver",
  			// 본인의 callBack url로 수정하세요.
			isPopup: false,
// 			loginButton: {color: "white", type: 3, height: 60}
  			// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
		}
	);
naverLogin.init();
</script>
 	 
 	 
</body>
</html>

