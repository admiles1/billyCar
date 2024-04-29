<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 				이메일 <input type = "text" >
 				문의 주제 
 				<select id="" name="">
 					<option value = ""> 문의 주제 </option>
 					<option value = ""> 예약 변경 및 취소 </option>
 					<option value = ""> 운전자 </option>
 				</select>
 			</div>
 			
 			<div class = "title_wr">
 				제목 <input type = "text" placeholder="제목을 입력하세요">
 			</div>
 			
 			<div class = "content_wr">
 				질문 <textarea placeholder="내용을 입력하세요" style = "resize : none"></textarea>
 				<input type = "file" name = "" id = ""> 
 			</div>
 			<div class = "content_wr">
 				<span class="material-symbols-outlined">
					subdirectory_arrow_right
				</span> 답변 <textarea placeholder="내용을 입력하세요" style = "resize : none"></textarea>
			</div>
 		</div>
 	 		<div class = "btn_wr"><a href = "#" > 돌아가기 </a></div>
	</div>
	 </main>
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>