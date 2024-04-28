<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 등록</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

form {
	max-width: 500px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #f8f9fa;
}

.form-group {
	margin-bottom: 20px;
}

label {
	font-weight: bold;
}

button[type="submit"] {
	width: 100%;
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
				<nav class="col-md-2 d-md-block bg-light sidebar">
					<div class="sidebar-sticky">
						<ul class="nav flex-column">
							<li class="nav-item">
							<a class="nav-link active" href="admin_main.jsp"><i class="fas fa-tachometer-alt"></i>관리자 메인</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="collapse" data-target="#memberMenu"
								aria-expanded="false" aria-controls="memberMenu"><i
									class="fas fa-users"></i> 회원 관리</a>
								<div id="memberMenu" class="collapse">
									<ul class="nav flex-column pl-3">
										<li class="nav-item"><a class="nav-link" href="#"><i
												class="fas fa-list"></i> 회원 목록 조회</a></li>
										<li class="nav-item"><a class="nav-link" href="#"><i
												class="fas fa-user-lock"></i> 블랙리스트 관리</a></li>
									</ul>
								</div>
							</li>
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="collapse" data-target="#carMenu"
								aria-expanded="false" aria-controls="carMenu"><i
									class="fas fa-car"></i> 차량 관리</a>
								<div id="carMenu" class="collapse">
									<ul class="nav flex-column pl-3">
										<li class="nav-item"><a class="nav-link"
											href="admin_car.jsp"><i class="fas fa-list"></i> 차량 목록 조회</a></li>
										<li class="nav-item"><a class="nav-link" href="#"><i
												class="fas fa-car"></i> 신규 차량 등록</a></li>
										<li class="nav-item"><a class="nav-link" href="#"><i
												class="fas fa-edit"></i> 차량 수정 및 삭제</a></li>
										<li class="nav-item"><a class="nav-link" href="#"><i
												class="fas fa-calendar-alt"></i> 예약 차량 관리</a></li>
									</ul>
								</div>
							</li>
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="collapse" data-target="#customerMenu"
								aria-expanded="false" aria-controls="customerMenu"><i
									class="fas fa-user"></i> 고객 관리</a>
								<div id="customerMenu" class="collapse">
									<ul class="nav flex-column pl-3">
										<li class="nav-item"><a class="nav-link" href="#"><i
												class="fas fa-comments"></i> 1:1 문의 상담 내역</a></li>
										<li class="nav-item"><a class="nav-link" href="#"><i
												class="fas fa-reply"></i> 답변 내역</a></li>
										<li class="nav-item"><a class="nav-link" href="#"><i
												class="fas fa-star"></i> 리뷰 관리</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</nav>
				<main role="main" class="col-md-10 ml-sm-auto px-4">
					<div
						class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h1 class="h2">차량 등록</h1>
					</div>
					<form>
						<div class="form-group">
							<label for="manufacturer">제조사</label> <input type="text"
								class="form-control" id="manufacturer" placeholder="제조사를 입력하세요"
								required>
						</div>
						<div class="form-group">
							<label for="model">모델</label> <input type="text"
								class="form-control" id="model" placeholder="모델을 입력하세요" required>
						</div>
						<div class="form-group">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" placeholder="이름을 입력하세요" required>
						</div>
						<div class="form-group">
							<label for="year">연식</label> <input type="text"
								class="form-control" id="year" placeholder="연식을 입력하세요" required>
						</div>
						<div class="form-group">
							<label for="release">출고</label> <input type="text"
								class="form-control" id="release" placeholder="출고 정보를 입력하세요">
						</div>
						<div class="form-group">
							<label for="fuel">연료</label> <input type="text"
								class="form-control" id="fuel" placeholder="연료 정보를 입력하세요">
						</div>
						<div class="form-group">
							<label for="number">차량 번호</label> <input type="text"
								class="form-control" id="number" placeholder="차량 번호를 입력하세요">
						</div>
						<div class="form-group">
							<label for="price">가격</label> <input type="text"
								class="form-control" id="price" placeholder="가격을 입력하세요">
						</div>
						<div class="form-group">
							<label for="image">차량 이미지 URL</label> <input type="text"
								class="form-control" id="image" placeholder="차량 이미지 URL을 입력하세요">
						</div>
						<button type="submit" class="btn btn-primary d-block mx-auto">등록</button>
					</form>
				</main>
			</div>
		</div>
	</main>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>