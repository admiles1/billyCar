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
#signup form {
    text-align: center; /* 폼 안의 요소들을 가운데 정렬 */
}

#signup {
	margin-top: 30px;
	background:#fff;
	border:1px solid #ccc;
	border-radius: 8px;
    padding: 30px;
	width: 100%;	
	height: 100%;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    align-items: center;
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
	justify-content: center;
	line-height: 30px; 
	padding: 10px 50px; 
	align-items: center;
	margin-bottom: 15px;
}

#signup input[type="text"],
#signup input[type="email"],
#signup input[type="tel"] {
    margin-right: 60px; /* 입력창과 버튼 사이의 간격 조정 */
	width: 350px;
}
			
#signup label {
	font-size: 13px;  /* 글자 크기 - 13px */
	width: 110px;  /* 너비 - 110px */
}

.modify-notice {
	border: 1px solid #ccc;
	border-radius: 12px;
	text-align: center;
	margin-bottom: 20px;
	line-height: 15px;
	padding: 15px;
}

#signup input[type="submit"] {
    display: block; 
    margin: 0 auto;
    border: none;
    border-radius: 20px;
    font-size: 16px;
    letter-spacing: 1px;
    padding: 7px 20px;
    background-color: #00AAFF;
    color: white;
}

#signup input[type="submit"]:hover {
	 background-color: #555;
}

#signup em {
	font-size: 13px; 
	color: red; 
	letter-spacing: -1px;
}   


</style>
<body>
	<form id="signup" action="mypage" method="post" name="fr">
		<fieldset>
			<h2>회원정보 수정</h2>
			<hr>
			<div class="modify-notice">
			<p class="contxt-list">
				회원정보 수정 시 다음 양식을 준수하여 기입해주세요! </p>
				<p>이메일은<em> 반드시 @를 포함</em> 하여 입력해주세요.
				
				<p>전화번호는<em> '-' 제외한 숫자 정보</em> 만 기입해주세요! </p>
		</div>
		      <ul>
		      	<li>
		          <label for="memberName">이름</label>
		          <input id="memberName" name="name" type="text" value="${info.member_name}" readonly>
		        </li>
		      	<li>
		          <label for="memberId">아이디</label>
		          <input id="memberId" name="id" type="text" value="${info.member_id}" readonly>
		        </li>
		        <li>
		          <label for="email">메일 주소</label>
		          <input id="email" name="member_email" type="email" id="member_email" value="${info.member_email}" autocomplete="off" >
		        </li>
		         <li>
		          <label for="memberBirth">생년 월일</label>
		          <input id="memberBirth" name="birth" type="text" value="${info.member_birth}" readonly>
		        </li>
		        <li>
		          <label for="memberReDdate">가입일</label>
		          <input id="memberRegDate" name="RegDate" type="text" value="${info.member_reg_date}" readonly>
		        </li>
		        
		        <li>
		          <label for="tel">연락처</label>
		          <input id="tel" name="member_phone" type="tel" value="${info.member_phone}" autocomplete="off"
		          		pattern="^[0-9]{10,11}$">
		        </li>  
		      </ul>
		      <input type="submit" value="회원정보 변경">
		</fieldset>
	</form>
<script type="text/javascript">	
	
  window.onload = function() {
        // 회원 가입일 가져와서 자르기
        let memberRegDate = "${info.member_reg_date}";
        let slicedDate = memberRegDate.slice(0, 10); // 10글자까지 자름
        
        // 자른 날짜 설정
        document.getElementById("memberRegDate").value = slicedDate;
    }



	document.fr.onsubmit = function() {
	    let email = document.getElementById("email").value;
	    let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	    if (!emailPattern.test(email)) { // 이메일 양식이 맞는지 확인
	        alert("유효한 이메일을 입력해주세요.");
	        document.getElementById("email").focus();
	        return false; // 폼 제출 방지
	    }
	}

  </script>
</body>
</html>