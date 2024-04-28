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
	height: 80%;
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
    
    #license-register button {
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
   
    #license-register button:hover {
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
		background: #50555C;
		color: #FFF;
	    border-radius: 12px;
	    margin-bottom: 20px;
	}
	
	.detail-info {
		display: flex; /* Flexbox를 사용하여 요소를 수직 가운데로 정렬합니다. */
	}
	
	.notice-text {
		margin: 0 auto;
		padding: 16px;
		display: block;
		font-size: 14px;
		line-height: 24px;
	}
	
	.notice-text img {
	    display: inline-block; /* 이미지를 텍스트와 인라인 요소로 배치합니다. */
	    vertical-align: middle; /* 이미지를 텍스트의 가운데에 위치시킵니다. */
	    margin-right: 8px; /* 이미지와 텍스트 사이의 간격을 조절합니다. */
	    width: 35px; /* 이미지의 너비를 조절합니다. */
	}
	
	#terms {
		margin-top: 20px;
		background:#fff;
		border:1px solid #ccc;
		border-radius: 8px;
	    padding: 30px;
		width: 100%;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	.view1 a {
		display: inline-block;
		font-size: 14px;
		line-height: 20px;
		color : #50555C;
		text-decoration: underline;
		cursor: pointer;
		margin-left: 485px;
	}
	
	.view2 a {
		display: inline-block;
		font-size: 14px;
		line-height: 20px;
		color : #50555C;
		text-decoration: underline;
		cursor: pointer;
		margin-left: 453px;
	}
	
</style>
</head>
<body>
<div class="license-notice"> 
	<div class="detail-info">
		<p class="notice-text">
			<img src="../images/caution.png">운전면허정보 저장을 위해 약관 동의를 진행해주세요
		</p>
	</div>
</div>
<form id="license-register">
    <h2>면허 등록 및 갱신</h2>
    <hr>
    <div class="license-example">
    	<img id="license-image" src="../images/license.png">
    </div>
    
    <div class="license-info">
        <label for="licenseType">면허 종류 *</label>
        <select id="licenseType">
            <option value="1종 보통">1종 보통</option>
            <option value="2종 보통">2종 보통</option>
        </select>
        <label for="licenseNumber">면허 번호 *</label>
        <input type="text" id="licenseNumber" placeholder="면허 번호를 입력하세요">
        <label for="issueDate">발급일 *</label>
        <input type="text" id="issueDate" placeholder= "발급일을 입력하세요 (예: YYYY-MM-DD)">
        <label for="expirationDate">만료일 *</label>
        <input type="text" id="expirationDate" placeholder="만료일을 입력하세요 (예: YYYY-MM-DD)">
        <button onclick="registerOrUpdateLicense()">면허 등록 및 갱신</button>
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
					<a>보기</a>
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
					<a>보기</a>
				</span>
			</li>
		</ul>
	</div>
</form>

<script>
    function registerOrUpdateLicense() {
        var licenseNumber = document.getElementById("licenseNumber").value;
        var expirationDate = document.getElementById("expirationDate").value;
        var licenseType = document.getElementById("licenseType").value;
        
      
    }
</script>

</body>
</html>