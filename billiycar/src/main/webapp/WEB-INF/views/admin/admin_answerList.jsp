<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  .question, .answer { cursor: pointer; }
  .question { font-family: 'Arial', sans-serif; color: #007bff; }
  .answer { font-family: 'Calibri', sans-serif; color: #28a745; }
  .edit-btn { float: right; margin-top: -20px; color: #dc3545; } /* Modified color for visibility */
</style>
</head>
<body>
<main class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">관리자 페이지</a>
    </nav>
   <div class="container-fluid">
    <div class="row">
      <jsp:include page="sidebar.jsp" />
      <main role="main" class="col-md-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">답변 내역</h1>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-body">
                  <div class="inquiry">
                    <a href="admin_answerList_form">
                      <h6 class="question">질문 1: 페라리를 빌렸는데 아무리 밟아도 시속 500km 가 안나와요,,ㅠㅠ 왜 그러나요?</h6>
                      <p class="answer">답변 1 : 어떤 차든 시속 500km 가 나오기는 힘듭니다. ^^</p>
                    </a>
                    <a href="edit_answer.jsp?qid=1" class="edit-btn">수정</a>
                  </div>
                  <hr class="my-4">
                  <!-- Additional Q&A sections can be repeated as needed -->
                </div>
              </div>
            </div>
          </div>
        </div>
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