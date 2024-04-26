<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <head>
    <title>문의내역</title>
     <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
	<!-- css -->
	<link rel ="stylesheet" href = "${pageContext.request.contextPath}/resources/css/Q&A_list.css">
	<link rel ="stylesheet" href = "css/font.css">
	
	<!-- 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  </head>
  <body>
  
  	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
  	
  	
  	<!-- 제목 -->
  	<div class = "arti">
  	
  	<div class = "notice_title">
  		<em class = "cs_title_1">문의내역</em><br>
  		<em class = "cs_sub_title">빌리카에서 다양한 소식을 안내해 드립니다.</em>
  	</div>
  	
  	 <div class ="btn_qna">
			 	<input type = "button" value = "문의하기">
	 </div>
  	
  	<!-- 검색창 -->
  	<div class = "searc">
	  	<form action="">
		  	<div class = "notice_se">
			  	<div class="group">
		  			<svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
		  			<input placeholder="Search" type="search" class="input" name = "notice_search">
				</div>
		  	</div>
		 </form> 
	 </div>	
	 
	 <!-- 게시글 -->
	<div class = "board">
  	<table class="table-fill">
		<thead>
			<tr>
				<th class="text-left" width = "10px">글 번호</th>
				<th class="text-left" width = "200px">제목</th>
				<th class="text-left" width = "70px">작성자</th>
				<th class="text-left" width = "50px">작성일</th>
				<th class="text-left" width = "30px">답변 상태</th>
			</tr>
		</thead>
		<tbody class="table-hover">
			<tr>
				<td class="text-left">1</td>
				<td class="text-left"><a href = "#">제목1</a></td>
				<td class="text-left">홍길동</td>
				<td class="text-left">24-12-23</td>
				<td class="text-left">답변 완료</td>
			</tr>
			<tr>
				<td class="text-left">February</td>
				<td class="text-left">February</td>
				<td class="text-left">February</td>
				<td class="text-left">24-12-23</td>
				<td class="text-left">24-12-23</td>
			</tr>
			<tr>
				<td class="text-left">March</td>
				<td class="text-left">March</td>
				<td class="text-left">March</td>
				<td class="text-left">24-12-23</td>
				<td class="text-left">24-12-23</td>
			</tr>
			<tr>
				<td class="text-left">April</td>
				<td class="text-left">April</td>
				<td class="text-left">April</td>
				<td class="text-left">$ 56,000.00</td>
				<td class="text-left">$ 56,000.00</td>
			</tr>
			<tr>
				<td class="text-left">May</td>
				<td class="text-left">May</td>
				<td class="text-left">May</td>
				<td class="text-left">$ 98,000.00</td>
				<td class="text-left">$ 98,000.00</td>
			</tr>
		</tbody>
	</table>
	
	<!-- 페이징 -->
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

    <!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
  </body>
</html>