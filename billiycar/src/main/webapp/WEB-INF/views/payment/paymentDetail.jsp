<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>결제페이지</title>
<!-- <link rel="stylesheet" href="css/paymentPage.css"> -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
 <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 <style type="text/css">
 	.subject{
	font: bold;
	margin-bottom : 15px;
 	padding: 5px; 
	text-align : left;
	background-color : lightgray;
	border-radius : 10px;
	height: 45px;
	}
	.subject2{
	font: bold;
	margin-bottom : 15px;
 	padding: 5px; 
	text-align : left;
	background-color : lightgray;
	border-radius : 10px;
	height: 45px;
	}
		
	.accordion-body {
            max-height: 200px; /* 최대 높이 설정 */
            overflow-y: auto; /* 내용이 넘치는 경우 스크롤 표시 */
    }
    .list-table-v02{
		border-top: 2px solid black;
 		width: 870px; 
		margin-left: 15px;
		
	}
    .c , th{
    	border: 1px solid gray;
    }
    
    th:first-child, td:first-child {
		border-left:0;
	}
	th:last-child, td:last-child {
		border-right: 0;	
	}
	
	.testBtn {
		width: 150px;
		height: 80px;
		 
	}
	#paymentMain{
	border: 1px solid lightgray;
	border-radius: 10px;
	padding-left: 0px;
	padding-right: 0px;
	
	}
#paymentSide{  
 		position:fixed;  
  		left:1190px; top:230px;  
   		width: 410px;  
   		height: 600px;  
		margin: 0px;
		padding: 0px;
  		border: 1px solid lightgray;
  		border-radius: 10px;
  	} 
  	
  	label {
  		margin-left: 10px;
  	}

 </style>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
	      <!-- row div 다 닫기 -->
<!-- 		<div class="col-md-7 col-lg-12"> -->
		<div class="row g-5">
		<div class="col-md-7 col-lg-8 " id="paymentMain">
	<!--         <form class="needs-validation" > -->
	    <h4 class="subject">예약정보</h4>
	    	<div class="row g-3">
	       		<div class="col-sm-3">
	            	<label>대여날짜</label>
	            </div>
	
	             <div class="col-sm-9">
                    <input type="text" class="form-control" id="pickupDate" value="${reservDetails[0].reserv_pickupdate}" readonly>
                </div>
	        </div>
	        
	        <div class="row g-3">
	        	<div class="col-sm-3">
	       	    	<label>대여지역</label>
	            </div>
				
	            <div class="col-sm-9">
	            	<input type="text" class="form-control" id="locatrionInfo"  value="${reservDetails[0].reserv_pickuplocation}" readonly>
	            </div>
			</div>
			
			<div class="row g-3">
				<div class="col-sm-3">
	            	<label>반납날짜</label>
	            </div>
	
	            <div class="col-sm-9">
                    <input type="text" class="form-control" id="returnDate" value="${reservDetails[0].reserv_returndate}" readonly>
                </div>
				
			</div>
			
			<div class="row g-3">
				<div class="col-sm-3">
	            	<label>반납지역</label>
	            </div>
	
	            <div class="col-sm-9">
	            	<input type="text" class="form-control" id="locatrionInfo" value="${reservDetails[0].reserv_returnlocation}" readonly>
	            </div>
			</div>
			<hr>            
	        
		<h4 class="subject">운전자정보(필수입력)</h4>
	        <div class="row gy-3">
	            <div class="col-sm-2">
	              		<label>운전자명</label>
	           	</div>
	
	           	<div class="col-sm-4">
	            	<input type="text" class="form-control" id="nameInfo" value="${info.member_name}" readonly>
	       		</div>
	           		 
	           	<div class="col-sm-2">
	            	<label>생년월일</label>
	            </div>
				
	            <div class="col-sm-4">
	           		<input type="text" class="form-control" id="birthInfo" value="${info.member_birth}" readonly>
	       		</div>
			</div>
				
			<div class="row gy-3">
	        	<div class="col-sm-2">
	   	  			<label>전화번호</label>
	           	</div>
	
	           	<div class="col-sm-4">
	       			<input type="text" class="form-control" id="tellInfo" value="${info.member_phone}" readonly>
	   			</div>
	           		 
	      		<div class="col-sm-2">
	            	<label>메일주소</label>
	           	</div>
	
	           	<div class="col-sm-4">
	            	<input type="text" class="form-control" id="eMailInfo" value="${info.member_email}" readonly>
	       		</div>
	           		 
	        </div>
			
		<hr>
		<h4 class="subject">보험정보</h4>
			<div class="row g-3">
				<h5>자차보험(선택사항, 24시간기준)</h5>
				<table class="list-table-v02" width="100%">
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
				        <tr class="insuranceChk" id="insuranceNone">
				            <td colspan="1" class="c">
				                <input name="insurance" class="chk insurance_data" id="insuranceCar0" type="radio" value="0"
				                ${reservDetails[0].reserv_insurance == 0 ? 'checked="checked"' : ''} disabled>
				                <label>선택안함</label>
				            </td>
				            <td colspan="1" class="c">없음</td>
				            <td colspan="1" class="c">없음</td>
				            <td colspan="1" class="c">전액부담</td>
				        </tr>
				        
				        <tr class="insuranceChk" id="insuranceGeneral">
				            <td colspan="1" class="c">
				                <input name="insurance" class="chk insurance_data" id="insuranceCar1" type="radio" value="10000"
				                ${reservDetails[0].reserv_insurance == 1 ? 'checked="checked"' : ''} disabled>
				                <label>일반자차</label>
				            </td>
				            <td colspan="1" class="c">1만원</td>
				            <td colspan="1" class="c">200만원</td>
				            <td colspan="1" class="c">50만원</td>
				        </tr>
				        
				        <tr class="insuranceChk" id="insuranceFull">
				            <td colspan="1" class="c">
				                <input name="insurance" class="chk insurance_data" id="insuranceCar12" type="radio" value="26000"
				                ${reservDetails[0].reserv_insurance == 2 ? 'checked="checked"' : ''} disabled>
				                <label>완전자차</label>
				            </td>
				            <td colspan="1" class="c">2만6천원</td>
				            <td colspan="1" class="c">200만원</td>
				            <td colspan="1" class="c">0만원</td>
				        </tr>
				    </tbody>
				</table>
			</div>	
					
			<br>		
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
			<div class="col-md-5 col-lg-4 order-md-last" id="paymentSide">
			<h4 class="subject2">결제 정보 확인</h4>
			<div class="container last_check">
				<div>
				</div>
				
				<p><b>차량 정보</b></p>
				<div class="row ">
					<div class="col-3">차량</div>
					<div class="col-9 car-name" align="right">${reservDetails[0].car_model}</div>
 					<div class="col-3">기본정보</div> 
 					<div class="col-9" align="right">${reservDetails[0].car_capacity} </div> 
					<div class="col-3">제한나이</div> 
 					<div class="col-9" align="right">만23세 이상</div> 
 					<div class="col-3">운전경력</div>
 					<div class="col-9" align="right">면허취득 1년이상</div> 
				</div>
				<br>
				<h6><b>결제 정보</b></h6>
				<div class="row">
					<div class="col-3">
						<input type="text" id="differenceday" readonly/>
					</div>
					<div class="col-9" align="right">
						<input type="text" id="firstAmount" readonly/>
					</div>
					<div class="col-3">보험금액</div>
					<div class="col-9 incurance" id="insurance_price" align="right">${empty param.insurance ? '(+)0' : param.insurance}</div>
					<div class="col-3">할인금액</div>
					<div class="col-9" align="right">할인금액 표시</div>
					<hr>
					<div class="col-3">결제 금액(VAT 포함)</div>
					<div class="col-9"  align="right"><input type="text" id="dateDifferenceInput" value="${reservDetails[0].payment_result_amount }" readonly/></div>
					<div></div>
				</div>
			</div>
			</div>

    <!-- 아임포트 스크립트 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <script>
        const IMP = window.IMP; 
        IMP.init("imp47235683"); // 내 가맹점 식별 코드
        
        function startPayment() {
            IMP.request_pay({
                pg: "html5_inicis", // 결제 과정에 사용될 결제사 이니시스
                pay_method: "card", // 결제 수단
                merchant_uid: "payDone_" + new Date().getTime(), // 주문번호 어칼지 고민
                name: "렌트카 예약", // 주문 명 '렌트카 되어있는 곳에 차명 따와야 할듯'
                amount: 100, // 금액
                buyer_email: "${info.member_email}", // 구매자 이메일 필요한가 싶네
//                 buyer_name: '홍길동', // 구매자 이름 가져오기
                buyer_name: "${info.member_name}" // 구매자 이름 가져오기
//                 buyer_tel: '010-1234-5678', // 구매자 전화번호 필요 하려나
//                 buyer_addr: '서울특별시 강남구 삼성동', // 구매자 주소 필요 없을듯
//                 m_redirect_url: 'http://localhost:8080/billycar/' // 모바일 결제시 리다이렉션될 URL이건 그냥 메인으로 보내면 될듯 이거안쓰고 보내도 될듯
//                 m_redirect_url: 'http://www.naver.com' // 모바일 결제시 리다이렉션될 URL이건 그냥 메인으로 보내면 될듯 이거안쓰고 보내도 될듯
            }, function(rsp) {
                if (rsp.success) {
                    alert("결제 성공");
                    location.href ="paymentComplete";
                } else {
                    alert("결제 취소");
                    
                }
            });
        }
        
        document.addEventListener('DOMContentLoaded', function() {
            var reservInsurance = ${reservDetails[0].reserv_insurance};
            document.getElementById('insuranceNone').style.display = reservInsurance == 0 ? '' : 'none';
            document.getElementById('insuranceGeneral').style.display = reservInsurance == 1 ? '' : 'none';
            document.getElementById('insuranceFull').style.display = reservInsurance == 2 ? '' : 'none';
        });
        
        
    </script>
	
	
	<!-- 보험 값 받아오는 스크립트 -->
	 <script>
        // 문서 로드 시 이벤트 리스너 추가
        document.addEventListener('DOMContentLoaded', function() {
            let radios = document.querySelectorAll('.insurance_data'); // 모든 라디오 버튼을 선택
            radios.forEach(function(radio) {
                radio.addEventListener('change', function() { // 라디오 버튼 변경 이벤트
                    if (this.checked) { // 라디오 버튼이 선택된 경우
                        let price = this.value; // 선택된 라디오 버튼의 값 가져오기
                        document.getElementById('insurance_price').innerText = '(+)' + price; // 값을 div에 표시
                    }
                });
            });
        });
    </script>	

	
	
		
				
  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%-- 	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer> --%>
</body>
</html>