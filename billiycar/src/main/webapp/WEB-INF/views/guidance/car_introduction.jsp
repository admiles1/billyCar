<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
</head>
<body>
    <header>
        <jsp:include page="../inc/top.jsp" />
    </header>

    <main class="container vehicle-details">
        <div class="cont_top">
            <div class="cont_tit">
                <h2>차량소개</h2>
            </div>
        </div>
        <div class="cont">
            <ul class="search-car-result-list">
                <li class="panel">
                    <div class="left">
                        <div class="img-wrap-responsive">
                            <img onerror="this.src='resources/main_images/rewiewCar2.png'" src="/_files/cat_category/a106d5d03428fe453c42ffb564feaffc.png">
                        </div>
                    </div>
                    <div class="right">
                        <div class="title">
                            <h3>SM6</h3>
                            <div class="type-list">
                                <span>중형</span>
                                <span>5인승</span>
                                <span>LPG</span>
                            </div>
                        </div>
                        <div class="search-car-result-cont">
                            <div class="search-car-result-cont-left">
                                <h3 class="title-01 f14">요금정보</h3>
                                <table class="cont-list-table-v04">
                                    <colgroup>
                                        <col width="20%">
                                        <col width="40%">
                                        <col width="40%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="first">구분</th>
                                            <th>주중 대여료</th>
                                            <th>주말 대여료</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>24시간</td>
                                            <td class="b_l1 r"><span style="color:#0b80ff">53,000</span> 원</td>
                                            <td class="b_l1 r"><span style="color:#0b80ff">58,000</span> 원</td>
                                        </tr>
                                        <tr>
                                            <td>6시간</td>
                                            <td class="b_l1 r">50,000 원</td>
                                            <td class="b_l1 r">55,000 원</td>
                                        </tr>
                                        <tr>
                                            <td>1시간</td>
                                            <td class="b_l1 r">7,000 원</td>
                                            <td class="b_l1 r">7,000 원</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="search-car-result-cont-right">
                                <h3 class="title-01 f14">옵션정보</h3>
                                <div class="text-box">
                                    <div class="car-option">
    					<h5 class="div-tap"> 옵션</h5>
    					<ul class="car-option-list">
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small>국제운전면허증 가능</small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 긴급출동무료</small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 충전기제공 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 연료적립 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 카시트 무료 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 금연 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 열선시트 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 스마트키 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 제2운전자 등록가능 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 네비게이션 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 후방카메라 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 블랙박스 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 하이패스 </small>
    						</li>
    						<li>
    							<img src="../resources/images/option_2ndlinsece.png"><p>
    							<small> 블루투스 </small>
    						</li>
    					</ul>
    				</div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-wrap">
                            <a class="call" href="javascript:;" title="전화상담" onclick="return Common.openLayerPage('/?pCode=1541884045&amp;mode=contactUs&amp;pmode=ajax&amp;c_idx=118','450','330','전화상담요청')">전화상담</a>
                            <a class="reservation" href="/?pCode=1541884045&amp;idx=118">실시간 예약</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </main>

    <footer>
        <jsp:include page="../inc/bottom.jsp" />
    </footer>
</body>
</html>
