<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>면허 등록</title>
<script src="https://kit.fontawesome.com/ef42a902c7.js" crossorigin="anonymous"></script>
</head>
<style>

#license-register {
	background:#fff;
	border:1px solid #ccc;
	border-radius: 8px;
	padding: 30px;
	width: 100%;	
	height: 75%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
	
h2 {
    font-size: 32px;
    margin-bottom: 20px;
}
    
input[type="password"] {
    width: 50%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}
    
#license-register input[type="submit"] {
	display: block; /* 블록 요소로 지정하여 다른 요소와 가로로 정렬되도록 합니다. */
	margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬합니다. */
  	border: none;
  	border-radius: 20px;
  	font-size: 16px;
  	letter-spacing: 1px;
  	padding: 7px 0;
  	width: 160px;
  	background-color: #00AAFF; /* 배경색 지정 */
  	color: white; /* 글자색 지정 */
 }
   
#license-register input[type="submit"]:hover {
    background-color: #555;
}
    
.license-info {
	margin: 0 auto;
    margin-top: 30px;
    text-align: left;
    width: 100%;
}
    
.license-info label {
    font-size: 15px;
    display: block;
    margin-bottom: 10px;
}
    
.license-info input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}
    
.license-info select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}
    
.license-example {
	padding: 25px;
    background: #f7f7f9;
    border-radius: 8px;
    overflow: hidden;
    text-align: center;
    margin-bottom: 48px;
}
    
#license-image {
   	display: block; /* 이미지를 블록 요소로 설정하여 가운데 정렬을 쉽게 합니다. */
	margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬합니다. */
}
	
.license-notice {
	margin-top: 30px;
	background: #50555C;
	color: #FFF;
    border-radius: 12px;
    margin-bottom: 20px;
}
	
.detail-info {
	display: flex; 
}
	
.notice-text {
	margin: 0 auto;
	padding: 16px;
	display: block;
	font-size: 14px;
	line-height: 24px;
}
	
.notice-text img {
    display: inline-block; 
    vertical-align: middle; 
    margin-right: 8px; 
    width: 35px; 
}
	
#terms {
	margin-top: 10px;
	background:#fff;
	border:1px solid #ccc;
	border-radius: 8px;
    padding: 20px;
	width: 100%;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
	
.view1 a, .view2 a {
	display: inline-block;
	font-size: 14px;
	line-height: 20px;
	color : #50555C;
	text-decoration: underline;
	cursor: pointer;
	float: right;
}

.chk-box input[type="checkbox"] {
    margin-right: 5px; /* 체크박스 오른쪽에 5px의 여백 추가 */
}

/*모달 팝업 영역 스타일링*/
.modal {
    display: none; 
    position: absolute;
    top:0;
    left: 0;
    width: 100%;
    height: 100vh;
    overflow: hidden;
    background: rgba(0,0,0,0.5);
}

.modal.on {
    display: block;
}

.modal .modal_popup {
    position: absolute;
    top: 50%;
    left: 50%;
	width: 550px; 
    transform: translate(-50%, -50%);
    padding: 20px;
    background: #ffffff;
    border-radius: 20px;
}

.modal .modal_popup .close_btn {
    display: block;
    padding: 10px 20px;
    margin: 0 auto;
    margin-top: 50px;
    background-color: #00AAFF;
    border: none;
    border-radius: 10px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}

.modal_content table {
	margin-top: 30px;
    border-collapse: collapse;
    width: 100%;
}

.modal_content th, .modal_content td {
    border: 1px solid #fff;
    padding: 8px;
    text-align: center;
}

.modal_content th {
    background-color: #f2f2f2;
    font-size: 14px;
}

.modal_content td {
    font-size: 12px;
}

.modal_content th:nth-child(2), .modal_content td:nth-child(1) {
    width: 25%; 
}

.modal .modal_popup p {
    margin-top: 60px;
    font-size: 14px;
}

h3 {
	text-align: center;
}

.modal2 {
	z-index: 15;
    display: none; 
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal2 .modal_popup {
    position: relative;
    margin: 10% auto;
    padding: 20px;
    width: 80%;
    max-width: 550px;
    background: #ffffff;
    border-radius: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.modal2 .modal_popup .close_btn2 {
    display: block;
    margin: 20px auto 0;
    padding: 10px 20px;
    background-color: #00AAFF;
    border: none;
    border-radius: 10px;
    color: #fff;
    cursor: pointer;
    transition: box-shadow 0.2s;
}

.modal2 .modal_content table {
    margin-top: 30px;
    border-collapse: collapse;
    width: 100%;
}

.modal2 .modal_content th, .modal2 .modal_content td {
    border: 1px solid #fff;
    padding: 8px;
    text-align: center;
}

.modal2 .modal_content th {
    background-color: #f2f2f2;
    font-size: 14px;
}

.modal2 .modal_content td {
    font-size: 12px;
}

.modal2 .modal_content th:nth-child(2), .modal2 .modal_content td:nth-child(1) {
    width: 25%; 
}

.modal2 .modal_popup p {
    margin-top: 60px;
    font-size: 14px;
}


</style>
</head>
<body>
<div class="license-notice"> 
	<div class="detail-info">
		<p class="notice-text">
			<img src="./resources/mypage_images/caution.png">운전면허정보 저장을 위해 약관 동의를 진행해주세요
		</p>
	</div>
</div>
<form id="license-register" action="license" method="post" onsubmit="return validateForm()">
    <h2>면허 등록 및 갱신</h2>
    <hr>
    <div class="license-example">
    	<img id="license-image" src="./resources/mypage_images/license.png">
    </div>
    
    <div class="license-info">
        <label for="licenseNumber">면허 번호 *</label>
        <input type="text" id="licenseNumber" name="license_user_id" placeholder="면허 번호를 입력하세요" maxlength="12">
        <label for="licenseType">면허 종류 *</label>
        <select id="licenseType" name="license_name">
            <option value="면허 종류">면허 종류를 선택해주세요</option>
            <option value="2종 보통">2종 보통</option>
            <option value="1종 보통">1종 보통</option>
            <option value="1종 보통">1종 대형</option>
            <option value="1종 보통">1종 특수-대형견인차(트레일러)</option>
            <option value="1종 보통">1종 특수-구난차(레커)</option>
            <option value="1종 보통">1종 특수-소형견인차</option>
            <option value="국제 면허">국제 면허</option>
        </select>
        <label for="issueDate">발급일 *</label>
        <input type="text" id="issueDate" name="license_issue_date" placeholder= "발급일을 입력하세요 (예: YYYYMMDD)" maxlength="8">
        <label for="expirationDate">만료일 *</label>
        <input type="text" id="expirationDate" name="license_expiration_date" placeholder="만료일을 입력하세요 (예: YYYYMMDD)" maxlength="8">
        <input type="submit" value="면허 등록 및 갱신">
    </div>
</form>

<form id="terms">
	<div class="agree-check">
		<span class="chk-box">
			<input type="checkbox" id="totalChk">
			<label for="totalChk">
				전체동의
			</label>
		</span>
			<hr>
		<ul class="agree-list">
			<li>
				<span class="chk-box">
					<input type="checkbox" id="agree01" name="chk">
					<label for="agree01">
						개인정보 수집 및 이용 동의(선택)					
					</label>				
				</span>
				<span class="view1">
					<a type="button" class="modal_btn">보기</a>
				</span>
			</li>
			<li>
				<span class="chk-box">
					<input type="checkbox" id="agree02" name="chk">
					<label for="agree02">
						고유식별정보 수집 및 이용 동의(선택)					
					</label>
				</span>
				<span class="view2">
					<a type="button" class="modal_btn2">보기</a>
				</span>
			</li>
		</ul>
	</div>
</form>
<div class="modal">
    <div class="modal_popup">
        <h3>개인정보 수집 및 이용 동의(선택)</h3>
       	<hr>
       	<div class="modal_content">
       		<table>
                <thead>
                    <tr>
                        <th>수집항목</th>
                        <th>수집·이용 목적</th>
                        <th>보유기간</th>
                    </tr>
                </thead>
               	<tbody>
	               	<tr>
		               	<td>
			               	면허종류, 
			               	<br>
			               	면허발급일, 
			               	<br>
			               	면허만료일
		               	</td>
	               		<td>차량대여자격확인</td>
	               		<td class="point">회원탈퇴 후 즉시 또는 계약에 따른 거래관계의 종료 후 5년까지</td>
	            	</tr>
               	</tbody>
            </table>
       	</div>
       	<p class="ft_14 mt16">
       		고객님께서는 동의를 거부할 권리가 있으며, 동의하지 않아도 SK렌탈닷컴 회원서비스 
       		이용이 가능하지만 미리 입력하시면 차량 예약 시 자동으로 입력되어 더욱 간편하게 이용하실 수 있습니다.
       	</p>
        <button type="button" class="close_btn">확인</button>
    </div>
</div>
<div class="modal2">
    <div class="modal_popup">
        <h3>고유식별정보 수집 및 이용 동의(선택)</h3>
        <hr>
        <div class="modal_content">
            <table>
                <thead>
                    <tr>
                        <th>수집항목</th>
                        <th>수집·이용 목적</th>
                        <th>보유기간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>운전면허번호</td>
                        <td>차량대여자격확인</td>
                        <td class="point">회원탈퇴 후 즉시 또는 계약에 따른 거래관계의 종료 후 5년까지</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <p class="ft_14 mt16">
            고객님께서는 동의를 거부할 권리가 있으며, 동의하지 않아도 SK렌탈닷컴 회원서비스 
            이용이 가능하지만 미리 입력하시면 차량 예약 시 자동으로 입력되어 더욱 간편하게 이용하실 수 있습니다.
        </p>
        <button type="button" class="close_btn2">확인</button>
    </div>
</div>
<script>
	function validateForm() {
	    if (!document.getElementById('totalChk').checked) { // 전체동의 체크 확인
	        alert("약관에 동의해주세요.");
	        document.getElementById('terms').scrollIntoView();
	        return false; // 폼 제출 막기
	    }
	    return true; // 약관에 동의했을 때만 제출
	}

    const modal = document.querySelector('.modal');
    const modalOpen = document.querySelector('.modal_btn');
    const modalClose = document.querySelector('.close_btn');
	
    //열기 버튼을 눌렀을 때 모달팝업이 열림
    modalOpen.addEventListener('click',function(){
        modal.style.display = 'block';
    });
    
    
    //확인 버튼을 눌렀을 때 모달팝업이 닫힘
    modalClose.addEventListener('click',function(){
        modal.style.display = 'none';
    });
    const modal2 = document.querySelector('.modal2');
    const modalOpen2 = document.querySelector('.modal_btn2');
    const modalClose2 = document.querySelector('.close_btn2');

    // 보기 버튼을 클릭했을 때 새로운 모달 창이 열림
    modalOpen2.addEventListener('click', function() {
        modal2.style.display = 'block';
    });

    // 확인 버튼을 클릭했을 때 새로운 모달 창이 닫힘
    modalClose2.addEventListener('click', function() {
        modal2.style.display = 'none';
    });
    
    function toggleCheckboxes(checked) {
        // Select all checkboxes except the "전체동의" checkbox
        var checkboxes = document.querySelectorAll('.agree-list input[type="checkbox"]:not(#totalChk)');
        checkboxes.forEach(function(checkbox) {
            checkbox.checked = checked;
        });
    }
    
    // 전체동의 
    document.getElementById('totalChk').addEventListener('change', function() {
        toggleCheckboxes(this.checked);
    });
    
    // 개인정보 동의 
    document.getElementById('agree01').addEventListener('change', function() {
        if (!this.checked) {
            document.getElementById('totalChk').checked = false;
        }
    });

    // 고유식별정보 동의 
    document.getElementById('agree02').addEventListener('change', function() {
        if (!this.checked) {
            document.getElementById('totalChk').checked = false;
        }
    });
    
    modalClose.addEventListener('click',function(){
        modal.style.display = 'none';
        document.getElementById('agree01').checked = true; // 개인정보 동의 체크
    });

    modalClose2.addEventListener('click', function() {
        modal2.style.display = 'none';
        document.getElementById('agree02').checked = true; // 고유식별정보 동의 체크
    });
    
    function OnlyNumbers(input) {
        input.addEventListener('input', function() {
            // 문자 제거
            this.value = this.value.replace(/[^\d]/g, '');
        });
    }

    // 텍스트 상자에 대한 입력 이벤트 처리
    window.addEventListener('DOMContentLoaded', function() {
        var licenseNumberInput = document.getElementById('licenseNumber');
        var issueDateInput = document.getElementById('issueDate');
        var expirationDateInput = document.getElementById('expirationDate');

        OnlyNumbers(licenseNumberInput);
        OnlyNumbers(issueDateInput);
        OnlyNumbers(expirationDateInput);
    });
   
    
    
</script>

</body>
</html>