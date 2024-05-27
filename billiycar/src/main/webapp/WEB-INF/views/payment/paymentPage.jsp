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
/*     flex: 1; */
	}
	/* 데스크탑용 사이드*/
 #paymentSide{   
  		position:fixed;   
   		right: 290px;; top:232px;   
   		width: 410px;   
/*    		height: 600px;    */
		height: 70%;
 		margin: 0px; 
 		padding: 0px; 
   		border: 1px solid lightgray; 
   		border-radius: 10px; 
   		overflow-y: auto; 
   	}  
 
  	label {
  		margin-left: 10px;
  	}
	#mine {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: row-reverse;
	}
	#dateDifferenceInput {
	text-align: right;
	border: none;
	}
	#firstAmount{
	text-align: right;
	border: none;
	}
	#differenceday{
	text-align: left;
	border: none;
	}
 </style>
 
 <!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
 
 <!-- 아임포트 스크립트 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	
 <script>
    	
        const IMP = window.IMP; 
        IMP.init("imp47235683"); // 내 가맹점 식별 코드

        function startPayment() {
        	let totalAmount = document.getElementById('dateDifferenceInput').value.replace(",", "");
        	 // 선택된 보험 항목의 id를 가져옴
            let selectedInsuranceId = document.querySelector('input[name="insurance"]:checked').id;
            
            // 해당 id와 일치하는 label 태그를 선택
            let selectedLabel = document.querySelector('label[for="' + selectedInsuranceId + '"]');
            
            // 선택된 label의 텍스트를 가져옴
            let selectedInsuranceText = selectedLabel ? selectedLabel.textContent.trim() : '';
            
            // 선택된 쿠폰의 값 (coupon_id,coupon_discount_amount)
            let couponValue = $('#memberCoupon').val();
            let couponParts = couponValue.split(','); // coupon_id와 coupon_discount_amount 분리
            let couponId = couponParts[1];
            let couponDiscountAmount = couponParts[0];
            console.log("선택된 쿠폰 ID: " + couponId); // 쿠폰 ID 확인
            console.log("선택된 쿠폰 할인 금액: " + couponDiscountAmount); // 쿠폰 할인 금액 확인
            
            IMP.request_pay({
                pg: "html5_inicis", // 결제 과정에 사용될 결제사 이니시스
                pay_method: "card", // 결제 수단
//                 merchant_uid: "payDone_" + new Date().getTime(), // 주문번호 어칼지 고민
                name: "렌트카 예약", // 주문 명 '렌트카 되어있는 곳에 차명 따와야 할듯'
//                 amount: 100, // 금액
                amount: totalAmount, // 찐 금액 이걸로하면 ㄹㅇ 차금액 나옴!
                buyer_email: "${info.member_email}", // 구매자 이메일 필요한가 싶네
//                 buyer_name: '홍길동', // 구매자 이름 가져오기
                buyer_name: "${info.member_name}" // 구매자 이름 가져오기
//                 buyer_tel: '010-1234-5678', // 구매자 전화번호 필요 하려나
//                 buyer_addr: '서울특별시 강남구 삼성동', // 구매자 주소 필요 없을듯
//                 m_redirect_url: 'http://192.168.3.120:8081/billycar/' // 모바일 결제시 리다이렉션될 URL이건 그냥 메인으로 보내면 될듯 이거안쓰고 보내도 될듯
            }, function(rsp) {
                if (rsp.success) {
                	
                	$.ajax({
                		type : "POST",
                		url : "payment",
                		data : {
                			schedule : '${param.schedule}',
                			car_number : '${param.car_number}',
                			payment_result_amount : totalAmount,
                			insurance: selectedInsuranceText,
                			coupon_id : couponId
                		},
                		dataType : "JSON",
                		success : function(response) {
                			if(response) {
        	        			 alert("결제 성공");
        	        			 location.href="./";
                			} else {
                				 alert("헐 실패;");
                			}
                		}
                	
                	})
                	
                } else {
                    alert("결제 취소");
                    
                }
            });
        }
        	
    </script>
	
	
<!-- 	보험 값 받아오는 스크립트  (기존) -->
 	 <script> 
         // 문서 로드 시 이벤트 리스너 추가
         document.addEventListener('DOMContentLoaded', function() {
             let radios = document.querySelectorAll('.insurance_data'); // 모든 라디오 버튼을 선택
             let previousInsuranceCost = 0;
            
             radios.forEach(function(radio) {
                 radio.addEventListener('change', function() { // 라디오 버튼 변경 이벤트
                     if (this.checked) { // 라디오 버튼이 선택된 경우
 						let price = parseInt(this.value); // 선택된 라디오 버튼의 값 가져오기
						
 						document.getElementById('insurance_price').textContent = price.toLocaleString();
 						
 		                // P1의 입력 값 업데이트
 		                let inputField = document.getElementById('dateDifferenceInput');
 						let existingTotal = parseInt(inputField.value.replace(/,/g, ''));
 						let newTotal = existingTotal - previousInsuranceCost + price ;
						
 						inputField.value = newTotal.toLocaleString(); // 총액을 포맷하여 표시
 						document.getElementById('totalAmount').value = newTotal;
						 
 		                previousInsuranceCost = price;
                     }
                 });
             });
        });
   </script>	 

	<script type="text/javascript">
	    let startDate1 = "${fn:split(param.schedule, ',')[0]}";
	    let endDate1 = "${fn:split(param.schedule, ',')[1]}";
		
	    // 문자열 형식 변경
	    let startDate2 = startDate1.replace(" ", "T") + ":00:00";
	    let endDate2 = endDate1.replace(" ", "T") + ":00:00";
	
	    // Date 객체로 변환
	    let startDateObject = new Date(startDate2);
	    let endDateObject = new Date(endDate2);
	
	    // 두 날짜 간의 차이를 밀리초 단위로 계산
	    let differenceInMilliseconds = endDateObject - startDateObject;
	
	    // 밀리초를 일, 시간, 분, 초 단위로 변환
	    let differenceInDays = Math.floor(differenceInMilliseconds / (1000 * 60 * 60 * 24));
	    let differenceInHours = Math.floor((differenceInMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	
	    // 결과 문자열 생성
	    let differenceday = "대여금액(" + differenceInDays + "일 " + differenceInHours+  "시간)" ;
	    let differenceString = 0;
	    if(differenceInHours/4 > 1){
		    differenceString = differenceInDays * ${car.car_dayprice} + ${car.car_dayprice}; 
	    } else{
	    	differenceString = differenceInDays * ${car.car_dayprice} + differenceInHours * ${car.car_hourprice};
	    }	
		
	    
	    // 페이지 로드 후 input 태그에 결과 표시
	    window.onload = function() {
	        document.getElementById('differenceday').value = differenceday.toLocaleString(); 
	        document.getElementById('firstAmount').value = differenceString.toLocaleString(); 
	        document.getElementById('dateDifferenceInput').value = differenceString.toLocaleString(); // toLocaleString() 이거 숫자표시 쉼표 넣어줌
	    };
	    
	    
	</script>
	
	<script>
	$('#memberCoupon').on('change', function() {
		let sale = $('#memberCoupon').val();
	});
	
    $(document).ready(function () {
    	
        // 적용 버튼 클릭 시
        $('#applyCouponBtn').click(function () {
            // 선택한 쿠폰 값을 가져옴
            let selectedCoupon = $('#memberCoupon').val();
            // 쿠폰 값을 오른쪽에 표시
            $('#salePrice').text(selectedCoupon);
        });
    });
    
    
   $('#insurance_price').on('change', function() {
		let insurance_price = $('#insurance_price').val();
	});
   $(document).ready(function () {
	   $('#insurance_price').click(function () {
           // 선택한 쿠폰 값을 가져옴
           let selectedInsurance = $('#insurance_price').val();
           // 쿠폰 값을 오른쪽에 표시
           $('#insurance_price').text(selectedInsurance);
       });
   };
</script>
<script type="text/javascript">
	$(document).ready(function () {
	    let previousCouponDiscount = 0; // 이전 쿠폰 할인 금액 저장
	
	    $('#applyCouponBtn').click(function () {
	        let selectedCouponDiscount = parseInt($('#memberCoupon').val());
	        let totalInput = $('#dateDifferenceInput');
	        let currentTotal = parseInt(totalInput.val().replace(/,/g, ''));
	
	        // 쿠폰 할인 금액을 기존 총 금액에서 빼고 새로운 할인 금액을 더합니다.
	        let newTotal = currentTotal + previousCouponDiscount - selectedCouponDiscount;
	        totalInput.val(newTotal.toLocaleString()); // 새로운 총 금액 포맷하여 표시
	
	        // 할인 금액 표시 업데이트
	        $('#salePrice').text(selectedCouponDiscount.toLocaleString());
	
	        // 새로운 쿠폰 할인 금액 저장
	        previousCouponDiscount = selectedCouponDiscount;
	    });
	});
</script>	
	<!-- 필요데이터  변수 초기화  스크립트--> 
<script type="text/javascript">
	function submitPaymentForm() {
	    // 필요한 데이터 설정
	    let totalAmount = document.getElementById('totalAmount').value;
	    let form = document.getElementById('paymentForm');
	    form.totalAmount.value = totalAmount;

	    // 폼 제출
	    form.submit();
	}
	</script>
 
</head>
<body class="mine">
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
		<div class="row g-5">
		<div class="col-md-7 col-lg-8 " id="paymentMain">
	    <h4 class="subject">예약정보</h4>
	    	<div class="row g-3">
	       		<div class="col-sm-3">
	            	<label>대여날짜</label>
	            </div>
	
	            <div class="col-sm-9">
	            	<input type="text" class="form-control" id="dateInfo"  value="${fn:split(param.schedule, ',')[0]}시" readonly>
	            </div>
	        </div>
	        
	        <div class="row g-3">
	        	<div class="col-sm-3">
	       	    	<label>대여지역</label>
	            </div>
				
	            <div class="col-sm-9">
	            	<input type="text" class="form-control" id="locatrionInfo"  value="${fn:split(param.schedule, ',')[2]}" readonly>
	            </div>
			</div>
			
			<div class="row g-3">
				<div class="col-sm-3">
	            	<label>반납날짜</label>
	            </div>
	
	            <div class="col-sm-9">
	            	<input type="text" class="form-control" id="dateInfo" value="${fn:split(param.schedule, ',')[1]}시" readonly >
	            </div>
				
			</div>
			
			<div class="row g-3">
				<div class="col-sm-3">
	            	<label>반납지역</label>
	            </div>
	
	            <div class="col-sm-9">
	            	<input type="text" class="form-control" id="locatrionInfo" value="${fn:split(param.schedule, ',')[3]}" readonly>
	            </div>
			</div>
			
			<hr>            
	        
		<h4 class="subject">예약자정보</h4>
	        <div class="row gy-3">
	            <div class="col-sm-2">
	              		<label>예약자명</label>
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
								<input name="insurance" class="chk insurance_data" id="insuranceCar0" type="radio" value="0" checked="checked"> 
								<label  for="insuranceCar0">선택안함</label>
							</td>
							<td colspan="1" class="c" >없음</td>
							<td colspan="1" class="c" >없음</td>
							<td colspan="1" class="c" >전액부담</td>
						</tr>
						
						<tr class="insuranceChk" >
							<td colspan="1" class="c" >
								<input name="insurance" class="chk insurance_data" id="insuranceCar1" type="radio" value="15" > 
								<label  for="insuranceCar1">일반자차</label>
							</td>
							<td colspan="1" class="c">1만원</td>
							<td colspan="1" class="c">200만원</td>
							<td colspan="1" class="c">50만원</td>
						</tr>
						
						<tr class="insuranceChk" >
							<td colspan="1" class="c" >
								<input name="insurance" class="chk insurance_data" id="insuranceCar2" type="radio" value="25" >
								<label  for="insuranceCar2"> 완전자차 </label>
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
		<h4 class="subject">결제수단 선택</h4>
			<div class="row">
				<div class="col pay_radio">
					&nbsp;<input type="radio" name="payment" checked>&emsp;신용/체크카드
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
				<div class="col-sm-2">
	            	<label> 
	            		<select class="form-control" id="memberCoupon" name="memberCoupon" style="width: 150px;">
				            <option value="0">선택안함</option>
				            <c:forEach var="ci" items="${couponIssue}">
					            <option value="${ci.coupon_discount_amount},${ci.coupon_id}" id="memberCoupon">${ci.coupon_name}</option>
					            
				            </c:forEach>
			            </select>
	            	</label>
	            </div>
	            <div class="col-sm-10">
	            	<input type="button" value="적용" style="height: 37px;" id="applyCouponBtn" >
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
		            	<jsp:include page="payment_CarRental.jsp" flush="true" />
		            </div>
		        </div>
		        <div class="accordion-item">
		            <h2 class="accordion-header">
		                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		                    개인정보 취급방침
		                </button>
		            </h2>
		            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
	        			<jsp:include page="payment_Privacy.jsp" flush="true" />            	
		            </div>
		        </div>
		    </div>
		</div>
		<div class="col-md-5 col-lg-4 order-md-last" id="paymentSide">
			<h4 class="subject2">결제 정보 확인</h4>
			<div class="container last_check">
				<div>
 					<img src="<%= request.getContextPath() %>/resources/upload/${car.car_img}" width="370" > <!-- 차이미지 받아 오기 --> 
				</div>
				
				<p><b>차량 정보</b></p>
				<div class="row ">
					<div class="col-3">차량</div>
					<div class="col-9 car-name" align="right">${car.car_model}</div>
 					<div class="col-3">기본정보</div> 
 					<div class="col-9" align="right">${car.car_capacity}/${car.gear_type}/${car.car_fuel}</div> 
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
<%-- 					<div class="col-9" align="right"><fmt:formatNumber value="${car.car_dayprice}" pattern="#,###"/></div> --%>
					<div class="col-9" align="right">
						<input type="text" id="firstAmount" readonly/>
					</div>
					<div class="col-3">보험금액</div>
					<div class="col-9 incurance" id="insurance_price" align="right">0</div>
					<div class="col-3">할인금액</div>
					<div class="col-9" align="right" id="salePrice">0</div>
					<hr>
					<div class="col-3">결제 금액(VAT 포함)</div>
					<div class="col-9"  align="right"><input type="text" id="dateDifferenceInput"  readonly/></div>
				
				</div>
				<form action="payment" method="post">
					<input type="hidden" id="totalAmount" name="totalAmount" value="0">
<%-- 					<input type="hidden" name="carNumber" value="${car.car_number}"> --%>
					<input type="button" class="sub_btn w-100 btn btn-primary btn-lg" value="결제하기" onclick="startPayment()" >
				</form>			
			</div>
			</div>
		</div>
	</div>

    
<%-- 	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer> --%>
</body>
</html>