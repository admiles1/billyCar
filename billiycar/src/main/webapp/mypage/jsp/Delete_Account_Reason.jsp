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
   section {
        padding: 20px;
        border: 2px solid #797979;
        border-radius: 10px;
        height: auto;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    h2 {
        font-size: 32px;
        margin-bottom: 20px;
    }
    p {
        margin-bottom: 20px;
    }
    .reason-checkbox {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    input[type="checkbox"] {
        margin-right: 10px;
    }
    textarea {
        width: 50%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        resize: none;
    }
    button {
        padding: 10px 20px;
        font-size: 18px;
        background-color: #333;
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
</head>
<body>

<section>
    <h2>회원 탈퇴</h2>
    <p>회원 탈퇴를 진행하기 전에 탈퇴 사유를 선택해주세요.</p>
    
    <div class="reason-checkbox">
        <input type="checkbox" id="reason1" value="사유1">
        <label for="reason1">사유 1</label>
    </div>
    
    <div class="reason-checkbox">
        <input type="checkbox" id="reason2" value="사유2">
        <label for="reason2">사유 2</label>
    </div>
    
    <div class="reason-checkbox">
        <input type="checkbox" id="reason3" value="사유3">
        <label for="reason3">사유 3</label>
    </div>
    
    <div class="reason-checkbox">
        <input type="checkbox" id="reason4" value="사유4">
        <label for="reason4">사유 4</label>
    </div>
    
    <div class="reason-checkbox">
        <input type="checkbox" id="otherReason">
        <label for="otherReason">기타</label>
    </div>
    
    <textarea id="otherReasonText" placeholder="기타 사유를 입력해주세요" rows="4"></textarea>
    
    <button onclick="goToNextPage()">다음</button>
</section>

<script>
    function goToNextPage() {
        // 다음 페이지로 이동하는 로직 추가 필요
        alert("다음 페이지로 이동합니다.");
    }
</script>

</body>
</html>