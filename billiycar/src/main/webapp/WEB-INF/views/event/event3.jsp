<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>렌트카 첫 고객 할인 이벤트</title>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		.container { margin-top: 20px; }
		.important { color: #dc3545; } /* Bootstrap danger color for emphasis */
	</style>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
		<h1 class="text-center my-4">🚗 렌트카 첫 고객 할인 이벤트! 🚗</h1>
		<div class="card">
			<div class="card-body">
				<h3 class="card-title">🌟 이벤트 상세 정보</h3>
				<p>신규 가입 고객을 위한 특별 할인! 지금 가입하고 첫 렌트카 예약에서 5000원 할인을 받으세요.</p>
                <ul>
					<li>모든 차종에 대해 5000원 첫 렌트 할인</li>
					<li>온라인 예약 시 자동 적용</li>
					<li>신규 회원 가입 필수</li>
				</ul>
				<h3 class="card-title">🌟 참여 방법</h3>
				<p> &nbsp;신규 가입 후 첫 고객에게 자동 적용!
				
				</p>
				                
				<p class="important mt-3">이벤트 기간: 제한 없음, 신규 가입 고객만 해당</p>
			</div>
		</div>
		<p class="mt-3">추가 문의사항이 있는 경우 이벤트 문의 메일(itwillbs_3@itwillbs.co.kr)로 연락 주시기 바랍니다.</p>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>