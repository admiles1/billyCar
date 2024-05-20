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
        .reservation-card {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .reservation-header {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .reservation-details {
            font-size: 1.1rem;
        }
        .reservation-details dt {
            font-weight: bold;
        }
        .reservation-details dd {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="reservation-header">차량 예약 내역</h1>
<%--     <c:if test="${not empty reservations}"> --%>
<%--         <c:forEach var="reservation" items="${reservations}"> --%>
<!--             <div class="reservation-card"> -->
<!--                 <dl class="reservation-details"> -->
<!--                     <dt>예약자:</dt> -->
<%--                     <dd>${reservation.reserver}</dd> --%>
<!--                     <dt>예약 날짜:</dt> -->
<%--                     <dd>${reservation.date}</dd> --%>
<!--                     <dt>예약 시간:</dt> -->
<%--                     <dd>${reservation.time}</dd> --%>
<!--                 </dl> -->
<!--             </div> -->
<%--         </c:forEach> --%>
<%--     </c:if> --%>
<%--     <c:if test="${empty reservations}"> --%>
<!--         <div class="alert alert-info"> -->
<!--             예약 내역이 없습니다. -->
<!--         </div> -->
<%--     </c:if> --%>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
