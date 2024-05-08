<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
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
  	
  	<main class="container">
  	<!-- 제목 -->
  	<div class = "arti">
  	
  	<div class = "notice_title">
  		<em class = "cs_title_1">문의내역</em><br>
  		<em class = "cs_sub_title">빌리카에서 다양한 소식을 안내해 드립니다.</em>
  	</div>
  	
  	 <div class ="btn_qna">
	 	<input type = "button" value = "문의하기" onclick = "location.href ='qna_q'">
	 </div>
  	
  	<!-- pageNum 변수 선언 -->
	<c:set var = "pageNum" value = "1"/>
			<c:if test="${not empty param.pageNum}">
				<c:set var = "pageNum" value = "${param.pageNum}"/>
			</c:if>
	 
	 <!-- 게시글 -->
	<div class = "board">
  	<table class="table-fill">
		<thead>
			<tr>
				<th class="text-left" width = "10px">글 번호</th>
				<th class="text-left" width = "190px">제목</th>
				<th class="text-left" width = "40px">질문 유형</th>
				<th class="text-left" width = "80px">작성일</th>
				<th class="text-left" width = "30px">답변 상태</th>
			</tr>
		</thead>
		<tbody class="table-hover">
		
		<c:choose>
			<%-- 문의 내역이 존재하지 않을 경우 --%>
			<c:when test="${empty qnaList}">
				<tr>
					<td colspan = "5"> 문의내역이 존재하지 않습니다 </td>
				</tr>
			</c:when>
			
			
			<%-- 문의 내역이 존재할 경우 --%>
			<c:otherwise>
				<c:forEach var="qna" items="${qnaList}">
					<c:set var="i" value="${i+1}"></c:set>
					<tr>
						<%-- 답변 번호 --%>
						<td class="text-left">${i}</td>

						<%-- 제목 --%>
						<td class="text-left"><a href = "qnaAnswerDetail?qna_idx=${qna.qna_idx}&pageNum=${pageNum}">${qna.qna_subject}</a></td>
						
						<%-- 카테고리 --%>
						<td class="text-left">
							<c:choose>
								<c:when test="${qna.qna_category eq 'reservation'}"> 예약 문의 </c:when>
								<c:when test="${qna.qna_category eq 'function'}">부름 문의</c:when>
								<c:when test="${qna.qna_category eq 'price'}">가격 문의</c:when>
								<c:when test="${qna.qna_category eq 'return'}">반납 문의</c:when>
								<c:otherwise>기타</c:otherwise>
							</c:choose>	
						</td>

						<%-- 시간 --%>
						<td class="text-left"><fmt:formatDate value="${qna.qna_date}" pattern = "yy-MM-dd HH시 mm분"/></td>
						
						<td class="text-left"> 
							<%-- 답변상태 --%>
							<c:choose>
								<c:when test="${qna.qna_status eq 0}">
									답변 대기
								</c:when>
								<c:otherwise>
									답변 완료
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				
				
			</c:otherwise>
		</c:choose>
		
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

</main>
    <!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
  </body>
</html>