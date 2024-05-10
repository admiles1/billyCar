<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쿠폰함</title>
</head>
<style>
   #coupon {
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
    
     table {
     	margin-top: 50px;
        width: 100%;
        border-collapse: collapse;
        text-align: center;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
</style>
</head>
<body>

<form id="coupon">
    <h2>나의 쿠폰 확인</h2>
    <hr>
    <table>
        <thead>
            <tr>
                <th>쿠폰 이름</th>
                <th>쿠폰 코드</th>
                <th>쿠폰 할인율</th>
                <th>사용 기한</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Coupon123</td>
                <td>10%</td>
                <td>전체 차량</td>
                <td>2024-06-30</td>
            </tr>
            <tr>
                <td>Coupon456</td>
                <td>20%</td>
                <td>SUV</td>
                <td>2024-07-15</td>
            </tr>
            <tr>
                <td>Coupon789</td>
                <td>15%</td>
                <td>경차</td>
                <td>2024-08-20</td>
            </tr>
            <tr>
                <td>CouponABC</td>
                <td>25%</td>
                <td>전기차</td>
                <td>2024-09-10</td>
            </tr>
        </tbody>
    </table>
</form>
</body>
</html>