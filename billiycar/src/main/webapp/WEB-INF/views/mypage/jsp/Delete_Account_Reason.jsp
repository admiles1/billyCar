<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴 사유</title>
</head>
<style>
  	#delete-reason {
  		margin-top: 30px;
  		background:#fff;
		border:1px solid #ccc;
		border-radius: 8px;
	    padding: 30px;
		width: 100%;	
		height: 100%;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  	}
  	
    h2 {
        font-size: 32px;
        margin-bottom: 20px;
    }
    
    p {
        margin-bottom: 20px;
    }
    
  	.reason-form {
        display: flex;
        line-height: 30px;
        flex-direction: column;
        align-items: center;
        margin-top: 40px;
    }
    
    .reason-checkbox {
    	display: flex; /* 수정: 내부 요소들을 가로로 정렬하기 위해 flexbox 사용 */
        align-items: center;
        margin-bottom: 15px;
    }
    
    input[type="checkbox"] {
        margin-right: 10px;
        transform: scale(1.5);
    }
    
     label {
       	display: block; /* 수정: label을 블록 요소로 변경 */
       	align-items: center;
       	height: 100%;
    	width: 200px;    
     	flex-shrink: 0;  수정: flex item으로 축소되지 않도록 설정 */
    	line-height: 1.5em; 
    }
    
    label::before {
    	content: "";
   	 	display: inline-block;
   		width: 1em; /* 예시로 조정할 수 있는 값 */
    }
    
    textarea {
        width: 50%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        resize: none;
    }
    
    #delete-reason input[type="submit"] {
        border: none;
		border-radius: 20px;
		font-size: 16px;
		letter-spacing: 1px;
		padding: 7px 0;
		width: 120px;
		background-color: #00AAFF; /* 배경색 지정 */
	    color: white; /* 글자색 지정 */
	    margin-top: 20px;
    }
    
    #delete-reason input[type="submit"]:hover {
        background-color: #555;
    }
</style>
</head>
<body>

<form id="delete-reason" action="MemberWithdraw">
    <h2>회원 탈퇴</h2>
    <hr>
    <p>회원 탈퇴를 진행하기 전에 탈퇴 사유를 선택해주세요.</p>
    <div class="reason-form">
	    <div class="reason-checkbox">
	        <input type="checkbox" id="reason1" value="사유1">
	        <label for="reason1">아이디 및 비밀번호 분실</label>
	    </div>
	    
	    <div class="reason-checkbox">
	        <input type="checkbox" id="reason2" value="사유2">
	        <label for="reason2">개인정보 유출 우려</label>
	    </div>
	    
	    <div class="reason-checkbox">
	        <input type="checkbox" id="reason3" value="사유3">
	        <label for="reason3">서비스 이용 불편</label>
	    </div>
	    
	    <div class="reason-checkbox">
	        <input type="checkbox" id="otherReason">
	        <label for="otherReason">기타</label>
	    </div>
	    
	    <textarea id="otherReasonText" placeholder="기타 사유를 입력해주세요" rows="4"></textarea>
	    
	    <input type="submit" value="다음">
    </div>
</form>

<script>
	document.getElementById('otherReasonText').addEventListener('click', function() {
	    document.getElementById('otherReason').checked = true;
	});

</script>

</body>
</html>