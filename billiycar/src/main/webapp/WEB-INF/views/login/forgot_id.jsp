<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forgot_id.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">

	let checkAuthNumResult = false;
	let serverAuthNum = "";
	$(function() {
		document.fr.onsubmit = function() {
			if (!isValidName($("#phone_member_name").val())) { // 이름 확인
		    	alert("이름을 확인해주세요.");
		        document.fr.phone_member_name.focus();
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
		    } else if($("#auth_num").val() !== serverAuthNum){
				alert("인증번호를 확인해주세요.");
				return false;
			} else if ($("#auth_num").val() == serverAuthNum) {
				alert("인증되었습니다.");
				checkAuthNumResult = true;
			} else if (!checkAuthNumResult) {
		    	alert("전화번호 인증을 완료해주세요.");
		        return false; 
		    }
		}
		
		
	
	}); 

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
		            serverAuthNum = response.auth_num;  // 서버에서 받은 인증번호를 저장
		            
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
	
	

	function isValidName(name) { // 이름 유효성 검사
	    return /^[가-힣]{2,5}$/.test(name);
	}

	function isValidPhoneNumber(phoneNumber) { // 휴대폰 번호 유효성 검사
		return /^[0-9]{10,11}$/.test(phoneNumber);
	}


</script>
</head>
<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
<body>
    <div class="container">
        <div class="button">
            <a href="forgot_id" class="forgot_id">아이디 찾기</a> |
            <a href="forgot_pw_step1" class="forgot_pw">비밀번호 찾기</a>
        </div>
        <hr>
        <form action="forgot_id" method="post">
	        <h4>본인확인 이메일로 인증</h4>
		        <div class="email">
		            <br>
		            <input type="text" placeholder="이름" class="name" id="member_name" name="member_name" maxlength="5"/>
		            <br>
		            <input type="email" placeholder="Email" class="email_ad" id="member_email" name="member_email"/>
		            <input type="submit" class="check_btn" value="인증하기">
		            <br>
		            <hr>
		        </div>
        </form>
        <form action="show_id" name="fr">
	        <h4>본인 명의 휴대전화로 인증</h4>
	        <br>
	        <div class="tel">
	            <input type="text" placeholder="이름" class="phone_member_name" id="phone_member_name" name="phone_member_name" maxlength="5">
	            <br>
<!-- 	            <select class="telecom"> -->
<!-- 	                <option>통신사</option> -->
<!-- 	                <option>SKT</option> -->
<!-- 	                <option>KT</option> -->
<!-- 	                <option>LG U+</option> -->
<!-- 	                <option>SKT 알뜰폰</option> -->
<!-- 	                <option>KT 알뜰폰</option> -->
<!-- 	                <option>LG U+ 알뜰폰</option> -->
<!-- 	            </select> -->
	            <input type="text" placeholder="전화번호" class="telephone_num" id="member_phone" name="member_phone"/>
	            <input type="button" class="check_btn"  id="check_tel" value="문자전송" onclick="phoneAuth()">
	            <br>
	            <div>
	                <input type="text" placeholder="인증번호" class="cernum" name="auth_num" id="auth_num"/>
	                <br>
		        <div class="next">
		        <input type="submit" value="다음"  id="next" >
		        </div>
	            </div>
	        </div>
		</form>
    </div>
    <footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>
