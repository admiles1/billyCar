<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 자세히 보기</title>

<!-- css -->
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/notice_detail.css">
</head>
<body>
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
  	
  	<div class = "notice_de_main">
	
		<!-- 타이틀 -->
		<div class = "notice_d_t_div">
  			<em class = "notice_d_title">공지사항</em><br>
  		</div>
  		
  		<div class = "detail_view">
  			<div class ="view_tit">
  				<h3> ${notice.board_subject} </h3>
  			</div>
  			
  			<div class = "view_info">
				<em class="em"><b>작성자</b></em>
				<em class="em">${notice.board_writer}</em>
				<em class="em"><b>날짜</b></em>
				<c:set var="noticeDate" value="${fn:split(fn:split(notice.board_date, 'T')[0], '-')}" />
				<em class="em">${noticeDate[1]}월 ${noticeDate[2]}일</em>
  			</div>
  			
  			<div class = "view_cont">
  				<p>
  					${notice.board_content}
				</p>
  			</div>
  		</div>
  		
  		<div class = "btn-view">
  		<c:choose>
  			<c:when test="${sessionScope.member_id eq 'admin'}">
	  			<a href = "noticeModify?notice_idx=${notice.board_idx}&pageNum=${param.pageNum}&important=${notice.board_important}">수정</a>
	  			<input type = "button" value="삭제" onclick="confirmDelete()" />
	  			<a href = "notice">목록</a>
  			</c:when>
  			<c:otherwise>
  				<a href = "notice" style="margin-left:50px"> 목록 </a>
  			</c:otherwise>
  		</c:choose>
  		</div>
  		
  	</div>
  	
  	<script type="text/javascript">
		function confirmDelete() {
			if(confirm("게시물을 삭제하시겠습니까?")) {
				location.href = "noticeDelete?notice_idx=${notice.board_idx}&pageNum=${param.pageNum}";
			}
		}
	</script>
  	
  	
  	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>