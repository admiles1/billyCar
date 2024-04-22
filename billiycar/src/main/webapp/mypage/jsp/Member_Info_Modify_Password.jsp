<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
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
    input[type="password"],
    input[type="text"] {
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
        background-color: #006AFF;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }
    button:hover {
        background-color: #555;
    }
</style>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>

<section>
    <h2>비밀번호 변경</h2>
    <input type="password" id="currentPassword" placeholder="현재 비밀번호">
    <input type="password" id="newPassword" placeholder="새로운 비밀번호">
    <input type="password" id="confirmPassword" placeholder="새로운 비밀번호 확인">
    <div class="g-recaptcha" data-sitekey="YOUR_SITE_KEY"></div>
    <button onclick="changePassword()">비밀번호 변경</button>
</section>

<script>
    function changePassword() {
        var currentPassword = document.getElementById("currentPassword").value;
        var newPassword = document.getElementById("newPassword").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        
        // 자동입력방지문자 확인
        grecaptcha.ready(function() {
            grecaptcha.execute('YOUR_SITE_KEY', {action: 'submit'}).then(function(token) {
                // 비밀번호 변경 로직 추가 필요
            });
        });
    }
</script>

</body>
</html>