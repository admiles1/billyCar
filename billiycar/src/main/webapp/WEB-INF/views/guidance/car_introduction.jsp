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
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
    
    <!-- 스크롤링 -->
    
    <script type="text/javascript">

			let isLoading = false;
			let isEmpty = false;
			let searchKeyword = '';
			let searchType = '';
			let pageNum = 1;
			
			
			function getScroll(newSearchKeyword = "", newSearchType = "", isEmpty) {
// 			   alert(newSearchKeyword)
// 			   alert(newSearchType)
// 			   alert(isEmpty)
			   
			   if (isLoading) return; // 이미 데이터를 불러오고 있는 중이라면 중복 요청 방지
			   isLoading = true; // 데이터 요청 중 플래그 설정
			   
			   
			    $.ajax({
			        type: "GET",
			        url: "carScroll",
			        data: {
			            pageNum: pageNum,
			            searchKeyword: newSearchKeyword || searchKeyword,
			            searchType: newSearchType || searchType
			        },
			        dataType: "json",
			        success: function(response) {
			            let carList = response;
// 			            console.log(carList);

			         //true면 기존 아코디언 비움
			            if(isEmpty) {
			         	   $("#listEnd").empty();
			//             pageNum = 2;
			            }
			         
			         //반복문을 통해 ajax를 통해 받아온 값을 아코디언div에 전달
			         
			         // ----------------------------옵션 사진들 변수 저장--------------------------------------
			         
						let option_linsece = "${pageContext.request.contextPath}/resources/images/option/option_linsece.png";
						let option_sos = "${pageContext.request.contextPath}/resources/images/option/option_sos.png";
						let option_charger = "${pageContext.request.contextPath}/resources/images/option/option_charger.png";
						let option_seat = "${pageContext.request.contextPath}/resources/images/option/option_seat.png";
						let option_nosmoking = "${pageContext.request.contextPath}/resources/images/option/option_nosmoking.png";
						let option_heatseat = "${pageContext.request.contextPath}/resources/images/option/option_heatseat.png";
						let option_smartkey = "${pageContext.request.contextPath}/resources/images/option/option_smartkey.png";
						let option_2ndlinsece = "${pageContext.request.contextPath}/resources/images/option/option_2ndlinsece.png";
						let option_navigation = "${pageContext.request.contextPath}/resources/images/option/option_navigation.png";
						let option_backcamera = "${pageContext.request.contextPath}/resources/images/option/option_backcamera.png";
						let option_blackbox = "${pageContext.request.contextPath}/resources/images/option/option_blackbox.png";
						let option_highpass = "${pageContext.request.contextPath}/resources/images/option/option_highpass.png";
						let option_bluetooth = "${pageContext.request.contextPath}/resources/images/option/option_bluetooth.png";
						
			         // ---------------------------------------------------------------------------------------
			         
			            $.each(carList, function(index, car) {
// 			            for(car of carList) {
							let original_fileName = null;
			            	
							if(car.car_img != null) {
			            		original_fileName = car.car_img.substring(car.car_img.indexOf('_') + 1)
			            	}
							
			            	let imgPath = "${pageContext.request.contextPath}/resources/upload/" + original_fileName 
							alert(car.model)
			            	
			               alert(original_fileName)
					               ' <li class="panel">'
					               +' <div class="left">'
					               +'     <div class="img-wrap-responsive">'
					               +'            <img src="' + imgPath  + '">'
					               +'     </div>'
					               +' </div>'
					               +' <div class="right">'
					               +'    <div class="title">'
					               +'         <h3> ' + car.model + '</h3>'
					               +'         <div class="type-list">'
					               +'            <span>' + car.carType + '</span> /'
					               +'           <span>' + car.car_capacity + '</span> /'
					               +'            <span>' + car.fuel + '</span>'
					               +'        </div>'
					               +'    </div>'
					               +'    <div class="search-car-result-cont">'
					               +'         <div class="search-car-result-cont-left">'
					               +'             <h5 class="title-01 f14"> 요금정보</h5>'
					               +'            <table class="cont-list-table-v04">'
					               +'                 <colgroup>'
					               +'                    <col width="20%">'
					               +'                    <col width="40%">'
					               +'                    <col width="40%">'
					               +'                </colgroup>'
					               +'                 <thead>'
					               +'                    <tr>'
					               +'                         <th class="first">구분</th>'
					               +'                         <th>대여료</th>'
					               +'                     </tr>'
					               +'                 </thead>'
					               +'                <tbody>'
					               +'                     <tr>'
					               +'                         <td> 종일가 </td>'
					               +'                         <td class="b_l1 r"><span style="color:#0b80ff">' + car.car_dayprice + '</span></td>'
					               +'                    </tr>'
					               +'                    <tr>'
					               +'                         <td>1시간</td>'
					               +'                        <td class="b_l1 r">' + car.car_hourprice + '</td>' 
					               +'                     </tr>'
					               +'                 </tbody>'
					               +'            </table>'
					               +'        </div>'
					               +'        <div class="search-car-result-cont-right">'
					               +'            <div class="text-box">'
					               +'                <div class="car-option">'
					               +'					<h5 class="div-tap"> 옵션</h5>'
					               +' 					<ul class="car-option-list">'
					               +' 						<li>'
					               +' 							<img src="' + option_linsece + '" id="optionImg"><p>'
					               +' 							<small>국제운전면허</small>'
					               +' 						</li>'
					               +'						<li>'
					               +' 							<img src="' + option_sos + '" id="optionImg"><p>'
					               +' 							<small> 긴급출동무료</small>'
					               +' 						</li>'
					               +' 						<li>'
					               +' 							<img src="' + option_charger + '" id="optionImg"><p>'
					               +' 							<small> 충전기제공 </small>'
					               +' 						</li>'
					               +' 						<li>'
					               +' 							<img src="' + option_seat + '" id="optionImg"><p>'
					               +' 							<small> 카시트 무료 </small>'
					               +' 						</li>'
					               +' 						<li>'
					               +' 							<img src="' + option_nosmoking + '" id="optionImg"><p>'
					               +' 							<small> 금연 </small>'
					               +' 						</li>'
					               +' 						<li>'
					               +' 							<img src="' + option_heatseat + '" id="optionImg"><p>'
					               +' 							<small> 열선시트 </small>'
					               +' 						</li>'
					               +' 						<li>'
					               +' 							<img src="' + option_smartkey + '" id="optionImg"><p>'
					               +' 							<small> 스마트키 </small>'
					               +' 						</li>'
					               +' 						<li>'
					               +' 							<img src="' + option_2ndlinsece  + '" id="optionImg"><p>'
					               +' 							<small> 제2운전자 </small>'
					               +'  						</li>'
					               +'  						<li>'
					               +'							<img src="' + option_navigation + '" id="optionImg"><p>'
					               +'							<small> 네비게이션 </small>'
					               +'						</li>'
					               +' 						<li>'
					               +'							<img src="' + option_backcamera + '" id="optionImg"><p>'
					               +'							<small> 후방카메라 </small>'
					               +'						</li>'
					               +'						<li>'
					               +'							<img src="' + option_highpass + '" id="optionImg"><p>'
					               +'							<small> 블랙박스 </small>'
					               +'						</li>'
					               +'						<li>'
					               +'							<img src="' + option_linsece + '" id="optionImg"><p>'
					               +'							<small> 하이패스 </small>'
					               +'						</li>'
					               +'						<li>'
					               +'							<img src="' + option_linsece + '" id="optionImg"><p>'
					               +'							<small> 블루투스 </small>'
					               +'						</li>'
					               +'					</ul>'
					               +'				</div>'
					               +'            </div>'
					               +'          </div>'
					               +'      </div>'
					               +'   </div>'
					               +'  </li>'
					               
		               		$(".search-car-result-list").append(carUl);
			                
				            }); // each
			            
				            isLoading = false; // 데이터 요청 완료 후 플래그 해제
				            pageNum++;
				           }, // success
			        
			        error: function() {
			            alert("불러오는데 실패했습니다");
			        }
			    });
			}
			
			$(function() {
			   //초기 로딩
			    getScroll("", "",  false);
	
			   // 검색 버튼 눌렀을 시
			    document.fr.onsubmit = function() {
				   
			        let newSearchType = $("#searchType").val();
			        let newSearchKeyword = $("#searchKeyword").val();
				   	alert(newSearchType + "dddd" + newSearchKeyword)

			        searchType = newSearchType || ''; // faqCategory 업데이트
			        searchKeyword = newSearchKeyword || ''; // faqCategory 업데이트
			        pageNum = 1;
			        
				   	alert("두번째 " + searchType + "-" + searchKeyword)
			        
			        getScroll(newSearchKeyword, newSearchType, true);
			    }
			    
			    
			    // 스크롤 내릴 때
			    $(document).scroll(function() {
			        let currentScroll = $(this).scrollTop();
			        let documentHeight = $(document).height();
			        let windowHeight = $(window).height();
			        let nowHeight = currentScroll + windowHeight;
			        let bottom = 20; //딱 맞게 scroll바가 아래로 가지 않아도 ajax 호출하도록
			       
			        // 화면 하단까지 스크롤되었을 때 추가 데이터 가져오기
			      if (currentScroll >= documentHeight - windowHeight - bottom) {
			         console.log("스크롤 이벤트 발생 - pageNum = " + pageNum);
			         getScroll(newSearchKeyword, newSearchType, false);// 스크롤 이벤트 발생 시 getScroll() 함수 호출
			        }
			    });
			});
    </script>
    
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
       		<form action="javascript:void(0);" name="fr">
				<select name="searchType" id="searchType">
					<option value="brand" <c:if test="${param.searchType eq 'brand'}"> selected</c:if>> 제조사</option>
					<option value="model" <c:if test="${param.searchType eq 'model'}"> selected</c:if>> 모델</option>
				</select>
				<input type="text" name="searchKeyword" value="${param.searchKeyword}" placeholder="검색어를 입력하여주세요" id="searchKeyword"> 
				<input type="submit" value="검색" />
			</form>
        </div>
        
        
        
        
        <div class="cont" id="listEnd">
        
<%--         <c:forEach var="car" items="${carList}"> --%>
        
         
<ul class="search-car-result-list">
<!--                 <li class="panel"> -->
<!--                     <div class="left"> -->
<!--                         <div class="img-wrap-responsive"> -->
<%--                         	<c:if test="${not empty car.car_img}"> --%>
<%-- 								<c:set var="original_fileName" value="${fn:substringAfter(car.car_img, '_')}"/> --%>
<%-- 	                            <img src="${pageContext.request.contextPath}/resources/upload/${car.original_fileName}"> --%>
<%-- 							</c:if> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="right"> -->
<!--                         <div class="title"> -->
<%--                             <h3>${car.model}</h3> --%>
<!--                             <div class="type-list"> -->
<%--                                 <span>${car.carType}</span> / --%>
<%--                                 <span>${car.car_capacity}</span> / --%>
<%--                                 <span>${car.fuel}</span> --%>
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="search-car-result-cont"> -->
<!--                             <div class="search-car-result-cont-left"> -->
<!--                                 <h5 class="title-01 f14"> 요금정보</h5> -->
<!--                                 <table class="cont-list-table-v04"> -->
<%--                                     <colgroup> --%>
<%--                                         <col width="20%"> --%>
<%--                                         <col width="40%"> --%>
<%--                                         <col width="40%"> --%>
<%--                                     </colgroup> --%>
<!--                                     <thead> -->
<!--                                         <tr> -->
<!--                                             <th class="first">구분</th> -->
<!--                                             <th>대여료</th> -->
<!--                                         </tr> -->
<!--                                     </thead> -->
<!--                                     <tbody> -->
<!--                                         <tr> -->
<!--                                             <td> 종일가 </td> -->
<!--                                             <td class="b_l1 r"><span style="color:#0b80ff"> -->
<%--                                             <fmt:formatNumber value="${car.car_dayprice}" type="currency" /></span></td> --%>
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td>1시간</td> -->
<%--                                             <td class="b_l1 r"><fmt:formatNumber value="${car.car_hourprice}" type="currency" /></td>  --%>
<!--                                         </tr> -->
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                             </div> -->
<!--                             <div class="search-car-result-cont-right"> -->
<!-- 	                            <div class="text-box"> -->
<!--                                     <div class="car-option"> -->
<!-- 				    					<h5 class="div-tap"> 옵션</h5> -->
<!-- 				    					<ul class="car-option-list"> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_linsece.png" id="optionImg"><p> --%>
<!-- 				    							<small>국제운전면허</small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_sos.png" id="optionImg"><p> --%>
<!-- 				    							<small> 긴급출동무료</small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_charger.png" id="optionImg"><p> --%>
<!-- 				    							<small> 충전기제공 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_seat.png" id="optionImg"><p> --%>
<!-- 				    							<small> 카시트 무료 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_nosmoking.png" id="optionImg"><p> --%>
<!-- 				    							<small> 금연 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_heatseat.png" id="optionImg"><p> --%>
<!-- 				    							<small> 열선시트 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_smartkey.png" id="optionImg"><p> --%>
<!-- 				    							<small> 스마트키 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_2ndlinsece.png" id="optionImg"><p> --%>
<!-- 				    							<small> 제2운전자 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_navigation.png" id="optionImg"><p> --%>
<!-- 				    							<small> 네비게이션 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_backcamera.png" id="optionImg"><p> --%>
<!-- 				    							<small> 후방카메라 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_blackbox.png" id="optionImg"><p> --%>
<!-- 				    							<small> 블랙박스 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_highpass.png" id="optionImg"><p> --%>
<!-- 				    							<small> 하이패스 </small> -->
<!-- 				    						</li> -->
<!-- 				    						<li> -->
<%-- 				    							<img src="${pageContext.request.contextPath}/resources/images/option/option_bluetooth.png" id="optionImg"><p> --%>
<!-- 				    							<small> 블루투스 </small> -->
<!-- 				    						</li> -->
<!-- 				    					</ul> -->
<!-- 				    				</div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </li> -->
            </ul>
        
        </div>
    </main>
	
    <footer>
        <jsp:include page="../inc/bottom.jsp" />
    </footer>
</body>
</html>
