<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호입력</title>
</head>
<style>
	#passwd-insert {
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
        font-size: 18px;
        line-height: 1.6;
    }
    
    input[type="password"] {
        width: 50%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    
    #passwd-insert input[type="submit"] {
        border: none;
		border-radius: 20px;
		font-size: 16px;
		letter-spacing: 1px;
		padding: 7px 0;
		width: 90px;
		background-color: #00AAFF; /* 배경색 지정 */
	    color: white; /* 글자색 지정 */
    }
   
    #passwd-insert input[type="submit"]:hover {
        background-color: #555;
    }
    
    .passwd-check {
    	margin-top: 200px;
        display: flex; /* 내부 요소를 가로로 나란히 정렬하기 위해 flexbox 사용 */
       	flex-direction: column; /* 가운데 정렬 */
        align-items: center; /* 세로 가운데 정렬 */
    }
    
</style>
</head>
<body>

<form id="passwd-insert" action="modifyInfo" method="post">
	<h2>회원정보 수정</h2>
	<hr>
    <p>회원정보 수정을 위해 비밀번호를 입력해주세요<p>
    <div class="passwd-check">
    	<input type="password" id="password" name="member_passwd" placeholder="비밀번호를 입력해주세요">
    	<input type="submit" value="완료">	
	</div>
</form>

<script>

</script>

</body>
</html>