<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<!-- 부트스트랩 CSS 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Font Awesome 아이콘 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- Chart.js CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/chart.js">
<!-- 관리자 페이지 스타일 -->
<style>
  /* 추가적인 스타일링 */
  .card {
    margin-bottom: 20px;
  }
   /* 추가적인 스타일링 */
  .nav-link {
    white-space: nowrap;
  }
  .card-text {
    white-space: nowrap;
  	
  }
  .form-group {
  	padding : 10px;
  	text-align: center;
  }
  
</style>
</head>
<body>
<main class="container">


    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
<!--         <a class="navbar-brand" href="#">관리자 페이지</a> -->
    </nav>


      <!-- 메인 컨텐츠 영역 -->
      <main role="main" class="col-md-10 col-lg-10 ml-sm-auto px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
           <h1 class="h2">쿠폰 등록</h1>
        </div>

       <!-- 메인 페이지의 내용 추가 -->
		<div class="container">
		  <div class="row">
		    <div class="col-md-8 offset-md-2">
		      <div class="card">
		        <div class="card-body">
		          <h5 class="card-title" style="text-align: center">쿠폰</h5>
		          
		          <form action="couponAdd" method="post">
		          
		            <!-- 쿠폰이름 -->
		            <div class="form-group">
		              <label for="inquiry">쿠폰 이름</label><input type="text" placeholder="쿠폰 이름을 입력하세요" required="required" name="coupon_name">
		            </div>
		            
		            <!-- 쿠폰 번호 -->
		            <div class="form-group">
		              <label for="response">쿠폰 코드</label> <input type="text" placeholder="쿠폰코드를 입력하세요" required="required" name="coupon_code">
		            </div>
		            
		            <!-- 쿠폰 할인율 -->
		            <div class="form-group">
		              <label for="response">할인 금액</label> <input type="text" placeholder="금액을 입력하세요" required="required" name="coupon_discount_amount" style="width:200px">
		            </div>
		            
		            <!-- 제출 버튼 -->
		            <div class="form-group text-center">
			            <button type="submit" class="btn btn-primary">쿠폰 등록하기</button>
		            </div>
		          </form>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
        
        
        
      </main>
    </div>
  </div>
</main>
  <!-- jQuery, Popper.js, 부트스트랩 JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- Chart.js JS -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>