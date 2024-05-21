<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>면허 인증 관리</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- 부트스트랩 CSS 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
  
.form-control {
	margin-left : 800px;
	width : 150px;
    display: inline-block;
    vertical-align: middle;
}

.mr-2 {
    margin-right: 0.5rem; /* Adjust as needed */
}

.form-control, .search {
 	display: inline-block;
    vertical-align: middle;
} 



</style>

<script type="text/javascript">
	<%-- 셀렉트박스 바뀔 때 submit--%>
	function selectboxSubmit() {
		document.fr.submit();
	}
	
	
</script>
</head>
<body>
<main class="container">


    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">관리자 페이지</a>
    </nav>

  <!-- 사이드바 -->
   <div class="container-fluid">
    <div class="row">
      <jsp:include page="sidebar.jsp" />

      <!-- 메인 컨텐츠 영역 -->
      <main role="main" class="col-md-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">면허 인증 회원 관리</h1>
        </div>

        <!-- 회원 정렬 -->
        <form class="form-inline mb-3" name="fr" action="admin_license">
	          <div class="form-group inline-elements margin-right">
			    <select class="form-control" name="license" onchange="selectboxSubmit()" style="display:flex;">
			        <option value="all" >전체</option>
			        <option value="license_auth" <c:if test="${param.license eq 'license_auth'}">selected</c:if>>면허 인증 회원</option>
			        <option value="license_unauth" <c:if test="${param.license eq 'license_unauth'}">selected</c:if>>미인증 회원</option>
			    </select>
			 </div>
        </form>
        
        <!-- 검색 -->
<!--         <form action="" method="get" style="width:400px;"> -->
<!-- 	        <div class="search" > -->
<!-- 	       	  <select class="form-control2" > -->
<!-- 			        <option value="all" >전체</option> -->
<%-- 			        <option value="license_auth" <c:if test="${param.license eq 'license_auth'}">selected</c:if>>면허 인증 회원</option> --%>
<%-- 			        <option value="license_unauth" <c:if test="${param.license eq 'license_unauth'}">selected</c:if>>미인증 회원</option> --%>
<!-- 			   </select> -->
<!-- 			   <input type="text" > -->
<!-- 			   <input type="button" value="검색"> -->
<!-- 	        </div> -->
<!--         </form> -->

        <!-- 회원 목록 테이블 -->
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>순번</th>
                <th>이름</th>
                <th>아이디</th>
                <th>이메일</th>
                <th>면허 인증 여부</th>
                <th>비고</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach var="member" items="${memberList}">
					<c:set var="i" value="${i+1}"></c:set>
            	
		              <tr>
		                <td>${i}</td>
		                <td>${member.member_name}</td>
		                <td>${member.member_id}</td>
		                <td>${member.member_email}</td>
		                <td><span style="color:${member.color}">${member.license_checked}</span></td>
		                <td <c:if test="${member.age_group != '만 23세 이상'}">style="color:red"</c:if>>${member.age_group}</td>
		              </tr>
            	</c:forEach>
            	
		<!--                 <td> -->
		<!--                   <a href="#" class="btn btn-sm btn-primary">기간 수정</a> -->
		<!--                   <button class="btn btn-sm btn-danger">삭제</button> -->
		<!--                 </td> -->
            </tbody>
          </table>
        </div>
        
        
        <c:set var = "pageNum" value = "1"/>
				<c:if test="${not empty param.pageNum}">
					<c:set var = "pageNum" value = "${param.pageNum}"/>
				</c:if>
        
        <%-- 페이징 --%>
				<section id = "pageList" style="text-align: center;">
			
					<input type="button" value="이전" onclick="location.href='admin_license?license=${license_auth}&pageNum=${pageNum -1}'" 
						<c:if test="${pageNum eq 1}">disabled</c:if>
					>
					
					<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${i eq pageNum}">
								${i}
							</c:when>
							<c:otherwise>
								<a href="admin_license?license=${license_auth}&pageNum=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>		
				<input type="button" value="다음" onclick="location.href='admin_license?license=${license_auth}&pageNum=${pageNum +1}'"
					<c:if test="${pageNum eq pageInfo.maxPage }">disabled</c:if>
				>
				</section>
        
      </main>
    </div>
  </div>
</main>
<!-- jQuery, Popper.js, 부트스트랩 JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>