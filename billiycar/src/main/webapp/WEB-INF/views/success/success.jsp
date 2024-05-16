<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script>
	<%-- request 객체에 저장된 "msg" 속성값을 alert() 함수를 통해 출력하기 --%>
	alert("${msg}");
	location.href = "${targetURL}";		
</script>












