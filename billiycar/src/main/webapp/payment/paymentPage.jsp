<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>결제페이지</title>
<!-- <link rel="stylesheet" href="css/paymentPage.css"> -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
 <style type="text/css">
 	.subject{
	font: bold;
/* 	height : 30px; */
	margin-bottom : 15px;
	text-align : left;
	background-color : lightgray;
	border-radius : 10px;
	}

	.accordion-body {
            max-height: 200px; /* 최대 높이 설정 */
            overflow-y: auto; /* 내용이 넘치는 경우 스크롤 표시 */
    }
    
/*     td, th{ */
/*     	border: 1px solid black; */
/*     } */
	.list-table-v02{
		border-top: 2px solid black;
		
	}
    .c{
    	border-top: 0.5px solid gray;
    	border-bottom: 0.5px solid gray;
    }
/*  	.insuranceChk{  */
/*  		border-left: 1px solid white;  */
/*  		border-rightt: 1px solid white;  */
/*  	}  */
 </style>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
	      <!-- row div 다 닫기 -->
	<!-- 	<div class="col-md-7 col-lg-12"> -->
		<div class="col-lg-12">
	<!--         <form class="needs-validation" > -->
	    <h4 class="subject">예약정보</h4>
	    	<div class="row g-3">
	       		<div class="col-sm-3">
	            	<label>대여날짜</label>
	            </div>
	
	            <div class="col-sm-9">
	              <input type="text" class="form-control" id="dateInfo" placeholder="" value="대여 날짜받아올꺼" required>
	            </div>
	        </div>
	        
	        <div class="row g-3">
	        	<div class="col-sm-3">
	       	    	<label>대여지역</label>
	            </div>
				
	            <div class="col-sm-9">
	            	<select class="form-select" aria-label="Default select example">
						<option selected>대역지역</option>
						<option value="1">대여지역1</option>
						<option value="2">대여지역2</option>
						<option value="3">대여지역3</option>
					</select>
	            </div>
			</div>
			
			<div class="row g-3">
				<div class="col-sm-3">
	            	<label>반납날짜</label>
	            </div>
	
	            <div class="col-sm-9">
	            	<input type="text" class="form-control" id="dateInfo" placeholder="" value="반납 날짜받아올꺼" required>
	            </div>
				
			</div>
			
			<div class="row g-3">
				<div class="col-sm-3">
	            	<label>반납지역</label>
	            </div>
	
	            <div class="col-sm-9">
	            	<select class="form-select" aria-label="Default select example">
						<option selected>반납지역</option>
						<option value="1">반납지역1</option>
						<option value="2">반납지역2</option>
						<option value="3">반납지역3</option>
					</select>
	            </div>
			</div>
			
			<div class="row g-3">
				<div class="col-sm-3">
	            	<label>총 대여시간</label>
	        	</div>
	
	            <div class="col-sm-9">
	            	<input type="text" class="form-control" id="dateInfo" placeholder="" value="총 대여시간 받아올꺼" required>
	            </div>
	        </div>
			<hr>            
	        
		<h4 class="subject">운전자정보(필수입력)</h4>
	        <div class="row gy-3">
	            <div class="col-sm-2">
	              		<label>운전자명</label>
	           	</div>
	
	           	<div class="col-sm-4">
	            	<input type="text" class="form-control" id="dateInfo" placeholder="[필수]이름" value="" required>
	       		</div>
	           		 
	           	<div class="col-sm-2">
	            	<label>생년월일</label>
	            </div>
				
	            <div class="col-sm-4">
	           		<input type="text" class="form-control" id="dateInfo" placeholder="[필수]생년월일" value="" required>
	       		</div>
			</div>
				
			<div class="row gy-3">
	        	<div class="col-sm-2">
	   	  			<label>전화번호</label>
	           	</div>
	
	           	<div class="col-sm-4">
	       			<input type="text" class="form-control" id="dateInfo" placeholder="[필수]핸드폰번호(-제외)" value="" required>
	   			</div>
	           		 
	      		<div class="col-sm-2">
	            	<label>메일주소</label>
	           	</div>
	
	           	<div class="col-sm-4">
	            	<input type="text" class="form-control" id="dateInfo" placeholder="[필수]이메일" value="" required>
	       		</div>
	           		 
	        </div>
			
			<hr>	
		<h4 class="subject">이벤트정보</h4>
			
			<div class="row g-3">
				<table class="list-table-v02" width="100%"  >
					<colgroup span="1">
						<col width="45%">
						<col width="25%">
						<col width="30%">
					</colgroup>
					<thead>
						<tr>
							<th>이벤트명</th>
							<th>혜택</th>
							<th class="last-child">기간</th>
						</tr>
					</thead>
					<tbody>
						<tr class="eventChk" bordercolor="black">
							<td colspan="3" class="c" bordercolor="black">
								<input name="event" class="chk event_data" id="event0" type="radio" value="0|선택안함" checked="checked"> 
								<label for="event0" bordercolor="black">선택안함</label>
							</td>
						</tr>
						<tr class="eventChk" bordercolor="black">
							<td colspan="3" class="c" bordercolor="black">
								<input name="event" class="chk event_data" id="event1" type="radio" value="0|선택안함" > 
								<label for="event0" bordercolor="black">이벤트1</label>
							</td>
						</tr>
				</table>
			</div>
			<hr>	
		<h4 class="subject">보험정보</h4>
			<div class="row g-3">
				<h5>자차보험(선택사항, 24시간기준)</h5>
				<table class="list-table-v02" width="100%"  >
					<colgroup span="1">
						<col width="40%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>보험종류</th>
							<th>보험료</th>
							<th>보상한도</th>
							<th class="last=child">고객부담금</th>
						</tr>
					</thead>
					<tbody>
						<tr class="insuranceChk" >
							<td colspan="1" class="c" >
								<input name="insurance0" class="chk insurance_data" id="insuranceCar0" type="radio" value="0" checked="checked"> 
								<label>선택안함</label>
							</td>
							<td colspan="1" class="c" >없음</td>
							<td colspan="1" class="c" >없음</td>
							<td colspan="1" class="c" >전액부담</td>
						</tr>
						
						<tr class="insuranceChk" >
							<td colspan="1" class="c" >
								<input name="insurance0" class="chk insurance_data" id="insuranceCar1" type="radio" value="10000" > 
								<label>일반자차</label>
							</td>
							<td colspan="1" class="c">1만원</td>
							<td colspan="1" class="c">200만원</td>
							<td colspan="1" class="c">50만원</td>
						</tr>
						
						<tr class="insuranceChk" >
							<td colspan="1" class="c" >
								<input name="insurance0" class="chk insurance_data" id="insuranceCar12" type="radio" value="26000" > 
								<label>완전자차</label>
							</td>
							<td colspan="1" class="c">2만6천원</td>
							<td colspan="1" class="c">200만원</td>
							<td colspan="1" class="c">0만원</td>
						</tr>
					</tbody>
				</table>
			</div>	
					
					
			<div class="row g-3">			
				<h5>종합보험(기본)</h5>
				<table class="list-table-v02" width="100%"  >
					<colgroup span="1">
						<col width="40%">
						<col width="30%">
						<col width="30%">
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>보상범위</th>
							<th class="last=child">고객부담금</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="1" class="c" >대인 |</td>
							<td colspan="1" class="c" >없음</td>
							<td colspan="1" class="c" >없음</td>
						</tr>
						
						<tr>
							<td colspan="1" class="c" >대인 ||</td>
							<td colspan="1" class="c">무한</td>
							<td colspan="1" class="c">50만원</td>
						</tr>
						
						<tr>
							<td colspan="1" class="c" >대물</td>
							<td colspan="1" class="c">2000만원</td>
							<td colspan="1" class="c">30만원</td>
						</tr>
						
						<tr>
							<td colspan="1" class="c" >자손</td>
							<td colspan="1" class="c">1500만원</td>
							<td colspan="1" class="c">30만원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr>	
		<h4 class="subject">추가옵션</h4>
			<div class="row row-cols-2">
				<div class="opt_chk">
					<input type="checkbox" name="opt_chk" id="opt_chk8" value="8|0">&emsp;카시트(영유아용)1개
					<br>무료대여
				</div>
				<div class="opt_chk">
					<input type="checkbox" name="opt_chk" id="opt_chk8" value="8|0">&emsp;카시트(주니어)1개
					<br>무료대여
				</div>
				<div class="opt_chk">
					<input type="checkbox" name="opt_chk" id="opt_chk8" value="8|0">&emsp;카시트(영유아용)2개
					<br>5000원
				</div>
				<div class="opt_chk">
					<input type="checkbox" name="opt_chk" id="opt_chk8" value="8|0">&emsp;카시트(주니어)2개
					<br>5000원
				</div>
			</div>
			
			<hr>
		<h4 class="subject">결제수단 선택</h4>
			<div class="row">
				<div class="col pay_radio">
					<input type="radio" name="payment">&emsp;신용/체크카드
				</div>
				<div class="col pay_radio">
					<input type="radio" name="payment">&emsp;가상계좌이체
				</div>
				 <div class="col pay_radio">
					<input type="radio" name="payment">&emsp;무통장입금
				</div>
			</div>
			<hr>
		<h4 class="subject">할인정보(중복할인불가)</h4>
			<div class="row g-3">
				<div class="col-sm-3">
	            	<label>쿠폰사용&emsp;<input type="text"></label>
	            </div>
	            <div class="col-sm-9">
	            	<input type="button" value="적용">
	            </div>
			</div>
			<hr>
		<h4 class="subject">이용약관</h4>
			
			<div class="accordion" id="accordionExample">
		       	<div class="accordion-item">
		        	<h2 class="accordion-header">
		            	<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		                    자동차 대여 표준약관
		            	</button>
		            </h2>
		            <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
		            	<div class="accordion-body">
							제1조(약관의 적용)
							①위드렌터카(이하 “회사”라 한다)는 이 약관에 따라 대여자동차(이하 “렌터카”라 한다)를 임차인에게 대여하고 임차인은 이를 임차한다.<br>
							②회사는 이 약관의 취지, 법령 및 일반적 관습에 반하지 않는 범위에서 특약할 수 있으며, 특약한 때에는 그 특약이 우선한다. 단, 그 특약은 반드시 기재되어야 한다.<br>
							<br>
							제2조(예약)<br>
							①임차인은 렌터카를 임차할 때에는 미리 차종, 개시일시, 임차장소, 임차기간, 반환장소, 운전자 기타 임차조건을 명시하고 예약할 수 있으며 회사는 렌터카의 보유 범위 내에서 예약에 응한다.<br>
							②전항의 예약은 대여예정요금의 범위 내에서 예약금을 청구할 수 있고, 대여예정요금의 10% 범위내에서 위약금을 청구한다.<br>
							③대여 예정요금은 게시요금과 할인요금으로 구분된다. 여기서 할인요금이라 함은 게시요금에 소정의 할인율을 적용한 요금을 말한다.<br>
							④제1항에 의하여 예약한 임차개시시간을 1시간 이상 경과하여도 렌터카대여계약(이하“대여계약”이라 한다)을 체결하지 않을 경우에는 예약은 취소하는 것으로 한다.<br>
							⑤제1항의 임차조건을 변경하고자 할 경우에는 미리 회사의 승낙을 받아야 한다.<br>
							<br>
							제3조(대여계약의 체결)<br>
							①회사는 대여할 수 있는 렌터카가 없을 때 또는 임차인이 본조 제3항 각호에 해당할 때를 제외하고 임차인의 신청에 의하여 대여계약을 체결한다.<br>
							②대여계약의 신청은 제2조 제1항의 임차조건을 명시하여야 한다.<br>
							③회사는 임차인이 다음 각 호의 1에 해당할 경우에는 대여계약의 체결을 거절할 수 있다.<br>
							<br>
							1. 렌터카운전에 필요한 자격의 운전면허증을 소지하지 아니한 자와 만21세 미만인 자(다만, 사고발생의 빈도 및 보험요율을 감안하여 임차인의 연령 및 운전 경력 등은 특약으로 할 수 있다.)<br>
							2. 신원확인이 불가능하거나 회사의 질문이나 자료요구에 불응할 경우<br>
							3. 음주상태에 있을 경우<br>
							4. 마약, 각성제, 신나 등 약물에 중독되었다고 판단될 경우<br>
							5. 예약당시 결정한 운전자와 인수시의 운전자가 다를 경우<br>
							6. 과거 대여 시 대여요금의 지불을 체납하고 있을 경우<br>
							7. 과거 대여 시 제17조 각호 사항에 해당하는 행위가 있을 경우<br>
							8. 동물과 동반할 경우 (차량대여시 당사차량의 위생관리를 위해 냄새가 나는 애완동물과의 동반은 제한한다. 만약 애완동물과의 동반을 원할 경우 회사가 정하는 내부클리닝 비용을 임차인은 부담해야한다.)<br>
							9. 위 각호에 준하는 사항으로서 대여계약의 체결을 거절할 만한 객관적인 사유가 있을 경우<br>
							<br>
							제4조 (대여계약의 성립 등)<br>
							①대여계약은 회사가 대여요금을 징수하고 임차인에게 렌터카를 인도할 때 성립된다. 이때에 예약금은 대여요금의 일부 및 전부에 충당한다.<br>
							②회사는 사고, 도난 기타 회사의 귀책사유에 의하지 아니하는 사유로 인하여 예약 차종의 렌터카를 대여할 수 없을 경우에는 다른 차종의 렌터카(이하 “대체렌터카”라 한다)를 대여할 수 있다.<br>
							③전항에 의하여 대여하는 대체렌터카의 대여요금이 예약차종의 대여요금보다 비싸게 될 경우에는 예약차종의 대여요금을, 예약차종의 대여요금보다 싼 경우에는 대체렌터카의 대여요금을 각 적용한다.<br>
							④임차인은 제2항에 의한 대체렌터카의 대여신청을 거절하고 예약을 취소할 수 있다.<br>
							<br>
							제5조(대여계약의 해제)<br>
							①회사는 임차인이 대여 기간 중에 다음 각 호의 1에 해당한 때에는 대여계약의 해지사유를 설명하고 즉시 렌터카의 반환을 청구할 수 있다.<br>
							<br>
							1. 이 약관을 위반한 경우<br>
							2. 임차인의 귀책사유로 인하여 교통사고를 야기한 경우<br>
							3. 제3조제3항 각호에 해당하게 되었을 경우<br>
							<br>
							②임차인은 렌터카가 임차인에게 인도되기 이전의 하자로 인하여 사용 불능하게 된 경우 제22조제3항에 의한 조치를 받는 경우를 제외하고 대여계약을 해지할 수 있다.<br>
							<br>					
							제6조(불가항력 사유로 인한 대여계약의 중도종료)<br>
							①렌터카의 대여 기간 중에 천재지변, 기타 불가항력 사유로 인하여 렌터카의 사용이 불능하게 된 경우 대여계약은 종료된 것으로 한다.<br>
							②임차인은 전항에 해당하게 된 경우 그 뜻을 회사에 연락하여야 한다.<br>
							<br>					
							제7조(중도해약)<br>
							①임차인은 임차기간중이라도 회사의 동의하에 대여계약을 해약할 수 있다. 이때에는 임차인은 제25조의 중도해약 수수료를 지불하여야 한다.<br>
							②임차인의 귀책사유로 인하여 렌터카의 사고 또는 고장이 발생하여 대여 기간 중 반환할 경우 고객은 회사에 그 손해를 배상하고 계약은 해지된다.<br>
							<br>
							제8조(임차조건의 변경)<br>
							①대여계약의 성립 후 제3조제2항의 임차조건을 변경하고자 할 때에는 미리 회사의 승낙을 받아야 한다.<br>
							②회사는 전항에 의한 임차조건의 변경으로 인하여 대여 업무에 지장이 있을 때에는 그 변경을 승낙하지 않을 수 있다.<br>
							<br>
							제9조(자동차의 종류)<br>
							회사가 대여할 수 있는 자동차는 승용자동차와 승합자동차로 한다.<br>
							<br>
							제10조(보험 가입 등)<br>
							①회사는 제3조제2항에서 명시한 개시일시 및 임차장소에서 자동차손해배상보장법에 의한 책임보험과 자동차종합보험(대인, 대물, 자손)에 가입하고 제14조에서 정하는 렌터카를 대여한다.<br>
							<br>
							제11조(점검 등)<br>
							①회사는 임차인과 공동으로 렌터카 인도 전 일상 점검과 차체외관 및 차량운행에 필요한 기본공구의 적재여부 및 연료량을 확인한 후 렌터카를 인도한다.<br>
							②회사는 전항의 확인에 있어 렌터카에 정비 불량 등을 발견했을 경우 교환 등의 조치를 강구하고 그 내용을 기록 유지하여야 한다.<br>
							③회사는 렌터카를 인도할 때 자동차 임대차계약서를 임차인에게 교부하고 주요내용을 설명하여야 한다.<br>
							<br>
							제12조(대여요금 및 추가요금)<br>
							①회사가 영수하는 대여요금은 부산광역시에 신고하여 회사에 게시한 대여요금표에 기준 한다.<br>
							②임차인은 대여요금 외에 임차인의 요구로 인하여 대여에 부대되는 추가비용이 발생한 경우에는 추가비용을 부담하여야 한다.<br>
							③부산광역시에 신고 된 차량대여요금 및 차량손해면책 비용은 할인할 수 있다.<br>
							④회사가 영수하는 차량손해면책금은 부산광역시에 신고하여 회사에 게시한 차량손해면책요금표에 기준 한다.<br>
							<br>					
							제13조(요금의 수수방법)<br>
							①대여요금은 렌터카 대여 시에 사용예정금액을 선불한다.<br>
							②사용기간 초과 등으로 선불요금에 부족이 있을 때에는 렌터카 반환 시에 정산 입금한다.<br>
							<br>
							제14조(정기점검 의무 등)<br>
							회사는 자동차관리법 제36조의 일상점검 및 정기점검 정비를 실시한 렌터카를 대여하여야 한다.<br>
							<br>
							제15조(임차인의 점검의무)<br>
							임차인은 임차 기간 중 임차한 렌터카에 관하여 매일 사용 개시 전에 일상점검을 실시하여야 한다.<br>
							<br>
							제16조(임차인의 관리책임)<br>
							①임차인은 선량한 관리자의 주의의무를 가지고 렌터카를 사용하고 보관하여야 한다.<br>
							②전항의 관리책임은 렌터카의 인도를 받은 시점에서 시작하여 회사에 반환한 시점에 끝난다.<br>
							<br>
							제17조(금지행위)<br>
							임차인은 렌터카의 임차 기간 중에 다음의 행위를 하여서는 아니 된다.<br>
							1. 렌터카를 자동차운송사업 또는 이와 유사한 목적으로 사용하는 일<br>
							2. 렌터카를 전대하거나 또는 담보에 공용하는 등 회사의 소유권을 침해하는 일체의 행위를 하는 일<br>
							3. 렌터카의 차량번호표를 위조 또는 변조하거나 렌터카를 개조 또는 개장하는 등 그 원상을 변경하는 일<br>
							4. 렌터카를 운전연습 및 각종시험 혹은 경기에 사용하거나 또는 다른 차를 견인 혹은 디밀음에 사용하는 일<br>
							5. 법령 또는 공서양속에 위반하여 렌터카를 사용하는 일<br>
							6. 대여계약서에 명시된 운전자 이외의 제3자 및 무면허 자에게 운전을 시키는 일<br>
							7. 기타 임차인의 부당한 과실행위로 차량을 손상시키는 일<br>
							<br>
							제18조(배상책임)<br>
							①임차인은 렌터카의 임차기간중 제17조에 해당되는 행위 및 기타 임차인의 귀책사유로 인하여 회사 또는 제3자에게 손해를 끼쳤을 때에는 그 손해를 배상할 책임을 진다.<br>
							②임차인의 교통법규위반 및 주정차 위반 과태료와 범칙금등은 렌터카 반환 후에도 임차인이 부담하여야 한다.<br>
							<br>
							제19조(사고처리)<br>
							이용자는 다음 행위를 하여서는 안됩니다.<br>
							①임차인은 렌터카에 사고가 발생한 때에는 법령상의 조치를 취함과 동시에 다음의 정하는 바에 따라 처리하여야 한다.<br>
							1. 즉시 사고 상황 등을 회사에 통보하여야 한다.<br>
							2. 당해 사고에 관하여 회사가 계약하고 있는 보험회사가 요청하는 서류 또는 증거의 제출에 협조하여야 한다.<br>
							3. 당해사고에 관하여 제3자와 담판 또는 협정을 할 때에는 미리 회사와 협의하여야 한다.<br>
							4. 렌터카의 수리는 회사와 협의를 거쳐 지정한 공장에서 시행하여야 한다.<br>
							②회사와 임차인은 각자 주어진 책임 범위 내에서 사고해결에 노력하고 상호협조를 태만히 하여 발생하는 손해에 대하여는 귀책사유에 따라 상대방에게 배상하여야 한다.<br>
							<br>	
							제20조(보험처리 등)<br>
							①임차인은 사고발생시 회사가 체결한 자동차 보험 및 차량손해면책제도의 보장 범위 내에서 손해를 보상받을 수 있다. 다만, 다음 각 호의 어느 하나에 해당하는 사유로 발생한 손해와 자동차 보험약관에서 정한 면책사항에 해당하는 경우에는 어떠한 보상도 받지 못한다.<br>
							1. 임차인의 고의로 인한 손해<br>
							2. 무면허 운전 사고로 인한 손해<br>
							3. 영리를 목적으로 렌터카를 대여하거나 요금 또는 대가를 받고 렌터카를 사용했을 경우에 생긴 사고로 인한 손해<br>
							4. 범죄를 목적으로 렌터카를 사용 중의 사고로 인한 손해<br>
							5. 음주 운전 중의 사고로 인한 손해<br>
							6. 렌터카를 경기용이나 경기를 위한 연습용 또는 시험용으로 사용 중의 사고로 인한 손해<br>
							7. 임차인(임차인과 동승자로 기록된 공동임차인 포함) 이외 제3자가 렌터카를 운전하여 발생한 사고로 인한 손해<br>
							8. 12대 중과실사고<br>
							9. 도난사고<br>
							10. 손해보험법상 본인이 부담해야 하는 차량손해 및 법규 위반사항(타이어 파손, 실내부품, 소모품, 체인파손, 체인에 의한 차량파손, 내비게이션, 유모차, 카시트 등의 편의장비 파손 등)<br>
							②고객은 제1항의 보상을 받음에 있어 고객의 귀책사유로 인한 사고의 경우 차량손해면책제도에 가입한 경우는 회사에서 정하는 자기부담금을 별도로 지급하여야 한다.<br>
							③ 차량손해면책제도에 가입하지 않고 사고가 발생하여 차량이 파손된 경우 고객은 사고당시 차량기준가액 등을 기준으로 회사에 손해를 배상하여야 한다.<br>
							④ 제1항 및 제2항의 보상금이 임차인이 부담하여야 할 제18조의 손해배상금을 충당할 수 없을 때 회사는 그 부족금 발생사유를 임차인에게 설명하고 통상의 손해 범위 내에서 추가보상을 요구 할 수 있다.<br>
							⑤ 대여계약이 종료되었음에도 고객이 회사에 렌터카를 반환하지 않고 운행하다가 생긴 사고는 회사의 자동차 보험 가입에도 불구하고 고객이 손해배상책임을 져야 하며, 그 사고로 인하여 회사에 손해가 발생한 경우에는 고객은 회사에 그 손해를 배상하여야 한다.<br>
							<br>
							제21조(휴차손해부담)<br>
							①임차인은 임차인의 귀책사유에 의한 사고로 렌터카를 수리할 경우 그 수리기간의 영업 손해를 배상하여야 하고, 렌터카가 수리 불가능할 정도로 파손되거나 도난당한 경우에는 렌터카의 재 구매 및 등록 등에 소요되는 기간의 영업 손해를 부담하여야 한다.<br>
							②회사는 전항에 의하여 임차인이 부담 할 손해금을 정한 경우에는 회사의 평균 임차율 등을 감안한 객관적인 산정자료를 제시하여야 한다.<br>
							<br>					
							제22조(고장 등의 조치)<br>
							①임차인은 임차 기간 중 렌터카의 이상 또는 고장을 발견했을 경우 즉시 운전을 중지하고 회사에 연락함과 동시에 회사의 지시에 따라야 한다.<br>
							②임차인은 렌터카의 이상 또는 고장이 임차인의 고의 또는 과실에 의하는 경우에는 렌터카의 인수 및 수리에 소요되는 비용을 부담하여야 한다.<br>
							③임차인은 렌터카 대여전의 하자로 인하여 사용 불능하게 되었을 경우 회사로부터 대체렌터카의 제공 또는 이에 준하는 조치를 받을 수 있다.<br>
							④회사는 제3항에서 정한 조치를 할 수 없는 경우에는 고객에게 대여요금을 반환한다.<br>
							<br>
							제23조(불가항력 사유로 인한 면책)<br>
							①회사는 천재지변 기타 불가항력 사유로 인하여 임차인이 임차기간 내에 렌터카를 반환 할 수 없을 경우에는 사용기간동안 연장요금을 부담한다. 단, 이로 인하여 발생하는 손해에 관하여 임차인의 책임을 묻지 아니한다. 임차인은 이때 즉시 회사에 연락하고 회사의 요청에 협조하여야 한다.<br>
							②임차인은 천재지변 기타 불가항력 사유로 인하여 회사가 렌터카의 대여 또는 대체렌터카를 제공할 수 없을 경우 그로 인하여 발생하는 손해에 관하여 회사의 책임을 묻지 아니한다. 이때 회사는 즉시 임차인에게 연락하여야 한다.<br>
							<br>
							제24조(예약의 취소)<br>
							①임차예정시간을 1시간 이상 경과하여도 대여계약이 체결되지 아니한 경우에는 예약은 취소된 것으로 한다. 이 경우 위약금은 반환하지 아니한다.<br>
							②고객이 자신의 사정으로 임차예정일시로부터 24시간 이전에 예약을 취소하는 경우에는 예약금 전액을 반환한다.<br>
							③고객이 자신의 사정으로 임차예정일시 직전 24시간 내에 예약을 취소하는 경우에는 위약금을 제외한 예약금을 반환한다.<br>
							④회사는 예약금을 수령한 후 회사의 사정으로 예약을 취소하거나 대여계약을 체결하지 못할 경우에는 고객에게 사유를 설명하고 총금액의 110%를 반환한다.<br>
							⑤제2조에 따른 예약을 한 후 천재지변 등 불가항력적인 사유로 인하여 계약을 체결할 수 없게 된 경우에는 회사는 예약금을 고객에게 반환한다.<br>
							<br>
							제25조(중도해약수수료)<br>
							임차인은 제7조 제1항의 중도해약 할 경우 해약까지의 시간에 상당하는 대여요금 외에 해당하는 대여요금의 10%를 중도해약 수수료로 지불하여야 한다.<br>
							<br>
							제26조(대여요금의 환불)<br>
							회사는 다음 각 호에 해당하는 때에는 다음에 의하여 임차인으로부터 영수한 대여요금의 전부 또는 일부를 환불하여야 한다.<br>
							1. 제5조 제2항에 의하여 임차인이 대여계약을 해지한 때에는 영수한 대여요금의 전액<br>
							2. 제6조 제1항에 의하여 대여계약이 종료한 때에는 영수한 대여요금에서 대여계약이 종료된 시간에 상당한 대여요금을 공제한 잔액<br>
							<br>
							제27조(렌터카의 확인 등)<br>
							①임차인은 렌터카를 회사에 반환 할 때 통상적 사용으로 인한 마모를 제외하고 인도를 받았을 때 확인한 상태에서 반환하여야 한다.<br>
							②회사는 렌터카를 반환 시에 임차인의 입회하에 렌터카의 상황을 확인한다.<br>
							③회사는 렌터카를 인도 받을 때 임차인 입회하에 렌터카 안에 임차인 또는 동승자의 유류품 유무를 확인한다. 단, 분실물에 대한 그 책임은 회사가 지지 아니한다.<br>
							④연료비와 주차비는 임차인이 부담한다. 다만, 연료 과부족분에 대하여는 상호 정산한다. 이를 위해 회사는 고객이 렌터카를 반환 할 때의 연료량이 임대시의 연료량보다 부족한 경우에는 당해 부족분에 대한 연료대금을 요청할 수 있고 고객은 반환시의 연료량이 임차시의 연료량을 초과하는 경우에는 당해 초과분에 대한 연료대금을 회사에게 요청할 수 있다. 다만, 연료정산의 편의와 정확성을 위해 회사가 연료탱크에 연료를 100%채워 인도하는 경우 고객은 연료탱크에 연료를 100%채워 반환하여야 한다.<br>
							<br>
							제28조(렌터카의 반환시기 등)<br>
							①임차인은 렌터카를 임차 기간 내에 반환하여야 한다.<br>
							②임차인은 제8조 제1항에 의하여 임차기간을 연장할 때에는 변경후의 임차기간에 해당하는 대여요금을 지불하여야 한다.<br>
							<br>
							제29조(렌터카의 반환장소 등)<br>
							①렌터카의 반환은 제3조 제2항에 의하여 명시한 반환 장소에 반환하여야 한다. 다만, 제8조 제1항에 의하여 반환장소를 변경할 경우 변경후의 반환장소에 반환하여야 한다.<br>
							②임차인의 사정상 반환 장소 변경으로 인하여 회사가 부담하여야 할 비용이 발생한 경우에는 임차인은 회송비용을 부담하여야 한다.<br>
							<br>
							제30조(반환하지 않을 경우의 조치)<br>
							회사는 임차인이 대여기간 만료 시로부터 24시간을 경과하여도 반환장소에 렌터카의 반환을 하지 아니하거나 또한 회사의 반환 청구에 응하지 않을 때 또는 임차인의 소재가 불명한 때에는 필요한 법적 절차를 취할 수 있다.<br>
							<br>
							제31조(지연손해금)<br>
							회사와 임차인은 상호 이 약관에 기초한 금전채무의 이행을 지연할 경우 상대방에 대하여 금융기관의 연체이율로 지연손해금을 지불하여야 한다.<br>
							<br>
							제32조(계약의 세칙)<br>
							①회사는 이 약관에 준하여 따로 세칙을 정할 수 있다.<br>
							②회사는 따로 세칙을 정할 경우 회사의 영업소에 게시함과 동시에 회사가 시행 하는 팸플릿 및 요금표에 이를 기재한 후 이 약관과 함께 임차인에게 설명하여야 한다. 이를 변경한 경우에도 또한 같다.<br>
							<br>
							제33조(국․영문의 해석)<br>
							국문과 영문의 약관의 해석에 차이가 있을 시는 국문약관에 따른다.<br>
							<br>
							제34조(임차인의 연령 및 운전경력)<br>
							회사는 임차인의 연령과 운전경력을 다음 각항과 같이 제한 할 수 있다.<br>
							1.임차인의 연령: 임차인이 자동차를 임차하기 위해서는 만23세 이상이어야 한다.<br>
							2.운전경력: 도로 교통법상 운전면허증 소지자로서 운전경력 1년 이상이어야 한다.<br>
							3.전항의 운전경력은 임차인이 도로 교통법상 유효한 운전면허증을 발급 받은 후 임차 개시 일까지의 기간을 말한다.<br>
							<br>
							제35조(소송)<br>
							본 계약에 의한 자동차 대여에 관하여 분쟁이 발생한 때에는 대여인의 소재지 관할하는 법원에 제소하는 것으로 한다.<br>
							<br>
							제36조(신원조회)<br>
							회사는 임차인의 신용상태를 관련 법규에 정한 범위 내에서 조회, 확인 할 수 있다.<br>    
		            	</div>
		            </div>
		        </div>
		        <div class="accordion-item">
		            <h2 class="accordion-header">
		                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		                    개인정보 취급방침
		                </button>
		            </h2>
		            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
		                <div class="accordion-body">
		        			수집하는 개인정보의 항목<br>
							<br>
							위드렌터카는 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다.위드렌터카의 회원제 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 하며 선택항목을 입력하시지 않았다 하여 서비스 이용에 제한은 없습니다.<br>
							1) 회원 가입시 수집하는 개인정보의 범위<br>
							- 필수항목 : 희망 ID, 비밀번호, 성명, 생년월일, 성별, 주소, 전화번호, 이메일주소<br>
							2) 유료정보 이용시 수집하는 개인정보의 범위<br>
							- 회원 가입시 수집한 정보와 동일<br>
							- 결제방법에 따라 결제창에 입력하는 개인정보는 결제대행사에 기록될 뿐 미래SNS에 기록되지 않음<br>
							3) 자료 판매금액 출금시 수집하는 개인정보의 범위<br>
							- 은행명, 계좌번호<br>
							<br>
							개인정보의 수집 및 이용목적<br>
							① 위드렌터카는 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.<br>
							- 성명, 아이디, 비밀번호 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용<br>
							- 이메일주소, 전화번호 : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보의 안내<br>
							- 주소, 전화번호 : 경품 배송에 대한 정확한 배송지의 확보 및 본인 식별<br>
							- 생년월일, 성별, 주소 : 본인 식별 및 인구통계학적 분석 자료(이용자의 연령별, 성별, 지역별 통계분석)<br>
							- 주민등록번호 : 출금 회원에 한하며 소득세 신고를 위한 수집<br>
							- 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료<br>
							② 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지,정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.<br>
							<br>
							개인정보의 보유 및 이용기간<br>
							① 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.<br>
							단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.<br>
							- 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 경우 등 일정한 사전에 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다.<br>
							- 계약 또는 청약철회 등에 관한 기록 : 5년<br>
							- 대금결제 및 재화등의 공급에 관한 기록 : 5년<br>
							- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br>
							- 재가입 방지를 위한 가입정보 기록: 6개월<br>
							- 자료 등록 및 판매에 관한 기록: 6개월<br>
							② 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하께서 열람을 요구하는 경우 위드렌터카는 지체없이 그 열람 확인 할 수 있도록 조치합니다.<br>            	
		                </div>
		            </div>
		        </div>
		    </div>
			<hr>    
		<h4 class="subject">결제 전 예약 확인</h4>
			<div class="container last_check">
				<h5>예약자 정보</h5>
				<div class="row row-cols-2">
					<div class="col">예약자 이름</div>
					<div class="col">예약자명 표시</div>
					<div class="col">휴대폰 번호</div>
					<div class="col">예약자 휴대폰 번호 표시</div>
					<div class="col">생년월일</div>
					<div class="col">예약자 생년원일 표시</div>
					<div class="col">이메일</div>
					<div class="col">예약자 이메일 표시</div>
				</div>
				<br>
				<h5>차량 정보</h5>
				<div class="row row-cols-2">
					<div class="col">차량</div>
					<div class="col">차량이름(차량크기 정보->ex.중형,대형)표시</div>
					<div class="col">기본정보</div>
					<div class="col">차량 수용인원/기어방식/기름종류 표시</div>
					<div class="col">세부정보</div>
					<div class="col">차 옵션 표시</div>
					<div class="col">이용일</div>
					<div class="col">빌린 날짜 표기(대여일 및 시간 ~ 반납일 및 시간)</div>
					<div class="col">대여지역</div>
					<div class="col">대여지역 표시</div>
					<div class="col">반납지역</div>
					<div class="col">반납지역 표시</div>
					<div class="col">제한나이</div>
					<div class="col">만23세 이상</div>
					<div class="col">운전경력</div>
					<div class="col">면허취득 1년이상</div>
					<div class="col">면허종류</div>
					<div class="col">면허종류 표시</div>
				</div>
				<br>
				<h5>추가 옵션</h5>
				<div class="row row-cols-2">
					<div class="col">추가 옵션 표시</div>
					<div class="col">추가 옵션에 따른 추가 비용 표시 없으면(+0원)</div>
				</div>
				<br>
				<h5>결제 정보</h5>
				<div class="row row-cols-2">
					<div class="col">이용금액</div>
					<div class="col">이용금액 표시</div>
					<div class="col">결제금액</div>
					<div class="col">결제금액 표시</div>
					<div class="col">결제수단</div>
					<div class="col">결제수단 표시</div>
				</div>
				<br>
			</div>			
			<div align="center">
				<button class="sub_btn w-50 btn btn-primary btn-lg" type="submit" >결제하기</button>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script> -->
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>