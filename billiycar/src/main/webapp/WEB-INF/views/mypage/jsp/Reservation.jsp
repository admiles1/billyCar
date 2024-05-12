<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>현재 예약 내역</title>
</head>
<style>
   #resv-confirm {
   		margin-top: 30px;
   	 	background:#fff;
   	 	margin-right:30px;
		border:1px solid #ccc;
		border-radius: 8px;
	    padding: 30px;
		width: 100%;	
		height: 100%;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   }
   
    h2 {
        font-size: 32px;
        margin-bottom: 20px;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        border: 1px solid #ccc;
        margin-top: 50px;
        text-align: center;
    }
    
    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
        white-space: nowrap; /* 한 줄로 표시되도록 설정 */
    }
    
    th {
        background-color: #f2f2f2;
        text-align: center;
    }
</style>
<script type="text/javascript">

	if ("${message}" != null && "${message}" !== "") {
	    alert("${message}");
	}

	function showReview(value){
		console.log(value);
		let review_id = document.querySelector("#reviewShow" + value);
		review_id.style.display = 'table-row';
	}
	
	function closeReview(value){
		console.log(value);
		let review_id = document.querySelector("#reviewShow" + value);
		review_id.style.display = 'none';
	}
	
	function setRating(value, reservIdx) {
	    var ratingValueId = "ratingValue" + reservIdx;
	    document.getElementById(ratingValueId).value = value;
	    
	    var stars = document.querySelectorAll("#rating" + reservIdx + " span");
	    for (var i = 0; i < stars.length; i++) {
	        if (i < value) {
	            stars[i].innerHTML = '<i class="fa-solid fa-star" style="color: yellow;"></i>';
	        } else {
	            stars[i].innerHTML = '<i class="fa-regular fa-star"></i>';
	        }
	    }
	}

</script>
</head>
<body>

<div id="resv-confirm">
    <h2>예약내역 확인${message }</h2>
    <hr>
    <table border="1">
        <tr>
            <th>대여일</th>
            <th>반납일</th>
            <th>대여지역</th>
            <th>반납지역</th>
            <th>보험여부</th>
            <th>예약상태</th>
            <th>리뷰</th>
        </tr>
        
        	<c:forEach var="reserv" items="${reservList }">
	        	<tr>
		        	<td>${reserv.reserv_pickupdate }</td>
		            <td>${reserv.reserv_returndate }</td>
		            <td>${reserv.reserv_pickuplocation }</td>
		            <td>${reserv.reserv_returnlocation }</td>
		            <td>
		            	<c:choose>
		            		<c:when test="${reserv.reserv_insurance eq 1}">
		            			없음
		            		</c:when>
		            		<c:when test="${reserv.reserv_insurance eq 2}">
		            			일반자차
		            		</c:when>
		            		<c:when test="${reserv.reserv_insurance eq 3}">
		            			완전자차
		            		</c:when>
		            	</c:choose>
		            </td>
		            <td>
		            	<c:choose>
		            		<c:when test="${reserv.reserv_status eq 1}">
		            			O
		            		</c:when>
		            		<c:when test="${reserv.reserv_status eq 0}">
		            			X
		            		</c:when>
		            	</c:choose>
		            </td>
		            <td>
		            	<c:choose>
		            		<c:when test="${reserv.reserv_review_status eq 0}">
		            			<a onclick="showReview('${reserv.reserv_idx}')" class="btn btn-sm btn-danger">리뷰쓰기</a>
		            		</c:when>
		            		<c:otherwise>
		            			<a class="btn btn-sm btn-danger">리뷰완료</a>
		            		</c:otherwise>
		            	</c:choose>
		            </td>
		       		</tr>
			        <tr style="display: none;" id = "reviewShow${reserv.reserv_idx }">
			        	<td colspan="7">
			<!--         		<a onclick="showReview()" class="btn btn-sm btn-primary">작성완료</a> -->
			                <!-- 리뷰 작성 폼 요소들을 이곳에 추가 -->
			                <form action="reviewWrite" method="post">
			                	
							    
							    <label for="review">리뷰 제목</label><br>
							    <input type="text" class="form-control" name="review_subject" width="200px;" style="margin-top: 10px;" placeholder="리뷰 제목을 입력해주세요"><br>
			                	<label for="review">리뷰 내용</label><br>
			    				<textarea id="review" name="review_content" class="form-control" rows="4" cols="50" style="margin-top: 10px;" placeholder="리뷰 내용을 입력해주세요"></textarea><br>
			    				
			    				<div id="rating${reserv.reserv_idx }">
								    <span onclick="setRating(1, ${reserv.reserv_idx })"><i class="fa-regular fa-star"></i></span>
								    <span onclick="setRating(2, ${reserv.reserv_idx })"><i class="fa-regular fa-star"></i></span>
								    <span onclick="setRating(3, ${reserv.reserv_idx })"><i class="fa-regular fa-star"></i></span>
								    <span onclick="setRating(4, ${reserv.reserv_idx })"><i class="fa-regular fa-star"></i></span>
								    <span onclick="setRating(5, ${reserv.reserv_idx })"><i class="fa-regular fa-star"></i></span>
								    <br>
								    <p>별점을 선택해주세요</p>
								</div>
							    <input type="hidden" id="ratingValue${reserv.reserv_idx}" name="review_score" value="0">
							    <input type="hidden"  name="review_id" value="${reserv.member_id }">
							    <input type="hidden"  name="car_number" value="${reserv.car_number }">
							    <input type="hidden"  name="review_idx" value="${reserv.reserv_idx }">
							    
			                	<input type="submit" value="작성완료" class="btn btn-primary">
			                	<input type="button" value="닫기" class="btn btn-primary" onclick="closeReview('${reserv.reserv_idx}')">
			                </form>
			        	</td>
		        </tr>
        	</c:forEach>
            
        
    </table>
</div>
</body>
</html>