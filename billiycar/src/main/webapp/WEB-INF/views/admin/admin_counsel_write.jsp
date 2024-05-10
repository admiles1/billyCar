<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<!-- 부트스트랩 CSS 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Chart.js CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js">

<!-- 썸머노트 -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- 관리자 페이지 스타일 -->
<style>
  /* 추가적인 스타일링 */
  .card {
    margin-bottom: 20px;
  }
   /* 추가적인 스타일링 */
  .nav-link {
    white-space: nowrap;
  }
  .card-text {
    white-space: nowrap;
  }
  

  #title {
  	margin-right : 150px;
  	border : 1px solid gray;
  	border-radius: 10px;
  }
  
  #faq_category {
  	margin-left : 200px;
  	border-radius: 10px;
  }
  
  .btn-view {
	margin-left : 430px;
	margin-top : 15px;
	padding : 10px;
}

.btn-view a {
	padding : 10px;
	border-radius : 10px;
	background-color : #275efe;
	color : white;
	text-decoration: none;
}

.btn-view #writeGo {
	padding : 10px;
	border-radius : 10px;
	background-color : #275efe;
	border : none;
	color : white;
	text-decoration: none;
}
  
</style>

<script type="text/javascript">

//submit 시 필수 항목 입력 안 됐을 경우

$(function(){
			
			// 카테고리 선택했을 경우
			document.fr.faq_category.onchange = function() {
				let cate = $("#faq_category").val();
				
				if(cate != "") {
					$("#faq_category").css("background", "");
					$("#categoryArea").text("");
					console.log()
				}
			}
			
			// 제목 입력했을 경우
			document.fr.faq_subject.onkeyup = function() {
				
				if($("#tile").val().length > 0) {
					$("#tile").css("border-color","#999");
				}
			}
			
			// 내용 입력했을 경우
			document.fr.faq_content.onkeyup = function() {
				
				if($("#summernote").val().length > 0) {
					$("#view_cont").css("border-color","#999");
				}
			}

	document.fr.onsubmit = function() {
	
		// 문의 주제 안 골랐을 경우
		
		if($("#faq_category").val() == "") {
			document.fr.faq_category.focus(); // 포커스 요청
			$("#faq_category").css("background", "#FFD8D8");
			$("#categoryArea").text("문의 주제를 선택해 주세요");
			$("#categoryArea").css("color","red");
			return false;
		} 
		
		// 제목 입력 안 했을 경우
		if ($("#title").val().length == 0){
			document.fr.faq_subject.focus(); // 포커스 요청
			$("#title").css("border-color", "red");
			return false;
		}
		
		// 내용 입력 안 했을 경우
		if($("#summernote").val().length == 0){
			document.fr.faq_content.focus(); // 포커스 요청
			$("#view_cont").css("border-color", "red");
			return false;
		}
	}
})

</script>

</head>
<body>
<main class="container">


    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">관리자 페이지</a>
    </nav>

   <div class="container-fluid">
    <div class="row">
      <jsp:include page="sidebar.jsp" />

		<!-- 메인 컨텐츠 영역 -->
<main role="main" class="col-md-10 col-lg-10 ml-sm-auto px-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">자주 묻는 질문 추가</h1>
    </div>

    <!-- 1:1 문의 상담 내역 표시 -->
    <div class="card">
        <div class="card-header">
            자주 묻는 질문
        </div>
        <div class="card-body">
            <div class="list-group">
            <form action="CounselWrite" name="fr" method="post">
                <!-- 예시 1:1 문의 상담 내역 -->
                    <div class="d-flex w-100 justify-content-between">
						<select name="faq_category" id="faq_category" >
		 					<option value =""> 문의 주제 </option>
		 					<option value ="accident"> 고장 및 사고 </option>
		 					<option value ="price"> 요금 및 결제 </option>
		 					<option value ="reservation"> 예약 </option>
		 					<option value ="etc"> 기타 </option>
		 				</select>

						<input type = "text" id="title" placeholder="제목을 입력하시오" name ="faq_subject" style="width :500px;" required="required">
					</div>
						<div id="categoryArea" style="margin-left:180px"></div> 
						
					<div class ="view_cont" style="margin-top:30px">
						<textarea id="summernote" style = "background-color:white" name ="faq_content" required="required"></textarea>
					    <script>
					    $('#summernote').summernote({
					        placeholder: '내용을 입력하시오',
					        tabsize: 2,
					        height: 400,
					        toolbar: [
					          ['style', ['style']],
					          ['font', ['bold', 'underline', 'clear']],
					          ['color', ['color']],
					          ['para', ['ul', 'ol', 'paragraph']],
					          ['table', ['table']],
			// 		          ['insert', ['link', 'picture', 'video']],
					          ['view', ['fullscreen', 'codeview', 'help']]
					        ]
					      });
					    </script>
				    </div>
	              	<div class = "btn-view">
			  			<input type = "submit" value = "작성" id = "writeGo">
			  			<a href = "admin_counsel">목록</a>
	  				</div>
              </form>
              </div>
            </div>
        </div>
    </div>
</main>
 
  <!-- jQuery, Popper.js, 부트스트랩 JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- Chart.js JS -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>