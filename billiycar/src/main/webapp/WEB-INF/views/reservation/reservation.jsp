<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> :: 빌리카-예약페이지 :: </title>
<script src="${pageContext.request.contextPath}/resources/util/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservMain.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<!--  데이트피커 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">

</head>
<body>	
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div id="tapTitle"> 
		<h1 align="center"> 실시간 예약</h1>
	</div> 
	<main class="container text-center">
 		<div class="row">	
    		<div class="col-4">
			    <form action="reservation" id="searchForm" method="post">
			    	<div class="car_option_sel"> <h3> 예약 일정 </h3></div>
			    	<div>
		    			<div class="flex-sm-row flex-column d-flex">
					    	<div class="col-sm-9 col-12 px-0 mb-2">
					    		<div class="input-daterange">
					    			<input type="text" class="form-control datetext" placeholder="대여 날짜 선택" readonly name="pickupDate"
					    				<c:if test="${not empty pickupDate}"> value="${pickupDate}"</c:if>>
					    			<input type="text" class="form-control datetext" placeholder="반납 날짜 선택" readonly name="returnDate"
					    				<c:if test="${not empty returnDate}"> value="${returnDate}"</c:if>>
					    		</div>
					    	</div>
					    </div>
			    	</div>
		    		<div class="howBtn">
				    	<input type="button" name="reserveWhere" value="지점 선택하기">
				    	<input type="button" name="reserveWhere" value="내 주위로 부르기">
		    		</div>
		    		<input type="text" class="selectArea" name="pickupLocation"  value=":: 대여지점 ::" readonly style="padding-right: 17px;">
			    	<select  class="selectArea" name="returnLocation">
			    		<option selected> :: 반납지점 :: </option>
			    		<option value="direct"> 지점에 직접 반납하기 </option>
			    		<option value="direct"> 픽업장소에 반납하기 </option>
			    	</select>
			    	<div class="car_option_sel">
			    		<hr>
			    		<h3> 차종 </h3>
			    		<span class="carList1">
			    			<label><input type="checkbox" value="경형" name="carType"> 경형 </label><br>
			    			<label><input type="checkbox" value="중형" name="carType"> 중형	</label><br>
			    			<label><input type="checkbox" value="SUV" name="carType"> SUV	</label><br>
			    			<label><input type="checkbox" value="승합" name="carType"> 승합	</label><br>
			    			<label><input type="checkbox" value="기타" name="carType"> 기타 </label>
						</span>
			    		<span class="carList2">
			    			<label><input type="checkbox" value="준중형" name="carType"> 준중형 </label><br>
			    			<label><input type="checkbox" value="대형" name="carType"> 대형 </label><br>
			    			<label><input type="checkbox" value="전기" name="carType"> 전기 </label><br>
			    			<label><input type="checkbox" value="수입" name="carType"> 수입 </label><br>
						</span>
			    	</div>
			    	<div class="car_option_sel">
			    		<hr>
			    		<h3> 연료 </h3>
			    		<span class="fuelList1">
			    			<label><input type="checkbox" value="가솔린" name="fuelType"> 가솔린 </label><br>
			    			<label><input type="checkbox" value="LPG" name="fuelType"> LPG </label><br>
			    			<label><input type="checkbox" value="전기" name="fuelType"> 전기 </label>
						</span>
			    		<span class="fuelList2">
			    			<label><input type="checkbox" value="디젤" name="fuelType"> 디젤 </label><br>
			    			<label><input type="checkbox" value="하이브리드" name="fuelType"> 하이브리드 </label><br>
			    			<label><input type="checkbox" value="가린+LPG" name="fuelType"> 가솔린+LPG </label>
						</span>
			    	</div>
			    	<input type="submit" value="차	량	검	색" id="searchCar">
			    </form>
    		</div>
   		 	<div class="col-8" id="selectResult">
   		 		<ul>
   		 			<li class="carList fadeIn row">
   		 				<a href="reservationdetail" class="d-flex">
   		 					<span class="carImg"><img src=""></span>
   		 					<span class="carInfo">
   		 						<span> 람보르기니 </span>
   		 						<span> 스포츠카 / 2인승 / 만23세 이상</span>
   		 						<span> 100,000원</span>
   		 					</span>
   		 				</a>
   		 			</li>
   		 			
   		 		</ul>
    		</div>
  		</div>
	</main>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>

<% // 데이트피커 스크립트 %>
<script>
	$(document).ready(function(){
		$('.input-daterange').datepicker({
		    format: 'yyyy-mm-dd',
		    todayHighlight: true,
		    startDate: '0d',
		    orientation: "bottom"
		});
		
	});
	
	
</script>
</body>
</html>