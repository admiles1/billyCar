<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<title>Main Area</title>
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
    
  
    .input-group {
        display: flex;
        align-items: center;
        justify-content: space-between; /* 입력창과 버튼을 각각 왼쪽과 오른쪽에 배치 */
        margin-bottom: 20px;
    }
    
    .input-group label {
        margin-right: 10px;
    }
    
    .input-group input {
        flex: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        width: 40px; /* 입력창의 너비를 30%로 조정 */
    }
    
    .input-group button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #006AFF;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    
    
        .input-group + .input-group {
        margin-top: 30px;
    }
    
</style>
</head>
<body>

<header>
    <h4>회원정보 수정</h4>
</header>

<section>
   <h2>Enter Details</h2>
    <div class="input-group">
        <label for="name">이름</label>
        <input type="text" id="name" placeholder="Your Name">
    </div>
    <div class="input-group">
        <label for="email">이메일</label>
        <input type="email" id="email" placeholder="Your Email">
        <button onclick="changeEmail()">이메일 변경</button>
    </div>
    <div class="input-group">
        <label for="phone">전화번호</label>
        <input type="tel" id="phone" placeholder="Your Phone Number">
        <button onclick="changePhoneNumber()">전화번호 변경</button>
    </div>
</section>

<script>
    function changeEmail() {
        // 이메일 변경 로직을 추가하세요
    }
    
    function changePhoneNumber() {
        // 전화번호 변경 로직을 추가하세요
    }
</script>

</body>
</html>