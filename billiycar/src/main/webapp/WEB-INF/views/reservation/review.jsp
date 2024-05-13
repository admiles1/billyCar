<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/ef42a902c7.js" crossorigin="anonymous"></script>

<style type="text/css">
	.subject{
		color:  #00AAFF;
	}
</style>
<script type="text/javascript">
// $(document).ready(function(){
//     $('#options').change(function(){
//         var selectedOption = $('#options').val(); 
//         $.ajax({
//             type: 'GET',
//             url: 'review',
//             data: { option: selectedOption },
//             success: function(response){
//                 var result = response;// 받은 데이터로 화면 업데이트
//             },
//             error: function(xhr, status, error){
//                 console.error(error);
//             }
//         });
//     });
// });
function optionChange(option) {
    var selectedOption = option.value;
    location.href = "review?option=" + selectedOption;
}

</script>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
    	<h1 class="subject mt-5 mb-3" style="text-align: center; margin-bottom: 50px;">리뷰</h1>
    	
    <!-- 검색창 -->
<!--     <div class="card noto-sans-kr" style="margin-top: 20px; margin-bottom: 50px;"> -->
<!--     <div class="card-body">	 -->
<!-- 		<div style="text-align: center; margin-bottom: 100px;"> -->
<!-- 	        <form> -->
<!-- 	            <div class="mb-2 row"> -->
<!-- 	                <label for="carType" class="col-sm-2 col-form-label" style="text-align: center;">검색 타입</label> -->
<!-- 	                <div class="col-sm-10"> -->
<!-- 	                    <select class="form-select form-select-sm" id="carType"> -->
<!-- 	                         <option selected>차종 선택</option> -->
<!-- 	                         <option value="sedan">Sedan</option> -->
<!-- 	                         <option value="suv">SUV</option> -->
<!-- 	                         <option value="hatchback">Hatchback</option> -->
<!-- 	                    </select> -->
<!-- 	                </div> -->
	<!--                 <label for="carType" class="col-sm-2 col-form-label" style="text-align: center;">검색순</label> -->
	<!--                 <div class="col-sm-4"> -->
	<!--                     <input type="text" class="form-control form-control-sm" id="searchText" placeholder="차량 검색"> -->
	<!--                 </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="mb-2 row"> -->
<!-- 	                <label for="searchText" class="col-sm-2 col-form-label" style="text-align: center;">차량 검색</label> -->
<!-- 	                <div class="col-sm-10"> -->
<!-- 	                    <input type="text" class="form-control form-control-sm" id="searchText" placeholder="차량 검색"> -->
<!-- 	                </div> -->
<!-- 	            </div> -->
<!-- 	            <div style="margin-top: 8px; text-align: center;"> -->
<!-- 	                <button type="submit" class="btn btn-primary" style="width: 100px;">검색</button> -->
<!-- 	            </div> -->
<!-- 	        </form> -->
<!--         </div> -->
<!--     </div> -->
<!-- 	</div> -->
    	
    	
    <!-- 검색창 -->
    	<div style="width: 100px; margin-left: 1195px;">
                <select class="form-select form-select-sm" aria-label="리뷰 정렬" id="options" onchange="optionChange(this)">
                    <option value="latest">최신순</option>
                    <option value="old">오래된순</option>
                    <option value="rating">별점순</option>
                </select>
        </div>
<!--     	<div style="width: 100px; margin-left: 1195px;"> -->
<!--                 <select class="form-select form-select-sm" aria-label="리뷰 정렬" id="options"> -->
<!--                     <option value="latest">최신순</option> -->
<!--                     <option value="old">오래된순</option> -->
<!--                     <option value="rating">별점순</option> -->
<!--                 </select> -->
<!--         </div> -->
    	<div class="row" style="margin-top: 10px;">
    		<c:forEach var="review" items="${reviewList }">
	        	<div class="col-md-3">
	        		<div class="card">
	        			
	                	<img src="./resources/main_images/rewiewCar1.png" class="card-img-top" alt="리뷰 이미지 1" width="300" height="300">
	                    <div class="card-body">
	                    	
	                    	<h5 class="card-title">
	                    		<c:forEach begin="1" end="${review.review_score }" varStatus="loop">
	                    		<i class="fa-solid fa-star" style="color: #FFE000;"></i>
	                    		</c:forEach>
	                    	</h5>
	                    	<h6 class="card-title">${review.car_img }</h6>
	                    	<p class="card-text">${review.review_content }</p>
	                    	<div class="card-footer">
								<small all class="text-body-secondary">${review.review_id } 고객님<i></i></small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

    <!-- 부트스트랩 자바스크립트 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>