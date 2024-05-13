<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 소개</title>
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/css/company.css">
</head>
<body>
	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
  	
  	<div class = "com_intro">
  		
		<!-- 타이틀 -->
		<div class = "title_div">
  			<em class = "intro_title">빌리카 소개</em><br>
  		</div>
  		
  		<div class = "com_intro_center">
	  		<h2><span style = "color : #00AAFF">빌리카</span>는 고객의 행복까지 함께합니다. <br></h2>
	  		고객 여러분의 한결같은 사랑으로
			부산에서 최고의 렌터카 회사로 성장하였습니다.<br>
	
			빌리카는 고객 여러분께 더 좋은 서비스를
			제공하기 위해 끊임없이 노력하겠습니다.
  		</div>
  		
  		<div class ="com_good">
  			<h2><span style = "color : #00AAFF">빌리카</span> 장점</h2>
  		</div>
  		
		<div class = "img_intro">
			<img src = "${pageContext.request.contextPath}/resources/images/billycar_intro3.png">
			<img src = "${pageContext.request.contextPath}/resources/images/billycar_intro1.png">
			<img src = "${pageContext.request.contextPath}/resources/images/billycar_intro2.png">
			<br>
			<span class = "img_span">실제 유저들의 리뷰</span>
			<span class = "img_span">우리 집 앞까지 배달 가능</span>
			<span class = "img_span">쉬운 가격 비교</span>
		</div>
  	</div>

  	<div>
  		<div id="map" style="width:100%;height:350px;"></div>
  	</div>
  	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
			geocoder.addressSearch('부산광역시 동천로 109 삼한골든게이트', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
</script>
  	
  	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>