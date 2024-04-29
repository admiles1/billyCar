<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>현대차 렌트 할인 이벤트</title>
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
		<h1 class="text-center my-4">🚗 현대차 렌트 할인 이벤트! 🚗</h1>
		<div class="card">
			<div class="card-body">
				<h3 class="card-title">🌟 이벤트 상세 정보</h3>
				<p>지금 현대차를 렌트하시면 특별 할인 혜택을 제공합니다! 여러분의 다음 여행을 위한 완벽한 기회를 놓치지 마세요.</p>
				<ul>
					<li>모든 차종 대여 시 5000원 할인</li>
					<li>추가 운전자 비용 없음</li>
					<li>첫 100명의 고객에게는 특별 선물 제공</li>
				</ul>
				<h3 class="card-title">🌟 참여 방법</h3>
				<p>
					&nbsp;결제 페이지 - 이벤트정보에서 이벤트2 현대차 할인 이벤트를 체크하세요!
				</p>
				<p class="important mt-3">이벤트 기간: 이벤트 대상 100명 예약 종료까지</p>
				<p class="important mt-3">추첨 대상 100명이 많은 손님의 예약 시 이벤트가 빠르게 종료 될 수 있습니다.</p>
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