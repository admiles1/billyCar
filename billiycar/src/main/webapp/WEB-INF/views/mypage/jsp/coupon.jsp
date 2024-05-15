<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠폰함</title>
</head>
<style>
   #coupon {
   		margin-top: 30px;
   	 	background:#fff;
		border:1px solid #ccc;
		border-radius: 8px;
	    padding: 30px;
		width: 100%;	
		height: 100%;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   }
   
    h2 {
        font-size: 32px;
        margin-bottom: 20px;
    }
    
     table {
     	margin-top: 50px;
        width: 100%;
        border-collapse: collapse;
        text-align: center;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
</style>
</head>
<body>

	<form id="coupon" action="couponUpdate" method="post">
    	<h2>나의 쿠폰 확인</h2>
    	<hr>
		<div style="float:right; margin-bottom:10px;">
	    	<input type="text" placeholder="쿠폰 코드를 입력하시오" name="coupon_code">
	    	<input type="submit" value="쿠폰 등록" style="background-color: #00AAFF; color: white">
		</div>
    <table>
        <thead>
            <tr>
                <th>쿠폰 이름</th>
                <th>쿠폰 코드</th>
                <th>쿠폰 할인율</th>
                <th>사용 상태</th>
            </tr>
        </thead>
        <tbody>
           <c:forEach var="coupon" items="${Coupon}">
			    <tr>
			        <td>${coupon.coupon_name}</td> <!-- 이 부분 수정 -->
			        <td>${coupon.coupon_code}</td>
			        <td>${coupon.coupon_discount_amount}%</td>
			        <td>
			            <c:choose>
			                <c:when test="${coupon.coupon_used_status == 1}">사용 가능</c:when>
			                <c:when test="${coupon.coupon_used_status == 2}">사용 불가</c:when>
			            </c:choose>
			        </td>
			    </tr>
			</c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>