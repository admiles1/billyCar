<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>대여 안내</title>
	<link rel ="stylesheet" href = "${pageContext.request.contextPath}/resources/css/rental.css">
	
	 <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
</head>
<body>

	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
  	
  	<main class="container">
  	<div class = "rental">
  		
		<!-- 타이틀 -->
		<div class = "re_title_div">
  			<em class = "rental_title">대여 안내</em><br>
  			<em style = "margin-left : 60px;"> 위드렌터카의 전 차량은 자동차종합보험(대인-대물-자손)에 가입되어 있습니다.</em>
  		</div>
  		
  		<!-- 본문 -->
  		<div>
  		
  		<div class="guide">
			<h4 class="tit_guide cr" style = "margin-left : 50px;">꼭 확인하세요!</h4>
			<ul class="guide_list">
				<li class="f14">운전면허증을 반드시 지참, 실사용자와 예약자명을 분명히 밝혀주셔야 만일의 사태에 불이익이 없습니다.</li>
				<li class="f14">고객은 교통법규를 준수하며 차량 임차 중에 발생한 교통법규위반에 관한 사항은 임차인의 책임입니다.</li>
				<li class="f14">상기 자격요건이 충족된다하더라도 자사측에서 운전이 미숙하다고 판단되거나 음주상태인 고객님 또는 계약서상의 필요 정보를 거절하실 경우, 차량대여를 거부할 수 있습니다. </li>
			</ul>
		</div>
		
		<div class = "sub">
			<h3 class = "sub_t">  * 대여 조건 </h3>
		</div>
		
		<div class = "tabless">
				<table class="for_table">
					<colgroup>
						<col width="50%">
						<col width="50%">
					</colgroup>
					<thead>
					<tr>
						<th class="first f14">내국인</th>
						<th class="f14">외국인</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class=" white-bg">
							<ul class="ul-list">
								<li>도로교통법상 유효한 운전면허증 소지자 </li>
							</ul>
						</td>
						<td class="b_l1 white-bg">
							<ul class="ul-list">
								<li>- 제네바협약, 비엔나협약, SOFA 가입국에서 발행한 국제운전면허증과 개인여권 소지자 </li>
								<li>- 운전면허증을 소지한 내국인과 동행하여 공동임차인으로 계약서를 작성 </li>
							</ul>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="sgap"></div>
				<table class="cont">
					<colgroup>
						<col colspan="2" width="*">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<thead>
					<tr>
						<th colspan="2" class="first f14">차량종류</th>
						<th class="f14">나이제한</th>
						<th class="f14">운전경력</th>
						<th class="f14">면허증별</th>
						<th class="f14">비고</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td colspan="2" class="white-bg">수입차량</td>
						<td class="b_l1 white-bg">만26세 이상</td>
						<td class="b_l1 white-bg">3년이상</td>
						<td class="b_l1 white-bg">2종보통 이상</td>
						<td class="b_l1 white-bg">-</td>
					</tr>
					<tr>
						<td rowspan="3" class="white-bg">국산차량</td>
						<td class="b_l1 white-bg">대형승용차량</td>
						<td class="b_l1 white-bg">만26세 이상</td>
						<td class="b_l1 white-bg">3년이상</td>
						<td class="b_l1 white-bg">2종보통 이상</td>
						<td class="b_l1 white-bg">-</td>
					</tr>
					<tr>
						<td class="b_l1 white-bg">승합차량</td>
						<td class="b_l1 white-bg">만26세 이상</td>
						<td class="b_l1 white-bg">3년이상</td>
						<td class="b_l1 white-bg">1종보통</td>
						<td class="b_l1 white-bg">9인승은 2종 보통가능</td>
					</tr>
					<tr>
						<td class="b_l1 white-bg">그 외 기타</td>
						<td class="b_l1 white-bg">24세 이상</td>
						<td class="b_l1 white-bg">1년이상</td>
						<td class="b_l1 white-bg">2종보통 이상</td>
						<td class="b_l1 white-bg">-</td>
					</tr>
					</tbody>
				</table>
			</div>
			<hr class = "hr-2">
			<div class = "sub">
				<h3 class = "sub_t">  * 대여 인수 절차 </h3>
			</div>
			
			<div id = "step">
				<div id = "step1">
					<h4>STEP 01.</h4><br>
	 	 			홈페이지에 면허증 등록하기
				</div>
				<div id = "step2" style = "margin-left : 20px">
					<h4>STEP 02.</h4><br>
	 	 			원하는 차량 예약
				</div>
				<div id = "step3" style = "margin-left : 20px">
					<h4>STEP 03.</h4><br>
	 	 			직원에게 차량설명, 주의사항, 보험가입 내용 등을 간략히 설명듣기
				</div>
				<div id = "step4" >
					<h4>STEP 04.</h4><br>
	 	 			원하는 장소에서 면허증(필수)제시하여 계약서 작성. 차량외관확인, 차량작동상태확인, 연료상태확인
				</div>
				<div id = "step5" style = "margin-left : 20px">
					<h4>STEP 05.</h4><br>
	 	 			계약서에 임차인 동의후, 계약서 사본과 차량 키를 수령받고 출발~!
				</div>
			</div> <!-- step -->	
			
			<hr class = "hr-2">
			<div class = "sub">
				<h3 class = "sub_t">  * 대여 반납 절차 </h3>
			</div>
			
			<div id = "return_step">
				<div id = "rstep1" >
					<h4>STEP 01.</h4><br>
					계약시간 최소 1시간 이전에 고객센터로 전화주셔서 반납장소와 시간을 통보해주세요.
				</div>
				<div id = "rstep2" style = "margin-left : 20px">
					<h4>STEP 02.</h4><br>
					직원과 함께 소지하고 계신 계약내용을 확인하고 차량상태 및 연료, 이상유무를 확인한 후 차량 키를 직원에게 넘겨주시고 귀가하시면 됩니다.
				</div>
			</div>
			
			<hr class = "hr-2">
			<div class = "sub">
				<h3 class = "sub_t">  * 운전면허증 분실 시 대여방법 </h3>
			</div>
			
			<div class="caution">
			<h4 class="tit_guide cr" style = "margin-left : 50px;">꼭 확인하세요!</h4>
			<ul class="guide_list">
				<li class="f14">운전면허증은 차량대여를 위해 필요한 필수요소 입니다.</li>
				<li class="f14">운전면허증 분실시, 운전면허증을 대신할 수 있는 운전경력증명서와 주민등록증이 필요합니다.</li>
				<li class="f14" style = "margin-top : 20px;">[운전 경력 증명 방법]</li>
				<li class="f14">* 경찰서 민원실 방문 → 운전면허경력증명서 발급 (수수료 1,000원)</li>
				<li class="f14">* 민원24 홈페이지(<a href = "http://www.minwon.go.kr">http://www.minwon.go.kr</a>)>접속 → 로그인 → 민원신청 → 즉시민원발급 → 운전경력증명발급 (본인이름의 공인인증서가 필요함).</li>
				<li class="f14">* 운전면허증 분실시, 운전면허증을 대신할 수 있는 운전경력증명서와 주민등록증이 필요합니다.</li>
			</ul>
		</div>
		
			<hr class = "hr-2">
			<div class = "sub">
				<h3 class = "sub_t">  * 교통사고 대처법 </h3>
			</div>
			
			<div class="caution">
			<ul class="guide_list">
				<li class="f14">사고발생시(교통사고대처요령) 당황하지 마시고 아래 대처요령을 숙지하신 후 즉시, 고객센터 (전화 : 3333-3333)로 전화주세요.</li>
				<li class="f14">사고발생시, 사고상황 등을 회사로 즉시 통보해야합니다. (자동차대여약관 규정)</li>
				<li class="f14" style = "color : red">미연락시, 반납후 문제발생으로 인한 수리비(상대피해포함)는 전액 고객부담되오니, 필히 연락바랍니다.</li>
				<li class="f14" style = "margin-top : 20px;">[사고 조치]</li>
				<li class="f14">* 쌍방사고 및 상대/자차일방사고 : 보험직원이 현장출동 후 사고처리</li>
				<li class="f14" style = "color : red">※ 차량운행 불가 시, 견인출동은 10km까지 무상지원(초과 시 1km당 2,000원 요금발생 고객부담)</li>
				<li class="f14" style = "margin-top : 15px;">* 단독사고 : 차량상태에 따라 차량회수 또는 지속운행</li>
				<li class="f14" style = "color : red">※ 차량운행 불가 시, 견인출동은 고객부담</li>
				<li class="f14" style = "color : red">※ 차량교체 시 자차효력 상실/지속운행 시 자차효력 유지</li>
			</ul>
		</div>
			
  		</div> <!-- 본문 --> 
		</div>
</main>
	
	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
	
  	<!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>