<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.card { margin-bottom: 20px; }
.nav-link { white-space: nowrap; }
.card-text { white-space: nowrap; }
form { max-width: 500px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 10px; background-color: #f8f9fa; }
.form-group { margin-bottom: 20px; }
label { font-weight: bold; }
button[type="submit"] { width: 100%; }
</style>
</head>
<body>
<main class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">관리자 페이지</a>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="sidebar.jsp" />
            <main role="main" class="col-md-10 ml-sm-auto px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">차량 수정</h1>
                </div>
				<form action="carModifyPro" method="post">
				<input type="hidden" name="car_idx" value="${car.car_idx}">
                    <div class="form-group">
                        <label for="pricePerDay">1일 가격</label>
                        <input type="text" class="form-control" id="pricePerDay" name="car_dayprice" value="${car.car_dayprice }" required>
                    </div>
                    <div class="form-group">
                        <label for="hourlyPrice">1시간 가격</label>
                        <input type="text" class="form-control" id="hourlyPrice" name="car_hourprice" value="${car.car_hourprice }" required>
                    </div>
                    <div class="form-group">
                        <label for="carStatus">차량 상태 변경</label>
                        <select id="carStatus" name="car_status" class="form-control" required>
                            <option value="0" >정상</option>
                            <option value="1" >수리중</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">수정</button>
                </form>
            </main>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
