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
    body {
        font-family: "Noto Sans KR", sans-serif;
        margin: 0;
        padding: 0;
    }
    header {
        color: #006AFF;
        padding: 20px;
        text-align: left;
        border-bottom: 3px solid #797979;
        margin-bottom: 20px; 
        padding-bottom: 4px;
        margin-top: 30px;
        margin-left: 10px;
        margin-right: 10px;
        font-size: 21px;
        font-weight: 600;
         font-family: 'NotoKrB';
    }
    section {
        padding: 20px;
        border: 2px solid #797979;
        border-radius: 10px;
        height: 750px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    h1 {
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
    button {
        padding: 10px 20px;
        font-size: 18px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px; /* 버튼과 입력란 사이의 간격 조정 */
    }
    button:hover {
        background-color: #555;
    }
</style>
</head>
<body>

<header>
    <h4>회원정보 수정</h4>
</header>

<section>
    <h2>회원정보 수정을 위해 비밀번호를 입력해주세요</h2>
    <input type="password" id="password" placeholder="비밀번호를 입력하세요">
    <button onclick="checkPassword()">다음</button>
</section>

<script>
    function checkPassword() {
        var password = document.getElementById("password").value;
        // 비밀번호 확인 로직 추가 필요
       
    }
</script>


</body>
</html>