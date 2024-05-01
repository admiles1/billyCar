<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> :: 빌리카-예약페이지 :: </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservMain.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>	
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div id="tapTitle"> 
		<h1 align="center"> 실시간 예약 </h1>
	</div> 
	<main class="container text-center">
 		<div class="row">	
    		<div class="col-4">
			    <form action="" id="searchForm" method="post">
			    	<div class="car_select_option">
	                </div>
			    		<div class="howBtn">
					    	<input type="button" name="reserveWhere" value="지점 선택하기">
					    	<input type="button" name="reserveWhere" value="내 주위로 부르기">
			    		</div>
				    	<select id="selectArea">
				    		<option selected> :: 대여지점 :: </option>
				    		<option> 아이티윌본점 </option>
				    	</select>
				    	<select id="selectArea">
				    		<option selected> :: 반납지점 :: </option>
				    		<option> 아이티윌본점 </option>
				    	</select>
				    	<div class="car_option_sel">
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
   		 					<span class="carImg"><img src="istockphoto-1186972461-612x612.jpg" style="scale : 1;"></span>
   		 					<span class="carInfo">
   		 						<span> 람보르기니 </span>
   		 						<span> 스포츠카 / 2인승 / 만23세 이상</span>
   		 						<span> 100,000원</span>
   		 					</span>
   		 				</a>
   		 			</li>
   		 			<li class="carList fadeIn row">
   		 				<a href="reservationdetail" class="d-flex">
   		 					<span class="carImg"><img src="istockphoto-1186972461-612x612.jpg" style="scale : 1;"></span>
   		 					<span class="carInfo">
   		 						<span> 람보르기니 </span>
   		 						<span> 스포츠카 / 2인승 / 만23세 이상</span>
   		 						<span> 100,000원</span>
   		 					</span>
   		 				</a>
   		 			</li>
   		 			<li class="carList fadeIn row">
   		 				<a href="reservationdetail" class="d-flex">
   		 					<span class="carImg"><img src="istockphoto-1186972461-612x612.jpg" style="scale : 1;"></span>
   		 					<span class="carInfo">
   		 						<span> 람보르기니 </span>
   		 						<span> 스포츠카 / 2인승 / 만23세 이상</span>
   		 						<span> 100,000원</span>
   		 					</span>
   		 				</a>
   		 			</li>
   		 			<li class="carList fadeIn row">
   		 				<a href="detail.jsp" class="d-flex">
   		 					<span class="carImg"><img src="istockphoto-1186972461-612x612.jpg" style="scale : 1;"></span>
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
</body>
</html>