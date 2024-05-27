<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠폰 관리</title>
<!-- 부트스트랩 CSS 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Chart.js CSS -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
  .star-rating {
    color: gold;
  }
  th, td {
    text-align: center;
  }
  .pagination {
    margin-top: 20px;
  }
  .nav-link {
    white-space: nowrap;
  }
  
  #deleteCoupon {
  	padding : 5px;
	border-radius : 10px;
	border: none;
	background-color : #F15F5F;
	color : white;
	text-decoration: none;
	font-size: bold;
  }
  
  #couponButton {
  	background-color:#FFBB00;
  	border-radius : 10px;
  	margin-bottom: 10px;
  	border:none;
	outline: none;
	box-shadow: none;
  }
  
</style>
<script type="text/javascript">
	window.name = 'couponList';
	
	console.log(10);
	
	function openCouponAdd() {
		window.open('couponAdd', '쿠폰 추가', 'width=430, height=500, left=750, top=300')
	}
	
</script>
</head>
<body>
<main class="container">
	<iframe name="couponList" style="display:none;"></iframe>
    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">쿠폰 관리</a>
    </nav>
	 <div class="container-fluid">
	    <div class="row">
	      <jsp:include page="sidebar.jsp" />

            <!-- 메인 컨텐츠 영역 -->
            <main role="main" class="col-md-10 col-lg-10 ml-sm-auto px-4">
                <h1 class="h2">쿠폰 내역</h1>
                
                <!-- 쿠폰 등록 -->
                <div>
                	<input type="button" value="쿠폰 등록하기" onclick="openCouponAdd()" style="float:right" id="couponButton">
                </div>
                
                <!-- 쿠폰 내역 -->
                <div class="review-table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>쿠폰 이름</th>
                                <th>쿠폰 코드</th>
                                <th>할인금액</th>
                                <th>조치</th>
                            </tr>
                        </thead>
                        
                        <tbody id="couponBody">
	                        <c:forEach var="coupon" items="${couponList}">
		                        <tr>
		                         	<td>${coupon.coupon_id}</td>
		                         	<td>${coupon.coupon_name}</td>
		                         	<td>${coupon.coupon_code}</td>
		                         	<td>${coupon.coupon_discount_amount}</td>
		                         	<td><input type="button" id="deleteCoupon" value="삭제" onclick="location.href='couponDelete?coupon_code=${coupon.coupon_code}&coupon_id=${coupon.coupon_id}'"></td>
		                        </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
                    
                    
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <!-- 페이징 버튼 자리 -->
                        </ul>
                    </nav>
                </div>
            </main>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
