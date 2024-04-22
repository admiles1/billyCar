<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/reserv_detail.css">
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
	      						<img src="resources/images/1.png" class="d-block w-100" alt="...">
	   						</div>
	    					<div class="carousel-item">
	      						<img src="resources/images/3.jpg" class="d-block w-100" alt="...">
	   						</div>
	    					<div class="carousel-item">
	      						<img src="resources/images/2.jpg" class="d-block w-100" alt="...">
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
		    		<a href="http://naver.com"><span class="make-rv"></span></a>
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
    				<div class="car-info">
    					<h5> 자동차 기본정보</h5>
    				</div>
    				<div class="car-option">
    					<h5> 옵션</h5>
    				</div>
    				<div class="car-insurance">
   						<h5> 차량 보험안내</h5>
    				</div>
    			</div>
   			</div>
		</div>
	</div>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>	
</body>
</html>