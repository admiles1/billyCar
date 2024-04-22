<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>현재 예약 내역</title>
</head>
<style>
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
    button {
        padding: 10px 20px;
        font-size: 18px;
        background-color: #FF0000;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }
    button:hover {
        background-color: #CC0000;
    }
</style>
</head>
<body>

<section>
    <h2>회원탈퇴</h2>
    <p>회원탈퇴를 진행하시려면 비밀번호를 입력해주세요.</p>
    <input type="password" id="password" placeholder="비밀번호를 입력하세요">
    <button onclick="withdraw()">회원탈퇴</button>
</section>

<script>
    function withdraw() {
        var password = document.getElementById("password").value;
        
        // 회원탈퇴 로직 추가 필요
    }
</script>
</body>
</html>