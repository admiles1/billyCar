<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<link href="${pageContext.request.contextPath}/resources/css/check_id.css" rel="stylesheet">

<meta charset="UTF-8">
<title>아이디 중복확인</title>

</head>
<body>
<script type="text/javascript">

</script>
	<form action="memberStatus"  name="fr" method="post">
		<div class="form-group mr-2" style="text-align: center;">
            <select class="form-control" name="member_status">
              <option value="1">회원</option>
              <option value="2">휴먼</option>
              <option value="3">블랙리스트</option>
              <option value="4">탈퇴회원</option>
            </select>
            
            <input type="hidden" name="member_id" value="${param.member_id }">
            <input type="submit" class="btn btn-primary" style="width: 100px;" id="updateButton" value="변경">
            <input type="button" class="btn btn-primary" style="width: 100px;" onclick="window.close()" value="닫기">
          </div>
	</form>
	

</body>
</html>