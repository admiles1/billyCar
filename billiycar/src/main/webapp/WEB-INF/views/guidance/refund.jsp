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
        .card-title{
			font-family: "Noto Sans KR", sans-serif !important;
			font-size : 18px;
			color : #00AAFF;
/* 			margin-left : px; */
        }
        .hr-2 {
			border: 0;
			border-bottom: 2px dashed #eee;
			margin-left : 100px;
			background: #999;
			margin-top : 50px;
		}
        .caution{
			background-color : #E4E4E4;	
			padding : 10px;
			border-radius: 10px;
			border : none;
			margin-left : 100px;
			width : 1150px;
		}
		.card{border-color: white;}
		.content{list-style-type: none;}
		
		.for_table, th, td, tr, .cont {
			border : 1px solid #ddd;
			border-collapse: collapse;
			text-align: center;
		}
		
		th, td {
			padding : 5px;
		}
		
		th {
			background-color : #f2f2f2;
			font-weight : bold;
		}
		
		td {
			background-color : #fff;
		}
		
		.can {
			width : 900px;
			margin-left : 200px;
		}
		
		.ul-list {
			list-style-type : none;
			margin : auto;
		}
		
				
    </style>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
        <h1 class="text-center my-4">렌트카 환불 규정</h1>
        <div class="card">
            <div class="refund_body">
                <h3 class="card-title">* 환불 정책</h3>
                
                <div class="caution">
	                <ul class="content">
	                	<li>당사의 환불 정책은 투명하고 공정하며, 고객의 만족을 최우선으로 합니다. 다음은 주요 환불 규정입니다.</li>
	                    <li><strong>예약 취소:</strong> 렌트 시작 48시간 전까지 예약을 취소하시면 전액 환불됩니다.</li>
	                    <li><strong>늦은 취소:</strong> 렌트 시작 48시간 내에 취소할 경우 예약금의 50%가 공제된 후 환불됩니다.</li>
	                    <li><strong>렌트 미이행:</strong> 렌트 시작 시간에 차량을 인수하지 않을 경우 환불이 불가능합니다.</li>
	                    <li><strong>조기 반납:</strong> 렌트차량을 조기에 반납하실 경우 남은 기간에 대한 차액은 환불해 드리지않습니다.</li>
	                </ul>
                </div>
	                <hr class="hr-2">
	                <h3 class="card-title">* 환불 절차</h3>
					<div class="caution">
		                <ol class="content">
		                	<li>환불을 원하시는 경우, 아래의 절차를 따라주시기 바랍니다</li>
		                    <li>당사 고객 서비스 센터로 연락을 주시거나, 홈페이지 내 마이페이지 - 나의 예약관리 - 예약내역 확인에서 요청하십시오.</li>
		                    <li>환불 요청이 접수된 후, 7~10 영업일 이내에 결제하신 방법과 동일한 방식으로 환불됩니다.</li>
		                    <li>추가 문의사항이 있는 경우 이벤트 문의 메일(itwillbs_3@itwillbs.co.kr)로 연락 주시기 바랍니다.</li>
		                </ol>
                	</div>
                	<hr class="hr-2">
	                <h3 class="card-title">* 취소 수수료</h3>
	                <div class="can">
		                <table class="for_table">
<!-- 							<colgroup> -->
<!-- 								<col width="50%"> -->
<!-- 								<col width="50%"> -->
<!-- 							</colgroup> -->
							<thead>
								<tr>
									<th class="first f14">구분</th>
									<th class="first f14">대여기간 6시간 이하</th>
									<th class="f14">대여기간 6시간 초과</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class=" white-bg">
										<ul class="ul-list">
											<li>취소수수료 미부과 </li>
										</ul>
									</td>
									<td class="b_l1 white-bg" colspan="2">
										<ul class="ul-list">
											<li>예약 및 결제 후 30분 이내 (최우선 조건) </li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class=" white-bg">
										<ul class="ul-list">
											<li>취소수수료 10% </li>
										</ul>
									</td>
									<td class="b_l1 white-bg">
										<ul class="ul-list">
											<li> 대여시간 2시간 전 ~ 대여시작 30분 전 </li>
										</ul>
									</td>
									<td class="b_l1 white-bg">
										<ul class="ul-list">
											<li> 대여시간 4시간 전 ~ 대여시작 2시간 전 </li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class=" white-bg">
										<ul class="ul-list">
											<li>취소수수료 20% </li>
										</ul>
									</td>
									<td class="b_l1 white-bg">
										<ul class="ul-list">
											<li> 대여시간 30분 전 ~ 대여시작 </li>
										</ul>
									</td>
									<td class="b_l1 white-bg">
										<ul class="ul-list">
											<li> 대여시간 2시간 전 ~ 대여시작 </li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class=" white-bg">
										<ul class="ul-list">
											<li>취소수수료 25% </li>
										</ul>
									</td>
									<td class="b_l1 white-bg" colspan="2">
										<ul class="ul-list">
											<li>대여시작 시간 초과 <br>
												* 점유시간은 정상 과금, 잔여 서비스 요금의 25%를 취소 수수료 부과
											 </li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
                	</div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>