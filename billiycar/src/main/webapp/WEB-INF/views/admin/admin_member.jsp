<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 목록 조회</title>
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
</style>
</head>
<body>
<main class="container">
	<c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum }"/>

    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">관리자 페이지</a>
    </nav>

   <div class="container-fluid">
    <div class="row">
      <jsp:include page="sidebar.jsp" />

      <!-- 메인 컨텐츠 영역 -->
      <main role="main" class="col-md-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">회원 목록 조회</h1>
        </div>

        <!-- 회원 목록 검색 기능 -->
        <form class="form-inline mb-3" action="adminMemberSearch" method="get">
          <div class="form-group mr-2" style="text-align: center;">
            <input type="text" name="searchKeyword" class="form-control" placeholder="검색어 입력">
          </div>
          <div class="form-group mr-2" style="text-align: center;">
            <select class="form-control" name="searchType">
              <option value="all">전체</option>
              <option value="id">ID</option>
              <option value="name">이름</option>
              <option value="status">상태</option>
            </select>
            <input type="submit" class="btn btn-primary" value="검색" style="margin-top: 30px;">
          </div>
        </form>
		
		<!-- 회원 목록 테이블 -->
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>가입일</th>
                <th>상태</th>
                <th>조작</th>
              </tr>
            </thead>
            <c:choose>
            	<c:when test="${empty memberList }">
            		<td colspan="6" align="center">게시물 목록이 없습니다.</td>
            	</c:when>
            	<c:otherwise>
		            <c:forEach var="member" items="${memberList }">
		            <tbody>
		            	 <tr>
		                <td>${member.member_id }</td>
		                <td>${member.member_name }</td>
		                <td>${member.member_email }</td>
		                <td>${member.member_reg_date }</td>
		               
		                <c:choose>
		                	<c:when test="${member.member_status eq 3}">
		                		<td>블랙리스트</td>
		                	</c:when>
		                	<c:when test="${member.member_status eq 1}">
		                		<td>회원</td>
		                	</c:when>
		                </c:choose>
		                
		                <td>
		                  <a href="#" class="btn btn-sm btn-primary">상세보기</a>
		                  <a href="memberDelete" class="btn btn-sm btn-danger">삭제</a>
		                </td>
		              </tr>
		            </tbody>
		            </c:forEach>
	            </c:otherwise>
            </c:choose> 
            
          </table>
        </div>
        <!-- 목록 테이블 끝 -->
        ${pageInfo }
        <section id = "pageList" style="text-align: center;">
			
			<input type="button" value="이전" onclick="location.href='adminMemberSearch?pageNum=${pageNum -1}&searchType=${searchType }&searchKeyword=${searchKeyword }&searchType=${searchType }&searchKeyword=${searchKeyword }'" 
				<c:if test="${pageNum eq 1 }">disabled</c:if>
			>
			
			<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
				<c:choose>
					<c:when test="${i eq pageNum }">
						${i}
					</c:when>
					<c:otherwise>
						<a href="adminMemberSearch?pageNum=${i}&searchType=${searchType }&searchKeyword=${searchKeyword }">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>		
		<input type="button" value="다음" onclick="location.href='adminMemberSearch?pageNum=${pageNum +1}&searchType=${searchType }&searchKeyword=${searchKeyword }'"
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