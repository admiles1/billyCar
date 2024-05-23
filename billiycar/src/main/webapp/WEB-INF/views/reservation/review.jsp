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
	var member_id = "${sessionScope.member_id}";
	
	$('.heart').on('click',function(){
		var heart = $(this).find('i');
		var review_idx = $(this).find('.review_idx').val();
		console.log(member_id);
		console.log(review_idx);
		
		if(member_id == ""){
			alert("로그인 후 좋아요 버튼을 눌러주세요!");
			location.href="login";
			return;
		}
		
		
		var isHeart = heart.hasClass('fa-regular');
//         if (heart.hasClass('fa-regular')) {
//         	heart.removeClass('fa-regular').addClass('fa-solid').css('color', 'red');
//         	count ++;
//         } else if(heart.hasClass('fa-solid')){
//         	heart.removeClass('fa-solid').addClass('fa-regular').css('color', 'grey');
//         	count --;
//         }
        
        $.ajax({
        	type : "GET",
        	url : "reviewHeart",
        	data : {
        		member_id : member_id,
        		isHeart : isHeart,
        		review_idx : review_idx
        	},
        	dataType : "JSON",
        	success : function(data){
        		console.log(data);
        		 if (isHeart) {
                     heart.removeClass('fa-regular').addClass('fa-solid').css('color', 'red');
                 } else {
                     heart.removeClass('fa-solid').addClass('fa-regular').css('color', 'grey');
                 }
        		
        	}
        });
        
    });
	
	
    $('#options').on('change', function() {
        let pageNum = 1;
        let option = $('#options').val();
		console.log(option);
        
        $.ajax({
            type: 'GET',
            url: 'reviewOption',
            dataType: 'JSON',
            data: { option: option, pageNum: pageNum },
            success: function(data) {
                let pageInfo = data.pageInfo;
                updateReviewList(data.reviewList);
                updatePageInfo(pageInfo, pageNum, option);
                
                $('#options').val(option);
            }
        });
    });

    function updateReviewList(reviews) {
        var html = '';
        reviews.forEach(function(review) {
        	html += '<div class="col-md-3" style="margin-top: 20px;">' +
				            '<div class="card" style="position: relative;">' +
				            '<div style="position: absolute; top: 10px; left: 10px; color: grey;" class="heart">' + 
				            '<input type="hidden" class="review_idx" value="' + review.review_idx + '">';
							if (review.member_id != null && review.member_id === member_id) {
							    html += '<i class="fa-solid fa-heart" style="color: red;"></i>';
							} else {
							    html += '<i class="fa-regular fa-heart" style="color: gray;"></i>';
							}
							html += '</div>' +
							
							
		                	
                            '<img src="request.getContextPath()/resources/upload/' + review.car_img + 'width="306" height="300">' +
                            '<hr>' +
                            '<div class="card-body">' +
                                '<h5 class="card-title">';
	            for (var i = 0; i < review.review_score; i++) {
	                html += '<i class="fa-solid fa-star" style="color: #FFE000;"></i>';
	            }
	            html +=         '</h5>' +
                            '<h5 class="card-title" style="height: 20px; margin-top: 20px;">제목</h5>' + 
                            '<p>' + review.review_subject + '</p>' + 
                            '<h5 class="card-text">내용</h5>' + 
                            '<p style="height: 80px;">' + review.review_content + '</p>' +
                            '<div class="card-footer">' +
                                '<small class="text-body-secondary">' + review.review_id + ' 고객님</small>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>';
        });
        $('.row').html(html);  
    }

    function updatePageInfo(pageInfo, pageNum, option) {

        var html = '';
        // 이전 버튼
        html += '<input type="button" value="이전" onclick="location.href=\'review?pageNum=' + (pageNum - 1) + '&option=' + option + '\'"';
        if (pageNum == 1) {
            html += ' disabled';
        }
        html += '>';

        // 페이지 번호 링크
        for (var i = pageInfo.startPage; i <= pageInfo.endPage; i++) {
            if (i == pageNum) {
                html += ' ' + i + ' ';
            } else {
                html += ' <a href="review?pageNum=' + i + '&option=' + option + '">' + i + '</a> ';
            }
        }

        // 다음 버튼
        html += '<input type="button" value="다음" onclick="location.href=\'review?pageNum=' + (pageNum + 1) + '&option=' + option + '\'"';
        if (pageNum == pageInfo.maxPage) {
            html += ' disabled';
        }
        html += '>';

        // 결과를 페이지에 추가
        $('.pageList').html(html);
    }
    
});

</script>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	
	<div class="container">
		<!-- ? -->
		<c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum }"/>
		<c:set var="option" value="${empty param.option ? 1 : param.option }"/>
	
    	<h1 class="subject mt-5 mb-3" style="text-align: center; margin-bottom: 50px;">리뷰</h1>
    	
    	
    <!-- 검색창 -->
    	<div style="width: 100px; margin-left: 1195px;">
                <select class="form-select form-select-sm" aria-label="리뷰 정렬" id="options">
				    <option value="latest" <c:if test="${param.option == 'latest'}">selected</c:if>>최신순</option>
				    <option value="old" <c:if test="${param.option == 'old'}">selected</c:if>>오래된순</option>
				    <option value="rating" <c:if test="${param.option == 'rating'}">selected</c:if>>별점순</option>
				</select>
        </div>
    	<div class="row">
    		<c:forEach var="review" items="${reviewList }">
	        	<div class="col-md-3" style="margin-top: 20px;">
	        		<div class="card" style="position: relative;">
	        			<div style="position: absolute; top: 10px; left: 10px; color: grey;" class="heart">
	        				<input type="hidden" class="review_idx" value="${review.review_idx }">
	        					<c:choose>
	        						<c:when test="${not empty review.member_id && review.member_id eq member_id }">
	        							<i class="fa-solid fa-heart" style="color: red;"></i>
	        						</c:when>
	        						<c:otherwise>
	        							<i class="fa-regular fa-heart" style="color: gray;"></i>
	        						</c:otherwise>
	        					</c:choose>
	        			</div>
	                	<img src="<%= request.getContextPath() %>/resources/upload/${review.car_img }" width="306" height="300">
	                    <div class="card-body">
	                    	<h5 class="card-title">
	                    		<c:forEach begin="1" end="${review.review_score }" varStatus="loop">
	                    		<i class="fa-solid fa-star" style="color: #FFE000;"></i>
	                    		</c:forEach>
	                    	</h5>
	                    	<h5 class="card-title" style="height: 20px; margin-top: 20px;">제목</h5>
	                    	<p>${review.review_subject }</p>
	                    	<h5 class="card-text">내용</h5>
	                    	<p style="height: 60px;">${review.review_content }</p>
	                    	<div class="card-footer">
								<small all class="text-body-secondary">${review.review_id } 고객님<i></i></small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
		
		<div class="pageList" style="text-align: center; margin-top: 20px;">
			
			<input type="button" value="이전" onclick="location.href='review?pageNum=${pageNum -1}&option=${option }'" 
				<c:if test="${pageNum eq 1 }">disabled</c:if>
			>
			
			<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
				<c:choose>
					<c:when test="${i eq pageNum }">
						${i}
					</c:when>
					<c:otherwise>
						<a href="review?pageNum=${i}&option=${option }">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>		
			<input type="button" value="다음" onclick="location.href='review?pageNum=${pageNum +1}&option=${option }'"
			<c:if test="${pageNum eq pageInfo.maxPage }">disabled</c:if>
			>
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