<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>렌트카 환불 규정</title>
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
        <h1 class="text-center my-4">렌트카 환불 규정</h1>
        <div class="card">
            <div class="card-body">
                <h3 class="card-title">환불 정책</h3>
                <p>당사의 환불 정책은 투명하고 공정하며, 고객의 만족을 최우선으로 합니다. 다음은 주요 환불 규정입니다:</p>
                <ul>
                    <li><strong>예약 취소:</strong> 렌트 시작 48시간 전까지 예약을 취소하시면 전액 환불됩니다.</li>
                    <li><strong>늦은 취소:</strong> 렌트 시작 48시간 내에 취소할 경우 예약금의 50%가 공제된 후 환불됩니다.</li>
                    <li><strong>렌트 미이행:</strong> 렌트 시작 시간에 차량을 인수하지 않을 경우 환불이 불가능합니다.</li>
                    <li><strong>조기 반납:</strong> 렌트차량을 조기에 반납하실 경우 남은 기간에 대해 비례하여 환불해 드립니다.</li>
                </ul>
                <h3 class="card-title">환불 절차</h3>
                <p>환불을 원하시는 경우, 아래의 절차를 따라주시기 바랍니다:</p>
                <ol>
                    <li>당사 고객 서비스 센터로 연락을 주시거나, 홈페이지 내 마이페이지에서 예약 취소를 요청하십시오.</li>
                    <li>환불 요청이 접수된 후, 7~10 영업일 이내에 결제하신 방법과 동일한 방식으로 환불됩니다.</li>
                </ol>
                <p class="important mt-3">추가 문의사항이 있는 경우 고객 서비스 센터(<a href="mailto:support@rentcarcompany.com">support@rentcarcompany.com</a>)로 연락 주시기 바랍니다.</p>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>