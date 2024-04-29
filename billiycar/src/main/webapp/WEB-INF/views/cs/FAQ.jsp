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
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->

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
<main class="container">
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
		
		<!-- 검색창 -->
		<div class = "searc">
		  	<form action="">
			  	<div class = "faq_se">
				  	<div class="group">
			  			<svg class="icon" aria-hidden="true" viewBox="0 0 24 24"><g><path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path></g></svg>
			  			<input placeholder="Search" type="search" class="input" name = "notice_search">
					</div>
			  	</div>
			 </form> 
		 </div>	
		
		
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

        <!-- 세번째 질문 -->
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


	<div class = "faq_cs">
		<em> 상담원 1:1 문의 </em>
		<div class = "faq_cs_account">
			<span class = "faq_cs_1">
				<p class = "faq_cs_account1"> 빌리카 상담 운영시간 </p>
				<p class = "faq_cs_account2">9:00 ~ 17:00 (주말 및 공휴일 휴무)<br> *사고 및 긴급 출동 : 24시간 가능</em>
			</span>
			
		<div class = "faq_cs1_1">
			<input type = "button" class = "cs_btn" value = "1:1 상담 신청 바로가기" onclick = "location.href = 'qna_q'">
		</div>
		<hr class="hr-2">
		<em class = "faq_tell"> 전화상담 : 1577-7777</em>
		</div>
	</div>
	
</div>
		</main>
	<!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>