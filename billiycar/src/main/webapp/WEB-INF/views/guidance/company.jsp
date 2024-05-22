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

  	 <section class="py-2 text-center container noto-sans-kr" style="margin-top: 100px; margin-left : 910px;">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">오시는 길</h1>
				<p class="lead text-body-secondary">부산광역시 부산진구 동천로 109 삼한골든게이트 7층</p>
			</div>
		</div>
	</section>  
	
	
	
	<!-- 지도 -->
    <section class="py-5" style="margin-top: -50px; margin-left : 560px;">
        <div class="container d-flex justify-content-center align-items-center">
            <div class="row">
                <div id="map" style="width: 800px; height: 400px;"></div>
            </div>
        </div>
    </section>
        
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df9a4a8523d874b7750523a91471020a&libraries=services"></script>
    <script type="text/javascript">
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.1584897298991, 129.06205146230675), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(35.1584897298991, 129.06205146230675); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
    
	</script>
  	
  	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
</body>
</html>