<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>차량 목록 조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        .card {
            margin-bottom: 20px;
        }
        .nav-link {
            white-space: nowrap;
        }
        .card-text {
            white-space: nowrap;
        }
        .img_area {
            width: 200px;
            height: 150px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
        }
        .img_area img {
            width: 100%;
            height: auto;
            object-fit: contain;
            display: block;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }
        .btn-group .btn {
            margin-right: 5px;
        }
        .search-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        .search-container input,
        .search-container select,
        .search-container button {
            flex: 1;
        }
        .paging {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
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
                        <h1 class="h2">차량 목록 조회</h1>
                    </div>
                    <form class="search-container" id="searchForm">
                        <c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum}" />
                        <input type="text" id="searchKeyword" class="form-control" placeholder="검색어 입력" value="${param.searchKeyword}">
                        <select id="searchType" class="form-control">
                            <option value="">전체</option>
                            <option value="car_brand" <c:if test="${param.searchType eq 'car_brand'}">selected</c:if>>제조사</option>
                            <option value="car_model" <c:if test="${param.searchType eq 'car_model'}">selected</c:if>> 모델</option>
                            <option value="car_number" <c:if test="${param.searchType eq 'car_number'}">selected</c:if>>차량번호</option>
                        </select>
                        <button type="button" class="btn btn-primary" id="btnSearch">검색</button>
                    </form>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>제조사</th>
                                    <th style="width: 200px;">사진</th>
                                    <th>모델</th>
                                    <th>연식</th>
                                    <th>기어</th>
                                    <th>연료</th>
                                    <th>차량번호</th>
                                    <th>1일가격</th>
                                    <th>시간가격</th>
                                    <th>상태 변경</th>
                                </tr>
                            </thead>
                            <tbody id="carTableBody">
                                <!-- <c:forEach var="car" items="${carList}"> -->
                                <!-- <tr> -->
                                <!-- <td style="${car.color}">${car.car_brand}</td> -->
                                <!-- <td class="text-center"> -->
                                <!-- <div class="img_area"> -->
                                <!-- <img src="<%= request.getContextPath() %>/resources/upload/${car.car_img}" alt="차량 이미지"> -->
                                <!-- </div> -->
                                <!-- </td> -->
                                <!-- <td>${car.car_model}</td> -->
                                <!-- <td>${car.car_year}</td> -->
                                <!-- <td>${car.gear_type}</td> -->
                                <!-- <td>${car.car_fuel}</td> -->
                                <!-- <td>${car.car_number}</td> -->
                                <!-- <td>${car.car_dayprice}</td> -->
                                <!-- <td>${car.car_hourprice}</td> -->
                                <!-- <td> -->
                                <!-- <div class="btn-group" role="group" aria-label="Basic example"> -->
                                <!-- <button type="button" class="btn btn-sm btn-primary" onclick="modifyCar('${car.car_number}')">수정</button> -->
                                <!-- <button type="button" class="btn btn-sm btn-danger" onclick="confirmDelete('${car.car_number}')">삭제</button> -->
                                <!-- </div> -->
                                <!-- </td> -->
                                <!-- </tr> -->
                                <!-- </c:forEach> -->
                            </tbody>
                        </table>
                        <nav aria-label="Page navigation example">
                            <div class="paging" id="paging">
                                <!-- <ul class="pagination"> -->
                                <!-- <li class="page-item"> -->
                                <!-- <a id="previousPageLink" class="page-link" href="admin_car?pageNum=${pageNum - 1}" aria-label="Previous"> -->
                                <!-- <span aria-hidden="true">&laquo;</span> -->
                                <!-- </a> -->
                                <!-- </li> -->

                                <!-- <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}"> -->
                                <!-- <li class="page-item"> -->
                                <!-- <a class="page-link pageLink" href="admin_car?pageNum=${i}">${i}</a> -->
                                <!-- </li> -->
                                <!-- </c:forEach> -->

                                <!-- <li class="page-item"> -->
                                <!-- <a id="nextPageLink" class="page-link" href="admin_car?pageNum=${pageNum + 1}" aria-label="Next"> -->
                                <!-- <span aria-hidden="true">&raquo;</span> -->
                                <!-- </a> -->
                                <!-- </li> -->
                                <!-- </ul> -->
                            </div>
                        </nav>
                    </div>
                </main>
            </div>
        </div>
    </main>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        let pageNum = 1;
        let isLoading = false;

        $(document).ready(function() {
            $('#btnSearch').on('click', function() {
                check();
                pageNum = 1;
                searchCars(pageNum);
            });

            $(document).on('click', '.page-link', function(e) {
                e.preventDefault();
                pageNum = $(this).data('pagenum');
                searchCars(pageNum);
            });

            searchCars(pageNum);
        });

        function check() {
            if (searchKeyword.length < 2) {
                alert('2자 이상 입력해주세요');
                return;
            }

            searchCars(pageNum);
        }

        function searchCars(pageNum) {
            if (isLoading) {
                return;
            }
            isLoading = true;

            var searchType = $('#searchType').val();
            var searchKeyword = $('#searchKeyword').val();

            $.ajax({
                type: 'GET',
                url: 'search_car',
                data: {
                    searchType: searchType,
                    searchKeyword: searchKeyword,
                    pageNum: pageNum
                },
                dataType: "json",
                success: function(response) {
                    $('#carTableBody').empty();
                    $("#paging").empty();

                    let cars = response.cars;
                    $.each(cars, function(index, car) {
                        $('#carTableBody').append(
                            '<tr>' +
                                '<td style="' + car.color + '">' + car.car_brand + '</td>' +
                                '<td class="text-center">' +
                                    '<div class="img_area">' +
                                        '<img src="' + '<%= request.getContextPath() %>/resources/upload/' + car.car_img + '" alt="차량 이미지">' +
                                    '</div>' +
                                '</td>' +
                                '<td>' + car.car_model + '</td>' +
                                '<td>' + car.car_year + '</td>' +
                                '<td>' + car.gear_type + '</td>' +
                                '<td>' + car.car_fuel + '</td>' +
                                '<td>' + car.car_number + '</td>' +
                                '<td>' + car.car_dayprice + '</td>' +
                                '<td>' + car.car_hourprice + '</td>' +
                                '<td>' +
                                    '<div class="btn-group" role="group" aria-label="Basic example">' +
                                        '<button type="button" class="btn btn-sm btn-primary" onclick="modifyCar(\'' + car.car_number + '\')">수정</button>' +
                                        '<button type="button" class="btn btn-sm btn-danger" onclick="confirmDelete(\'' + car.car_number + '\')">삭제</button>' +
                                    '</div>' +
                                '</td>' +
                            '</tr>'
                        );
                    });

                    let startPage = response.pageInfo.startPage;
                    let endPage = response.pageInfo.endPage;
                    let maxPage = response.pageInfo.maxPage;

                    $("#paging").append(
                        '<ul class="pagination">' +
                            '<li class="page-item ' + (pageNum == 1 ? 'disabled' : '') + '">' +
                                '<a id="previousPageLink" class="page-link" href="#" data-pagenum="' + (pageNum - 1) + '" aria-label="Previous">' +
                                    '<span aria-hidden="true">&laquo;</span>' +
                                '</a>' +
                            '</li>'
                    );

                    for (let i = startPage; i <= endPage; i++) {
                        $("#paging ul").append(
                            '<li class="page-item">' +
                                '<a class="page-link pageLink" href="#" data-pagenum="' + i + '">' + i + '</a>' +
                            '</li>'
                        );
                    }

                    $("#paging ul").append(
                        '<li class="page-item ' + (pageNum == maxPage ? 'disabled' : '') + '">' +
                            '<a id="nextPageLink" class="page-link" href="#" data-pagenum="' + (pageNum + 1) + '" aria-label="Next">' +
                                '<span aria-hidden="true">&raquo;</span>' +
                            '</a>' +
                        '</li>' +
                        '</ul>'
                    );
                    isLoading = false;
                },
                error: function() {
                    alert('차량 목록이 없습니다.');
                    location.reload();
                }
            });
        }

        function confirmDelete(carNumber) {
            console.log("Deleting car with ID:", carNumber);
            if (confirm("정말 삭제하시겠습니까?")) {
                $.ajax({
                    type: 'POST',
                    url: 'deleteCar',
                    data: { carNumber: carNumber },
                    success: function(response) {
                        if (response === "success") {
                            alert('삭제되었습니다.');
                            location.reload();
                        } else {
                            alert('삭제에 실패하였습니다.');
                        }
                    },
                    error: function() {
                        alert('예약된 차량은 삭제 불가능합니다.');
                    }
                });
            }
        }

        function modifyCar(carNumber) {
            var carInfo = {
                carNumber: carNumber
            };
            var queryString = Object.keys(carInfo).map(key => key + '=' + carInfo[key]).join('&');
            window.location.href = 'carModify?' + queryString;
        }
    </script>
</body>
</html>
