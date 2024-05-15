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
	
	$(function(){
		
		$("#searchCar").on("click", function(){
			check();
			let formData = $("#searchForm").serialize();
			
			$.ajax({
				type : "POST" ,
				url : "SelectCarList",
				data : formData,
				dataType : "json",
				success : function(response) {
					$("#selectResult").empty();
					$("#selectResult").html("<ul>");
					
					for(let car of response) {
						let dayPrice = car.car_dayprice.toLocaleString();
						let hourPrice = car.car_hourprice.toLocaleString();
						
						$("#selectResult > ul").append(
								"<li class='carList fadeIn row'>"
								+ "<a class='d-flex'>"
								+ "<span class='carImg'><img src='" + car.car_img + "'></span>"
								+ "<span class='carInfo'>"
								+ "<span>" + car.car_model + " / " + car.car_capacity + "</span>"
								+ "<small>종일가 "+ dayPrice + "</small><br>"
								+ "<small>시간당 "+ hourPrice + "</small><br>"
								+ "<small>예약가능차량" + car.canReserv + "</small>"
								+ "</span>"
								+ "</a>"
								+ "</li>"
						);
					}
					$("#selectResult").append("</ul>");
				}
			}) // ajax 끝
		}); // 차량검색 클릭 이벤트
	}); //ready 끝

	
	
	
	function goDetail(model){
		let pickupDate = $("#reserv_pickupdate").val() + "T" + $("#reserv_pickuptime").val();
		let returnDate = $("#reserv_returndate").val() + "T" + $("#reserv_returntime").val();
		let pickupLocation = $("#reserv_pickuplocation").val();
		let returnLocation = $("#reserv_returnlocation").val();
		
		if(returnLocation == "sameLocaion") {
			returnLocation = pickupLocation
		}
		
		location.href="reservationdetail?car_model=" + model + "&pickupDate=" + pickupDate + "&returnDate=" + returnDate
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
						<div>
							<input type="text" id="keyword" placeholder="주소를 검색하세요">
       						<input type="button" value="검색" onclick="searchPlaces()"> 
       						<div id="selected-location"></div>
							<div style="margin: auto;" style="margin-top: 20px;">
								<div id="map" style="width: 400px; height: 400px; margin-left: 5px; margin-top: 20px;">
								</div>
							</div>		    		
														
							<!-- 지도 -->
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f11e41f80b0aa80e39eeb275a45a8451&libraries=services"></script>
							<script type="text/javascript">
							//지도생성
					        var mapContainer = document.getElementById('map');
							//지도의 초기생성
					        var mapOption = {
					            center: new kakao.maps.LatLng(35.17988104101734, 129.07510440921163),
					            level: 1
					        };
							
							//변수선언(장소 검색, 지오코딩, 인포윈도우)
					        var map = new kakao.maps.Map(mapContainer, mapOption);
					        var ps = new kakao.maps.services.Places();
					        var geocoder = new kakao.maps.services.Geocoder();
					        var infowindow = new kakao.maps.InfoWindow({zIndex:1});
					        var marker = null;
							
					        //키워드 텍스트에 장소를 검색하는 함수
					        function searchPlaces() {
					            var keyword = document.getElementById('keyword').value;
					            if (!keyword.trim()) {
					                alert('주소를 입력하세요.');
					                return;
					            }
					            ps.keywordSearch(keyword, placesSearchCB);
					        }
							
					        //장소 목록을 생성하여 목록에 표시함
					        function placesSearchCB(data, status, pagination) {
					            if (status === kakao.maps.services.Status.OK) {
					                displayPlaces(data);
					            } else {
					                alert('검색 결과가 없습니다.');
					            }
					        }
							
					     // 장소 목록을 select 태그로 생성하여 목록에 표시함
					        function displayPlaces(places) {
					            var selectedLocation = document.getElementById('selected-location');
					            selectedLocation.innerHTML = ''; // 기존 내용을 비웁니다
					            var select = document.createElement('select'); // select 요소 생성
					            //css
					            select.classList.add('col-form-label');
					            select.style.marginTop = '20px';
					            
					            select.id = 'place-select'; // select 태그에 ID 부여

					            // 선택 이벤트 핸들러
					            select.addEventListener('change', function() {
					                var selectedIndex = this.selectedIndex; // 선택된 인덱스
					                var selectedPlace = places[selectedIndex]; // 선택된 장소 객체
					                addMarker(selectedPlace); // 선택된 장소에 마커 추가
					                geocoder.coord2Address(selectedPlace.x, selectedPlace.y, function(result, status) {
					                    if (status === kakao.maps.services.Status.OK) {
					                        document.getElementById('reserv_pickuplocation').value = result[0].address.address_name;
					                    } else {
					                        selectedLocation.textContent = '\n주소 변환에 실패했습니다.';
					                    }
					                });
					            });

					            // 드롭다운 목록에 각 장소를 옵션으로 추가
					            places.forEach(function(place, index) {
					                var option = document.createElement('option');
					                option.textContent = place.place_name;
					                option.value = index; // index를 value로 저장
					                select.appendChild(option);
					            });

					            selectedLocation.appendChild(select); // 완성된 select 요소를 페이지에 추가
					        }
							
					        //추가적으로 마커를 변경하고 싶을때 새로운 위치에 위도 경도를 생성 
					        function addMarker(place) {
						    var latlng = new kakao.maps.LatLng(place.y, place.x);
						    if (!marker) {
						        marker = new kakao.maps.Marker({
						            position: latlng,
						            map: map,
						            draggable: true
						        });
						    } else {
						        marker.setPosition(latlng);
						    }
						    map.setCenter(latlng);
						
						    // 드래그 끝났을 때의 이벤트 리스너
						    kakao.maps.event.addListener(marker, 'dragend', function() {
						        // 마커 위치 가져오기
						        var position = marker.getPosition();
						
						        // 지오코딩 실행 (위도, 경도 순서 주의)
						        geocoder.coord2Address(position.getLng(), position.getLat(), function(result, status) {
						            var selectedLocation = document.getElementById('selected-location');
						            if (status === kakao.maps.services.Status.OK) {
						                document.getElementById('reserv_pickuplocation').value = result[0].address.address_name;
						            } else {
						                selectedLocation.textContent = '주소 변환에 실패했습니다.';
						            }
						        });
						    });
						}
					    </script>
							
				    	</div>
				    	<div id="clicked-location"></div>
		    			<div class="" style="margin-top: 20px;">
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
			    	<input type="button" value="차	량	검	색" id="searchCar">
			    </form>
    		</div>
   		</div>
		<div class="col-8" id="selectResult">
			검색을 먼저해주세요
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