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

	function goDetail(model,type,fuel){
		
		if($("#reserv_pickupdate").val() == "") {
			alert('일정을 검색하여 주세요');
			return;
		}
		
		let pickupDate = $("#reserv_pickupdate").val() + "T" + $("#reserv_pickuptime").val();
		let returnDate = $("#reserv_returndate").val() + "T" + $("#reserv_returntime").val();
		let pickupLocation = $("#reserv_pickuplocation").val();
		let returnLocation = $("#reserv_returnlocation").val();
		
		location.href="reservationdetail?model=" + model + "&pickupDate=" + pickupDate + "&returnDate=" + returnDate
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
			    	<hr>
			    	<div>
						<div>
							<div style="margin: auto;">
								<div id="map" style="width: 400px; height: 400px; margin-left: 5px;">
								</div>
							</div>		    		
							
							<!-- 지도 -->
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f11e41f80b0aa80e39eeb275a45a8451&libraries=services"></script>
							<script type="text/javascript">
										
// 							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
// 						    mapOption = { 
// 						        center: new kakao.maps.LatLng(35.17988104101734, 129.07510440921163), // 지도의 중심좌표
// 						        level: 7 // 지도의 확대 레벨
// 						    };

// 							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
// 							// 지도를 클릭한 위치에 표출할 마커입니다
// 							var marker = new kakao.maps.Marker({ 
// 							    // 지도 중심좌표에 마커를 생성합니다 
// 							    position: map.getCenter() 
// 							}); 
// 							// 지도에 마커를 표시합니다
// 							marker.setMap(map);
	
// 							// 지도에 클릭 이벤트를 등록합니다
// 							// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
// 							kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
							    
// 							    // 클릭한 위도, 경도 정보를 가져옵니다 
// 							    var latlng = mouseEvent.latLng; 
							    
// 							    // 마커 위치를 클릭한 위치로 옮깁니다
// 							    marker.setPosition(latlng);
							    
// 							    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
// 							    message += '경도는 ' + latlng.getLng() + ' 입니다';
							    
// 							    console.log(message);
							    
// 							    var geocoder = new kakao.maps.services.Geocoder();
							    
// // 							 	// 좌표를 주소로 변환하는 함수 호출
// 							    geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function(result, status) {
// 							        if (status === kakao.maps.services.Status.OK) {
// 							            console.log(result);
							            
// 							            // 변환된 주소를 사용할 수 있습니다
// 							            var address = result[0].address.address_name;
// 							            console.log('주소는 ' + address + ' 입니다');
							            
// 							            // 필요한 경우 HTML 요소에 주소를 표시하거나 다른 작업을 수행할 수 있습니다
// 							            // 예: document.getElementById('address').innerText = address;
// 							        } else {
// 							            console.log('주소 변환에 실패했습니다.');
// 							        }
// 							    });
// 							});
							
							// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
							var infowindow = new kakao.maps.InfoWindow({zIndex:1});
					        
					        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					            mapOption = {
					                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					                level: 3 // 지도의 확대 레벨
					            };  
					        
					        // 지도를 생성합니다    
					        var map = new kakao.maps.Map(mapContainer, mapOption); 
					        
					        // 장소 검색 객체를 생성합니다
					        var ps = new kakao.maps.services.Places(); 
					        
					        // 모든 마커를 저장할 배열
					        var markers = [];
					        
					        // 키워드로 장소를 검색합니다
					        ps.keywordSearch('재송동', placesSearchCB); 
					        
					        // 키워드 검색 완료 시 호출되는 콜백함수 입니다
					        function placesSearchCB (data, status, pagination) {
					            if (status === kakao.maps.services.Status.OK) {
					        
					                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					                // LatLngBounds 객체에 좌표를 추가합니다
					                var bounds = new kakao.maps.LatLngBounds();
					        
					                for (var i=0; i<data.length; i++) {
					                    displayMarker(data[i]);    
					                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
					                }       
					        
					                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					                map.setBounds(bounds);
					            } 
					        }
					        
					        // 지도에 마커를 표시하는 함수입니다
					        function displayMarker(place) {
					            
					            // 마커를 생성하고 지도에 표시합니다
					            var marker = new kakao.maps.Marker({
					                map: map,
					                position: new kakao.maps.LatLng(place.y, place.x) 
					            });
					
					            // 생성된 마커를 배열에 추가합니다
					            markers.push(marker);
					        
					            // 마커에 클릭이벤트를 등록합니다
					            kakao.maps.event.addListener(marker, 'click', function() {
					                // 모든 마커를 숨깁니다
					                for (var i = 0; i < markers.length; i++) {
					                    markers[i].setMap(null);
					                }
					                
					                // 클릭한 마커만 표시합니다
					                marker.setMap(map);
					                
					                console.log(marker);
					                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
					                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
					                infowindow.open(map, marker);
					            });
					        }
							
							
							</script>
				    	</div>
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
				    						<fmt:formatNumber value="${BH}" pattern="00" var="BHfmt" />
				    						<option value="${BHfmt}"
				    							<c:if test="${pickupTime eq BHfmt}"> selected </c:if>>${BHfmt}:00</option>
				    					</c:forEach>
									</select>
				    				<select name="returnTime" id="reserv_returntime">
										<c:forEach var="BH" begin="${BHS}" end="${BHE}" >
											<fmt:formatNumber value="${BH}" pattern="00" var="BHfmt" />
											<option value="${BHfmt}"
				    							<c:if test="${returnTime eq BHfmt}"> selected </c:if>>${BHfmt}:00</option>
				    					</c:forEach>
									</select>
					    		</div>
					    	</div>
					    </div>
			    	</div>
			    	<div class="location_area">
			    		<input type="text" class="selectArea" name="reserv_pickuplocation" 
			    				value="아이티윌"  id="reserv_pickuplocation"
			    				style="padding-right: 17px;" onclick="alert('api예정')"
			    				placeholder=":: 대여지점 ::" readonly>
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
								<c:set var="cktype" value=" ,${fuel.name}" />
			    				<li><label class="car-type">
				    				<input type="checkbox" value="${type.name}" name="car_type">${type.name} 
								</label></li>
			    			</c:forEach>	
			    		</ul>
			    	</div>
			    	<div class="car_option_sel">
			    		<hr>
			    		<h3> 연료 </h3>
			    		<ul class="car-option-list">
			    			<c:forEach var="fuel" items="${fuels}">
			    				<c:set var="ckfuel" value=" ,${fuel.name}" />
			    				<li><label class="car-fuel">
			    					<input type="checkbox" value="${fuel.name}" name="car_fuel"> ${fuel.name} 
								</label></li>
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
			   		 				<a class="d-flex" onclick="goDetail('${car.car_model}', '${car.car_type}', '${car.car_fuel}')">
			   		 					<span class="carImg"><img src="${car.car_img}"></span>
			   		 					<span class="carInfo">
			   		 						<span> ${car.car_model}</span>
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