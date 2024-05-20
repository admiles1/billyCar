<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    
     .pagination-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .pagination {
        display: flex;
        list-style: none;
        padding: 0;
    }

    .pagination .page-item {
        margin: 0 5px;
    }

    .pagination .page-link {
        display: block;
        padding: 10px 15px;
        color: #007bff;
        text-decoration: none;
        background-color: #fff;
        border: 1px solid #dee2e6;
        border-radius: 5px;
    }

    .pagination .page-link:hover {
        background-color: #e9ecef;
    }

    .pagination .page-item.disabled .page-link {
        pointer-events: none;
        color: #6c757d;
        background-color: #fff;
        border-color: #dee2e6;
    }
    
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var previousPageLink = document.getElementById('previousPageLink');
    var nextPageLink = document.getElementById('nextPageLink');

    // pageNum이 1 이하일 경우 이전 페이지 링크를 비활성화합니다.
    if (${pageNum le 1}) {
        previousPageLink.addEventListener('click', function(event) {
            event.preventDefault(); // 링크 클릭을 막음
            alert("더이상 페이지가 없습니다");
        });
    }

    // endPage가 maxPage보다 크거나 pageNum + 1이 maxPage보다 클 경우 다음 페이지 링크를 비활성화합니다.
    if (${endPage gt pageInfo.maxPage} || ${pageNum + 1 gt pageInfo.maxPage}) {
        nextPageLink.addEventListener('click', function(event) {
            event.preventDefault(); // 링크 클릭을 막음
            alert("더이상 페이지가 없습니다");
        });
    }
});

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
            stars[i].innerHTML = '<i class="fa-solid fa-star" style="color: #FFE000;"></i>';
        } else {
            stars[i].innerHTML = '<i class="fa-regular fa-star"></i>';
        }
    }
}

function check(){
	let subject = document.getElementById("review_subject").value;
	let content = document.getElementById("review_content").value;
	
	if(subject == ""){
		alert("리뷰 제목을 입력해주세요.");
		return false;
	}
	
	if(content == ""){
		alert("리뷰 내용을 입력해주세요.");
		return false;
	}
	
	return true;
}



// document.addEventListener('DOMContentLoaded', function() {
//     var previousPageLink = document.getElementById('previousPageLink');
//     var nextPageLink = document.getElementById('nextPageLink');

//     // pageNum이 1 이하일 경우 이전 페이지 링크를 비활성화합니다.
//     if (${pageNum le 1}) {
//         previousPageLink.addEventListener('click', function(event) {
//             event.preventDefault(); // 링크 클릭을 막음
//             alert("더이상 페이지가 없습니다");
//         });
//     }

//     // endPage가 maxPage보다 크거나 pageNum + 1이 maxPage보다 클 경우 다음 페이지 링크를 비활성화합니다.
//     if (${endPage gt pageInfo.maxPage} || ${pageNum + 1 gt pageInfo.maxPage}) {
//         nextPageLink.addEventListener('click', function(event) {
//             event.preventDefault(); // 링크 클릭을 막음
//             alert("더이상 페이지가 없습니다");
//         });
//     }
// });

window.onload = function() {
    let message = "${message}";
    if (message) {
        alert(message);
    }
};
	
</script>
</head>
<body>

<div id="resv-confirm">
    <h2>예약내역 확인</h2>
    <hr>
    <c:set var="pageNum" value="1"/>
    <c:if test="${not empty param.pageNum}">
        <c:set var="pageNum" value="${param.pageNum}"/>
    </c:if>
    <table border="1">
    	<thead>
	        <tr>
	        	<th>예약번호</th>
	            <th>예약일</th>
	            <th>대여일</th>
	            <th>반납일</th>
	            <th>예약상태</th>
	            <th>예약상세</th>
	            <th>리뷰</th>
	        </tr>
        </thead>
        <tbody>
        	 <c:choose>
                <%-- 문의 내역이 존재하지 않을 경우 --%>
                <c:when test="${empty reservList}">
                    <tr>
                        <td colspan="7">예약내역이 존재하지 않습니다</td>
                    </tr>
                </c:when>
                <c:otherwise>
		        	<c:forEach var="reserv" items="${reservList}">
			        	<c:set var="i" value="${i+1}"></c:set>
			        	<tr>
			        		<td>${i}</td>
			        		<td>${reserv.reserv_reg_date}</td>
				        	<td>${reserv.reserv_pickupdate }</td>
				            <td>${reserv.reserv_returndate }</td>
				            <td>
				            	<c:choose>
				            		<c:when test="${reserv.reserv_status eq 1}">
				            			예약완료
				            		</c:when>
				            		<c:when test="${reserv.reserv_status eq 0}">
				            			예약취소
				            		</c:when>
				            	</c:choose>
				            </td>
				             <td>
				            	<c:choose>
				            		<c:when test="${reserv.reserv_status eq 1}">
				            			<a href="paymentDetail?idx=${reserv.reserv_idx}">상세보기</a>
				            		</c:when>
				            		<c:otherwise>
				            			-
				            		</c:otherwise>
				            	</c:choose>
				            </td>
				             <td>
				            <c:choose>
				            	<c:when test="${reserv.reserv_review_status eq 0}">
				            		<a onclick="showReview('${reserv.reserv_idx}')" class="btn btn-sm btn-danger">리뷰쓰기</a>
				            	</c:when>
				            	<c:otherwise><a class="btn btn-sm btn-danger">리뷰완료</a></c:otherwise>
				            </c:choose>
				        </td>
			        </tr>
			        <tr style="display: none;" id="reviewShow${reserv.reserv_idx}">
				        <td colspan="8">
					        <form action="reviewWrite" method="post" onsubmit="return check()">
							    <label for="review_subject">리뷰 제목</label><br>
							    <input type="text" class="form-control" name="review_subject" id="review_subject${reserv.reserv_idx}" width="200px" style="margin-top: 10px;" placeholder="리뷰 제목을 입력해주세요"><br>
							    <label for="review_content${reserv.reserv_idx}">리뷰 내용</label><br>
							    <textarea id="review_content" name="review_content" class="form-control" rows="4" cols="50" style="margin-top: 10px;" placeholder="리뷰 내용을 입력해주세요"></textarea><br>
							    <div id="rating${reserv.reserv_idx}">
								    <span onclick="setRating(1, ${reserv.reserv_idx})"><i class="fa-regular fa-star"></i></span>
								    <span onclick="setRating(2, ${reserv.reserv_idx})"><i class="fa-regular fa-star"></i></span>
								    <span onclick="setRating(3, ${reserv.reserv_idx})"><i class="fa-regular fa-star"></i></span>
								    <span onclick="setRating(4, ${reserv.reserv_idx})"><i class="fa-regular fa-star"></i></span>
								    <span onclick="setRating(5, ${reserv.reserv_idx})"><i class="fa-regular fa-star"></i></span>
								    <br>
								    <p>별점을 선택해주세요</p>
							    </div>
							    <input type="hidden" id="ratingValue${reserv.reserv_idx}" name="review_score" value="0">
							    <input type="hidden" name="review_id" value="${reserv.member_id}">
							    <input type="hidden" name="car_number" value="${reserv.car_number}">
							    <input type="hidden" name="review_idx" value="${reserv.reserv_idx}">
							    <input type="submit" value="작성완료" class="btn btn-primary">
							    <input type="button" value="닫기" class="btn btn-primary" onclick="closeReview('${reserv.reserv_idx}')">
						    </form>
					    </td>
				        	</tr>
		        	</c:forEach>
        		</c:otherwise>
        	</c:choose>
       	</tbody>
    </table>
    <nav class="pagination-container" aria-label="Page navigation example">
        <div class="paging">
            <ul class="pagination">
                <li class="page-item">
                    <a id="previousPageLink" class="page-link" href="resvConfirm?pageNum=${pageNum - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                    <li class="page-item">
                        <a class="page-link pageLink" href="resvConfirm?pageNum=${i}">${i}</a>
                    </li>
                </c:forEach>

                <li class="page-item">
                    <a id="nextPageLink" class="page-link" href="resvConfirm?pageNum=${pageNum + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>
</body>
</html>