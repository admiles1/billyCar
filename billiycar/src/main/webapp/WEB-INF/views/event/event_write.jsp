<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이벤트 작성</title>

 <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 썸머노트 -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- css -->
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/notice_write.css">
</head>
<body>
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
  	
  	<main class="container">
  	<div class = "notice_de_main">
	
		<!-- 타이틀 -->
		<div class = "notice_d_t_div">
  			<em class = "notice_d_title">이벤트 작성</em><br>
  		</div>
  		
  		<form action="eventWrite" method= "post" enctype="multipart/form-data">
  		<div class = "detail_view">
  			<div class ="view_tit">
  				<h3><input type = "text" id="title" placeholder="제목을 입력하시오" name = "event_title" style = "width : 400px"> </h3>
  			</div>
  			
  			<div class = "view_info">
				<input type="file" value="파일 추가하기" name="event_iamge_form" multiple>
  			</div>
  			
<!--   			<div class = "view_cont"> -->
<!--   				<p> -->
<!--   				<textarea rows="20" cols="150" style = "resize : none" name = "board_content" placeholder="내용을 입력하세요"></textarea> -->
<!-- 					</p> -->
<!--   			</div> -->
			
			<div class ="view_cont"></div>
				<textarea id="summernote" style = "background-color:white" name = "event_content"></textarea>
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
  			<a href = "event">목록</a>
  		</div>
		</form>
	</div>
  	
	</main>
  	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
	
		<!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>