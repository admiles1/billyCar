<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<script>

	function goDetail(idx){
		if($("#reserv_pickupdate").val() == "") {
			alert('일정을 검색하여 주세요');
			return;
		}
		
		let pickupDate = $("#reserv_pickupdate").val() + "T" + $("#reserv_pickuptime").val();
		let returnDate = $("#reserv_returndate").val() + "T" + $("#reserv_returntime").val();
		let pickupLocation = $("#reserv_pickuplocation").val();
		let returnLocation = $("#reserv_returnlocation").val();
		location.href="reservationdetail?idx=" + idx + "&pickupDate=" + pickupDate + "&returnDate=" + returnDate
						+ "&pickuplocation=" + pickupLocation + "&returnlocation=" + returnLocation;
	}
	
	function check() {
		let pickupDate = $("#reserv_pickupdate").val();
		let returnDate = $("#reserv_returndate").val();
		let returnLocation = $("#reserv_returnlocation").val();
		
		if(pickupDate == "") {
			alert('대여날짜를 선택하여 주십시오');
			return false;
		} else if(pickupDate == "") {
			alert('반납날짜를 선택하여 주십시오');
			return false;
		} else if(returnLocation == "") {
			alert('반납장소를 선택하여 주십시오');
			return false;
		}
	}
</script>
</head>
<body>	
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div id="tapTitle"> 
		<h1 align="center"> 실시간 예약</h1>
	</div> 
	<main class="container text-center">
 		<div class="row">	
    		<div class="col-4">
			    <form action="reservation" id="searchForm" method="post" onsubmit="return check()">
			    	<div class="car_option_sel"> <h3> 예약 일정 </h3></div>
			    	<div>
		    			<div class="">
					    	<div class="col-sm-9 col-12 px-0 mb-2" align="center" style="width : 100%">
					    		<div class="input-daterange" align="center" style="width : 100%">
					    			<input type="text" class="form-control datetext" placeholder="대여 날짜 선택" readonly name="reserv_pickupdate"
					    				<c:if test="${not empty pickupDate}"> value="${pickupDate}"</c:if> id="reserv_pickupdate">
					    			<input type="text" class="form-control datetext" placeholder="반납 날짜 선택" readonly name="reserv_returndate"
					    				<c:if test="${not empty returnDate}"> value="${returnDate}"</c:if> id="reserv_returndate">
					    			<br>	
				    				<select name="pickupTime" id="reserv_pickuptime">
				    					<c:forEach var="BH" begin="${BHS}" end="${BHE}" >
				    						<option value="">${BH}:00</option>
				    					</c:forEach>
									</select>
									
				    				<select name="returnTime" id="reserv_returntime">
										<option value="06:00">06:00</option>
										<option value="07:00">07:00</option>
										<option value="08:00">08:00</option>
									    <option value="09:00">09:00</option>
									    <option value="10:00">10:00</option>
									    <option value="11:00">11:00</option>
									    <option value="12:00">12:00</option>
									    <option value="13:00">13:00</option>
									    <option value="14:00"> 14:00</option>
									    <option value="15:00"> 15:00</option>
									    <option value="16:00"> 16:00</option>
									    <option value="17:00"> 17:00</option>
									    <option value="18:00"> 18:00</option>
									    <option value="19:00"> 19:00</option>
									    <option value="20:00"> 20:00</option>
									</select>
					    		</div>
					    	</div>
					    </div>
			    	</div>
			    	<div class="location_area">
			    		<input type="text" class="selectArea" name="reserv_pickuplocation" 
			    			<c:if test="${not empty pickupLocation}"> value="${pickupLocation}"</c:if>
			    				readonly style="padding-right: 17px;" onclick="alert('api예정')"
			    				id="reserv_pickuplocation" placeholder=":: 대여지점 ::">
				    	<select  class="selectArea" name="reserv_returnlocation" id="reserv_returnlocation">
				    		<option selected value=""
				    			<c:if test="${empty returnLocation}">selected</c:if>> :: 반납장소 :: </option>
				    		<option value="branch"
				    			<c:if test="${returnLocation eq 'branch'}">selected</c:if>> 지점에 직접 반납하기 </option>
				    		<option value="samelocation"
				    			<c:if test="${returnLocation eq 'samelocation'}">selected</c:if>> 호출장소에 반납하기 </option>
				    	</select>
			    	</div>
			    	<div class="car_option_sel">
			    		<hr>
			    		<h3> 차종 </h3>
			    		<ul class="car-option-list">
							<c:forEach var="type" items="${types}">
			    				<li><label class="car-type"><input type="checkbox" value="${type.name}" name="car_type"
								<c:if test="${fn:contains(hasThisType, type.name)}"> checked </c:if>> ${type.name} </label></li>
			    			</c:forEach>	
			    		</ul>
			    	</div>
			    	<div class="car_option_sel">
			    		<hr>
			    		<h3> 연료 </h3>
			    		<ul class="car-option-list">
			    			<c:forEach var="fuel" items="${fuels}">
			    				<li><label class="car-fuel"><input type="checkbox" value="${fuel.name}" name="car_fuel"
								<c:if test="${fn:contains(hasThisFuel, fuel.name)}"> checked </c:if>> ${fuel.name} </label></li>
			    			</c:forEach>
			    		</ul>
			    	</div>
			    	<input type="submit" value="차	량	검	색" id="searchCar">
			    </form>
    		</div>
   			<c:choose>
	   			<c:when test="${needSearch}">
	   				<div class="col-8" id="selectResult">
	   					검색을 먼저해주세요
	   				</div>
	   			</c:when>
	   			<c:otherwise>
	   				<div class="col-8" id="selectResult">
		   		 		<ul>
		   		 			<c:forEach var="car" items="${cars}">
			   		 			<li class="carList fadeIn row">
			   		 				<a class="d-flex" onclick="goDetail('${car.car_idx}')">
			   		 					<span class="carImg"><img src="${car.car_img}"></span>
			   		 					<span class="carInfo">
			   		 						<span> ${car.car_model} </span>
			   		 						<span> ${car.car_type} / ${car.car_capacity}</span>
			   		 						<small>종일가 <fmt:formatNumber value="${car.car_dayprice}" pattern="#,###"/></small>
			   		 						<small>시간당 <fmt:formatNumber value="${car.car_hourprice}" pattern="#,###"/></small>
			   		 					</span>
			   		 				</a>
			   		 			</li>
		   		 			</c:forEach>
		   		 		 </ul>
		   		 		 <div> 
		   		 			<input type="button" value="이전" onclick="location.href='reservation?num='"> 
		   		 			<input type="button" value="다음" onclick="location.href='reservation?num='">	
			 			 </div>
	    			</div>
	   			</c:otherwise>
			</c:choose>
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