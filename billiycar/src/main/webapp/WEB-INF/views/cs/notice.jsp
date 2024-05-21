<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
	<title>공지사항</title>
	
	  <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- css -->
	<link rel ="stylesheet" href = "${pageContext.request.contextPath}/resources/css/notice.css">
	
</head>
  <body>
  
  	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
  	
  	<main class="container">
  	<!-- 제목 -->
  	<div class = "arti">
  	
  	<div class = "notice_title">
  		<em class = "cs_title_1">공지사항</em><br>
  		<em class = "cs_sub_title">빌리카에서 다양한 소식을 안내해 드립니다.</em>
  	</div>
  	
  	
  	<!-- 검색창 -->
<!--   	<div class = "searc"> -->
<!-- 	  	<form action=""> -->
<!-- 		  	<div class = "notice_se"> -->
<!-- 			  	<div class="group"> -->
<!-- 		  			<svg class="icon" aria-hidden="true" viewBox="0 0 24 24"> -->
<!-- 		  			<g> -->
<!--   					<path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"> -->
<!-- 	  				</path> -->
<!-- 	  				</g> -->
<!-- 	  				</svg> -->
<!-- 		  			<input placeholder="Search" type="search" class="input" name = "notice_search"> -->
<!-- 				</div> -->
<!-- 		  	</div> -->
<!-- 		 </form>  -->
<!-- 	 </div>	 -->
	 
	  <div class = "write_btn">
	  	<c:if test="${sessionScope.member_id eq 'admin'}">
		 	<a href = "noticeWrite"> 글쓰기 </a>
	  	</c:if>
	 </div>
	 
	 <!-- 게시글 -->
	<div class = "board">
	
		<c:set var = "pageNum" value = "1"/>
			<c:if test="${not empty param.pageNum}">
				<c:set var = "pageNum" value = "${param.pageNum}"/>
			</c:if>
	
  	<table class="table-fill">
		<thead>
			<tr>
				<th class="text-left" width = "5px">글 번호</th>
				<th class="text-left" width = "290px">제목</th>
				<th class="text-left" width = "40px">작성자</th>
				<th class="text-left" width = "70px">작성일</th>
			</tr>
		</thead>
		<tbody class="table-hover">
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<%-- 글번호 --%>
					<td class="text-left">
						<c:choose>
							<c:when test="${notice.board_important eq '1'}">
								<img src="${pageContext.request.contextPath}/resources/images/notice.png" style="width: 70px; height:30px;">
							</c:when>
							<c:otherwise>
								${notice.board_idx}
							</c:otherwise>
						</c:choose>
					</td>
					
					<%-- 글제목 --%>
					<td class="text-left"><a href = "noticeDetail?notice_idx=${notice.board_idx}&pageNum=${pageNum}">${notice.board_subject}</a></td>

					<%-- 작성자 --%>
					<td class="text-left">
						<c:if test="${notice.board_writer eq 'admin'}"> 관리자 </c:if> 
					</td>

					<%-- 작성일 --%>
					<c:set var="noticeDate" value="${fn:split(fn:split(notice.board_date, 'T')[0], '-')}" />
					<td>${noticeDate[1]}월${noticeDate[2]}일</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
 	<nav aria-label="Page navigation example">
		<div class = "paging">
	  		<ul class="pagination">
	    		<li class="page-item">
			    <a id="previousPageLink" class="page-link" href="notice?pageNum=${pageNum - 1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			    </a>
			</li>
			
			<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			    <li class="page-item">
			        <a class="page-link pageLink" href="notice?pageNum=${i}">${i}</a>
			    </li>
			</c:forEach>
			
			<li class="page-item">
			    <a id="nextPageLink" class="page-link" href="notice?pageNum=${pageNum + 1}" aria-label="Next">
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
</script>
</div>




</div> <!-- arti -->

</main>

    <!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
 </body>
</html>