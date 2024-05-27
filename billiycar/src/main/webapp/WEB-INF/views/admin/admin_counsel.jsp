<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주 묻는 질문</title>
<!-- 부트스트랩 CSS 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Chart.js CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js">
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
  
</style>
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
            <a href="CounselWrite" style="float:right; text-decoration:none; margin-right:10px" > 글쓰기 </a>
        </div>
        <div class="card-body">
            <div class="list-group">
            
                <!-- 예시 1:1 문의 상담 내역 -->
                
                	<c:set var = "pageNum" value = "1"/>
					<c:if test="${not empty param.pageNum}">
						<c:set var = "pageNum" value = "${param.pageNum}"/>
					</c:if>
                
                <c:forEach var="faq" items="${faqList}">
	                <a href="faqDetail?faq_idx=${faq.faq_idx}&pageNum=${pageNum}" class="list-group-item list-group-item-action">
	                    <div class="d-flex w-100 justify-content-between">
	                        <p class="mb-1">${faq.faq_subject}</p>
	                    </div>
	                </a>
                </c:forEach>
                
            </div>
        </div>
    </div>
</main>
    </div>
  </div>
  		<section id = "pageList" style="text-align: center; margin-left: 200px">
			
			<input type="button" value="이전" onclick="location.href='admin_counsel?pageNum=${pageNum -1}'" 
				<c:if test="${pageNum eq 1 }">disabled</c:if>
			>
			
			<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
				<c:choose>
					<c:when test="${i eq pageNum }">
						${i}
					</c:when>
					<c:otherwise>
						<a href="admin_counsel?pageNum=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>		
		<input type="button" value="다음" onclick="location.href='admin_counsel?pageNum=${pageNum +1}'"
			<c:if test="${pageNum eq pageInfo.maxPage }">disabled</c:if>
		>
		</section>
  
</main>
  <!-- jQuery, Popper.js, 부트스트랩 JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- Chart.js JS -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>