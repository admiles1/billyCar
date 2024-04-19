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
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- TOP -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
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



</style>
<script type="text/javascript">
$(document).ready(function(){
    $('.input-daterange').datepicker({
        format: 'dd-mm-yyyy',
        todayHighlight: true,
        startDate: '0d',
        orientation: "bottom"
    });
});
</script>
</head>
<body class ="body">
<!-- top 부분 -->
<div id = "logo">
	<img src="resources/images/logo_1.png" class = "top_logo">
</div>

<div class = "right_menu">
	<c:choose>
			<c:when test="${empty sessionScope.id}">
				<a class = "top_right_menu" href="">
				 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#00AAFF" class="bi bi-car-front-fill" viewBox="0 0 16 16">
  					<path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679q.05.242.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.8.8 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2m10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17s3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z"/>
				</svg>
					로그인
				</a>
				<a class = "top_right_menu" href="">회원가입</a>
			</c:when>
			<c:otherwise>
				<a class = "top_right_menu" href="">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#00AAFF" class="bi bi-car-front-fill" viewBox="0 0 16 16">
  					<path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679q.05.242.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.8.8 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2m10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17s3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z"/>
				</svg>
					마이페이지 
				</a>
				<a class = "top_right_menu" href="">로그아웃</a>
				<c:if test="${sessionScope.id eq 'admin'}">
					| <a class = "top_right_menu" href =""> 관리자페이지</a>
				</c:if>
			</c:otherwise>			
		</c:choose>
</div>


<div style="position: relative; z-index: 2">
<div class = "left_menu">
	<header class="top_menu_header">
	  <div class="con">
	  <hr id = "top-line">
	    <nav class="top_bar">
	      <ul class = "top_ul">
	        <li>
	          <a class = "top_menu" href="#">차량 예약</a>
	          <ul class = "top_ul">
	            <li><a class = "top_sub_menu"  href="#1"> 실시간 차량 예약 </a> </li>
	            <li><a class = "top_sub_menu"  href="#1"> 차량 예약 확인 </a> </li>
	            <li><a class = "top_sub_menu"  href="#1"> 차량 후기 </a> </li>
	          </ul>
	        </li>
	        <li>
	          <a class = "top_menu"  href="#">이용 안내</a>
	          <ul class = "top_ul">
	            <li><a class = "top_sub_menu"  href="#">회사 안내</a></li>
	            <li><a class = "top_sub_menu"  href="#">대여 안내</a></li>
	            <li><a class = "top_sub_menu"  href="#">취소 및 환불 규정</a></li>
	          </ul>
	        </li>
	        <li>
	          <a class = "top_menu"  href="#">차량 안내</a>
	          <ul class = "top_ul">
	            <li><a class = "top_sub_menu"  href="#">보유 차량 안내</a></li>
	            <li><a class = "top_sub_menu"  href="#">보험 안내</a></li>
	          </ul>
	        </li>
	        <li>
	          <a class = "top_menu" href="#">이벤트</a>
	        </li>
	        <li>
	          <a class = "top_menu"  href="#">고객센터</a>
	          <ul class = "top_ul">
	            <li><a class = "top_sub_menu" href="#">공지사항</a></li>
	            <li><a class = "top_sub_menu"  href="#">FAQ</a></li>
	            <li><a class = "top_sub_menu" href="#">문의 내역</a></li>
	          </ul>
	        </li>
	      </ul>
	    </nav>
	    <hr id="top-line">
	  </div>
	</header>
</div>
</div>
 <!-- 메인 부분 -->
<main class="container" style="position: relative; z-index: 1">

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
                        <label for="pickupDate" class="col-sm-2 col-form-label" style="text-align: center;">대여일</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control form-control-sm" id="pickupDate" placeholder="대여 날짜 선택" readonly>
                        </div>

                        <label for="returnDate" class="col-sm-2 col-form-label" style="text-align: center;">반납일</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control form-control-sm" id="returnDate" placeholder="반납 날짜 선택" readonly>
                        </div>
                    </div>
                </div>

                <div class="mb-2 row">
                    <label for="pickupTime" class="col-sm-2 col-form-label" style="text-align: center;">픽업 시간</label>
                    <div class="col-sm-4">
                        <input type="time" class="form-control form-control-sm" id="pickupTime">
                    </div>
                    <label for="carType" class="col-sm-2 col-form-label" style="text-align: center;">차종</label>
                    <div class="col-sm-4">
                        <select class="form-select form-select-sm" id="carType">
                            <option selected>차종 선택</option>
                            <option value="sedan">Sedan</option>
                            <option value="suv">SUV</option>
                            <option value="hatchback">Hatchback</option>
                        </select>
                    </div>
                </div>
                <div style="margin-top: 8px;">
                    <button type="submit" class="btn btn-sm date_btn-black">최저가 검색</button>
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
					<a href="#" class="btn btn-primary my-2">리뷰 더보기</a>
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
					<a href="#" class="btn btn-primary my-2">질문 더보기</a>
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
				<h1 class="fw-light">테마별 맟춤 차량 추천</h1>
				<p class="lead text-body-secondary">위드렌트카's PICK</p>
			</div>
		</div>
	</section>  
	

	  <div class="container marketing noto-sans-kr" style="text-align: center;">

    <div class="row" style="text-align: center;">
      <div class="col-lg-4">
     	 <img alt="" src="resources/main_images/re1.jpg" width="100%">
        <h2 class="fw-normal" style="margin-top: 10px;">추천관광지</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div>
      <div class="col-lg-4">
		<img alt="" src="resources/main_images/re2.jpg" width="100%">      
        <h2 class="fw-normal" style="margin-top: 10px;">드라이브코스</h2>
        <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div>
      <div class="col-lg-4">
      	<img alt="" src="resources/main_images/re3.jpg" width="100%">
        <h2 class="fw-normal" style="margin-top: 10px;">올레길코스</h2>
        <p>And lastly this, the third column of representative placeholder content.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div>
    </div>
    </div>
	
</main>


<!-- footer -->
<footer>
    <div id="footer" > 

	<div id = "f_size">
		<hr id="top_hr">
		<div class="finfo">
			<h3 id = "center_tel">고객센터 3333-3333</h3>
			<p class = "cs_weekend">월 ~ 일 9: 00 ~ 17:00 (공휴일 제외)</p>
			<div class="bank_info">
				<em class="tit">입금계좌 안내</em><br>
				<em>부산 114-511-806000</em>
				<em>(주)빌리카 </em>
			</div>
		</div>
			
		<p id = "footer_account">
			| 부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층(접수) | 사업자등록번호 : 111-88-22222 |<br>
			| 설립자 : (주)아이티윌 | 기관명 : (주)아이티윌부산지점 | 대표자 : 허정민 | TEL : 051-803-0909 <br>
			| FAX : 051-803-0979 | 이메일 : itwillbs_3@itwillbs.co.kr |<br>
		</p>
	</div>
</div>
</footer>
  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- 부트스트랩 JS 및 추가적인 JS 파일 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>