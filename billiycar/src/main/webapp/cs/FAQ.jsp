<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<meta charset="UTF-8">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FAQ</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/FAQ.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
<!-- <main class="container"> -->
 <main class="container">
        <div class="faq_arti">
            <!-- 타이틀 -->
            <div class="faq_title">
                <em class="faq_title_1">FAQ</em><br>
                <em class="faq_sub_title">빌리카에서 궁금한 내용들을 모두 알려 드립니다.</em>
            </div>
            
            <!-- 카테고리 버튼 -->
            <div class="d-flex flex-wrap gap-2">
                <button class="btn btn-outline-dark">예약 변경 및 취소</button>
                <button class="btn btn-outline-dark">고장 및 사고</button>
                <button class="btn btn-outline-dark">보험</button>
                <button class="btn btn-outline-dark">유류비</button>
                <button class="btn btn-outline-dark">운전자</button>
            </div>

            <!-- 검색창 -->
            <div class="search mt-3">
                <form>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                        <input type="search" class="form-control" placeholder="Search" name="notice_search">
                    </div>
                </form>
            </div>

            <!-- 자주 묻는 질문 -->
            <div class="accordion" id="faqAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            첫번째 질문
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
                        <div class="accordion-body">
                            답변 ~
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            두번째 질문
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo">
                        <div class="accordion-body">
                            답변 ~
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 페이징 -->
            <nav aria-label="Page navigation example" class="mt-4">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>

            <!-- 상담원 문의 -->
            <div class="faq_cs">
                <em>상담원 1:1 문의</em>
                <div class="faq_cs_account mt-3">
                    <div>
                        <p>빌리카 상담 운영시간</p>
                        <p>9:00 ~ 17:00 (주말 및 공휴일 휴무)<br> *사고 및 긴급 출동 : 24시간 가능</p>
                        <button class="btn btn-primary" onclick="location.href='qna_q'">1:1 상담 신청 바로가기</button>
                    </div>
                    <hr>
                    <p>전화상담 : 1577-7777</p>
                </div>
            </div>
        </div>
    </main>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>