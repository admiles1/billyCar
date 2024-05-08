<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대 1문의 조회</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	
	 <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- CSS -->
	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/Q&A_A.css">
	
	<!-- 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	
	<!-- 화살표 이미지 -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	
	<style type="text/css">
		 textarea::placeholder {
		 	color : #00aaff;
		 }
	</style>
	
</head>
<body>
	
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
	
	<main class="container">
	<div class = "cs_act">
	
		<!-- 타이틀 -->
		<div class = "cs_title">
  			<em class = "cs_title_1">문의 내역</em><br>
  			<em class = "cs_sub_title">궁금한 점을 해결해 드립니다 :)</em>
  		</div>
 
 		<div class = "cs_write">
 			<div class = "cus_info">
 				작성자 <input type = "text" value="${qna.qna_writer}" name="qna_writer" readonly="readonly">
 				문의 주제 
 				<select name="qna_category" id="qna_category" style = "margin-left : 15px" disabled="disabled">
 					<option value =""> 문의 주제 </option>
 					<option value ="reservation" <c:if test="${qna.qna_category eq 'reservation'}">selected</c:if>> 예약 </option>
 					<option value ="function" <c:if test="${qna.qna_category eq 'function'}">selected</c:if>> 부름 </option>
 					<option value ="price" <c:if test="${qna.qna_category eq 'price'}">selected</c:if>> 가격 </option>
 					<option value ="return" <c:if test="${qna.qna_category eq 'return'}">selected</c:if>> 반납 </option>
 					<option value ="etc"> 기타 </option>
 				</select>
 			</div>
 			
 			<div class = "title_wr">
 				제목 <input type = "text" value="${qna.qna_subject}" style = "margin-left : 15px" name ="qna_subject" readonly="readonly">
 			</div>
 			
 			<div class = "content_wr">
 				질문 <textarea style = "resize : none" readonly="readonly">${qna.qna_content}</textarea>
 				
 				<div style="margin-left:50px;">
	 				파일
	 				<c:if test="${not empty qna.qna_file}">
							<c:set var="original_fileName" value="${fn:substringAfter(qna.qna_file, '_')}"/>
							${original_fileName}
							<%-- 다운로드 --%>
							<%-- 다운로드 속성값에 파일명 지정 시 그 이름으로 다운됨 --%>
							<a href="${pageContext.request.contextPath}/resources/upload/${qna.qna_file}" download="${original_fileName}">
								<input type="button" value="다운로드" id="downBtn">
							</a>
					</c:if>
				</div>
 			</div>
 			
 			
 			<div class = "content_wr" style="margin-top:30px;">
 				<span class="material-symbols-outlined">
					subdirectory_arrow_right
				</span>
				
				
				
				<%-- 답변 상태에 따라 답변 보여주기 --%>
				<c:choose>
					<c:when test="${qna.qna_status eq 1}"> <%-- 답변 완료 --%>
						 답변 <textarea readonly="readonly" style = "resize : none">${qna.admin_content}</textarea>
					</c:when>
					<c:otherwise> <%-- 미답변 --%>
						 답변 <textarea placeholder="답변 대기 중입니다. 조금만 기다려 주세요." readonly="readonly" style = "resize : none;"></textarea>
					</c:otherwise>
				</c:choose>
				
			</div>
 		</div>
 	 		<div class = "btn_wr"><a href = "qna" > 돌아가기 </a></div>
	</div>
	 </main>
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>