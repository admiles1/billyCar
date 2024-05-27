<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠폰함</title>
</head>
<style>
   <title>쿠폰함</title>
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
        width: 100%;
        border-collapse: collapse;
        margin-top: 45px;
        text-align: center;
        table-layout: fixed;
        border-radius: 8px; /* 모서리 둥글게 처리 */
        overflow: hidden;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 15px; /* 셀 간격 늘리기 */
        text-align: center;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9; /* 번갈아가는 행 색상 */
    }

    tr:hover {
        background-color: #f5f5f5; /* 호버 효과 */
    }

    .pagination-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .pagination {
        display: flex;
        list-style: none;
        padding: 0;
    }

    .pagination .page-item {
        margin: 0 5px;
    }

    .pagination .page-link {
        display: block;
        padding: 10px 15px;
        color: #007bff;
        text-decoration: none;
        background-color: #fff;
        border: 1px solid #dee2e6;
        border-radius: 5px;
    }

    .pagination .page-link:hover {
        background-color: #e9ecef;
    }

    .pagination .page-item.disabled .page-link {
        pointer-events: none;
        color: #6c757d;
        background-color: #fff;
        border-color: #dee2e6;
    }

    .number {
        width: 10%;
    }

    .coupon-name {
        width: 25%;
    }

    .coupon-code {
        width: 25%;
    }

    .coupon-discount {
        width: 20%;
    }

    .coupon-status {
        width: 20%;
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
    <c:set var="pageNum" value="1"/>
    <c:if test="${not empty param.pageNum}">
        <c:set var="pageNum" value="${param.pageNum}"/>
    </c:if>
    <table>
        <thead>
            <tr>
                <th class="number"></th>
                <th class="coupon-name">쿠폰 이름</th>
                <th class="coupon-code">쿠폰 코드</th>
                <th class="coupon-discount">쿠폰 할인금액</th>
                <th class="coupon-status">사용 상태</th>
            </tr>
        </thead>
        <tbody>
             <c:choose>
                <%-- 문의 내역이 존재하지 않을 경우 --%>
                <c:when test="${empty Coupon}">
                    <tr>
                        <td colspan="5">쿠폰내역이 존재하지 않습니다</td>
                    </tr>
                </c:when>
              <c:otherwise>  
                  <c:forEach var="coupon" items="${Coupon}">
                        <c:set var="i" value="${i+1}"></c:set>
                        <tr>
                            <td>${i}</td>
                            <td>${coupon.coupon_name}</td>
                            <td>${coupon.coupon_code}</td>
                            <td><fmt:formatNumber value="${coupon.coupon_discount_amount}" pattern="#,##0 원"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${coupon.coupon_used_status == 1}">
                                    	<span style="color:#00AAFF">사용 가능</span>
                                    </c:when>
                                    <c:when test="${coupon.coupon_used_status == 2}">
                                    	<span style="color:red">사용 완료</span>
                                   	</c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    <nav class="pagination-container" aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a id="previousPageLink" class="page-link" href="MyCoupon?pageNum=${pageNum - 1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                <li class="page-item ${i == pageNum ? 'active' : ''}">
                    <a class="page-link pageLink" href="MyCoupon?pageNum=${i}">${i}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a id="nextPageLink" class="page-link" href="MyCoupon?pageNum=${pageNum + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</form>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    let previousPageLink = document.getElementById('previousPageLink');
    let nextPageLink = document.getElementById('nextPageLink');

    previousPageLink.addEventListener('click', function(event) {
        if (${pageNum} <= 1) {
            event.preventDefault();
            alert("더이상 페이지가 없습니다");
        }
    });

    nextPageLink.addEventListener('click', function(event) {
        if (${pageNum} >= ${pageInfo.maxPage}) {
            event.preventDefault();
            alert("더이상 페이지가 없습니다");
        }
    });
});
</script>
</body>
</html>