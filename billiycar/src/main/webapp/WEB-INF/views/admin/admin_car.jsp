<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>차량 목록 조회</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .card {
            margin-bottom: 20px;
        }
        .nav-link {
            white-space: nowrap;
        }
        .card-text {
            white-space: nowrap;
        }
        .img_area {
            width: 200px;
            height: 150px;
            overflow: hidden;
        }
        .img_area img {
            width: 100%;
            height: auto;
            display: block; /* 이미지를 가운데로 정렬하기 위해 필요한 CSS */
            margin: 0 auto; /* 이미지를 가운데로 정렬하기 위해 필요한 CSS */
        }
        /* 추가된 부분 */
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
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
                        <h1 class="h2">차량 목록 조회</h1>
                    </div>
                    <form class="form-inline mb-3">
                        <div class="form-group mr-2">
                            <input type="text" class="form-control" placeholder="검색어 입력">
                        </div>
                        <div class="form-group mr-2">
                            <select class="form-control">
                                <option value="">전체</option>
                                <option value="active">회사</option>
                                <option value="inactive">이름</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">검색</button>
                    </form>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제조사</th>
                                    <th>모델</th>
                                    <th>이름</th>
                                    <th>연식</th>
                                    <th>출고</th>
                                    <th>연료</th>
                                    <th>상태 변경</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>현대</td>
                                    <td class="text-center">
                                        <div class="img_area d-flex justify-content-center align-items-center">
                                            <img src="../image1/car0.png" alt="차량 이미지">
                                        </div>
                                    </td>
                                    <td>소나타</td>
                                    <td>16년식</td>
                                    <td>N</td>
                                    <td>휘발유</td>
                                    <td>
                                        <a href="#" class="btn btn-sm btn-primary">수정</a>
                                        <button class="btn btn-sm btn-danger">삭제</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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