<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<title>기본회원정보</title>
<style>
#memberInfo form {
    text-align: center; /* 폼 안의 요소들을 가운데 정렬 */
}

#memberInfo {
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

#memberInfo ul {
	list-style: none;
	padding: 0;
}

#memberInfo ul li {
	display: flex;
	justify-content: center;
	line-height: 30px; 
	padding: 10px 50px; 
	align-items: center;
	margin-bottom: 15px;
}

#memberInfo input[type="text"],
#memberInfo input[type="email"],
#memberInfo input[type="tel"] {
    margin-right: 60px; /* 입력창과 버튼 사이의 간격 조정 */
	width: 350px;
}
			
#memberInfo label {
	font-size: 13px;  /* 글자 크기 - 13px */
	width: 110px;  /* 너비 - 110px */
}

.info-notice {
	border: 1px solid #ccc;
	border-radius: 12px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	line-height: 15px;
	padding: 15px;
}

#memberInfo input[type="submit"] {
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

#memberInfo input[type="submit"]:hover {
	 background-color: #555;
}

#memberInfo em {
	font-size: 13px; /* 원하는 크기로 조절하세요 */
	color: red; /* 빨간색으로 변경 */
	letter-spacing: -1px;
}   

</style>
</head>
<body>
	<form id="memberInfo">
		<fieldset>
			<h2>회원정보</h2>
			<hr>
			<div class="info-notice">
			<p>${info.member_id}님의 페이지입니다.</p>
			<p class="contxt-info">
				회원정보 수정은 좌측 사이드 바의
				<em>회원정보 수정</em> 메뉴를 이용해주세요.
			</p>
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
		          <input id="email" name="member_email" type="email" value="${info.member_email}" autocomplete="off" readonly>
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
		          <input id="tel" name="member_phone" type="tel" value="${info.member_phone}" autocomplete="off" readonly>
		        </li>  
		      </ul>
		</fieldset>
	</form>
<script type="text/javascript">	
	function formatBirth(memberBirth) {
	    return memberBirth.slice(0, 4) + '-' + memberBirth.slice(4, 6) + '-' + memberBirth.slice(6, 8);
	}
	
	function formatTel(tel) {
		return tel.slice(0, 3) + '-' + tel.slice(3, 7) + '-' + tel.slice(7, 11);
	}
	
	window.onload = function() {
	// 회원 가입일 가져와서 자르기
	let memberRegDate = "${info.member_reg_date}";
	let slicedDate = memberRegDate.slice(0, 10); // 10글자까지 자름
	      
	// 자른 날짜 설정
	document.getElementById("memberRegDate").value = slicedDate;
	      
	let memberBirthInput = document.getElementById("memberBirth");
	if (memberBirthInput) {
		memberBirthInput.value = formatBirth(memberBirthInput.value);
	}
		
	let telInput = document.getElementById("tel");
	if (telInput) {
		telInput.value = formatTel(telInput.value);
	}
  }

  </script>
</body>
</html>