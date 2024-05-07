<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대 1문의창</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	
	 <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- CSS -->
	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/Q&A_Q.css">
	
	<!-- 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	
	<script>
	
		// 문의 주제 안 골랐을 경우
		
		$(function(){
			document.fr.qna_category.onchange = function() {
				let cate = $("#qna_category").val();
				
				if(cate == "") {
					document.fr.qna_category.focus(); // 포커스 요청
					$("#qna_category").css("background", "#FFD8D8");
					$("#categoryArea").text("문의 주제를 선택해 주세요");
					$("#categoryArea").css("color","red");
				}
				
			}
		})
	</script>
	
</head>
<body>
	
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
	
	<main class="container">
	
	<div class = "cs_act">
	
		<!-- 타이틀 -->
		<div class = "cs_title">
  			<em class = "cs_title_1">1:1 문의</em><br>
  			<em class = "cs_sub_title">궁금한 점을 해결해 드립니다 :)</em>
  		</div>
 		
 		<form action = "qna_q" method = "post" name="fr" enctype="multipart/form-data">
 		<div class = "cs_write">
 			<div class = "cus_info">
 				작성자 <input type = "text" value="${qna.qna_writer}" name="qna_writer" readonly="readonly">
 				문의 주제 
 				<select name="qna_category" id="qna_category" style = "margin-left : 15px">
 					<option value =""> 문의 주제 </option>
 					<option value ="reservation"> 예약 </option>
 					<option value ="function"> 부름 </option>
 					<option value ="fee"> 가격 </option>
 					<option value ="return"> 반납 </option>
 					<option value ="etc"> 기타 </option>
 				</select>
 				<div id="categoryArea" style = "margin-left:320px"></div>
 			</div>
 			
 			<div class = "title_wr">
 				제목 <input type = "text" placeholder="제목을 입력하세요" style = "margin-left : 15px" name ="qna_subject">
 			</div>
 			
 			<div class = "content_wr">
 				내용 <textarea placeholder="내용을 입력하세요" style = "resize : none" name="qna_content"></textarea>
 				<input type = "file" name="qna_file_form" multiple> 
 			</div>
 		</div>
 		<div class = "btn_wr">
 			<input type = "submit" value = "문의 제출" id = "qnaGo"></div>
 		</form>
 	 		
	</div>
	</main>
	
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>