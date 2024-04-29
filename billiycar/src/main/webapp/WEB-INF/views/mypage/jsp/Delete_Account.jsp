<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>
</head>
<style>
    #delete-acc {
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
    
   
    input[type="password"] {
        width: 50%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    
    #delete-acc button {
        border: none;
		border-radius: 20px;
		font-size: 16px;
		letter-spacing: 1px;
		padding: 7px 0;
		width: 120px;
		background-color: red; /* 배경색 지정 */
	    color: white; 
    }
    
    #delete-acc button:hover {
        background-color: #555;
    }
    
    .delete-check {
    	margin-top: 200px;
        display: flex; /* 내부 요소를 가로로 나란히 정렬하기 위해 flexbox 사용 */
       	flex-direction: column; /* 가운데 정렬 */
        align-items: center; /* 세로 가운데 정렬 */
    }
</style>
</head>
<body>

<form id="delete-acc" action="logout">
    <h2>회원탈퇴</h2>
    <hr>
    <p>회원탈퇴를 진행하시려면 비밀번호를 입력해주세요.</p>
    <div class="delete-check">
    <input type="password" id="password" placeholder="비밀번호를 입력하세요">
    <button onclick="withdraw()">회원탈퇴</button>
	</div>
</form>

<script>
    function withdraw() {
        var password = document.getElementById("password").value;
        
        // 회원탈퇴 로직 추가 필요
    }
</script>
</body>
</html>