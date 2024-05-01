<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reserv_detail.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
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
	      						<img src="..." class="d-block w-100" alt="...">
	   						</div>
	    					<div class="carousel-item">
	      						<img src="..." class="d-block w-100" alt="...">
	   						</div>
	    					<div class="carousel-item">
	      						<img src="..." class="d-block w-100" alt="...">
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
	   		 		<h2 class="car-name"> 람보르기니 
	   		 			<span class="car-size"> 스포츠카 </span>
   		 			</h2>
	   		 		<h2 class="car-price"> 50,000,000원 </h2>
	   		 		<hr>
	   		 		<div>
	   		 			데이트피커
	   		 		</div>
	   		 		<hr>
   		 			<select id="selectArea">
			    		<option selected> :: 대여지점 :: </option>
			    		<option> 아이티윌본점 </option>
			    	</select>
			    	<select id="selectArea">
			    		<option selected> :: 반납지점 :: </option>
			    		<option> 아이티윌본점 </option>
		    		</select>
		    		<br>
		    		<strong class="rental-criteria"> 대여 기준 </strong>
		    		<ul class="rental-criteria-list">
		    			<li><img src="../resources/images/check-img.png" class="check-img">나이 : <span class="qua">만 23세 이상</span></li>
		    			<li><img src="../resources/images/check-img.png" class="check-img">운전경력 : <span class="qua">1년 이상</span></li>
		    			<li><img src="../resources/images/check-img.png" class="check-img">면허종류 : <span class="qua">2종 보통면허 이상</span></li>
		    		</ul>
		    		<a href="payment"><span class="make-rv"></span></a>
		    		<a href="http://naver.com"><span class="contact-cs"></span></a>
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
	    					<div class="card review-card col-4">
							 	<div class="card-body">
							    	<h5 class="card-title"> OOO 고객님 </h5>
							    	<h6 class="card-subtitle mb-2 text-body-secondary"> 이 자리에 별점 넣기 </h6>
							    	<p class="card-text">리뷰 내용 </p>
							 	</div>
							</div>
	    					<div class="card review-card col-4">
							 	<div class="card-body">
							    	<h5 class="card-title"> 김유신 고객님 </h5>
							    	<h6 class="card-subtitle mb-2 text-body-secondary"> 이 자리에 별점 넣기 </h6>
						    		<textarea class="review-content" readonly cols="45" rows="10"> d기에 리뷰내용을 </textarea>
						    	</div>
							</div>
	    					<div class="card review-card col-4">
							 	<div class="card-body">
							    	<h5 class="card-title"> OOO 고객님 </h5>
							    	<h6 class="card-subtitle mb-2 text-body-secondary"> 이 자리에 별점 넣기 </h6>
							    	<p class="card-text">리뷰 내용 </p>
							 	</div>
							</div>
						</div>
    				</div>
    				<div class="car-info">
    					<h5 class="div-tap"> 자동차 기본정보</h5>
    					<ul class="car-info-list">
    						<li>
    							<small> 차량번호 </small> <br>
    							<strong> DB값 </strong>
    						</li>
    						<li>
    							<small> 제조사 </small> <br>
    							<strong> DB값 </strong>
    						</li>
    						<li>
    							<small> 모델 </small> <br>
    							<strong> DB값 </strong>
    						</li>
    						<li>
    							<small> 연식 </small> <br>
    							<strong> DB값 </strong>
    						</li>
    						<li>
    							<small> 변속타입 </small> <br>
    							<strong> DB값 </strong>
    						</li>
    						<li>
    							<small> 연료 </small> <br>
    							<strong> DB값 </strong>
    						</li>
    						<li>
    							<small> 정원 </small> <br>
    							<strong> DB값 </strong>
    						</li>
    					</ul>
    				</div>
    				<div class="car-option">
    					<h5 class="div-tap"> 옵션</h5>
    					<ul class="car-option-list">
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small>국제운전면허증 가능</small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 긴급출동무료</small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 충전기제공 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 연료적립 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 카시트 무료 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 금연 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 열선시트 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 스마트키 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 제2운전자 등록가능 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 네비게이션 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 후방카메라 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 블랙박스 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 하이패스 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
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
						<p id="check"><img src="../resources/images/check-img.png" class="check-img">Check
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>	
</body>
</html>