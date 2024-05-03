<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<title>Main Area</title>
<style>

#signup {
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

#singup ul {
	list-style: none;
	padding: 0;
}

#signup ul li {
	display: flex;
	line-height: 30px; 
	padding: 10px 50px; 
	align-items: center;
	margin-bottom: 10px;
}

#signup input[type="text"],
#signup input[type="email"],
#signup input[type="tel"] {
    margin-right: 80px; /* 입력창과 버튼 사이의 간격 조정 */
	width: 350px;
}
			
#signup button {	
	border: none;
	border-radius: 20px;
	font-size: 16px;
	letter-spacing: 1px;
	padding: 7px 0;
	width: 120px;
	background-color: #00AAFF; /* 배경색 지정 */
    color: white; /* 글자색 지정 */
}

#signup button:hover {
	 background-color: #555;
}

#signup label {
	font-size: 13px;  /* 글자 크기 - 13px */
	width: 110px;  /* 너비 - 110px */
}

.modify-notice {
	border: 1px solid #ccc;
	border-radius: 12px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	line-height: 15px;
	padding: 15px;
}

#signup em {
	font-size: 13px; /* 원하는 크기로 조절하세요 */
	color: red; /* 빨간색으로 변경 */
	letter-spacing: -1px;
}   
    
</style>
</head>
<body>
	<form id="signup">
		<fieldset>
			<h2>회원정보 수정</h2>
			<hr>
			<div class="modify-notice">
			<p>회원정보 수정을 위해 다음의 양식을 준수하여 주십시오.</p>
			<p class="contxt-list"> 
				<em>이름은 5자 미만</em>
			</p>
			<p class="contxt-list">
				<em>이메일은 반드시 @를 포함</em>
				하여 입력해주세요. 
			</p>
		</div>
		      <ul>
		      	<li>
		          <label for="memberName">이름</label>
		          <input id="memberName" name="name" type="text" value="${memberInfo.member_name}" readonly>
		        </li>
		      	<li>
		          <label for="memberId">아이디</label>
		          <input id="memberId" name="id" type="text" value="${memberInfo.member_id}" readonly>
		        </li>
		        <li>
		          <label for="email">메일 주소</label>
		          <input id="email" name="email" type="email" value="${memberInfo.member_email}" autocomplete="off">
		        </li>
		         <li>
		          <label for="memberBirth">생년 월일</label>
		          <input id="memberBirth" name="birth" type="text" value="${memberInfo.member_birth}" readonly>
		        </li>
		        <li>
		          <label for="memberReDdate">가입일</label>
		          <input id="memberRegDate" name="RegDate" type="text" value="${memberInfo.member_reg_date}" readonly>
		        </li>
		        
		        <li>
		          <label for="tel">연락처</label>
		          <input id="tel" name="tel" type="tel" value="${memberInfo.member_phone}" autocomplete="off">
		        </li>  
		      </ul>
		</fieldset>
	</form>

<script>
    function changeEmail() {
        // 이메일 변경 로직을 추가하세요
    }
    
    function changePhoneNumber() {
        // 전화번호 변경 로직을 추가하세요
    }
</script>

</body>
</html>