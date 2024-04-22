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
    table {
        width: 80%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
        white-space: nowrap; /* 한 줄로 표시되도록 설정 */
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>

<section>
    <h2>현재 예약 내역 확인</h2>
    <table>
        <tr>
            <th>대여일</th>
            <th>반납일</th>
            <th>대여지역</th>
            <th>반납지역</th>
            <th>차량정보</th>
            <th>결제상세내역</th>
        </tr>
        <tr>
            <td>2024-04-21</td>
            <td>2024-04-25</td>
            <td>부산 진구</td>
            <td>부산 남구</td>
            <td>소형차, 자동 기어</td>
            <td>총 결제 금액: 200,000원</td>
        </tr>
        <!-- 여기에 추가 예약 내역을 반복적으로 추가할 수 있습니다 -->
    </table>
</section>
</body>
</html>