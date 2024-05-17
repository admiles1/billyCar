<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의내역</title>
</head>
<style>
    #inquiry {
        margin-top: 30px;
        background: #fff;
        border: 1px solid #ccc;
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
        margin-top: 45px;
        text-align: center;
        table-layout: fixed;
        border-radius: 8px; /* 모서리 둥글게 처리 */
        overflow: hidden;
    }

    th,
    td {
        border: 1px solid #ccc;
        padding: 15px; /* 셀 간격 늘리기 */
        text-align: center;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9; /* 번갈아가는 행 색상 */
    }

    tr:hover {
        background-color: #f5f5f5; /* 호버 효과 */
    }

    .inquiry-num {
        width: 13%;
    }

    .inquiry-subject {
        width: 22%;
    }

    .inquiry-content {
        width: 25%;
    }

    .inquiry-date {
        width: 20%;
    }

    .inquiry-status {
        width: 15%;
    }
</style>
</head>
<body>

<form id="inquiry">
    <h2>나의 문의 내역</h2>
    <hr>
    <table>
       <thead>
            <tr>
                <th class="inquiry-num">문의 번호</th>
                <th class="inquiry-subject">문의 주제</th>
                <th class="inquiry-content">문의 내용</th>
                <th class="inquiry-date">문의 일자</th>
                <th class="inquiry-status">문의 상태</th>
            </tr>
        </thead>
           <tbody>
        	<c:forEach var="qna" items="${qna}" varStatus="newIdx">
			    <tr>
			        <td>${newIdx.index + 1}</td> <!-- 이 부분 수정 -->
			        <td><a href="qnaAnswerDetail?qna_idx=${qna.qna_idx}&pageNum=${pageNum}">${qna.qna_subject}</a></td>
			        <td>${qna.qna_content}</td>
			        <td>
			            <fmt:formatDate value="${qna.qna_date}" pattern="yy-MM-dd HH:mm"/>
			        </td>
			        <td>
			            <c:choose>
			                <c:when test="${qna.qna_status == 0}">답변 대기</c:when>
			                <c:when test="${qna.qna_status == 1}">답변 완료</c:when>
			            </c:choose>
			        </td>
			    </tr>
			</c:forEach>
        </tbody>
    </table>
</form>
<script type="text/javascript">


</script>
</body>
</html>