<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- 달력 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<style type="text/css">
	.container{
	position: relative;
	}
	
	#optionSelect{
		width: 100%; height: 100px;
		left:0%;
		position: absolute;
	}
	

::placeholder {
    color: #BDBDBD;
    opacity: 1;
}

:-ms-input-placeholder {
    color: #BDBDBD;
}

::-ms-input-placeholder {
    color: #BDBDBD;
}
/*일단 놔두기*/
.date_btn-black:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0;
}

.datepicker {
  background-color: #fff;
  border: none;
  border-radius: 0 !important;
}

.datepicker-dropdown {
  top: 0;
  left: 0;
}

.datepicker table tr td.today, span.focused {
  border-radius: 50% !important;
  background-image: linear-gradient(#FFF3E0, #FFE0B2);
}

.datepicker table tr td.today.range {
  background-image: linear-gradient(#eeeeee, #eeeeee) !important;
  border-radius: 0 !important;
}

/*Weekday title*/
thead tr:nth-child(3) th {
  font-weight: bold !important;
  padding-top: 10px;
  padding-bottom: 10px;
}

.dow, .old-day, .day, .new-day {
  width: 40px !important;
  height: 40px !important;
  border-radius: 0px !important;
}

.old-day:hover, .day:hover, .new-day:hover, .month:hover, .year:hover, .decade:hover, .century:hover {
  border-radius: 50% !important;
  background-color: #eee;
}

.active {
  border-radius: 50% !important;
  background-image: linear-gradient(#90CAF9, #64B5F6) !important;
  color: #fff !important;
}

.range-start, .range-end {
  border-radius: 50% !important;
  background-image: linear-gradient(#FFA726, #FFA726) !important;
}

.prev, .next, .datepicker-switch {
  border-radius: 0 !important;
  padding: 10px 10px 10px 10px !important;
  text-transform: uppercase;
  font-size: 14px;
  opacity: 0.8;
}

.prev:hover, .next:hover, .datepicker-switch:hover {
  background-color: inherit !important;
  opacity: 1;
}
/*수정*/
.date_btn-black {
  background-color: #37474F !important;
  color: #fff !important;
  width: 100%;
}

/*수정*/
.date_btn-black:hover {
  color: #fff !important;
  background-color: #000 !important;
}
	
/*date_input에 border 없애기*/	
.date_input {
    width: calc(50% - 15px);
    margin-right: 15px;
    border: none; /* border 제거 */
    outline: none; /* 포커스 시 테두리 제거 */
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
<body>

<!-- top 부분 -->
<%-- <header><jsp:include page="inc/top.jsp"></jsp:include></header> --%>
 <!-- 메인 부분 -->
<main class="container">

	<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/main_images/event1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/event2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/event3.jpg" class="d-block w-100" alt="...">
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
<!-- <div class="row justify-content-center mt-5"> -->
<!--       <div class="col-md-6 offset-md-3" id="optionSelect" style="margin-top: 20px; width: 100%;"> -->
    <div class="card" style="margin-top: 20px;">
        <div class="card-body">	
            <form>
                <div class="input-daterange">
                    <div class="mb-2 row">
                        <label for="pickupDate" class="col-sm-2 col-form-label" style="text-align: center;">대여일</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control form-control-sm" id="pickupDate" placeholder="대여 날짜 선택" readonly>
                        </div>
<!--                     </div> -->

<!--                     <div class="mb-2 row"> -->
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
<!--                 </div> -->
<!--                 <div class="mb-2 row"> -->
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
<!-- </div> -->
<!-- 	</div> -->

    	
 
   
   <!-- 리뷰 -->
	<section class="py-5 text-center container">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">고객 리뷰</h1>
				<p class="lead text-body-secondary">위드 렌트카는 이미 많은 고객분들로부터 사랑받고 있습니다.</p>
				<p>
					<a href="#" class="btn btn-primary my-2">리뷰 더보기</a>
				</p>
			</div>
		</div>
	</section>
   
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<div class="col">
			<div class="card h-100">
				<img src="resources/main_images/a1.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><img src="images/star5.png"/></h5>
					<p class="card-text">좋아요</p>
				</div>
				<div class="card-footer">
				<small class="text-body-secondary">admin 고객님</small>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<img src="resources/main_images/a2.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><img src="images/star5.png"/></h5>
					<p class="card-text">직원분들 친절하시고 차량 상태도 좋습니다.</p>
				</div>
				<div class="card-footer">
				<small class="text-body-secondary">한성민 고객님</small>
				</div>
			</div>
		</div>

		<div class="col">
			<div class="card h-100">
				<img src="resources/main_images/a3.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><img src="images/star5.png"/></h5>
					<p class="card-text">차량이 너무 깨끗해서 이용하는 기간내내 쾌적해서 좋았어요.</p>
				</div>
				<div class="card-footer">
					<small class="text-body-secondary">이점숙 고객님</small>
				</div>
			</div>
		</div>
	</div>
	


	<!-- FAQ -->
	<section class="py-2 text-center container" style="margin-top: 100px;">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">자주 묻는 질문</h1>
				<p class="lead text-body-secondary">고객님들의 편의를 위한 FAQ</p>
				<p>
					<a href="#" class="btn btn-primary my-2">질문 더보기</a>
				</p>
			</div>
		</div>
	</section>

	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				01.카시트 등 부가서비스는 어떻게 이용하나요?
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
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				02.사고 또는 고장 발생시 어떻게 해야하나요?
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
	</div>
	
	<!-- 맞춤 추천 -->
	<section class="py-2 text-center container" style="margin-top: 100px;">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">테마별 맟춤 차량 추천</h1>
				<p class="lead text-body-secondary">위드렌트카's PICK</p>
			</div>
		</div>
	</section>  
<div class="row">
      <div class="col-lg-4">
        <img src="resources/main_images/pick1.png" width="416" height="416" style="border-radius: 5px; margin-bottom: 10px;"/>
        <p>한적한 자연으로 떠나요</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img src="resources/main_images/pick2.png" width="416" height="416" style="border-radius: 5px; margin-bottom: 10px;"/>
        <p>실용적인 차가 최고!</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
      	<img src="resources/main_images/pick3.png" width="416" height="416" style="border-radius: 5px; margin-bottom: 10px;"/>
        <p>My 세컨카 로망 충족</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
</main>

<%--  <footer><jsp:include page="inc/bottom.jsp"></jsp:include></footer> --%>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>