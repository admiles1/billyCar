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
 <script src="https://kit.fontawesome.com/ef42a902c7.js" crossorigin="anonymous"></script>
 <style type="text/css">
	
	h4.subject {
        font-size: 20px;
        font-weight: bold;
        color: #007bff;
        padding-bottom: 10px;
        border-bottom: 2px solid #007bff;
        margin-top: 30px;
        margin-bottom: 10px;
    }

	#reservDetailInfo {
		margin-top: 30px;
		background:#fff;
		border:1px solid #ccc;
		border-radius: 8px;
	    padding: 30px;
		width: 100%;	
		height: 100%;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    align-items: center;
	}
	
	  .input-group-text {
        width: 40px; /* 원하는 너비로 설정 */
        background-color: transparent; /* 배경색 제거 */
        border: 1px solid #ced4da; /* 테두리 적용 */
        border-right: none; /* 오른쪽 테두리 제거 */
        display: flex;
        justify-content: center;
        align-items: center;
        border-top-left-radius: 0.25rem; /* 왼쪽 위 모서리 둥글게 */
        border-bottom-left-radius: 0.25rem; /* 왼쪽 아래 모서리 둥글게 */
    }

    .input-group .form-control {
        border-left: none; /* 왼쪽 테두리 제거 */
        border-top-right-radius: 0.25rem; /* 오른쪽 위 모서리 둥글게 */
        border-bottom-right-radius: 0.25rem; /* 오른쪽 아래 모서리 둥글게 */
    }

    .input-group {
        display: flex;
        width: 100%;
    }
	
	.list-table-v02 {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
	
	 .list-table-v02 th, .list-table-v02 td {
        padding: 10px;
        text-align: center;
        border: 1px solid #dee2e6;
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

	 .list-table-v02 th {
        background-color: #f8f9fa;
        border-bottom: 2px solid #dee2e6;
    }

	#paymentSide{  
		margin-top: 30px;
 		position:fixed;  
  		left:1190px; top:230px;  
   		width: 410px;  
   		height: 600px;  
		background:#fff;
		border:1px solid #ccc;
		border-radius: 8px;
	    padding: 30px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    align-items: center;
  	} 
  	
  	label {
  		margin-left: 10px;
  		height: 38px; /* input의 높이와 맞추기 */
        line-height: 38px; /* input의 높이와 맞추기 */
  	}
  	
  	

 </style>
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
		<div class="row g-5">
		<div class="col-md-7 col-lg-8">
		<form id="reservDetailInfo">
			<fieldset>
				<h2>예약상세 정보</h2>
			<hr>
		    <h4 class="subject">예약정보</h4>
		    	<div class="row g-3">
		       		<div class="col-sm-3">
		            	<label>대여날짜</label>
		            </div>
		             <div class="col-sm-9">
		             	<div class="input-group">
			            	<span class="input-group-text"><i class="fa-solid fa-clock"></i></span>
	                    	<input type="text" class="form-control" id="pickupDate" value="${fn:replace(reservDetails[0].reserv_pickupdate, 'T', ' ')}" readonly>
	                	</div>
	                </div>
		        </div>
		        
		        <div class="row g-3">
		        	<div class="col-sm-3">
		       	    	<label>대여지역</label>
		            </div>
		             <div class="col-sm-9">
				        <div class="input-group">
				            <span class="input-group-text"><i class="fa-solid fa-location-dot"></i></span>
				            <input type="text" class="form-control" id="locationInfo" value="${reservDetails[0].reserv_pickuplocation}" readonly>
				        </div>
					</div>
				</div>
				<div class="row g-3">
					<div class="col-sm-3">
		            	<label>반납날짜</label>
		            </div>
		            <div class="col-sm-9">
		            	<div class="input-group">
			            	<span class="input-group-text"><i class="fa-solid fa-clock"></i></span>
		                    <input type="text" class="form-control" id="returnDate" value="${fn:replace(reservDetails[0].reserv_returndate, 'T', ' ')}" readonly>
	                	</div>
	                </div>
				</div>
				
				<div class="row g-3">
					<div class="col-sm-3">
		            	<label>반납지역</label>
		            </div>
		            <div class="col-sm-9">
		            	<div class="input-group">
				            <span class="input-group-text"><i class="fa-solid fa-location-dot"></i></span>
		            		<input type="text" class="form-control" id="locatrionInfo" value="${reservDetails[0].reserv_returnlocation}" readonly>
		            	</div>
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
				            <td colspan="1" class="c">15원</td>
				            <td colspan="1" class="c">200만원</td>
				            <td colspan="1" class="c">50만원</td>
				        </tr>
				        
				        <tr class="insuranceChk" id="insuranceFull">
				            <td colspan="1" class="c">
				                <input name="insurance" class="chk insurance_data" id="insuranceCar2" type="radio" value="26000"
				                ${reservDetails[0].reserv_insurance == 2 ? 'checked="checked"' : ''} disabled>
				                <label>완전자차</label>
				            </td>
				            <td colspan="1" class="c">25원</td>
				            <td colspan="1" class="c">200만원</td>
				            <td colspan="1" class="c">없음</td>
				        </tr>
				    </tbody>
				</table>
			</div>	
			</fieldset>
		 </form>
	</div>		
			</div>
			</div>
			 <div class="col-md-5 col-lg-4 order-md-last" id="paymentSide">
                <h4 class="subject2">결제 정보 확인</h4>
                <div class="container last_check">
                    <div>
                        <img src="<%= request.getContextPath() %>/resources/upload/${reservDetails[0].car_img}" width="370">
                    </div>
                    
                    <p><b>차량 정보</b></p>
                    <div class="row">
                        <div class="col-3">차량모델</div>
                        <div class="col-9 car-name" align="right">${reservDetails[0].brand_name} ${reservDetails[0].model_name}</div>
                        <div class="col-3">차량번호</div>
                        <div class="col-9 car-name" align="right">${reservDetails[0].car_number}</div>
                        <div class="col-3">승차인원</div> 
                        <div class="col-9" align="right">${reservDetails[0].car_capacity}</div>
                        <div class="col-3">연식</div>
                        <div class="col-9" align="right">${fn:substring(reservDetails[0].car_year, 0, 4)}</div>
                        <div class="col-3">제한나이</div>
                        <div class="col-9" align="right">만23세 이상</div>
                        <div class="col-3">운전경력</div>
                        <div class="col-9" align="right">면허취득 1년이상</div>
                    </div>
                    <br>
                    <h6><b>결제 정보</b></h6>
                    <div class="row">
                        <div class="col-3">결제수단</div>
                        <div class="col-9" align="right">신용/체크카드</div>
                        <div class="col-7">총 대여시간</div>
                        <div class="col-5" id="total_rental_time" align="right"></div>
                        <div class="col-3">보험금액</div>
                        <div class="col-9 incurance" id="insurance_price" align="right">
                            <c:choose>
                                <c:when test="${reservDetails[0].reserv_insurance == 0}">
                                    (+)0 원
                                </c:when>
                                <c:when test="${reservDetails[0].reserv_insurance == 1}">
                                    (+)15 원
                                </c:when>
                                <c:when test="${reservDetails[0].reserv_insurance == 2}">
                                    (+)25 원
                                </c:when>
                            </c:choose>
                        </div>
                        <!-- <div class="col-3">할인금액</div> -->
                        <!-- <div class="col-9" align="right">할인금액 표시</div> -->
                        <hr>
                        <div class="col-7">결제금액(VAT 포함)</div>
                        <div class="col-5" id="total_payment" align="right">
                            ${reservDetails[0].payment_result_amount} 원
                        </div>
                    </div>
                </div>
			</div>
	<script type="text/javascript">

    document.addEventListener('DOMContentLoaded', function() {
        var reservInsurance = ${reservDetails[0].reserv_insurance};
        var insurancePrice = 0;

        if (reservInsurance == 1) {
            insurancePrice = 10000;
        } else if (reservInsurance == 2) {
            insurancePrice = 26000;
        }

        let paymentResultAmount = ${reservDetails[0].payment_result_amount};
        let totalPaymentAmount = paymentResultAmount;

        document.getElementById('total_payment').innerText = totalPaymentAmount.toLocaleString() + " 원";
        document.getElementById('insuranceNone').style.display = reservInsurance == 0 ? '' : 'none';
        document.getElementById('insuranceGeneral').style.display = reservInsurance == 1 ? '' : 'none';
        document.getElementById('insuranceFull').style.display = reservInsurance == 2 ? '' : 'none';
        
        let pickupDateStr = "${reservDetails[0].reserv_pickupdate}";
        let returnDateStr = "${reservDetails[0].reserv_returndate}";

        // Date 객체로 변환합니다.
        let pickupDate = new Date(pickupDateStr);
        let returnDate = new Date(returnDateStr);

        // 대여시간과 반납시간의 차이
        let timeDiff = returnDate - pickupDate;

        // 밀리초에서 시간으로 변환
        let totalHours = Math.floor(timeDiff / (1000 * 60 * 60));
        
        let totalRentalTimeStr = "";
        if (totalHours < 24) {
            totalRentalTimeStr = totalHours + "시간";
        } else {
            let days = Math.floor(totalHours / 24);
            let remainingHours = totalHours % 24;
            totalRentalTimeStr = days + "일";
            if (remainingHours > 0) {
                totalRentalTimeStr += " " + remainingHours + "시간";
            }
        }

        // 총 대여시간 표시
        document.getElementById('total_rental_time').innerText = totalRentalTimeStr;
	    
// 	    let rentalFirstPrice = 0; 
	    
// 	    if(Interger.parseInt(totalRentalTimeStr)/4 > 1){
// 	    	Interger.parseInt(days) = totalRentalTimeStr
// 	    	'${reservDetails[0].car_dayprice}' * 	
// 	    } else{
// 	    	totalRentalTimeStr
// 	    }
        
    });
    
   
    
    
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>