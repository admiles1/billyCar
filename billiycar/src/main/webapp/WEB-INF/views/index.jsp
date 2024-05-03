<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
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

</script>
</head>
<body class ="body">
	<header>
		<jsp:include page="inc/top.jsp"></jsp:include>
	</header>

 <!-- 메인 부분 -->
<main class="container" style="position: relative; z-index: 1; margin-top: 37px;">

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
            <form>
                <div class="input-daterange">
                    <div class="mb-2 row">
                        <label for="pickupDate" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-regular fa-calendar-days"></i> 대여일</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control form-control-sm" id="pickupDate" placeholder="대여 날짜 선택" readonly>
                        </div>

                        <label for="pickupDate" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-regular fa-calendar-days"></i> 반납일</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control form-control-sm" id="returnDate" placeholder="반납 날짜 선택" readonly>
                        </div>
                    </div>
                </div>
                <!--  연습 -->
   
                <!-- 연습 -->
                

                <div class="mb-2 row">
                    <label for="pickupTime" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-regular fa-clock"></i> 대여시간</label>
                    <div class="col-sm-4">
                        <input type="time" class="form-control form-control-sm" id="pickupTime" value="09:00" step="1800">
                    </div>
                    <label for="pickupTime" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-regular fa-clock"></i> 반납시간</label>
                    <div class="col-sm-4">
                        <input type="time" class="form-control form-control-sm" id="pickupTime" value="21:00">
                    </div>
                </div>
                
                
                <div class="mb-2 row">
                	<label for="carType" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-solid fa-car-side"></i> 차종</label>
                    <div class="col-sm-4">
                        <select class="form-select form-select-sm" id="carType">
                            <option selected>차종 선택</option>
                            <option value="sedan">Sedan</option>
                            <option value="suv">SUV</option>
                            <option value="hatchback">Hatchback</option>
                        </select>
                    </div>
                    <label for="carType" class="col-sm-2 col-form-label" style="text-align: center;"><i class="fa-solid fa-gas-pump"></i> 연료</label>
                    <div class="col-sm-4">
                        <select class="form-select form-select-sm" id="carType">
                            <option selected>연료 선택</option>
                            <option value="">휘발유</option>
                            <option value="">경유</option>
                            <option value="">LPG</option>
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
                    <img src="resources/main_images/icon1.png" width="53" height="53" alt="누적예약">
                    <div class="mt-2">
                        <div class="font-weight-bold">누적예약</div>
                        <div id="allRsv" class="text-primary">180807</div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="about-reason text-center">
                    <img src="resources/main_images/icon2.png" width="53" height="53" alt="예약가능차량">
                    <div class="mt-2">
                        <div class="font-weight-bold">예약 가능 차량</div>
                        <div id="ableRsv" class="text-primary">3885</div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="about-reason text-center">
                    <img src="resources/main_images/icon3.png" width="53" height="53" alt="제주도입점업체">
                    <div class="mt-2">
                        <div class="font-weight-bold">제주도 입점 업체</div>
                        <div id="inCorp" class="text-primary">79</div>
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
				<h1 class="fw-light">고객 리뷰</h1>
				<p class="lead text-body-secondary">위드 렌트카는 이미 많은 고객분들로부터 사랑받고 있습니다.</p>
				<p>
					<a href="review" class="btn btn-primary my-2">리뷰 더보기</a>
				</p>
			</div>
		</div>
		
		<!-- 구분  -->
		<div class="row row-cols-1 row-cols-md-3 g-4 noto-sans-kr">
		<div class="col">
			<div class="card h-100">
				<img src="resources/main_images/rewiewCar1.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><img src="resources/main_images/star5.png"/></h5>
					<h6 class="card-title">bmw i4</h6>
					<p class="card-text">좋아요</p>
				</div>
				<div class="card-footer">
				<small class="text-body-secondary">admin 고객님</small>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<img src="resources/main_images/rewiewCar2.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><img src="resources/main_images/star5.png"/></h5>
					<h6 class="card-title">bmw X7</h6>
					<p class="card-text">직원분들 친절하시고 차량 상태도 좋습니다.</p>
				</div>
				<div class="card-footer">
				<small class="text-body-secondary">한성민 고객님</small>
				</div>
			</div>
		</div>

		<div class="col">
			<div class="card h-100">
				<img src="resources/main_images/rewiewCar3.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><img src="resources/main_images/star5.png"/></h5>
					<h6 class="card-title">기아 k5</h6>
					<p class="card-text">차량이 너무 깨끗해서 이용하는 기간내내 쾌적해서 좋았어요.</p>
				</div>
				<div class="card-footer">
				<small class="text-body-secondary">한성민 고객님</small>
				</div>
			</div>
		</div>
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
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
				01. 카시트 등 부가서비스는 어떻게 이용하나요?
				</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					■ 위드렌터카는 유아용카시트, 주니어용 카시트를 무료로 대여해드리고 있습니다. 
					예약하실 때, 선택하시거나 차량이용일 이전에 전화로 알려주시면 배차 시 제공해드리고 있습니다. 
					(단, 한정수량인 관계로 단일품목을 2개이상 이용시에는  추가비용이 발생됨을 알려드립니다.
				</div>
			</div>
		</div>
		<!-- 2번 -->
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				02. 사고 또는 고장 발생시 어떻게 해야하나요?
				</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					■ 사고 또는 고장 발생 시
					당황하지 마시고 먼저 자사 직통전화로 연락을 하시고 기다리시면
					보험접수 및 보험사 출동 등 자사에서 필요하다고 판단되는 부분에 대해서 일괄 신청 및 처리하고 있습니다.
					직통전화 : 051-808-600 / 010-9700-6615 
				</div>
			</div>
		</div>
		<!-- 3번 -->
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseTwo">
				03. 현금 영수증 발급이 가능한가요?
				</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					■ 렌터카는 차량을 구매하는 것이 아닌 대여 품목으로 현금영수증 발급 및 소득공제제외 대상입니다.
					상세한 내용은 국세청 홈페이지에서 확인이 가능합니다.
					<br>
					■ 관련 법령 - 소득세법 제 162조의 3 및 동법시행령 제 210조의 3 - 조세특례제한법 제 121조의 2 ⑥ 5번(리스료)  
				</div>
			</div>
		</div>
		<!-- 4번 -->
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseTwo">
				04. 해외에 거주하고 있는데 예약 및 이용이 가능하나요?
				</button>
			</h2>
			<div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					■ 외국인 및 해외체류자 대여시에는 전화상담이 직접 어려울 경우 국내에 거주중인
  					지인을 통해 대리예약이 가능하나 운전자의 조건이 확인 되어야 합니다.
					<br>
					■ 임차인은 필히 국적이 한국인이어야 하고, 국내주소지, 국내 휴대폰번호, 차량대여기준 (연령/운전경력)이 적합한 경우 등록가능하며
					<br>
					■ 외국인은 제 2운전자(추가운전자)로 등록이 가능하며 아래의 조건을 충족해야합니다.

					
				</div>
			</div>
		</div>
	</div>
		
	</section>

	
	
	<!-- 맞춤 추천 theme-->
	<section class="py-2 text-center container noto-sans-kr" style="margin-top: 100px;">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">고객 이벤트</h1>
				<p class="lead text-body-secondary">위드렌트카's PICK</p>
			</div>
		</div>
	</section>  
	

	  <div class="container marketing noto-sans-kr" style="text-align: center;">

    <div class="row">
        	<div class="col-md-4">
        		<div class="card">
                	<img src="resources/event_images/envent_page_event1-1.webp" class="card-img-top" alt="이벤트 이미지 1" width="300" height="300">
                    <div class="card-body">
                    	<h5 class="card-title">유아용 카시트 무료 이벤트!</h5>
                    	<p class="card-text">다자녀 고객 당신은 애국자! 애국자한테 드리는 유아용 카시트 무료 이벤트!(자녀3이상일 경우)</p>
                    	<a href="event1" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img src="resources/event_images/envent_page_event2-1.webp" class="card-img-top" alt="이벤트 이미지 2" width="300" height="300">
					<div class="card-body">
						<h5 class="card-title">현대차 렌트 할인 이벤트!</h5>
						<p class="card-text">현대차 렌트 시 5000원 할인 이벤트!</p><br>
						<a href="event2" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img src="resources/event_images/envent_page_event3-1.webp" class="card-img-top" alt="이벤트 이미지 1" width="300" height="300">
					<div class="card-body">
						<h5 class="card-title">첫 고객 할인 이벤트!</h5>
						<p class="card-text">빌리카가 쏜다! 첫 고객 할인 이벤트!</p><br>
						<a href="event3" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
    </div>
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