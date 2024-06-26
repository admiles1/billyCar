<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- top 링크 -->
<link rel="stylesheet" href="resources/css/main_top.css">
<link rel="stylesheet" href="resources/css/datepicker.css">
<link rel="stylesheet" href="resources/css/banner.css">
<link rel = "stylesheet" href ="resources/css/bottom.css">


<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<!-- 달력 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<!-- 배너 -->
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- TOP -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://kit.fontawesome.com/ef42a902c7.js" crossorigin="anonymous"></script>
<style type="text/css">
	
	#optionSelect{
		width: 100%; height: 100px;
		left:0%;
		position: absolute;
	}

/* 폰트 */
.noto-sans-kr {
  font-family: "Noto Sans KR", sans-serif;
  font-optical-sizing: auto;
  font-weight: 100px;
  font-style: normal;
}

 /* 버튼을 숨기는 CSS */
#adminButton {
   display: none;
   background-color: #f0f0f0; 
   color: #333; 
   border: 1px solid #ccc; 
   padding: 10px 20px; 
   cursor: pointer; 
}

/* 전체 페이지를 덮는 빈 여백 스타일 */
#overlay {
   position: fixed;
   top: 0;
   left: 0;
   width: 300px;
   height: 300px;
}




</style>
<script type="text/javascript">
$(document).ready(function(){
    $('.input-daterange').datepicker({
        format: 'yyyy-mm-dd',
        todayHighlight: true,
        startDate: '0d',
        orientation: "bottom"
    });
    
});

var clickCount = 0;
function countClicks() {
    clickCount++; // 클릭 횟수 증가
    if (clickCount >= 3) { // 예: 클릭 횟수가 3 이상일 때
//         document.getElementById('adminButton').style.display = 'block'; // 버튼을 표시
			location.href="adminForm";
    }
}

//관리자 페이지로 이동하는 함수
function redirectToAdminPage() {
    window.location.href = "review"; // 관리자 페이지의 URL로 리디렉션
}

function check() {
	let pickupDate = $("#pickupDate").val();
	let returnDate = $("#returnDate").val();
	
	if(pickupDate == "") {
		alert('대여날짜를 선택하여 주십시오');
		return false;
	} else if(pickupDate == "") {
		alert('반납날짜를 선택하여 주십시오');
		return false;
	}
}

</script>
</head>
<body class ="body">
	<header>
		<jsp:include page="inc/top.jsp"></jsp:include>
	</header>

 <!-- 메인 부분 -->
<main class="container" style="position: relative; z-index: 1; margin-top: 37px;">
	<c:set var="member_id" value="${sessionScope.member_id}"></c:set>
	<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/main_images/event1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/main_images/event2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/main_images/event3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- 달력 -->
    <div class="card noto-sans-kr" style="margin-top: 20px;">
        <div class="card-body">	
            <form action="reservation" method="post" onsubmit="return check()">
                <div class="input-daterange">
                    <div class="mb-2 row">
                        <label for="pickupDate" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-regular fa-calendar-days"></i> 대여일</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control form-control-sm" id="pickupDate" name="reserv_pickupdate" placeholder="대여 날짜 선택" readonly>
                        </div>
                        
                        <label for="pickupDate" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-regular fa-calendar-days"></i> 반납일</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control form-control-sm" id="returnDate" name="reserv_returndate" placeholder="반납 날짜 선택" readonly>
                        </div>
                    </div>
                </div>
                <div class="mb-2 row">
	   				<label for="pickupDate" class="col-sm-2 col-form-label" style="text-align: center;">
						<i class="fa-regular fa-clock"></i> 대여시간
					</label>
	   				<div class="col-sm-4">
	   				   <select  class="form-select form-select-sm"  name="pickupTime">
	    					<c:forEach var="BH" begin="${BHS}" end="${BHE}" >
	    						<fmt:formatNumber value="${BH}" pattern="00" var="BHfmt" />
	    						<option value="${BHfmt}">${BHfmt}:00</option>
	    					</c:forEach>
						</select>	
					</div>
					<label for="pickupDate" class="col-sm-2 col-form-label" style="text-align: center;">
						<i class="fa-regular fa-clock"></i> 반납시간
					</label>
	   				<div class="col-sm-4">
	   					<select class="form-select form-select-sm" name="returnTime">
							<c:forEach var="BH" begin="${BHS}" end="${BHE}" >
								<fmt:formatNumber value="${BH}" pattern="00" var="BHfmt" />
								<option value="${BHfmt}"> ${BHfmt}:00 </option>
		   					</c:forEach>
						</select>
					</div>
				</div>
                <div class="mb-2 row">
                	<label for="carType" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-solid fa-car-side"></i> 차종</label>
                    <div class="col-sm-4">
                        <select class="form-select form-select-sm" id="carType" name="car_type">
                            <option value='' selected>차종 선택</option>
                           	<c:forEach var="type" items="${types}">
                            	<option value="${type.name}" >${type.name} </option>
                        	</c:forEach>
                        </select>
                    </div>
                    <label for="carType" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-solid fa-gas-pump"></i> 연료</label>
                    <div class="col-sm-4">
                        <select class="form-select form-select-sm" id="carFuel" name="car_fuel">
                            <option value='' selected>연료 선택</option>
                       		<c:forEach var="fuel" items="${fuels}">
			    				<option value="${fuel.name}" > ${fuel.name} </option>
			    			</c:forEach>   
                        </select>
                    </div>
                </div>
                
                <div style="margin-top: 8px;">
                    <button type="submit" class="btn btn-sm date_btn-black"><i class="fa-solid fa-magnifying-glass"></i> 차량 검색</button>
                </div>
            </form>
        </div>
    </div>

	<!-- 연습란 -->
	<section class="content__banner bg-light py-5" style="margin-top: 20px;">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-4">
	                <div class="about-reason text-center">
	                    <img src="resources/main_images/icon1.png" width="53" height="53" alt="누적 예약">
	                    <div class="mt-2">
	                        <div class="font-weight-bold">누적예약</div>
	                        <div id="allRsv" class="text-primary">${reservCount }</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="about-reason text-center">
	                    <img src="resources/main_images/icon2.png" width="53" height="53" alt="예약가능차량">
	                    <div class="mt-2">
	                        <div class="font-weight-bold">현재 보유 차량</div>
	                        <div id="ableRsv" class="text-primary">${carCount }</div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-4">
	                <div class="about-reason text-center">
	                    <img src="resources/main_images/icon3.png" width="53" height="53" alt="누적 회원 수">
	                    <div class="mt-2">
	                        <div class="font-weight-bold">누적 회원 수</div>
	                        <div id="inCorp" class="text-primary">${memberCount }</div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>    	
 
   
   <!-- 리뷰 -->
	<section class="py-5 text-center container noto-sans-kr" style="margin-top: 30px;">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">인기 차량 추천</h1>
				<p class="lead text-body-secondary">빌리카에게 가장 많은 인기 많은 차량입니다.</p>
<!-- 				<p> -->
<!-- 					<a href="review" class="btn btn-primary my-2">리뷰 더보기</a> -->
<!-- 				</p> -->
			</div>
		</div>
		
		<!-- 구분  varstatus 해야라 -->
		<div class="row row-cols-1 row-cols-md-3 g-4 noto-sans-kr" style="justify-content: center;">
		<c:forEach var="popular" items="${popularList}" varStatus="status">
		<div class="col">
			<div class="card h-100" style="position: relative;">
<!-- 				<div style="position: absolute; left: -50px; top: -50px;"><img width="100" height="100" src="https://img.icons8.com/carbon-copy/100/1-circle.png" alt="1-circle"/></div> -->
				<div style="position: absolute; left: -50px; top: -50px;"><img width="100" height="100" src="https://img.icons8.com/carbon-copy/100/${status.count}-circle.png" alt="${status.count}-circle"/></div>
				<img src="<%= request.getContextPath() %>/resources/upload/${popular.car_img }" class="card-img-top">
				<div class="card-body">
				    <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 10px;">
				        <h5 style="width: 100px; text-align: right; margin-right: 10px;">모델명</h5>
				        <p class="lead text-body-secondary" style="margin: 0; width: 200px;">${popular.car_model_name}</p>
				    </div>
				    <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 10px;">
				        <h5 style="width: 100px; text-align: right; margin-right: 10px;">차번호</h5>
				        <p class="lead text-body-secondary" style="margin: 0; width: 200px;">${popular.car_number}</p>
				    </div>
				    <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 10px;">
				        <h5 style="width: 100px; text-align: right; margin-right: 10px;">연료</h5>
				        <p class="lead text-body-secondary" style="margin: 0; width: 200px;">${popular.car_fuel_name}</p>
				    </div>
				    <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 10px;">
				        <h5 style="width: 100px; text-align: right; margin-right: 10px;">차종류</h5>
				        <p class="lead text-body-secondary" style="margin: 0; width: 200px;">${popular.car_type_name}</p>
				    </div>
				</div>
				<div class="card-footer">
				<small class="text-body-secondary">평균 별점:${popular.review_score}점</small>, 
				<small class="text-body-secondary">종아요 수:${popular.review_heart }개</small>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	</section>
   
	<!-- FAQ -->
	<section class="py-2 text-center container noto-sans-kr" style="margin-top: 30px;">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">자주 묻는 질문</h1>
				<p class="lead text-body-secondary">고객님들의 편의를 위한 FAQ</p>
				<p>
					<a href="faq" class="btn btn-primary my-2">질문 더보기</a>
				</p>
			</div>
		</div>
		
		<!-- 구분  -->
		<div class="accordion noto-sans-kr" id="accordionExample">
		<!-- 1번 -->
		<c:forEach var="faq" items="${faqList }">
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${faq.faq_idx}" aria-expanded="false" aria-controls="collapse${faq.faq_idx}">
						${faq.faq_subject }
					</button>
				</h2>
				<div id="collapse${faq.faq_idx}" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						■ ${faq.faq_content }
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</section>

	<!-- 맞춤 추천 theme-->
	<section class="py-2 text-center container noto-sans-kr" style="margin-top: 100px;">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">고객 이벤트</h1>
				<p class="lead text-body-secondary">빌리카's PICK</p>
			</div>
		</div>
	</section>  
	<div class="container marketing noto-sans-kr" style="text-align: center;">
    <div class="row">
    		<c:forEach var="event" items="${eventList}">
	        	<div class="col-md-4">
	        		<div class="card">
	        			<img src="<%= request.getContextPath() %>/resources/upload/${event.event_image }" width="406" height="300">
	        			
	                    <div class="card-body">
	                    	<h5 class="fw-light">${event.event_title }</h5>
						</div>
						<a href="eventContent?event_idx=${event.event_idx}" class="btn btn-primary">쿠폰받으러가기</a>
					</div>
					
				</div>
			</c:forEach>
		</div>
    </div>
    
    <!-- 지도 -->
    
    <section class="py-2 text-center container noto-sans-kr" style="margin-top: 100px;">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">오시는 길</h1>
				<p class="lead text-body-secondary">부산광역시 부산진구 동천로 109 삼한골든게이트 7층</p>
			</div>
		</div>
	</section>  
	
	
	
	<!-- 지도 -->
    <section class="py-5" style="margin-top: -50px;">
        <div class="container d-flex justify-content-center align-items-center">
            <div class="row">
                <div id="map" style="width: 1296px; height: 400px;"></div>
            </div>
        </div>
    </section>
        
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df9a4a8523d874b7750523a91471020a&libraries=services"></script>
    <script type="text/javascript">
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.1584897298991, 129.06205146230675), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(35.1584897298991, 129.06205146230675); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
    
	</script>
    
    <div id="overlay" onclick="countClicks()"></div>
<!--     <button id="adminButton" onclick="redirectToAdminPage()">관리자페이지 이동</button> -->
	
</main>
<footer><jsp:include page="inc/bottom.jsp"></jsp:include></footer>


  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- 부트스트랩 JS 및 추가적인 JS 파일 -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
</body>
</html>