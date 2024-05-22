<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의내역</title>
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

    .pagination-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .pagination {
        display: flex;
        list-style: none;
        padding: 0;
    }

    .pagination .page-item {
        margin: 0 5px;
    }

    .pagination .page-link {
        display: block;
        padding: 10px 15px;
        color: #007bff;
        text-decoration: none;
        background-color: #fff;
        border: 1px solid #dee2e6;
        border-radius: 5px;
    }

    .pagination .page-link:hover {
        background-color: #e9ecef;
    }

    .pagination .page-item.disabled .page-link {
        pointer-events: none;
        color: #6c757d;
        background-color: #fff;
        border-color: #dee2e6;
    }
</style>
</head>
<body>

<form id="inquiry">
    <h2>나의 문의 내역</h2>
    <hr>
    <c:set var="pageNum" value="1"/>
    <c:if test="${not empty param.pageNum}">
        <c:set var="pageNum" value="${param.pageNum}"/>
    </c:if>
    <table>
        <thead>
            <tr>
                <th class="inquiry-num">문의 번호</th>
                <th class="inquiry-subject">문의 제목</th>
                <th class="inquiry-content">문의 내용</th>
                <th class="inquiry-date">문의 일자</th>
                <th class="inquiry-status">문의 상태</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <%-- 문의 내역이 존재하지 않을 경우 --%>
                <c:when test="${empty qna}">
                    <tr>
                        <td colspan="5">문의내역이 존재하지 않습니다</td>
                    </tr>
                </c:when>

                <%-- 문의 내역이 존재할 경우 --%>
                <c:otherwise>
                    <c:forEach var="qna" items="${qna}">
                        <c:set var="i" value="${i+1}"></c:set>
                        <tr>
                            <td class="text-left">${i}</td>
                            <td class="text-left"><a href="qnaAnswerDetail?qna_idx=${qna.qna_idx}&pageNum=${pageNum}">${qna.qna_subject}</a></td>
                            <td class="text-left">
                                ${qna.qna_content}
                            </td>
                            <c:set var="qnaDate" value="${fn:split(fn:split(qna.qna_date, 'T')[0], '-')}" />
							<c:set var="qnaDateTime" value="${fn:split(fn:split(qna.qna_date, 'T')[1], ':')}" />
							<td>${qnaDate[0]}-${qnaDate[1]}-${qnaDate[2]} ${qnaDateTime[0]}:${qnaDateTime[1]}</td>
                            <td class="text-left">
                                <c:choose>
                                    <c:when test="${qna.qna_status eq 0}">
                                        <span style="color:red">답변 대기</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color:#00aaff">답변 완료</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    <nav class="pagination-container" aria-label="Page navigation example">
        <div class="paging">
            <ul class="pagination">
                <li class="page-item">
                    <a id="previousPageLink" class="page-link" href="MyInquiry?pageNum=${pageNum - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                    <li class="page-item ${pageNum == i ? 'active' : ''}">
                        <a class="page-link pageLink" href="MyInquiry?pageNum=${i}">${i}</a>
                    </li>
                </c:forEach>

                <li class="page-item">
                    <a id="nextPageLink" class="page-link" href="MyInquiry?pageNum=${pageNum + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</form>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var previousPageLink = document.getElementById('previousPageLink');
    var nextPageLink = document.getElementById('nextPageLink');

    // pageNum이 1 이하일 경우 이전 페이지 링크를 비활성화합니다.
    if (${pageNum le 1}) {
        previousPageLink.addEventListener('click', function(event) {
            event.preventDefault(); // 링크 클릭을 막음
            alert("더이상 페이지가 없습니다");
        });
    }

    // endPage가 maxPage보다 크거나 pageNum + 1이 maxPage보다 클 경우 다음 페이지 링크를 비활성화합니다.
    if (${endPage gt pageInfo.maxPage} || ${pageNum + 1 gt pageInfo.maxPage}) {
        nextPageLink.addEventListener('click', function(event) {
            event.preventDefault(); // 링크 클릭을 막음
            alert("더이상 페이지가 없습니다");
        });
    }
});
</script>
</body>
</html>
