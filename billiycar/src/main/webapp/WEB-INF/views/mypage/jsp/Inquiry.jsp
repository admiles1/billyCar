<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의내역</title>
</head>
<style>
   #inquiry {
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
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        text-align: center;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }
  	
    
</style>
</head>
<body>

<form id="inquiry">
    <h2>나의 문의 내역</h2>
    <hr>
    <table>
       <thead>
            <tr>
                <th>문의 주제</th>
                <th>문의 제목</th>
                <th>문의 일자</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            	<td>차량예약 관련 문의</td>
                <td>차량 예약에 관한 문의입니다.</td>
                <td>2024-04-29</td>
            </tr>
        </tbody>
    </table>
</form>
</body>
</html>