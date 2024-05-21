<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js">
<style>
  .card { margin-bottom: 20px; }
  .nav-link, .card-text { white-space: nowrap; }
  #question, .answer { cursor: pointer; }
  #question { font-family: 'Arial', sans-serif; color: #007bff; }
  #answer { font-family: 'Calibri', sans-serif; color: #28a745; }
  .edit-btn { float: right; margin-top: -20px; color: #dc3545; } /* Modified color for visibility */
  
  .inline-elements {
 	 margin-left : 850px;
	width : 150px;
    display: inline-block;
    vertical-align: middle;
	}
	
	.mr-2 {
	    margin-right: 0.5rem; /* Adjust as needed */
	}
  
</style>
<script type="text/javascript">
	function selectSubmit () {
		document.fr.submit();
	}
</script>
</head>
<body>
<main class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="">관리자 페이지</a>
    </nav>
   <div class="container-fluid">
    <div class="row">
      <jsp:include page="sidebar.jsp" />
      <main role="main" class="col-md-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">답변 내역</h1>
        </div>
        
          <c:set var = "pageNum" value = "1"/>
				<c:if test="${not empty param.pageNum}">
					<c:set var = "pageNum" value = "${param.pageNum}"/>
				</c:if>
				
				<form class="form-inline mb-3" name="fr" action="adminAnswerList">
			          <div class="form-group inline-elements margin-right">
					    <select class="form-control" name="answer" onchange="selectSubmit()">
					        <option value="all" <c:if test="${param.answer eq 'all'}">selected</c:if>>전체</option>
					        <option value="no" <c:if test="${param.answer eq 'no'}">selected</c:if>>답변 미완료</option>
					        <option value="ok" <c:if test="${param.answer eq 'ok'}">selected</c:if>>답변 완료</option>
					    </select>
					 </div>
		        </form>
				
				<c:if test="${param.answer eq 'no'}">
					<div style="color:#00aaff; text-align:center; margin-bottom : 5px;">
						<b> 가장 오래된 질문 순으로 보여집니다 :) </b>
					</div>
				</c:if>
				
				<c:forEach var="qna" items="${qnaList}">
			        <div class="container">
			          <div class="row">
			            <div class="col-md-12">
			              <div class="card">
			                 <div class="card-body">
					            <%-- Assume that data is fetched from the server based on the qid parameter --%>
					            <h5 class="card-title">질문 ID: ${qna.qna_writer}</h5>
					            <p class="card-text" id="question"><strong>제목:</strong> ${qna.qna_subject}</p>
					            <p class="card-text" id="question"><strong>내용:</strong> ${qna.qna_content}</p>
					            <p class="card-text" id="answer"><strong>답변 내용:</strong>
									<c:choose>
										<c:when test="${qna.qna_status eq 0}">
											<span style="color:red;background-color:#FFFFD2; font-size: bold;">아직 답변하지 않으셨습니다.</span> 
										</c:when>
										<c:otherwise>
								             ${qna.admin_content}
										</c:otherwise>
									</c:choose>
								</p>
<!-- 					            <a href="adminAnswerList" class="btn btn-primary"><i class="fas fa-arrow-left"></i> 답변 내역</a> -->
					            <a href="adminAnswer?qna_idx=${qna.qna_idx}&pageNum=${pageNum}" class="btn btn-warning" style="background-color:#00aaff; border-color: #00aaff; color:white;"><i class="fas fa-edit"></i> 답변 달기</a>
					        </div>
			              </div>
			            </div>
			          </div>
			        </div>
				</c:forEach>
		
				<%-- 페이징 --%>
				<section id = "pageList" style="text-align: center;">
			
					<input type="button" value="이전" onclick="location.href='adminAnswerList?answer=${param.answer}&pageNum=${pageNum -1}'" 
						<c:if test="${pageNum eq 1 }">disabled</c:if>
					>
					
					<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${i eq pageNum }">
								${i}
							</c:when>
							<c:otherwise>
								<a href="adminAnswerList?answer=${param.answer}&pageNum=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>		
				<input type="button" value="다음" onclick="location.href='adminAnswerList?answer=${param.answer}&pageNum=${pageNum +1}'"
					<c:if test="${pageNum eq pageInfo.maxPage }">disabled</c:if>
				>
				</section>
		
      </main>
    </div>
  </div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>
