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

<style>
	.datetext{
		display : inline-block;
		width : 150px;
	}

</style>
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
		    			<div class="">
					    	<div class="col-sm-9 col-12 px-0 mb-2" align="center" style="width : 100%">
					    		<div class="input-daterange" align="center" style="width : 100%">
					    			<input type="text" class="form-control datetext" placeholder="대여 날짜 선택" readonly name="pickupDate"
					    				<c:if test="${not empty pickupDate}"> value="${pickupDate}"</c:if>>
					    			<input type="text" class="form-control datetext" placeholder="반납 날짜 선택" readonly name="returnDate"
					    				<c:if test="${not empty returnDate}"> value="${returnDate}"</c:if>>
					    			<br>	
				    				<select name="pickupTime">
										<option value="06">오전 06:00</option>
										<option value="07">오전 07:00</option>
										<option value="08">오전 08:00</option>
									    <option value="09">오전 09:00</option>
									    <option value="10">오전 10:00</option>
									    <option value="11">오전 11:00</option>
									    <option value="12">오후 12:00</option>
									    <option value="13">오후 13:00</option>
									    <option value="14">오후 14:00</option>
									    <option value="15">오후 15:00</option>
									    <option value="16">오후 16:00</option>
									    <option value="17">오후 17:00</option>
									    <option value="18">오후 18:00</option>
									    <option value="19">오후 19:00</option>
									    <option value="20">오후 20:00</option>
									</select>
				    				<select name="returnTime">
										<option value="06">오전 06:00</option>
										<option value="07">오전 07:00</option>
										<option value="08">오전 08:00</option>
									    <option value="09">오전 09:00</option>
									    <option value="10">오전 10:00</option>
									    <option value="11">오전 11:00</option>
									    <option value="12">오후 12:00</option>
									    <option value="13">오후 13:00</option>
									    <option value="14">오후 14:00</option>
									    <option value="15">오후 15:00</option>
									    <option value="16">오후 16:00</option>
									    <option value="17">오후 17:00</option>
									    <option value="18">오후 18:00</option>
									    <option value="19">오후 19:00</option>
									    <option value="20">오후 20:00</option>
									</select>
					    		</div>
					    	</div>
					    </div>
			    	</div>
			    	<div class="location_area">
			    		<input type="text" class="selectArea" name="pickupLocation"  value=":: 대여지점 ::" readonly style="padding-right: 17px;" onclick="alert('api예정')">
				    	<select  class="selectArea" name="returnLocation">
				    		<option selected> :: 반납지점 :: </option>
				    		<option value="direct"> 지점에 직접 반납하기 </option>
				    		<option value="direct"> 호출장소에 반납하기 </option>
				    	</select>
			    	</div>
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
			    			<label><input type="checkbox" value="가솔린" name="fuelType"> 휘발유 </label><br>
			    			<label><input type="checkbox" value="LPG" name="fuelType"> LPG </label>
						</span>
			    		<span class="fuelList2">
			    			<label><input type="checkbox" value="디젤" name="fuelType"> 경유 </label><br>
			    			<label><input type="checkbox" value="전기" name="fuelType"> 전기 </label>
						</span>
			    	</div>
			    	<input type="submit" value="차	량	검	색" id="searchCar">
			    </form>
    		</div>
   		 	<div class="col-8" id="selectResult">
   		 		<ul>
   		 			<c:forEach var="car" items="${cars}">
	   		 			<li class="carList fadeIn row">
	   		 				<a href="reservationdetail?returnDate=123" class="d-flex">
	   		 					<span class="carImg"><img src=""></span>
	   		 					<span class="carInfo">
	   		 						<span> ${car.car_model } </span>
	   		 						<span> ${car.car_type} / ${car.car_capacity}</span>
	   		 						<span> ${car.car_price}</span>
	   		 					</span>
	   		 				</a>
	   		 			</li>
   		 			</c:forEach>
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