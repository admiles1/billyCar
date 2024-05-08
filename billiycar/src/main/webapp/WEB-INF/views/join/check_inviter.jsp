<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">

	let checkIdResult = false;
	
	$(function() {
		document.fr.member_inviter.focus();
	    
	    $("#btnCheckInviter").click(function() {
	    	
	    if(document.fr.membe_inviter.value == ""){
 			alert("추천인 아이디를 입력해주세요.");
 			return false;
 	    }
	    
	    });
	    
	    
// 	    $("#btnSelectInviter").click(function() { // 아이디 사용 버튼 클릭 이벤트
// 	        window.opener.document.fr.member_inviter.value = "${param.member_inviter}";
// 	        window.close();
// 	    });
	    
	}); // document 객체의 ready 이벤트 끝
	
	
	
</script>
<link href="${pageContext.request.contextPath}/resources/css/check_id.css" rel="stylesheet">
<meta charset="UTF-8">
<title>추천인 확인</title>
</head>
<body>
<c:if test="${param.isValid eq false}">
	<script type="text/javascript">
		if(confirm("존재하지 않는 회원입니다. \n창을 닫으시겠습니까?")){
		    window.close();
		}
	</script>
</c:if>
<c:if test="${param.isValid eq true}">
	<script type="text/javascript">
	window.opener.document.fr.member_inviter.value = "${param.member_inviter}";
    window.close();
	</script>
</c:if>
	<form action="check_inviter"  name="fr" method="post">
		<input type="text" placeholder="추천인 아이디" class="id_box" name="member_inviter" id="member_inviter" value="${param.member_inviter}"/>
		<div id="checkIdResult"></div>
		
		<div>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${param.isValid eq true}"> --%>
<!-- 					<input type="button" class="id_check" value="확인" id="btnSelectInviter"><br> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<input type="submit" class="id_check" value="검색" id="btnCheckInviter"> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
				<input type="submit" class="id_check" value="검색" id="btnCheckInviter">
		</div>
	</form>
</body>
</html>