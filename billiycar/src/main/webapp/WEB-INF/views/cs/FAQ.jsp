<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<meta charset="UTF-8">
  <head>
   <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FAQ</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	
	 <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->

	<!-- CSS -->
	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/FAQ.css">
	
	<!-- 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
<main class="container">
	<div class = "faq_arti">
	
		<c:set var = "pageNum" value = "1"/>
			<c:if test="${not empty param.pageNum}">
				<c:set var = "pageNum" value = "${param.pageNum}"/>
			</c:if>
	
		<!-- 타이틀 -->
		<div class = "faq_title">
  			<em class = "faq_title_1">FAQ</em><br>
  			<em class = "faq_sub_title">빌리카에서 궁금한 내용들을 모두 알려 드립니다.</em>
  		</div>
  		
  		
  		<!-- 카테고리 -->
  		<div id = "btn_tag">
	  		<form>
	  			<span id = "tag1" style="padding:1px 2px 3px 4px;">
					<button class="white_btn" onclick="location.href='faq'">전체</button>
	  			</span>
	  			<span id = "tag2" style="padding:1px 2px 3px 4px;">
					<button class="white_btn" name="category" value="accident">고장 및 사고</button>
				</span>	
				<span id = "tag3" style="padding:1px 2px 3px 4px;">
					<button class="white_btn" name="category" value="price">요금 및 결제</button>
				</span>	
				<span id = "tag4" style="padding:1px 2px 3px 4px;">
					<button class="white_btn" name="category" value="reservation">예약</button>
				</span>	
				<span id = "tag5" style="padding:1px 2px 3px 4px;">
					<button class="white_btn" name="category" value="etc">기타</button>
				</span>	
			</form>
  		</div>
  		
  		<!-- dribbble -->
		<a class="dribbble" href="https://dribbble.com/shots/7441241-Button-Hover-Effects" target="_blank"><img src="https://cdn.dribbble.com/assets/dribbble-ball-mark-2bd45f09c2fb58dbbfb44766d5d1d07c5a12972d602ef8b32204d28fa3dda554.svg" alt=""></a>
		
		<!-- 검색창 -->
<!-- 		<div class = "searc"> -->
<!-- 		  	<form action=""> -->
<!-- 			  	<div class = "faq_se"> -->
<!-- 				  	<div class="group"> -->
<!-- 			  			<svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg> -->
<!-- 			  			<input placeholder="Search" type="search" class="input" name = "faq_search"> -->
<!-- 					</div> -->
<!-- 			  	</div> -->
<!-- 			 </form>  -->
<!-- 		 </div>	 -->
		
		
		<!-- 자주묻는질문들 -->
	<div class="container-fluid">
	    <div class="panel-group" id="accParent" role="tablist">
	        <c:forEach var="faq" items="${faqList}" varStatus="loop">
	            <!-- 첫번째 질문 -->
	            <div class="panel panel-default">
	                <div class="panel-heading" role="tab">
	                    <a role="button" data-toggle="collapse" data-parent="#accParent" href="#accEx${loop.index}" aria-controls="accEx${loop.index}">
	                        ${faq.faq_subject}
	                    </a>
	                </div>
	                <div id="accEx${loop.index}" class="panel-collapse collapse" role="tabpanel">
	                    <div class="panel-body">
	                        ${faq.faq_content} 
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>

      </div> <!-- id=accParent -->

		<%--페이징 --%>
	 	<nav aria-label="Page navigation example">
		<div class = "paging">
	  		<ul class="pagination">
	    		<li class="page-item">
			    <a id="previousPageLink" class="page-link" href="faq?pageNum=${pageNum - 1}<c:if test="${not empty param.category}">&category=${param.category}</c:if>" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			    </a>
			</li>
			
			<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			    <li class="page-item">
			        <a class="page-link pageLink" href="faq?pageNum=${i}<c:if test="${not empty param.category}">&category=${param.category}</c:if>">${i}</a>
			    </li>
			</c:forEach>
			
			<li class="page-item">
			    <a id="nextPageLink" class="page-link" href="faq?pageNum=${pageNum + 1}<c:if test="${not empty param.category}">&category=${param.category}</c:if>" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			    </a>
			</li>

	  		</ul>
  		</div>
	</nav> 
	
<script>
    // JavaScript를 사용하여 페이지 링크의 클릭 이벤트를 관리합니다.
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
    

 // 지점명 불러오기
	/*
	$(function() {
		let urlParams = new URL(location.href).searchParams;
		let category = urlParams.get('category');
		console.log(category);
		$.ajax({
			type: "GET",
			url: "getTheater",
			success: function(result) {
				for(let theater of result) {
					if(theater_id != 0 && theater.theater_id == theater_id) {
	                    $("#theater_id").append("<option value='" + theater.theater_id + "' selected>" + theater.theater_name + "</option>");
	                } else {
	                    $("#theater_id").append("<option value='" + theater.theater_id + "'>" + theater.theater_name + "</option>");
	                }
				}
			},
			error: function(request,status,error) {
				alert("다시 시도해 주세요");
			}
			
		});
	});
	
*/

</script>

	<div class = "faq_cs">
		<em> 상담원 1:1 문의 </em>
		<div class = "faq_cs_account">
			<span class = "faq_cs_1">
				<p class = "faq_cs_account1"> 빌리카 상담 운영시간 </p>
				<p class = "faq_cs_account2">9:00 ~ 17:00 (주말 및 공휴일 휴무)<br> *사고 및 긴급 출동 : 24시간 가능</em>
			</span>
			
		<div class = "faq_cs1_1">
			<input type = "button" class = "cs_btn" value = "1:1 상담 신청 바로가기" onclick = "location.href = 'qna_q'">
		</div>
		<hr class="hr-2">
		<em class = "faq_tell"> 전화상담 : 3333-3333</em>
		</div>
	</div>
	
		</main>
	<!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>