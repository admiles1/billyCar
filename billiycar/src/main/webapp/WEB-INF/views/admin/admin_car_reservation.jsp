<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 차량 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .card-group { margin-bottom: 20px; }
        .card { 
            flex: 1 0 21%; 
            margin: 10px; 
            cursor: pointer; 
            transition: transform 0.2s, box-shadow 0.2s;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            border: none;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }
        .card-body {
            text-align: center;
        }
        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .container-fluid {
            margin-top: 20px;
        }
        .h2 {
            font-size: 1.8rem;
            font-weight: bold;
        }
        .car-details {
            display: none;
            margin-top: 10px;
            transition: max-height 0.5s ease-out;
            overflow: hidden;
        }
        .car-details.show {
            display: block;
            max-height: 500px; /* 충분히 큰 값으로 설정 */
        }
        .car-list {
            list-style: none;
            padding: 0;
        }
        .car-list li {
            padding: 10px;
            margin: 5px 0;
            background: #f8f9fa;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            cursor: pointer;
        }
        .car-list li:hover {
            background: #e9ecef;
        }
    </style>
</head>
<body>
<main class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="./">관리자 페이지</a>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="sidebar.jsp" />
            <main role="main" class="col-md-10 ml-sm-auto px-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">예약 차량 관리</h1>
                </div>
                <div id="carManufacturers">
                    <!-- 제조사 반복문 시작 -->
                    <c:forEach var="brand" items="${brands}">
                        <div class="mb-4">
                            <h2>${brand.name}</h2>
                            <div class="card-group">
                                <!-- 모델 반복문 시작 -->
                                <c:forEach var="model" items="${models}">
                                    <c:if test="${model.code.startsWith(brand.code)}">
                                        <div class="card" onclick="toggleCarDetails('${model.code}', '${model.name}', this)">
                                            <div class="card-body">
                                                <h5 class="card-title">${model.name}</h5>
                                            </div>
                                        </div>
                                        <div class="car-details"></div>
                                    </c:if>
                                </c:forEach>
                                <!-- 모델 반복문 끝 -->
                            </div>
                        </div>
                    </c:forEach>
                    <!-- 제조사 반복문 끝 -->
                </div>
            </main>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function toggleCarDetails(modelCode, modelName, element) {
        console.log("모델 코드: " + modelCode);
        var carDetails = $(element).next('.car-details');
        if (carDetails.hasClass('show')) {
            // 이미 열려 있는 경우, 숨기기
            carDetails.removeClass('show').slideUp();
        } else {
            // 닫혀 있는 경우, AJAX 요청을 통해 열기
            $.ajax({
                method: "POST",
                url: "showCarDetails",
                data: { modelCode: modelCode },
                dataType: "json",
                success: function(cars) {
                    console.log("AJAX 요청 성공");

                    // 기존 차량 정보 제거
                    carDetails.remove();

                    // 새로운 차량 정보 추가
                    carDetails = $('<div class="car-details show"></div>');
                    var carList = $('<ul class="car-list"></ul>');
                    cars.forEach(function(car) {
                        var listItem = $('<li>' + car.car_number + ' (' + modelName + ')</li>');
                        listItem.on('click', function() {
                            openCarReservationWindow(car.car_number);
                        });
                        carList.append(listItem);
                    });
                    carDetails.append(carList);

                    // 선택한 카드 아래에 차량 정보 표시
                    $(element).after(carDetails);
                    carDetails.slideDown();
                },
                error: function(error) {
                    console.error("AJAX 요청 실패: ", error);
                    alert("차량 정보를 불러오는 데 실패했습니다.");
                }
            });
        }
    }

    function openCarReservationWindow(carNumber) {
        console.log("차량 번호: " + carNumber);
        var url = "carReservationDetails?carNumber=" + carNumber;
        window.open(url, "_blank", "width=800,height=600");
    }
</script>
</body>
</html>
