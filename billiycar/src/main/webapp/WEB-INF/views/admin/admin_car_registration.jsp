<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 등록</title>
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
                    <h1 class="h2">차량 등록</h1>
                </div>
                <form action="carUpload" method="get">
                    <div class="form-group">
                        <label for="manufacturer">제조사</label>
                        <select id="manufacturer" class="form-control" required>
                            <option value="">제조사를 선택하세요</option>
                            <option value="hyundai">현대</option>
                            <option value="kia">기아</option>
                            <option value="chevrolet">쉐보레</option>
                            <option value="bmw">BMW</option>
                            <option value="toyota">토요타</option>
                            <option value="nissan">닛산</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="model">모델</label>
                        <select id="model" class="form-control" required>
                            <option value="">모델을 선택하세요</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="name">이름</label> <input type="text" class="form-control" id="name" placeholder="이름을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="year">연식</label> <input type="text" class="form-control" id="year" placeholder="연식을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="release">출고</label> <input type="text" class="form-control" id="release" placeholder="출고 정보를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="fuel">연료</label> <input type="text" class="form-control" id="fuel" placeholder="연료 정보를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="number">차량 번호</label> <input type="text" class="form-control" id="number" placeholder="차량 번호를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="price">가격</label> <input type="text" class="form-control" id="price" placeholder="가격을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="image">차량 이미지</label>
                        <input type="file" class="form-control" id="image" name="image">
                        <input type="file" class="form-control" id="image1" name="image1">
                        <input type="file" class="form-control" id="image2" name="image2">
                        <input type="file" class="form-control" id="image3" name="image3">
                        <input type="file" class="form-control" id="image4" name="image4">
                        <input type="file" class="form-control" id="image5" name="image5">
                    </div>
                    <button type="submit" class="btn btn-primary d-block mx-auto">등록</button>
                </form>
            </main>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('#manufacturer').change(function() {
        var manufacturer = $(this).val();
        var models = {
            hyundai: ["소나타", "그랜저", "아이오닉", "팰리세이드"],
            kia: ["K5", "스팅어", "니로", "셀토스"],
            chevrolet: ["말리부", "트래버스", "스파크", "콜로라도"],
            bmw: ["320i", "520i", "X3", "X5"],
            toyota: ["캠리", "프리우스", "RAV4", "하이랜더"],
            nissan: ["알티마", "맥시마", "로그", "리프"]
        };
        var selectedModel = models[manufacturer];
        $('#model').empty();
        $.each(selectedModel, function(index, value) {
            $('#model').append($('<option>').text(value).attr('value', value));
        });
    });
});
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
