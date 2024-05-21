<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/util/jquery-3.7.1.js"></script>
<script>
	function sumbitCoupon() {
		let code = $("#coupon option:selected").val();
		opener.document.getElementById("summernote").value = code;
	}

</script>
</head>
<body>
	<select id="coupon">
		<c:forEach var="coupon" items="${couponList}">
			<option value="${coupon.coupon_code}"> ${coupon.coupon_name} </option>
		</c:forEach>
	</select>
	<input type="button" value="선택하기" onclick="sumbitCoupon()">
</body>
</html>