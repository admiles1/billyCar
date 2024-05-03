<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
	let checkIdResult = false;
	
	$(function() {
		document.fr.member_id.onblur = function() {
			
			if(checkID($("#member_id").val())){
				$("#checkIdResult").text("중복확인 버튼을 눌러주세요.");
				$("#checkIdResult").css("color", "blue");
				
				 checkIdResult = true;
			} 
		}
		
		document.fr.onsubmit = function() {
			if(checkIdResult) {
				return checkIdResult;
			} else {
				return false;
			}
		}
		
	}); // document 객체의 ready 이벤트 끝
	
	function checkID(member_id){ //아아디 유효성검사
	    
	    if(! /^[a-z0-9_-]{8,12}$/.test(member_id)){

	        $("#checkIdResult").text("8~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			$("#checkIdResult").css("color", "red");
	        id.focus();
	        return false;
	    }    
	    let checkNumber = member_id.search(/[0-9]/g);
	    let checkEnglish = member_id.search(/[a-z]/ig);
	    if(checkNumber <0 || checkEnglish <0){
	        $("#checkIdResult").text("숫자와 영문자를 혼용하여야 합니다.");
			$("#checkIdResult").css("color", "red");
	        member_id.focus();

	        return false;
	    }
	    if(/(\w)\1\1\1/.test(member_id)){
	        $("#checkIdResult").text("같은 문자를 4번 이상 사용하실 수 없습니다.");
			$("#checkIdResult").css("color", "red");
	        member_id.focus();

	        return false;
	    }
	    
	    return true;
	}

</script>
<link href="${pageContext.request.contextPath}/resources/css/check_id.css" rel="stylesheet">
<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>

<body>
	<form action="check_id"  name="fr" method="post">
		<input type="text" placeholder="아이디" class="id_box" name="member_id" id="member_id"/>
		<div id="checkIdResult"></div>
		
		<input type="submit" class="id_check" value="중복확인" id="btnCheckId"><br>
	</form>
</body>
</html>