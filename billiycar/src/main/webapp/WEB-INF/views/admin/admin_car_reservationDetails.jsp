<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>차량 예약 내역</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 20px;
        }
        .reservation-header {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .table {
            margin-top: 15px;
        }
        .table thead th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
        }
        .table tbody tr:hover {
            background-color: #f1f3f5;
        }
        .alert {
            margin-top: 15px;
        }
        .section-header {
            font-size: 1.2rem;
            font-weight: bold;
            margin-top: 30px;
            margin-bottom: 15px;
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="reservation-header">차량 예약 내역</h1>

    <c:choose>
        <c:when test="${not empty pastReservList}">
            <h2 class="section-header">지난 예약 내역</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>예약자</th>
                        <th>결제 시간</th>
                        <th>예약 시간</th>
                        <th>반납 시간</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reservation" items="${pastReservList}">
                        <tr>
                            <td>${reservation.member_name}</td>
                            <td>${reservation.reserv_reg_date}</td>
                            <td>${reservation.reserv_pickupdate}</td>
                            <td>${reservation.reserv_returndate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">
                지난 예약 내역이 없습니다.
            </div>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${not empty reservList}">
            <h2 class="section-header">예정된 예약 내역</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>예약자</th>
                        <th>결제 시간</th>
                        <th>예약 시간</th>
                        <th>반납 시간</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="reservation" items="${reservList}">
                        <tr>
                            <td>${reservation.member_name}</td>
                            <td>${reservation.reserv_reg_date}</td>
                            <td>${reservation.reserv_pickupdate}</td>
                            <td>${reservation.reserv_returndate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">
                예정된 예약 내역이 없습니다.
            </div>
        </c:otherwise>
    </c:choose>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
