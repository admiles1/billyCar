<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
window.onload = function(){
	document.form.onsubmit = function(){
		
		if(!document.form.chk[0].checked || !document.form.chk[1].checked) {
			alert("필수 약관 동의를 하셔야 가입이 가능합니다.");
			return false;
		} 
	}
	
}

function checkAll() {
	for(let chk of document.form.chk){
		chk.checked =  document.querySelector("#chkAll").checked;
	}
};
	
	
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join_agree.css">
<meta charset="UTF-8">
<title>약관동의</title>
</head>
<body>
	<form action="join_form" id="joinForm" name="form">
	    <ul class="join_box">
	        <li class="checkBox check01">
	            <ul class="clearfix">
	                <li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(필수), 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</li>
	                <li class="checkAllBtn">
	                    <input type="checkbox" name="chkAll" id="chkAll" class="chkAll" onclick="checkAll()">
	                </li>
	            </ul>
	        </li>
	        <li class="checkBox check02">
	            <ul class="clearfix">
	                <li>이용약관 동의(필수)</li>
	                <li class="checkBtn">
	                    <input type="checkbox" name="chk">
	                </li>
	            </ul>
	            <textarea name="" id="">여러분을 환영합니다. 빌리카 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 빌리카 서비스의 이용과 관련하여 빌리카 서비스를 제공하는 빌리카 주식회사(이하 ‘빌리카’)와 이를 이용하는 빌리카 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 빌리카 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
	        </li>
	        <li class="checkBox check03">
	            <ul class="clearfix">
	                <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
	                <li class="checkBtn">
	                    <input type="checkbox" name="chk">
	                </li>
	            </ul>
	            <textarea name="" id="">여러분을 환영합니다. 빌리카 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 빌리카 서비스의 이용과 관련하여 빌리카 서비스를 제공하는 빌리카 주식회사(이하 ‘빌리카’)와 이를 이용하는 빌리카 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 빌리카 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
	        </li>
	        <li class="checkBox check03">
	            <ul class="clearfix">
	                <li>위치정보 이용약관 동의(선택)</li>
	                <li class="checkBtn">
	                    <input type="checkbox" name="chk">
	                </li>
	            </ul>
	            <textarea name="" id="">여러분을 환영합니다. 빌리카 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 빌리카 서비스의 이용과 관련하여 빌리카 서비스를 제공하는 빌리카 주식회사(이하 ‘빌리카’)와 이를 이용하는 빌리카 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 빌리카 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>
	        </li>
	        <li class="checkBox check04">
	            <ul class="clearfix">
	                <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
	                <li class="checkBtn">
	                    <input type="checkbox" name="chk">
	                </li>
	            </ul>
	        </li>
	    </ul>
	    <ul class="footBtwrap clearfix">
	        <li><input type="button" class="fpmgBt1" onclick="history.back()" value="비동의"></li>
	        <li><input type="submit" class="fpmgBt2" value="동의"></li>
	    </ul>
	</form>

</body>

</html>

