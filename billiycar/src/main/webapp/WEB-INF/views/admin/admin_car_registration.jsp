<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
                <!-- 폼의 method를 POST로 변경하여 데이터 보안 강화 -->
                <form action="carUpload" method="post" enctype="multipart/form-data" onsubmit="submitForm()">
                    <div class="form-group">
                        <label for="manufacturer">제조사</label>
                        <div class="form-group">
                            <select id="manufacturer" name="car_brand" class="form-control" required>
                                <option value="">제조사를 선택하세요</option>
                                <c:forEach var="brand" items="${brands}">
                                    <option value="${brand.code }">${brand.name }</option>
                                </c:forEach>
                            </select>
                            <button type="button" class="btn btn-primary ml-1" onclick="openAddBrandWindow()">추가</button>
                            <button type="button" class="btn btn-danger ml-1" onclick="deleteNewCar()">삭제</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="model">모델</label>
                        <select id="model" name="car_model" class="form-control" required disabled>
                            <option value="">모델을 선택하세요</option>
                        </select>
						<button type="button" class="btn btn-primary ml-1" onclick="openAddModelWindow('${brand.name }')">추가</button>
						<button type="button" class="btn btn-danger ml-1" onclick="deleteNewModel()">삭제</button>
                    </div>
                    <div class="form-group">
                        <label for="carType">차량 종류</label>
                        <select id="carType" name="car_type" class="form-control" required>
                            <option value="">차량 종류를 선택하세요</option>
                            <c:forEach var="type" items="${types}">
                                <option value="${type.code }">${type.name }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="year">연식</label>
                        <select id="year" name="car_year" class="form-control" required>
                            <option value="">연식을 선택하세요</option>
                            <script>
                                for (let year = new Date().getFullYear(); year >= 2010; year--) { // 현재 연도부터 2010년까지
                                    document.write('<option value="' + year + '">' + year + '년</option>');
                                }
                            </script>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="fuel">연료</label>
                        <select id="fuel" name="car_fuel" class="form-control" required>
                            <option value="">연료를 선택하세요</option>
                            <c:forEach var="fuel" items="${fuels}">
                                <option value="${fuel.code }">${fuel.name }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group d-flex align-items-center justify-content-start">
                        <label for="number1" class="mr-2">차량번호 :</label>
                        <input type="text" class="form-control mr-2" id="number1" name="car_number1" placeholder="12" required maxlength="2" style="width: 80px;">
                    
                        <select id="numberPlateLetter" class="form-control mr-2" name="car_number2" required style="width: 70px;">
                            <option value="하">하</option>
                            <option value="호">호</option>
                            <option value="허">허</option>
                        </select>
                    
                        <input type="text" class="form-control" id="number2" name="car_number3" placeholder="3456" required maxlength="4" style="width: 100px;">
                    </div>
                    <div class="form-group">
                        <label for="pricePerDay">1일 가격</label>
                        <input type="text" class="form-control" id="pricePerDay" name="car_dayprice" placeholder="1일 가격을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="hourlyPrice">1시간 가격</label>
                        <input type="text" class="form-control" id="hourlyPrice" name="car_hourprice" placeholder="1시간 가격을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="image">차량 이미지</label>
                        <!-- 여러 이미지를 업로드할 수 있도록 수정 -->
                        <input type="file" class="form-control" id="image" name="mfc_img" multiple> <!-- multiple 속성 추가 -->
                    </div>
                    <div class="form-group">
                        <label for="gearType">기어 타입</label>
                        <select id="gearType" name="gear_type" class="form-control" required>
                            <option value="">기어 타입을 선택하세요</option>
                            <option value="0">자동</option>
                            <option value="1">수동</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="maxPassenger">최대 인원 수</label>
                        <!-- min과 max를 사용하여 최소값과 최대값을 지정하고, step을 사용하여 값이 얼마나 증가 또는 감소할지를 설정 -->
                        <input type="number" id="maxPassenger" name="car_capacity" class="form-control" min="1" max="20" step="1" placeholder="최대 인원 수를 입력하세요" required>
                    </div>
                    <button type="submit" class="btn btn-primary d-block mx-auto">등록</button>
                </form>
            </main>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
	    let models = JSON.parse('${models}');
	
	    // 제조사 선택 시 모델 드롭다운 업데이트
	    $('#manufacturer').change(function() {
	        var selectedBrand = $(this).val();
	        var filteredModels = models.filter(function(model) {
	            return model.code.startsWith(selectedBrand);
	        });
	
	        $('#model').empty().append('<option value="">모델을 선택하세요</option>');
	        $.each(filteredModels, function(index, model) {
	            $('#model').append($('<option>').text(model.name).attr('value', model.code));
	        });
	        $('#model').prop('disabled', false); // 모델 선택 활성화
	    });
	});
	
	function openAddBrandWindow() {
	    window.open('${pageContext.request.contextPath}/addBrand', 'newwindow', 'width=400,height=400');
	}
	
	function openAddModelWindow(brand) {
		var brandSelect = document.getElementById("manufacturer");
	    var brandName = brandSelect.options[brandSelect.selectedIndex].text;
	// 	console.log("현재선택된 제조사 : " + brandName);
	    window.open('${pageContext.request.contextPath}/addModel?brand='+brandName, 'newwindow', 'width=400,height=400');
	}
	
	function deleteNewCar() {
		var selectedCar = document.getElementById('manufacturer').value;
// 		console.log(selectedCar); // code 값 나옴
		if(selectedCar){ // 값이 있을경우에만
			console.log(selectedCar); // code 값 나옴
			$.ajax({
				type : "POST",
				url : "deleteNewCar",
				data : {
					code : selectedCar
				},
				success: function(response) {
                    if (response === "models_exist") {
                        alert("모델이 있습니다. 삭제를 원하시면 모델을 먼저 삭제해주시길 바랍니다.");
                    } else if (response === "success") {
                        alert("삭제되었습니다.");
                        location.reload(); 
                    } else {
                        alert("삭제에 실패했습니다. 다시 시도해주세요.");
                    }
                }
			});
		} else {
			alert("삭제할 제조사를 선택하세요.");
		}

	}
	
	function deleteNewModel() {
		var selectedCar = document.getElementById('model').value;
		console.log(selectedCar); // code 값 나옴
		if(selectedCar){ // 값이 있을경우에만
			console.log(selectedCar); // code 값 나옴
			$.ajax({
				type : "POST",
				url : "deleteNewModel",
				data : {
					code : selectedCar
				},
				success: function(response) {
					if (response === "success") {
                        alert("삭제되었습니다.");
                        location.reload(); 
                    } else {
                        alert("삭제에 실패했습니다. 다시 시도해주세요.");
                    }
                }
			});
		} else {
			alert("삭제할 모델을 선택하세요.");
		}

	}
</script>
</body>
</html>
