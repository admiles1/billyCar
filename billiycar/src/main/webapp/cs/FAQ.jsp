<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<meta charset="UTF-8">
  <head>
   <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FAQ</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	
	 <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- CSS -->
	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/FAQ.css">
	
	<!-- 글꼴 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>

	<div class = "faq_arti">
	
		<!-- 타이틀 -->
		<div class = "faq_title">
  			<em class = "faq_title_1">FAQ</em><br>
  			<em class = "faq_sub_title">빌리카에서 궁금한 내용들을 모두 알려 드립니다.</em>
  		</div>
  		
  		<!-- 카테고리 -->
  		<div id = "btn_tag">
  			<span id = "tag1" style="padding:1px 2px 3px 4px;">
				<button class="white_btn">예약 변경 및 취소</button>
  			</span>
  			<span id = "tag2" style="padding:1px 2px 3px 4px;">
				<button class="white_btn">고장 및 사고</button>
			</span>	
			<span id = "tag3" style="padding:1px 2px 3px 4px;">
				<button class="white_btn">보험</button>
			</span>	
			<span id = "tag4" style="padding:1px 2px 3px 4px;">
				<button class="white_btn">유류비</button>
			</span>	
			<span id = "tag5" style="padding:1px 2px 3px 4px;">
				<button class="white_btn">운전자</button>
			</span>	
  		</div>
  		
  		<!-- dribbble -->
		<a class="dribbble" href="https://dribbble.com/shots/7441241-Button-Hover-Effects" target="_blank"><img src="https://cdn.dribbble.com/assets/dribbble-ball-mark-2bd45f09c2fb58dbbfb44766d5d1d07c5a12972d602ef8b32204d28fa3dda554.svg" alt=""></a>
		
		
		<!-- 자주묻는질문들 -->
	<div class="container-fluid">
      <div class="panel-group" id="accParent" role="tablist">
        
        <!-- 첫번째 질문 -->
        <div class="panel panel-default">
          <div class="panel-heading" role="tab">
            <a role="button" data-toggle="collapse" data-parent="#accParent" href="#accEx1" aria-constrols="addEx1">
              첫번째 질문
            </a>
          </div>
          <div id="accEx1" class="panel-collapse collapse in" role="tabpanel">
            <div class="panel-body">
              답변 ~
            </div>
          </div>
        </div>
        
        <!-- 두번째 질문 -->
        <div class="panel panel-default">
          <div class="panel-heading" role="tab">
            <a role="button" data-toggle="collapse" data-parent="#accParent" data-target="#accEx2" aria-constrols="addEx2">
              두번째 질문
            </a>
          </div>
          <div id="accEx2" class="panel-collapse collapse" role="tabpanel">
            <div class="panel-body">
              답변 ~
            </div>
          </div>
        </div>
        
      </div> <!-- id=accParent -->
    </div>


</div>
		
	<!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>