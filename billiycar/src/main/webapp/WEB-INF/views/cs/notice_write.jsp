<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항 작성</title>
 <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 썸머노트 -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- css -->
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/notice_write.css">
<!-- <script src="https://code.jquery.com/jquery-3.7.1.js"></script> -->

</head>
<body>
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
  	
  	<main class="container">
  	<div class = "notice_de_main">
	
		<!-- 타이틀 -->
		<div class = "notice_d_t_div">
  			<em class = "notice_d_title">공지사항 작성</em><br>
  		</div>
  		
  		<form action="noticeWrite" method= "post">
  		<div class = "detail_view">
  			<div class ="view_tit">
  				<h3><input type = "text" id="title" placeholder="제목을 입력하시오" name = "board_subject" style = "width : 400px" required="required" maxlength="50"> </h3>
  			</div>
  			
  			<div class = "view_info">
				<em><b>작성자</b></em>
				<em>${sessionScope.member_id}</em>
				<input type="checkbox" name="important" value="important" style="margin-left:50px" > 주요공지 
  			</div>
  			
<!--   			<div class = "view_cont"> -->
<!--   				<p> -->
<!--   				<textarea rows="20" cols="150" style = "resize : none" name = "board_content" placeholder="내용을 입력하세요"></textarea> -->
<!-- 				</p> -->
<!--   			</div> -->
			
			<div class ="view_cont"></div>
				<textarea id="summernote" style = "background-color:white" name = "board_content" required="required" maxlength="7000"></textarea>
		    <script>
		    $('#summernote').summernote({
		        placeholder: '내용을 입력하시오 (글자수 5000자까지 가능합니다)',
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
  			<a href = "notice">목록</a>
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