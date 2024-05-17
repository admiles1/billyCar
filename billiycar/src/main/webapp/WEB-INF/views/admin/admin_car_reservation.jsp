<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 차량 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .reserved { color: red; font-weight: bold; }
        .available { color: green; font-weight: bold; }
        .nav-link { white-space: nowrap; }
        .input-group { width: 40%; }
        .form-select { margin-right: 2px; }
        .table thead th { cursor: pointer; }
        .pagination { justify-content: center; }
    </style>
</head>
<body>
<main class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="./">관리자 페이지</a>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="sidebar.jsp" />
            <main role="main" class="col-md-10 ml-sm-auto px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">예약 차량 관리</h1>
                </div>
                <div class="input-group mb-3">
                    <select class="form-select" id="searchType">
                        <option value="carNumber">차량 번호</option>
                        <option value="model">모델</option>
                        <option value="reserver">예약자</option>
                    </select>
                    <input type="text" class="form-control" id="searchInput" placeholder="검색어를 입력하세요">
                    <button class="btn btn-outline-secondary" type="button" onclick="searchCar()">검색</button>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th onclick="sortTable(1)">차량 번호</th>
                                <th onclick="sortTable(2)">모델</th>
                                <th onclick="sortTable(3)">상태</th>
                                <th onclick="sortTable(4)">예약자</th>
                                <th onclick="sortTable(5)">예약 날짜</th>
                                <th onclick="sortTable(6)">예약 시간</th>
                                <th>액션</th>
                            </tr>
                        </thead>
                        <tbody id="carTableBody">
                            <!-- 차량 데이터 하드코딩 -->
                            <tr>
                                <td>1</td>
                                <td>34가1234</td>
                                <td>현대 아반떼</td>
                                <td class="reserved">예약됨</td>
                                <td>홍길동</td>
                                <td>2024-05-17</td>
                                <td>10:00 - 12:00</td>
                                <td><button class="btn btn-sm btn-danger">예약 취소</button></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>56나5678</td>
                                <td>기아 K5</td>
                                <td class="available">이용 가능</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td><button class="btn btn-sm btn-success">예약 추가</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </main>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function searchCar() {
        var searchType = document.getElementById('searchType').value;
        var searchInput = document.getElementById('searchInput').value.toLowerCase();
        var table = document.getElementById('carTableBody');
        var rows = table.getElementsByTagName('tr');
        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].getElementsByTagName('td');
            var match = false;
            if (searchType === 'carNumber' && cells[1].innerText.toLowerCase().includes(searchInput)) {
                match = true;
            } else if (searchType === 'model' && cells[2].innerText.toLowerCase().includes(searchInput)) {
                match = true;
            } else if (searchType === 'reserver' && cells[4].innerText.toLowerCase().includes(searchInput)) {
                match = true;
            }
            rows[i].style.display = match ? '' : 'none';
        }
    }

    function sortTable(n) {
        var table = document.querySelector("tbody");
        var rows = Array.from(table.rows);
        var isAscending = table.getAttribute("data-sort") === "asc";
        rows.sort((rowA, rowB) => {
            var cellA = rowA.cells[n].innerText.toLowerCase();
            var cellB = rowB.cells[n].innerText.toLowerCase();
            return isAscending ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
        });
        table.innerHTML = "";
        rows.forEach(row => table.appendChild(row));
        table.setAttribute("data-sort", isAscending ? "desc" : "asc");
    }
</script>
</body>
</html>
