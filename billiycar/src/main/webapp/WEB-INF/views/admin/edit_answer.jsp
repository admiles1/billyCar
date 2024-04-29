<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>답변 수정 페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .card { margin-bottom: 20px; }
        .nav-link, .card-text { white-space: nowrap; }
        .question, .answer { cursor: pointer; }
        .question { font-family: 'Arial', sans-serif; color: #007bff; }
        .answer { font-family: 'Calibri', sans-serif; color: #28a745; }
        .edit-btn { float: right; margin-top: -20px; color: #dc3545; } /* 수정 버튼의 시각적 구분을 위한 스타일 */
        .container-fluid { padding: 20px; }
    </style>
</head>
<body>
<main class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">관리자 페이지</a>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-md-block bg-light sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="admin_main.jsp"><i class="fas fa-tachometer-alt"></i> 관리자 메인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="collapse" data-target="#memberMenu" aria-expanded="false" aria-controls="memberMenu"><i class="fas fa-users"></i> 회원 관리</a>
                            <div id="memberMenu" class="collapse">
                                <ul class="nav flex-column pl-3">
                                    <li class="nav-item">
                                        <a class="nav-link" href="admin_member.jsp"><i class="fas fa-list"></i> 회원 목록 조회</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="admin_blackList.jsp"><i class="fas fa-user-lock"></i> 블랙리스트 관리</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="collapse" data-target="#carMenu" aria-expanded="false" aria-controls="carMenu"><i class="fas fa-car"></i> 차량 관리</a>
                            <div id="carMenu" class="collapse">
                                <ul class="nav flex-column pl-3">
                                    <li class="nav-item">
                                        <a class="nav-link" href="admin_car.jsp"><i class="fas fa-list"></i> 차량 목록 조회</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fas fa-car"></i> 신규 차량 등록</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fas fa-calendar-alt"></i> 예약 차량 관리</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="collapse" data-target="#customerMenu" aria-expanded="false" aria-controls="customerMenu"><i class="fas fa-user"></i> 고객 관리</a>
                            <div id="customerMenu" class="collapse">
                                <ul class="nav flex-column pl-3">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fas fa-comments"></i> 1:1 문의 상담 내역</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fas fa-reply"></i> 답변 내역</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fas fa-star"></i> 리뷰 관리</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <main role="main" class="col-md-10 ml-sm-auto px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">답변 수정</h1>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <%-- 서버에서 질문 ID를 기준으로 현재 질문과 답변 데이터를 조회합니다 --%>
                                    <% 
                                        String question = "페라리를 빌렸는데 아무리 밟아도 시속 500km 가 안나와요,,ㅠㅠ 왜 그러나요?";
                                        String answer = "어떤 차든 시속 500km 가 나오기는 힘듭니다. ^^";
                                        String qid = request.getParameter("qid");
                                    %>
                                    <form action="update_answer.jsp" method="post">
                                        <input type="hidden" name="qid" value="<%= qid %>">
                                        <div class="form-group">
                                            <label for="question">질문</label>
                                            <textarea class="form-control" id="question" name="question" rows="3" readonly><%= question %></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="answer">답변</label>
                                            <textarea class="form-control" id="answer" name="answer" rows="3"><%= answer %></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">저장</button>
                                    </form>
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
</body>
</html>
