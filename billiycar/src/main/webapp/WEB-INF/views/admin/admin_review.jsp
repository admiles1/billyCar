<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지 - 리뷰 관리</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Chart.js CSS -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
  .star-rating {
    color: gold;
  }
  th, td {
    text-align: center;
  }
  .pagination {
    margin-top: 20px;
  }
  .nav-link {
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
                <h1 class="h2">리뷰 관리</h1>
                <div class="review-table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>사용자 이름</th>
                                <th>리뷰 내용</th>
                                <th>평점</th>
                                <th>리뷰 날짜</th>
                                <th>조치</th>
                            </tr>
                        </thead>
                        <tbody id="reviewBody">
                            <!-- 리뷰 데이터 자리 -->
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <!-- 페이징 버튼 자리 -->
                        </ul>
                    </nav>
                </div>
            </main>
        </div>
    </div>
</main>
<script>
    const reviews = [
        { name: "사용자1", content: "좋아요", rating: 4, date: "2024-04-01" },
        { name: "사용자2", content: "별로에요", rating: 2, date: "2024-04-01" },
        { name: "사용자3", content: "괜찮습니다", rating: 3, date: "2024-04-02" },
        { name: "사용자4", content: "완벽해요!", rating: 5, date: "2024-04-02" },
        { name: "사용자5", content: "다시는 이용하고 싶지 않아요", rating: 1, date: "2024-04-03" },
        { name: "사용자6", content: "훌륭해요", rating: 5, date: "2024-04-03" },
        { name: "사용자7", content: "나쁘지 않아요", rating: 3, date: "2024-04-03" },
        { name: "사용자8", content: "최악이었어요", rating: 1, date: "2024-04-04" },
        { name: "사용자9", content: "평범해요", rating: 3, date: "2024-04-04" },
        { name: "사용자10", content: "추천합니다", rating: 4, date: "2024-04-05" },
        { name: "사용자11", content: "그저 그래요", rating: 3, date: "2024-04-05" },
        { name: "사용자12", content: "좋았어요", rating: 4, date: "2024-04-05" },
        { name: "사용자13", content: "끔찍했어요", rating: 1, date: "2024-04-06" },
        { name: "사용자14", content: "너무 좋았어요", rating: 5, date: "2024-04-06" },
        { name: "사용자15", content: "실망스러워요", rating: 2, date: "2024-04-07" }
    ];

    const itemsPerPage = 5;
    const pageCount = Math.ceil(reviews.length / itemsPerPage);
    const pages = document.querySelector('.pagination');
    for (let i = 1; i <= pageCount; i++) {
        const pageItem = document.createElement('li');
        pageItem.className = 'page-item';
        const pageLink = document.createElement('a');
        pageLink.className = 'page-link';
        pageLink.href = '#';
        pageLink.textContent = i;
        pageLink.addEventListener('click', function (e) {
            e.preventDefault();
            displayPage(i);
        });
        pageItem.appendChild(pageLink);
        pages.appendChild(pageItem);
    }

    function displayPage(page) {
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const pageReviews = reviews.slice(start, end);

        const tbody = document.getElementById('reviewBody');
        tbody.innerHTML = '';
        pageReviews.forEach((review, index) => {
            const row = tbody.insertRow();
            row.insertCell(0).textContent = start + index + 1;
            row.insertCell(1).textContent = review.name;
            row.insertCell(2).textContent = review.content;
            const stars = row.insertCell(3);
            stars.innerHTML = '<span class="star-rating">' + '★'.repeat(review.rating) + '</span>';
            row.insertCell(4).textContent = review.date;
            const actions = row.insertCell(5);
            actions.innerHTML = '<button class="btn btn-success btn-sm">승인</button> ' +
                                '<button class="btn btn-danger btn-sm">삭제</button> ' +
                                '<button class="btn btn-info btn-sm">답글 달기</button>';
        });
    }

    displayPage(1); // 초기 페이지 로딩
    
    
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
