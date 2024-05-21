<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>차량 소개 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin-top: 20px;
        }
        .vehicle-details .cont_top {
            background-color: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        .img-wrap-responsive img {
            width: 100%;
            height: auto;
        }
        .search-car-result-list {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .panel {
            flex: 1 1 100%;
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
        }
        .panel .left {
            flex: 1;
            padding-right: 20px;
        }
        .panel .right {
            flex: 2;
        }
        .cont-list-table-v04 th, .cont-list-table-v04 td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .btn-wrap {
            margin-top: 10px;
        }
        .btn-wrap a {
            text-decoration: none;
            padding: 10px 20px;
            color: white;
            background-color: #0b80ff;
            border-radius: 5px;
            margin-right: 10px;
        }
        .btn-wrap a:hover {
            opacity: 0.9;
        }
        
        .car-option-list {
			list-style-type : none;
			display : flex;
		    flex-wrap: wrap;
		    width: 100%;
		}
		
		.car-info-list li {
			width : 25%;
			text-align : left;
		}
		
		.car-option-list li {width : 20%;}
		
   /* 	========================================= */
   
   /* div 인라인 */
    .title {
   		display: inline-block;
	    overflow: hidden;
	    position: relative;
	    margin-bottom: 10px;
	    background-color: #f5f5f5;
	    border-radius: 10px;
	    padding: 15px 10px 15px 20px;
	    display: flex;
	    align-items: center;
   }
   
   .type-list {
   		width : 300px;
   		display: flex;
	    margin-left: 20px;
	    color: #727272;
   }
		
	.type-list span {
    padding: 0 10px;
    position: relative;
	}
	
	.search-car-result-cont {
		display: flex;
	    position: relative;
	}
	
	/* 요금 정보 */
	.search-car-result-cont-left {
		margin-top: 30px;
		margin-left: 60px;
		width : 500px;
	}
	
	/* 옵션 정보 */
	.search-car-result-cont-right {
		margin-top : 10px;
		margin-left: -60px;
		width : 70%;
	}
	
	/* 옵션 이미지 */
	#optionImg {
		width : 50px;
	}
	
	/* 옵션 */
	.car-option-list {
		
		margin-left: -20px;
		padding : 5px;
	}
	
    </style>
</head>
<body>
    <header>
        <jsp:include page="../inc/top.jsp" />
    </header>

    <main class="container vehicle-details">
        <div class="cont_top">
            <div class="cont_tit">
                <h2 style="text-align: center">차량소개</h2>
            </div>
        </div>
        <div align="center">	
       		<form action="guideCar">
				<select name="searchType">
					<option value="brand" <c:if test="${param.searchType eq 'brand'}"> selected</c:if>> 제조사</option>
					<option value="model" <c:if test="${param.searchType eq 'model'}"> selected</c:if>> 모델</option>
				</select>
				<input type="text" name="searchKeyword" value="${param.searchKeyword}" placeholder="검색어를 입력하여주세요"> 
				<input type="submit" value="검색" />
			</form>
        </div>
        <div class="cont" id="listEnd">
        
        <c:forEach var="car" items="${carList}">
        
            <ul class="search-car-result-list">
                <li class="panel">
                    <div class="left">
                        <div class="img-wrap-responsive">
                        	<c:if test="${not empty car.car_img}">
								<c:set var="original_fileName" value="${fn:substringAfter(car.car_img, '_')}"/>
	                            <img src="${pageContext.request.contextPath}/resources/upload/${car.original_fileName}">
							</c:if>
                        </div>
                    </div>
                    <div class="right">
                        <div class="title">
                            <h3>${car.model}</h3>
                            <div class="type-list">
                                <span>${car.carType}</span> /
                                <span>${car.car_capacity}</span> /
                                <span>${car.fuel}</span>
                            </div>
                        </div>
                        <div class="search-car-result-cont">
                            <div class="search-car-result-cont-left">
                                <h5 class="title-01 f14"> 요금정보</h5>
                                <table class="cont-list-table-v04">
                                    <colgroup>
                                        <col width="20%">
                                        <col width="40%">
                                        <col width="40%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="first">구분</th>
                                            <th>대여료</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td> 종일가 </td>
                                            <td class="b_l1 r"><span style="color:#0b80ff">
                                            <fmt:formatNumber value="${car.car_dayprice}" type="currency" /></span></td>
                                        </tr>
                                        <tr>
                                            <td>1시간</td>
                                            <td class="b_l1 r"><fmt:formatNumber value="${car.car_hourprice}" type="currency" /></td> 
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="search-car-result-cont-right">
	                            <div class="text-box">
                                    <div class="car-option">
				    					<h5 class="div-tap"> 옵션</h5>
				    					<ul class="car-option-list">
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_linsece.png" id="optionImg"><p>
				    							<small>국제운전면허</small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_sos.png" id="optionImg"><p>
				    							<small> 긴급출동무료</small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_charger.png" id="optionImg"><p>
				    							<small> 충전기제공 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_seat.png" id="optionImg"><p>
				    							<small> 카시트 무료 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_nosmoking.png" id="optionImg"><p>
				    							<small> 금연 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_heatseat.png" id="optionImg"><p>
				    							<small> 열선시트 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_smartkey.png" id="optionImg"><p>
				    							<small> 스마트키 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_2ndlinsece.png" id="optionImg"><p>
				    							<small> 제2운전자 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_navigation.png" id="optionImg"><p>
				    							<small> 네비게이션 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_backcamera.png" id="optionImg"><p>
				    							<small> 후방카메라 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_blackbox.png" id="optionImg"><p>
				    							<small> 블랙박스 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_highpass.png" id="optionImg"><p>
				    							<small> 하이패스 </small>
				    						</li>
				    						<li>
				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_bluetooth.png" id="optionImg"><p>
				    							<small> 블루투스 </small>
				    						</li>
				    					</ul>
				    				</div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-wrap">
<!--                             <a class="reservation" href="/?pCode=1541884045&amp;idx=118">실시간 예약</a> -->
                        </div>
                    </div>
                </li>
            </ul>
        </c:forEach>
        
        </div>
    </main>
	
    <footer>
        <jsp:include page="../inc/bottom.jsp" />
    </footer>
</body>
</html>
