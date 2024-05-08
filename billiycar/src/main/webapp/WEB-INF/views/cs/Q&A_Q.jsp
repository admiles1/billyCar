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
	
		
		$(function(){
			
			// 카테고리 선택했을 경우
			document.fr.qna_category.onchange = function() {
				let cate = $("#qna_category").val();
				
				if(cate != "") {
					$("#qna_category").css("background", "");
					$("#categoryArea").text("");
					console.log()
				}
			}
			
			// 제목 입력했을 경우
			document.fr.qna_subject.onkeyup = function() {
				
				if($("#qna_subject").val().length > 0) {
					$("#qna_subject").css("border-color","#999");
				}
			}
			
			// 내용 입력했을 경우
			document.fr.qna_content.onkeyup = function() {
				
				if($("#qna_content").val().length > 0) {
					$("#qna_content").css("border-color","#999");
				}
			}
			
			// 정보 수집 동의했을 경우 
			document.fr.infoAgree.onclick = function() {
				if (document.fr.infoAgree.checked) {
					$(".infoAgreeDiv").css("border-color", "#fff");
				}
			}
			
			// submit 시 필수 항목 입력 안 됐을 경우
			document.fr.onsubmit = function() {
			
				// 문의 주제 안 골랐을 경우
				
				if($("#qna_category").val() == "") {
					document.fr.qna_category.focus(); // 포커스 요청
					$("#qna_category").css("background", "#FFD8D8");
					$("#categoryArea").text("문의 주제를 선택해 주세요");
					$("#categoryArea").css("color","red");
					return false;
				} 
				
				// 제목 입력 안 했을 경우
				if ($("#qna_subject").val().length == 0){
					document.fr.qna_subject.focus(); // 포커스 요청
					$("#qna_subject").css("border-color", "red");
					return false;
				}
				
				// 내용 입력 안 했을 경우
				if($("#qna_content").val().length == 0){
					document.fr.qna_content.focus(); // 포커스 요청
					$("#qna_content").css("border-color", "red");
					return false;
				}
				
				// 정보 제공 동의 체크 안 했을 경우
				if (!document.fr.infoAgree.checked) {
					document.fr.infoAgree.focus(); // 포커스 요청
					$(".infoAgreeDiv").css("border-color", "red");
					return false;
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
		 				작성자 <input type = "text" value="${qna.qna_writer}" name="qna_writer"  readonly="readonly">
		 				문의 주제 
		 				<select name="qna_category" id="qna_category" style = "margin-left : 15px">
		 					<option value =""> 문의 주제 </option>
		 					<option value ="reservation"> 예약 </option>
		 					<option value ="function"> 부름 </option>
		 					<option value ="fee"> 가격 </option>
		 					<option value ="return"> 반납 </option>
		 					<option value ="etc"> 기타 </option>
		 				</select>
		 				<span id="categoryArea" style = "margin-left:10px"></span>
		 			</div>
		 			
		 			<div class = "title_wr">
		 				제목 <input type = "text" placeholder="제목을 입력하세요" style = "margin-left : 15px" id="qna_subject" name ="qna_subject">
		 			</div>
		 			
		 			<div class = "content_wr">
		 				내용 <textarea placeholder="내용을 입력하세요" style = "resize : none" name="qna_content"  id="qna_content"></textarea>
		 				<input type = "file" name="qna_file_form" multiple> 
		 			</div>
		 		</div>
		 		
	 			<div class ="infoAgreeDiv">
	 				<input type ="checkbox" name="infoAgree" id= "infoAgree" style="margin-bottom:14px"> 아래와 같은 방침에 동의합니다. <br>
	 				[ 개인정보수집 및 이용 안내 동의 ] <br>
					수집 항목 : 이름 및 질문 내용 <br>
					수집, 이용 목적 : 빌리카 상담을 위한 정보제공 <br>
					보유, 이용기간 및 파기 : 답변 1년 후 지체 없이 파기 <br>
	 			</div>
	 			
	 			<div class = "btn_wr">
	 				<input type = "submit" value = "문의 제출" id = "qnaGo">
 				</div>
	 			
	 			
	 		</form>
		</div>
		
		
	</main>
	
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>