<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<title>면허 정보</title>
<style>
#memberInfo form {
    text-align: center; /* 폼 안의 요소들을 가운데 정렬 */
}

#memberInfo {
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
	
h2 {
	font-size: 32px;
    margin-bottom: 20px;
}	

#memberInfo ul {
	list-style: none;
	padding: 0;
}

#memberInfo ul li {
	display: flex;
	justify-content: center;
	line-height: 30px; 
	padding: 10px 50px; 
	align-items: center;
	margin-bottom: 15px;
}

#memberInfo input[type="text"],
#memberInfo input[type="email"],
#memberInfo input[type="tel"] {
    margin-right: 60px; /* 입력창과 버튼 사이의 간격 조정 */
	width: 350px;
}
			
#memberInfo label {
	font-size: 13px;  /* 글자 크기 - 13px */
	width: 110px;  /* 너비 - 110px */
}

.LicenseInfo_notice {
	border: 1px solid #ccc;
	border-radius: 12px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	line-height: 15px;
	padding: 15px;
}

#memberInfo input[type="submit"] {
    display: block; 
    margin: 0 auto;
    border: none;
    border-radius: 20px;
    font-size: 16px;
    letter-spacing: 1px;
    padding: 7px 20px;
    background-color: #00AAFF;
    color: white;
}

#memberInfo input[type="submit"]:hover {
	 background-color: #555;
}

.LicenseInfo_notice em {
	font-size: 17px; 
	color: blue; 
	letter-spacing: -1px;
}

.contxt-info {
	line-height: 30px;
}

.contxt-info em {
	font-size: 13px; 
	color: red; 
	letter-spacing: -1px;
}   

</style>
</head>
<body>
	<form id="memberInfo">
		<fieldset>
			<h2>면허 정보</h2>
			<hr>
			<div class="LicenseInfo_notice">
			<p><em>${sessionScope.member_id}</em> 님의 면허 정보입니다.</p>
			<p class="contxt-info">
				회원님의 등록된 면허 정보는 아래와 같습니다.<br>
				새롭게 면허 등록 또는 갱신을 원하시면 좌측 사이드바의
				<em>면허 등록 및 갱신</em> 메뉴를 이용해주세요.
			</p>
			</div>
		      <ul>
		      	<li>
		          <label for="licenseNumber">면허 번호</label>
		          <input id="licenseNumber" name="name" type="text" value="${licenseInfo.license_user_id}" readonly>
		        </li>
		      	<li>
		          <label for="licenseType">면허 종류</label>
		          <input id="licenseType" name="type" type="text" value="${licenseInfo.license_name}" readonly>
		        </li>
		        <li>
		          <label for="licenseIssue">발급일</label>
		          <input id="licenseIssue" name="issue" type="email" value="${licenseInfo.license_issue_date}"  readonly>
		        </li>
		         <li>
		          <label for="licenseExpiration">만료일</label>
		          <input id="licenseExpiration" name="Expiration" type="text" value="${licenseInfo.license_expiration_date}" readonly>
		        </li>
		      </ul>
		</fieldset>
	</form>
<script type="text/javascript">
	//면허 번호를 하이픈 구분된 형식으로 변환하는 함수
	function formatLicenseNumber(licenseNumber) {
	    // 숫자를 하이픈으로 구분하여 반환
	    return licenseNumber.slice(0, 2) + '-' + licenseNumber.slice(2, 4) + '-' + licenseNumber.slice(4, 9) + '-' + licenseNumber.slice(9);
	}
	
	// 페이지 로드 시 알림창 띄우기
	window.onload = function() {
	    alert("면허 등록이 완료되었습니다!");
	    var licenseNumberInput = document.getElementById("licenseNumber");
        if (licenseNumberInput) {
            licenseNumberInput.value = formatLicenseNumber(licenseNumberInput.value);
        }
	};
</script>
</body>
</html>