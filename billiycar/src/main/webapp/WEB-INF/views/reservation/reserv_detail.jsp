<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reserv_detail.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>:: 상세 예약페이지 ::</title>
</head>
<body>
<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div>
		<div class="container text-center">
	 		<div class="row">
	    		<div class="col-6 car-carousel">
	    			<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
	 					<div class="carousel-inner">
	    					<div class="carousel-item active">
	      						<img src="" class="d-block w-100" alt="...">
	   						</div>
	    					<div class="carousel-item">
	      						<img src="" class="d-block w-100" alt="...">
	   						</div>
	    					<div class="carousel-item">
	      						<img src="" class="d-block w-100" alt="...">
	    					</div>
						</div>
	  						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
	    						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    						<span class="visually-hidden">Previous</span>
	  						</button>
	  						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
	   							<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    						<span class="visually-hidden">Next</span>
	  						</button>
						</div>
	   				</div>	
	   		 	<div class="col-6" id="selectResult" style="">
	   		 		<h2 class="car-name"> ${car.car_model}
	   		 			<span class="car-size"> ${car.car_type} </span>
   		 			</h2>
	   		 		<h2 class="car-price"><fmt:formatNumber value="${car.car_dayprice}" pattern="#,###"/></h2>
	   		 		<hr>
	   		 		<div>
	   		 			<c:set var="schedules" value="${fn:split(param.schedule, ',')}" />
	   		 			<p> 대여 날짜 : ${schedules[0]}
	   		 			<p> 반납 날짜 : ${schedules[1]}
	   		 			<p> 대여 장소 : ${schedules[2]}
	   		 			<p> 반납 장소 : ${schedules[3]}
	   		 		</div>
	   		 		<hr>
		    		<br>
		    		<strong class="rental-criteria"> 대여 기준 </strong>
		    		<ul class="rental-criteria-list">
		    			<li><img src="${pageContext.request.contextPath}/resources/images/check-img.png" class="check-img">나이 : <span class="qua">만 23세 이상</span></li>
		    			<li><img src="${pageContext.request.contextPath}/resources/images/check-img.png" class="check-img">운전경력 : <span class="qua">1년 이상</span></li>
		    			<li><img src="${pageContext.request.contextPath}/resources/images/check-img.png" class="check-img">면허종류 : <span class="qua">2종 보통면허 이상</span></li>
		    		</ul>
		    		<a href="payment?car_number=${car.car_number}&schedule=${param.schedule}"><span class="make-rv"></span></a>
		    		<a href="faq"><span class="contact-cs"></span></a>
	    		</div>
	  		</div>
  		</div>
	</div>
	<hr style="margin : 5px;">'
	<div>
		<div class="container text-center">
 			<div class="row">
    			<div class="col-12">
    				<div class="review">
    					<h5 class="div-tap"> 이용후기 </h5>
    					<div style=" margin : 20px; display:flex">
    						<c:forEach var="review" items="${reviewes}">
   								<c:choose>
   									<c:when test="${not empty review.review_id}">
   										<div class="card review-card col-4">
				 							<div class="card-body">
										    	<h5 class="card-title"> ${review.review_id} 고객님 </h5>
<!-- 										    	<h6 class="card-subtitle mb-2 text-body-secondary"> 이 자리에 별점 넣기 </h6> -->
										    	<p class="card-text"> ${review.review_content} </p>
							    			</div>
										</div>
   									</c:when>
   									<c:otherwise>
   										<div class="card review-card col-4">
				 							<div class="card-body">
		   										<h5 class="card-title"> 아직 리뷰가 작성되지 않았습니다 </h5>
		   										<p class="card-text"> 차량 이용 후 리뷰를 달아주세요! </p>
											</div>
										</div>
   									</c:otherwise>
   								</c:choose> 						
    						</c:forEach>
						</div>
    				</div>
    				<div class="car-info">
    					<h5 class="div-tap"> 자동차 기본정보</h5>
    					<ul class="car-info-list">
    						<li>
    							<small> 차량번호 </small> <br>
    							<strong> ${car.car_number} </strong>
    						</li>
    						<li>
    							<small> 제조사 </small> <br>
    							<strong> ${car.car_brand} </strong>
    						</li>
    						<li>
    							<small> 모델 </small> <br>
    							<strong> ${car.car_model} </strong>
    						</li>
    						<li>
    							<c:set var="year" value="${car.car_year}"/>
    							<small> 연식 </small> <br>
    							<strong>${fn:substring(year,0,4)}</strong>
    						</li>
    						<li>
    							<small> 변속타입 </small> <br>
    							<strong>
    								<c:choose>
    									<c:when test="${car.gear_type eq 1}"> 수동 </c:when>
    									<c:otherwise> 자동 </c:otherwise>
    								</c:choose> 
 								</strong>
    						</li>
    						<li>
    							<small> 연료 </small> <br>
    							<strong> ${car.car_fuel} </strong>
    						</li>
    						<li>
    							<small> 정원 </small> <br>
    							<strong> ${car.car_capacity} </strong>
    						</li>
    					</ul>
    				</div>
    				<div class="car-option">
    					<h5 class="div-tap"> 옵션</h5>
    					<ul class="car-option-list">
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_linsece.png"><p>
    							<small>국제운전면허증 가능</small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_sos.png"><p>
    							<small> 긴급출동무료</small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_usb.png"><p>
    							<small> 충전기제공 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_charger.png"><p>
    							<small> 연료적립 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_seat.png"><p>
    							<small> 카시트 무료 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_nosmoking.png"><p>
    							<small> 금연 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_heatseat.png"><p>
    							<small> 열선시트 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_smartkey.png"><p>
    							<small> 스마트키 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_2ndlinsece.png"><p>
    							<small> 제2운전자 등록가능 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_navigation.png"><p>
    							<small> 네비게이션 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_backcamera.png"><p>
    							<small> 후방카메라 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_blackbox.png"><p>
    							<small> 블랙박스 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_highpass.png"><p>
    							<small> 하이패스 </small>
    						</li>
    						<li>
    							<img src="${pageContext.request.contextPath}/resources/images/option/option_bluetooth.png"><p>
    							<small> 블루투스 </small>
    						</li>
    					</ul>
    				</div>
    				<div class="car-insurance">
   						<h5 class="div-tap"> 차량 보험안내</h5>
						<table class="car-insurance-table">
							<tr>
								<th width="100px">일반자차</th>
								<td width="1200px">면책금 30~50만원 + 휴차보상료(사고 1건만 적용, 차종별 한도 있음)</td>
							</tr>
							<tr>
								<th>미가입</th>
								<td>사고로 발생되는 모든 차량수리비 및 휴차보상료를 고객께서 부담하셔야 합니다.<br>
									<span id="insurance-warning">타인에 의한 사고가 많은 만큼</span>만일의 경우를 대비해 자차보험에 가입하시길 권고 드립니다.
								</td>
							</tr>
						</table>
						<p id="check"><img src="${pageContext.request.contextPath}/resources/images/check-img.png" class="check-img">Check
						<ul class="check-list">
							<li>모든 자차보험은 사고 1건에 대해서만 적용됩니다.</li>
							<li>대형,수입 등 특이차종의 경우 일반면책만 가입가능</li>
							<li>면책적용 불가사항 (출동서비스, 견인, 체인, 네비게이션, 실내부품, 타이어, 휠, 침수, 12대중과실사고, 미등록운전자사고)</li>
						</ul>
    				</div>
    			</div>
   			</div>
		</div>
		</div>
	<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>

</body>
</html>