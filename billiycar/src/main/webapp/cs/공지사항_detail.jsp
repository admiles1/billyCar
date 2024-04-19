<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 detail</title>

<!-- css -->
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/공지사항_detail.css">
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
  				<h3> 미성년자 면허 도용 시 벌금 </h3>
  			</div>
  			
  			<div class = "view_info">
  				<dl>
  					<dt>작성자</dt>
  					<dd>빌리카</dd>
  				</dl>
  				<dl>
  					<dt>날짜</dt>
  					<dd>24-02-12</dd>
  				</dl>
  				<dl>
  					<dt>조회</dt>
  					<dd>14</dd>
  				</dl>
  			</div>
  			
  			<div class = "view_cont">
  				저쩌구
  				저쩌구
  			</div>
  		</div>
  		
  		<div class = "btn-view">
  			<a href = "#">수정</a>
  			<a href = "#">삭제</a>
  			<a href = "#">목록</a>
  		</div>
  		
  	</div>
  	
  	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>