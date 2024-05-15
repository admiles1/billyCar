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
$(function(){
	
	$('#options').on('change', function() {
        let option = $('#options').val();
        console.log(option);

        $.ajax({
            type: 'GET',
            url: 'reviewOption',
            dataType: 'json',
            data: { option: option, pageNum: pageNum },
            success: function(data) {
            	console.log(data);
                updateReviewList(data.reviewList);
                updatePageInfo(data.pageInfo);
            },
            error: function(xhr, status, error) {
                console.error('Error fetching data:', status, error);
            }
        });
    });

    function updateReviewList(reviews) {
        var html = '';
        reviews.forEach(function(review) {
            html += '<div class="col-md-3">' +
                        '<div class="card">' +
                            '<img src="./resources/main_images/rewiewCar1.png" class="card-img-top" alt="리뷰 이미지 1" width="300" height="300">' +
                            '<div class="card-body">' +
                                '<h5 class="card-title">';
            for (var i = 0; i < review.review_score; i++) {
                html += '<i class="fa-solid fa-star" style="color: #FFE000;"></i>';
            }
            html +=         '</h5>' +
                            '<h6 class="card-title">' + review.car_img + '</h6>' +
                            '<p class="card-text">' + review.review_content + '</p>' +
                            '<div class="card-footer">' +
                                '<small class="text-body-secondary">' + review.review_id + ' 고객님</small>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>';
        });
        $('.row').html(html);  
    }
    function updatePageInfo(pageInfos) {
    	var html = '';
    	pageInfos.forEach(function(pageInfo){
    		html += '<input type="button" value="이전" onclick="location.href='review?pageNum=pageInfo.pageNum'"'
    	});
    	$('#pageList').html(html);
    }
});

</script>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
	<c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum }"/>
    	<h1 class="subject mt-5 mb-3" style="text-align: center; margin-bottom: 50px;">리뷰</h1>
    	
    	
    <!-- 검색창 -->
    	<div style="width: 100px; margin-left: 1195px;">
                <select class="form-select form-select-sm" aria-label="리뷰 정렬" id="options">
                    <option value="latest">최신순</option>
                    <option value="old">오래된순</option>
                    <option value="rating">별점순</option>
                </select>
        </div>
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
			<section id = "pageList" style="text-align: center; margin-top: 20px;">
			
			<input type="button" value="이전" onclick="location.href='review?pageNum=${pageNum -1}'" 
				<c:if test="${pageNum eq 1 }">disabled</c:if>
			>
			
			<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
				<c:choose>
					<c:when test="${i eq pageNum }">
						${i}
					</c:when>
					<c:otherwise>
						<a href="review?pageNum=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>		
			<input type="button" value="다음" onclick="location.href='review?pageNum=${pageNum +1}'"
			<c:if test="${pageNum eq pageInfo.maxPage }">disabled</c:if>
			>
			</section>
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