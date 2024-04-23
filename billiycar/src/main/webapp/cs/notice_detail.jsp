<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 detail</title>

<!-- css -->
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/notice_detail.css">
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
				<em><b>작성자</b></em>
				<em>빌리카</em>
				<em><b>날짜</b></em>
				<em>24-02-12</em>
				<em><b>조회</b></em>
				<em>14</em>
  			</div>
  			
  			<div class = "view_cont">
  				<p>
  				1. 동해물과 백두산이 마르고 닳도록
				하느님이 보우하사 우리나라 만세
				무궁화 삼천리 화려 강산
				대한 사람 대한으로 길이 보전하세
				
				2. 남산 위에 저 소나무 철갑을 두른 듯
				바람 서리 불변함은 우리 기상일세
				무궁화 삼천리 화려 강산
				대한 사람 대한으로 길이 보전하세
				
				3. 가을 하늘 공활한데 높고 구름 없이
				밝은 달은 우리 가슴 일편단심일세
				무궁화 삼천리 화려 강산
				대한 사람 대한으로 길이 보전하세
				
				4. 이 기상과 이 맘으로 충성을 다하여
				괴로우나 즐거우나 나라 사랑하세
				무궁화 삼천리 화려 강산
				대한 사람 대한으로 길이 보전하세
				</p>
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