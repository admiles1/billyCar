<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>면허 등록</title>
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
        background-color: #006AFF;
        color: #fff;
        border: 1px;
        border-radius: 20px;
        cursor: pointer;
        margin-top: 10px;
    }
    button:hover {
        background-color: #555;
    }
    .license-info {
        margin-top: 30px;
        text-align: left;
        width: 80%;
    }
    .license-info label {
        font-size: 18px;
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
</style>
</head>
<body>

<section>
    <h2>면허 등록 및 갱신</h2>
    <div class="license-info">
        <label for="licenseNumber">면허 번호</label>
        <input type="text" id="licenseNumber" placeholder="면허 번호를 입력하세요">
        
        <label for="expirationDate">만료일</label>
        <input type="text" id="expirationDate" placeholder="만료일을 입력하세요 (예: YYYY-MM-DD)">
        
        <label for="licenseType">면허 종류</label>
        <select id="licenseType">
            <option value="1종 보통">1종 보통</option>
            <option value="2종 보통">2종 보통</option>
        </select>
        
        <button onclick="registerOrUpdateLicense()">면허 등록 또는 갱신</button>
    </div>
</section>

<script>
    function registerOrUpdateLicense() {
        var licenseNumber = document.getElementById("licenseNumber").value;
        var expirationDate = document.getElementById("expirationDate").value;
        var licenseType = document.getElementById("licenseType").value;
        
        // 면허 등록 또는 갱신 로직 추가 필요
    }
</script>

</body>
</html>