<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.subject{
		color:  #00AAFF;
	}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰</title>
    
<!--     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<div class="container">
    	<h1 class="subject mt-5 mb-3" style="text-align: center; margin-bottom: 50px;">리뷰</h1>
    	
    <!-- 검색창 -->
    <div class="card noto-sans-kr" style="margin-top: 20px; margin-bottom: 50px;">
    <div class="card-body">	
        <form>
            <div class="mb-2 row">
                <label for="carType" class="col-sm-2 col-form-label" style="text-align: center;">차량 종류</label>
                <div class="col-sm-4">
                    <select class="form-select form-select-sm" id="carType">
                         <option selected>차종 선택</option>
                         <option value="sedan">Sedan</option>
                         <option value="suv">SUV</option>
                         <option value="hatchback">Hatchback</option>
                    </select>
                </div>
                <label for="carType" class="col-sm-2 col-form-label" style="text-align: center;">검색순</label>
                <div class="col-sm-4">
                    <select class="form-select form-select-sm" id="carType">
                        <option selected>최신순</option>
                        <option value="sedan">별점순</option>
                        <option value="suv">조회순</option>
                    </select>
                </div>
            </div>
            <div class="mb-2 row">
                <label for="searchText" class="col-sm-2 col-form-label" style="text-align: center;">차량 검색</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control form-control-sm" id="searchText" placeholder="차량 검색">
                </div>
            </div>
            <div style="margin-top: 8px; text-align: center;">
                <button type="submit" class="btn btn-primary" style="width: 100px;">검색</button>
            </div>
        </form>
    </div>
	</div>
    	
    	
    <!-- 검색창 -->
    	
    	<div class="row">
        	<div class="col-md-3">
        		<div class="card">
                	<img src="./resources/main_images/rewiewCar1.png" class="card-img-top" alt="리뷰 이미지 1" width="300" height="300">
                    <div class="card-body">
                    	<h5 class="card-title">bmw i4</h5>
                    	<h5 class="card-title"><img src="./resources/main_images/star5.png"/></h5>
                    	<p class="card-text">좋아요</p>
                    	<div class="card-footer">
							<small class="text-body-secondary">admin 고객님</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="./resources/main_images/rewiewCar2.png" class="card-img-top" alt="리뷰 이미지 2" width="300" height="300">
					<div class="card-body">
                    	<h5 class="card-title">bmw i4</h5>
                    	<h5 class="card-title"><img src="./resources/main_images/star5.png"/></h5>
                    	<p class="card-text">좋아요</p>
                    	<div class="card-footer">
							<small class="text-body-secondary">admin 고객님</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="./resources/main_images/rewiewCar3.png" class="card-img-top" alt="리뷰 이미지 1" width="300" height="300">
					<div class="card-body">
                    	<h5 class="card-title">bmw i4</h5>
                    	<h5 class="card-title"><img src="./resources/main_images/star5.png"/></h5>
                    	<p class="card-text">좋아요</p>
                    	<div class="card-footer">
							<small class="text-body-secondary">admin 고객님</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<img src="./resources/main_images/rewiewCar4.png" class="card-img-top" alt="리뷰 이미지 1" width="300" height="300">
					<div class="card-body">
                    	<h5 class="card-title">bmw i4</h5>
                    	<h5 class="card-title"><img src="./resources/main_images/star5.png"/></h5>
                    	<p class="card-text">좋아요</p>
                    	<div class="card-footer">
							<small class="text-body-secondary">admin 고객님</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!-- 부트스트랩 자바스크립트 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>