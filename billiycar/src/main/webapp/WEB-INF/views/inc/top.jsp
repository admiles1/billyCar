<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/top.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<body class = "body">
<div id = "logo">
	<a href="./">
		<img src="${pageContext.request.contextPath}/resources/images/billycar_logo.png" class = "top_logo">
	</a>
</div>

<div class = "right_menu">
	<c:choose>
			<c:when test="${empty sessionScope.id}">
				<a class = "top_right_menu" href="login">
				 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#00AAFF" class="bi bi-car-front-fill" viewBox="0 0 16 16">
  					<path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679q.05.242.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.8.8 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2m10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17s3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z"/>
				</svg>
					로그인
				</a>
				<a class = "top_right_menu" href="join">회원가입</a>
			</c:when>
			<c:otherwise>
				<a class = "top_right_menu" href="mypage">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#00AAFF" class="bi bi-car-front-fill" viewBox="0 0 16 16">
  					<path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679q.05.242.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.8.8 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2m10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17s3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z"/>
				</svg>
					마이페이지 
				</a>
				<a class = "top_right_menu" href="logout">로그아웃</a>
				<c:if test="${sessionScope.id.id eq 'admin'}">
					| <a class = "top_right_menu" href ="admin"> 관리자페이지</a>
				</c:if>
			</c:otherwise>			
		</c:choose>
</div>

<div class = "left_menu">
	<header class="top_menu_header">
	  <div class="con">
	  <hr id = "top-line">
	    <nav class="top_bar">
	      <ul class = "top_ul">
	        <li>
	          <a class = "top_menu" href="reservation">차량 예약</a>
	          <ul class = "top_ul">
	            <li><a class = "top_sub_menu"  href="reservation"> 실시간 차량 예약 </a> </li>
	            <li><a class = "top_sub_menu"  href="review"> 차량 후기 </a> </li>
	          </ul>
	        </li>
	        <li>
	          <a class = "top_menu"  href="guideCompany">이용 안내</a>
	          <ul class = "top_ul">
	            <li><a class = "top_sub_menu"  href="guideCompany">회사 안내</a></li>
	            <li><a class = "top_sub_menu"  href="guideRental">대여 안내</a></li>
	            <li><a class = "top_sub_menu"  href="guideRefund">취소 및 환불 규정</a></li>
	          </ul>
	        </li>
	        <li>
	          <a class = "top_menu"  href="#">차량 안내</a>
	        </li>
	        <li>
	          <a class = "top_menu" href="event">이벤트</a>
	        </li>
	        <li>
	          <a class = "top_menu"  href="notice">고객센터</a>
	          <ul class = "top_ul">
	            <li><a class = "top_sub_menu" href="notice">공지사항</a></li>
	            <li><a class = "top_sub_menu"  href="faq">FAQ</a></li>
	            <li><a class = "top_sub_menu" href="qna">문의 내역</a></li>
	          </ul>
	        </li>
	      </ul>
	    </nav>
	    <hr id="top-line">
	  </div>
	</header>
</div>


</body>
</html>