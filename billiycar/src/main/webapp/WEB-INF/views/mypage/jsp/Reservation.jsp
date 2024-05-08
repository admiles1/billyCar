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
   #resv-confirm {
   		margin-top: 30px;
   	 	background:#fff;
   	 	margin-right:30px;
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
        border: 1px solid #ccc;
        margin-top: 50px;
        text-align: center;
    }
    
    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
        white-space: nowrap; /* 한 줄로 표시되도록 설정 */
    }
    
    th {
        background-color: #f2f2f2;
        text-align: center;
    }
</style>
<script type="text/javascript">
	function showReview(){
		let review_id = document.querySelector("#reviewShow");
		review_id.style.display = 'table-cell';
	}

</script>
</head>
<body>

<form id="resv-confirm">
    <h2>예약내역 확인</h2>
    <hr>
    <table>
        <tr>
            <th>대여일</th>
            <th>반납일</th>
            <th>대여지역</th>
            <th>반납지역</th>
            <th>차량정보</th>
            <th>결제상세내역</th>
            <th>리뷰</th>
        </tr>
        <tr>
            <td>2024-04-21</td>
            <td>2024-04-25</td>
            <td>부산 진구</td>
            <td>부산 남구</td>
            <td>소형차, 자동 기어</td>
            <td>총 결제 금액: 200,000원</td>
            <td><a onclick="showReview()" class="btn btn-sm btn-danger">리뷰쓰기</a></td>
        </tr>
        <tr>
        	<td colspan="8" style="display: none;" id="reviewShow">
        		리뷰란<br>
        		<a onclick="showReview()" class="btn btn-sm btn-primary">작성완료</a>
        	</td>
        </tr>
          <tr>
            <td>2024-05-01</td>
            <td>2024-05-05</td>
            <td>서울 강남구</td>
            <td>서울 송파구</td>
            <td>중형차, 수동 기어</td>
            <td>총 결제 금액: 250,000원</td>
        </tr>
        <tr>
            <td>2024-05-10</td>
            <td>2024-05-15</td>
            <td>대구 중구</td>
            <td>대구 수성구</td>
            <td>대형차, 자동 기어</td>
            <td>총 결제 금액: 350,000원</td>
        </tr>
        <tr>
            <td>2024-05-20</td>
            <td>2024-05-25</td>
            <td>인천 남구</td>
            <td>인천 서구</td>
            <td>소형차, 수동 기어</td>
            <td>총 결제 금액: 180,000원</td>
        </tr>
        <tr>
            <td>2024-06-01</td>
            <td>2024-06-05</td>
            <td>부산 동구</td>
            <td>부산 서구</td>
            <td>중형차, 자동 기어</td>
            <td>총 결제 금액: 270,000원</td>
        </tr>
    </table>
</form>
</body>
</html>