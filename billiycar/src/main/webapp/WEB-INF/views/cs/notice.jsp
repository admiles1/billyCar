<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	 	<a href = "noticeWrite"> 글쓰기 </a>
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
				<th class="text-left" width = "10px">글 번호</th>
				<th class="text-left" width = "200px">제목</th>
				<th class="text-left" width = "70px">작성자</th>
				<th class="text-left" width = "50px">작성일</th>
				<th class="text-left" width = "30px">조회수</th>
			</tr>
		</thead>
		<tbody class="table-hover">
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td class="text-left">${notice.board_idx}</td>
					<td class="text-left"><a href = "noticeDetail?notice_idx=${notice.board_idx}&pageNum=${pageNum}">${notice.board_subject}</a></td>
					<td class="text-left">${notice.board_writer}</td>
					<td class="text-left"><fmt:formatDate value="${notice.board_date}" pattern = "yy-MM-dd HH:mm"/></td>
					<td class="text-left">${notice.board_readcount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav aria-label="Page navigation example">
		<div class = "paging">
	  		<ul class="pagination">
	    		<li class="page-item">
	    		
	      			<a class="page-link" href="#" aria-label="Previous">
	        			<span aria-hidden="true">&laquo;</span>
	     			 </a>
	   			 </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			     	 <a class="page-link" href="#" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			     	 </a>
			     	 
	    		</li>
	  		</ul>
  		</div>
	</nav>
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