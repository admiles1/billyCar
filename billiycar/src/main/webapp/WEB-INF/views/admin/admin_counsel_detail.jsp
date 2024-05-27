<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주묻는질문</title>
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
  	margin-right: 680px;
  	width : 700px;
  	padding: 10px;
  	border : 1px solid gray;
  	border-radius: 10px;
  }
  
  #faq_category {
  	border-radius: 10px;
  }

.view_cont {
	border : 1px solid gray;
  	border-radius: 10px;
  	padding: 10px;
}
  
.btn-view {
	margin-left : 360px;
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

.btn-view input {
	padding : 9px;
	border-radius : 10px;
	background-color : #275efe;
	border : none;
	color : white;
	text-decoration: none;
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
        <h1 class="h2">자주 묻는 질문</h1>
    </div>

    <!-- 1:1 문의 상담 내역 표시 -->
    <div class="card">
        <div class="card-header">
            자주 묻는 질문
        </div>
        <div class="card-body">
            <div class="list-group">
                <!-- 예시 1:1 문의 상담 내역 -->
                    <div class="d-flex w-100 justify-content-between">
						<select name="faq_category" id="faq_category" disabled="disabled" >
		 					<option value ="" > 문의 주제 </option>
		 					<option value ="accident" <c:if test="${faq.faq_category eq 'accident'}">selected</c:if>> 고장 및 사고 </option>
		 					<option value ="price" <c:if test="${faq.faq_category eq 'price'}">selected</c:if>> 요금 및 결제 </option>
		 					<option value ="reservation" <c:if test="${faq.faq_category eq 'reservation'}">selected</c:if>> 예약 </option>
		 					<option value ="etc" <c:if test="${faq.faq_category eq 'etc'}">selected</c:if>> 기타 </option>
		 				</select>
              		</div>
              		
					<%-- 제목 --%>
					<div id="title"  style="margin-top:10px"> ${faq.faq_subject}</div>
					
					<%-- 내용 --%>
					<div class ="view_cont" style="margin-top:20px">
						${faq.faq_content}
				    </div>
				    
					<%-- 버튼 --%>
	              	<div class = "btn-view">
			  			<a href = "faqModify?faq_idx=${faq.faq_idx}&pageNum=${param.pageNum}">수정</a>
			  			<input type = "button" value="삭제" onclick="confirmDelete()" />
			  			<a href = "admin_counsel">목록</a>
	  				</div>
	  				
	  				<script type="text/javascript">
						function confirmDelete() {
							if(confirm("게시물을 삭제하시겠습니까?")) {
								location.href = "faqDelete?faq_idx=${faq.faq_idx}&pageNum=${param.pageNum}";
							}
						}
					</script>
	  				
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