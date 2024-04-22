<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<title>Main Area</title>
<style>
* {
	margin: 0;
	padding: 0;
}

/* body { */
/* 	background: #ccc; */
/* 	padding: 20px;	 */
/* } */

#signup {
	background:#fff;
	border:1px solid #ccc;
	border-radius: 8px;
    padding: 30px;
	width: 100%;	
	height: 90%;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 85px;
/* 	margin:30px auto; */
}
		
#signup fieldset {
	border: 1px solid #ccc;
	height: 100%;
	margin-bottom: 30px;
	
}
		
#signup legend {
	font-size: 16px;
	font-weight: bold;
	padding-left:5px;
	padding-bottom: 10px;	
}

#singup ul {
	list-style: none;
	padding: 0;
}

#signup ul li {
	display: flex;
	line-height: 30px; 
/* 	list-style: none; */
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

#signup label {
/* 	float: left;  /* 왼쪽으로 배치 */ */
	font-size: 13px;  /* 글자 크기 - 13px */
	width: 110px;  /* 너비 - 110px */
}

    
</style>
</head>
<body>
	<form id="signup">
		<fieldset>
		      <legend></legend>
		      <ul>
		        <li>
		          <label for="fullname">이름</label>
		          <input id="fullname" name="fullname" type="text" placeholder="5자미만 공백없이" required>
		        </li>
		        <li>
		          <label for="email">메일 주소</label>
		          <input id="email" name="email" type="email" placeholder="abcd@domain.com" required autocomplete="off">
		          <button onclick="changeEmail()">이메일 변경</button> 	
		        </li>
		        <li>
		          <label for="tel">연락처</label>
		          <input id="tel" name="tel" type="tel" autocomplete="off">
		          <button onclick="changePhoneNumber()">전화번호 변경</button>
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