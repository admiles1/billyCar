<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 내역 확인</title>
<style>
#resv-confirm {
    margin-top: 30px;
    background: #fff;
    margin-right: 30px;
    border: 1px solid #ccc;
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
    margin-top: 45px;
    text-align: center;
    table-layout: fixed;
    border-radius: 8px; /* 모서리 둥글게 처리 */
    overflow: hidden;
}
   
th, td {
    border: 1px solid #ccc;
    padding: 15px; /* 셀 간격 늘리기 */
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

tr:nth-child(even) {
    background-color: #f9f9f9; /* 번갈아가는 행 색상 */
}

tr:hover {
    background-color: #f5f5f5; /* 호버 효과 */
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

.reservNum {
    width: 12%;
}

.reservRegDate {
    width: 23%;
}

.reservPickupDate {
    width: 15%
}

.reservReturnDate {
    width: 15%;
}

.reservStatus {
    width: 15%;
}

.reservDetail {
    width: 15%;
}
   
.review {
    width: 15%;
}
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var previousPageLink = document.getElementById('previousPageLink');
    var nextPageLink = document.getElementById('nextPageLink');

    previousPageLink.addEventListener('click', function(event) {
        if (${pageNum} <= 1) {
            event.preventDefault();
            alert("더이상 페이지가 없습니다");
        }
    });

    nextPageLink.addEventListener('click', function(event) {
        if (${pageNum} >= ${pageInfo.maxPage}) {
            event.preventDefault();
            alert("더이상 페이지가 없습니다");
        }
    });
});

function showReview(value) {
    let review_id = document.querySelector("#reviewShow" + value);
    let reserv_idx = value;

    $.ajax({
        type: "GET",
        url: "reviewCondition",
        data: { reserv_idx: reserv_idx },
        dataType: "JSON",
        success: function(data) {
            let condition = String(data);
            if (condition == "true") {
                review_id.style.display = 'table-row';
            } else if (condition == "false") {
                alert("리뷰작성 기간이 아닙니다.");
            }
        }
    });
}

function closeReview(value) {
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

function check(idx) {
    let subject = document.getElementById("review_subject" + idx).value;
    let content = document.getElementById("review_content" + idx).value;
    let rating = document.getElementById("ratingValue" + idx).value;

    if (subject === "") {
        alert("리뷰 제목을 입력해주세요.");
        return false;
    }

    if (content === "") {
        alert("리뷰 내용을 입력해주세요.");
        return false;
    }

    if (rating === "0") {
        alert("별점을 선택해주세요.");
        return false;
    }

    return true;
}

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
    <c:set var="pageNum" value="1" />
    <c:if test="${not empty param.pageNum}">
        <c:set var="pageNum" value="${param.pageNum}" />
    </c:if>
    <table>
        <thead>
            <tr>
                <th class="reservNum">예약번호</th>
                <th class="reservRegDate">예약일</th>
                <th class="reservPickupDate">대여일</th>
                <th class="reservReturnDate">반납일</th>
                <th class="reservStatus">예약상태</th>
                <th class="reservDetail">예약상세</th>
                <th class="review">리뷰</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty reservList}">
                    <tr>
                        <td colspan="7">예약내역이 존재하지 않습니다</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="reserv" items="${reservList}">
                        <tr>
                            <td>${reserv.reserv_idx}</td>
                            <td>${fn:substringBefore(reserv.reserv_reg_date, 'T')} ${fn:substringAfter(reserv.reserv_reg_date, 'T')}</td>
                            <td>${fn:substringBefore(reserv.reserv_pickupdate, 'T')}</td>
                            <td>${fn:substringBefore(reserv.reserv_returndate, 'T')}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${reserv.reserv_status eq 0}">예약완료</c:when>
                                    <c:when test="${reserv.reserv_status eq 1}">이용중</c:when>
                                    <c:when test="${reserv.reserv_status eq 2}">이전예약</c:when>
                                </c:choose>
                            </td>
                            <td><a href="paymentDetail?idx=${reserv.reserv_idx}">상세보기</a></td>
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
                        <tr style="display: none;" id="reviewShow${reserv.reserv_idx}">
                            <td colspan="8">
                                <form action="reviewWrite" method="post" onsubmit="return check(${reserv.reserv_idx})">
                                    <label for="review_subject${reserv.reserv_idx}">리뷰 제목</label><br>
                                    <input type="text" class="form-control" name="review_subject" id="review_subject${reserv.reserv_idx}" width="200px" style="margin-top: 10px;" placeholder="리뷰 제목을 입력해주세요"><br>

                                    <label for="review_content${reserv.reserv_idx}">리뷰 내용</label><br>
                                    <textarea id="review_content${reserv.reserv_idx}" name="review_content" class="form-control" rows="4" cols="50" style="margin-top: 10px;" placeholder="리뷰 내용을 입력해주세요" maxlength="70"></textarea><br>

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
                    <li class="page-item ${pageNum == i ? 'active' : ''}">
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
