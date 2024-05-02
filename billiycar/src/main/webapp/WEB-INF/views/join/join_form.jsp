<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	let checkIdResult = false;
	let checkPasswdResult = false;
	let checkPasswd2Result = false;
	$(function() {
		document.querySelector("#btnCheckId").onclick = function() {
			window.open("check_id.jsp", "check_id", "width=500, height=400");
		};
		// --------------------------------------------------------------------
		// 2. 아이디 입력란에서 커서가 빠져나갈 때 아이디 길이 체크하기 => blur 이벤트
// 		document.querySelector("#id").onblur = function() {}
		document.fr.id.onblur = function() {
			// 입력된 ID 텍스트의 길이가 4 ~ 8글자 사이일 경우 아래쪽 빈 공간(div 태그 영역)에 
		    // "사용 가능" 초록색으로 표시, 아니면, "4~8글자만 사용 가능합니다" 빨간색으로 표시
// 		    let id = document.fr.id.value; // 입력받은 아이디 값 저장
		    let id = $("#id").val(); // 입력받은 아이디 값 저장
// 		    console.log("id = " + id + ", id.length = " + id.length);
		    
		    if(id.length >= 4 && id.length <= 8) {
// 		    	document.querySelector("#checkIdResult").innerText = "사용 가능";
// 		    	document.querySelector("#checkIdResult").style.color = "GREEN";
				$("#checkIdResult").text("사용 가능222");
				$("#checkIdResult").css("color", "green");
		    	
		    	// ID 규칙 검사 적합 여부 저장 변수에 true(적합)값 저장
		    	checkIdResult = true;
		    } else {
// 		    	document.querySelector("#checkIdResult").innerText = "4~8글자만 사용 가능합니다";
// 		    	document.querySelector("#checkIdResult").style.color = "RED";
				$("#checkIdResult").text("4~8글자만 사용 가능합니다222");
				$("#checkIdResult").css("color", "red");
		    	
		    	// ID 규칙 검사 적합 여부 저장 변수에 false(부적합)값 저장
		    	checkIdResult = false;
		    }
		}
		// --------------------------------------------------------------------
		// 3. 비밀번호 입력란에 키를 누를때마다 비밀번호 길이 체크하기 => keyup
		document.fr.passwd.onkeyup = function() {
			// 입력된 패스워드 텍스트의 길이가 8 ~ 16글자 사이이면 "사용 가능한 패스워드"(파란색) 표시,
   			// 아니면, "사용 불가능한 패스워드"(빨간색) 표시
// 		    let passwd = $("#passwd").val(); // id 선택자로 접근
		    let passwd = $("input[name=passwd]").val(); // 태그 및 속성&속성값으로 접근
// 		    console.log("passwd = " + passwd + ", passwd.length = " + passwd.length);
		    
		    if(passwd.length >= 8 && passwd.length <= 16) {
		    	$("#checkPasswdResult").text("사용 가능한 패스워드");
				$("#checkPasswdResult").css("color", "BLUE");
		    	
		    	// 비밀번호 규칙 검사 적합 여부 저장 변수에 true(적합)값 저장
		    	checkPasswdResult = true;
		    } else {
		    	$("#checkPasswdResult").text("사용 불가능한 패스워드");
				$("#checkPasswdResult").css("color", "RED");
				
		    	// 비밀번호 규칙 검사 적합 여부 저장 변수에 false(부적합)값 저장
		    	checkPasswdResult = false;
		    }
		    
		    // 비밀번호 입력(변경) 시 비밀번호 확인 작업도 함께 수행
// 		    checkSamePasswd();
		}
		
		// --------------------------------------------------------------------
		// 4. 비밀번호확인 입력란에 키를 누를때마다 비밀번호와 같은지 체크하기 => keyup
		// => 비밀번호와 비밀번호확인 입력 내용이 같으면 "비밀번호 일치"(파란색) 표시,
		//    아니면, "비밀번호 불일치"(빨간색) 표시
// 		document.fr.passwd2.onkeyup = function() {
// 			let passwd = document.fr.passwd.value; // 입력받은 패스워드 값 저장
// 			let passwd2 = document.fr.passwd2.value; // 입력받은 패스워드확인 값 저장
			
// 			if(passwd == passwd2) { // 두 패스워드 일치
// 		    	document.querySelector("#checkPasswd2Result").innerText = "비밀번호 일치";
// 		    	document.querySelector("#checkPasswd2Result").style.color = "BLUE";
// 			} else { // 불일치
// 		    	document.querySelector("#checkPasswd2Result").innerText = "비밀번호 불일치";
// 		    	document.querySelector("#checkPasswd2Result").style.color = "RED";
// 			}
// 		}
		
		document.fr.passwd2.onkeyup = checkSamePasswd;
		
		// 3-2(추가). 비밀번호 확인 후 다시 비밀번호 변경 시 비밀번호 확인 작업을 수행하기
		// => change 이벤트를 통해 비밀번호 입력 란에서 커서 빠져나갈 때 비밀번호 확인 함수 호출
		document.fr.passwd.onchange = checkSamePasswd;
		// --------------------------------------------------------------------
		// 5. 주민번호 숫자 입력할때마다 길이 체크하기 => keyup
		// => 주민번호 앞자리 입력란에 입력된 숫자가 6자리이면 뒷자리 입력란으로 커서 이동시키기
		// => 주민번호 뒷자리 입력란에 입력된 숫자가 7자리이면 뒷자리 입력란에서 커서 제거하기
		document.fr.jumin1.onkeyup = function() {
			if(document.fr.jumin1.value.length == 6) { // 앞자리 6자리 체크
				document.fr.jumin2.focus(); // 주민번호 뒷자리로 커서 이동
			}
		};
		
		document.fr.jumin2.onkeyup = function() {
			if(document.fr.jumin2.value.length == 7) { // 뒷자리 7자리 체크
				document.fr.jumin2.blur(); // 주민번호 뒷자리에서 커서 제거
			}
		};
		// --------------------------------------------------------------------
		// 6. 주소검색 버튼 클릭 시 search_address.jsp 페이지를 새 창에 표시하기
		// => 아래쪽에 있음(click 이벤트 - search_address() 함수 호출)
		// --------------------------------------------------------------------
		// 7. 이메일 도메인 선택 셀렉트 박스 항목 변경 시 => change
   		//    선택된 셀렉트 박스 값을 이메일 두번째 항목(@ 기호 뒤)에 표시하기
   		document.fr.emailDomain.onchange = function() {
// 			document.fr.email2.value = document.fr.emailDomain.value;
			let domain = $("#emailDomain").val();
			$("#email2").val(domain);
			
		    // "직접입력" 항목 외의 도메인 선택 시 도메인 입력창을 잠금처리 및 회색으로 변경하고,
		    // "직접입력" 항목 선택 시 도메인 입력창에 커서 요청 및 잠금 해제
		    if(domain == "") { // 직접입력
		    	document.fr.email2.focus(); // 포커스 요청
		    	document.fr.email2.readOnly = false; // 읽기전용 모드 해제
// 		    	document.fr.email2.style.background = ""; // 배경색 원래대로
				$("#email2").css("background", "");
		    } else { // 직접입력 외의 항목
		    	document.fr.email2.readOnly = true; // 읽기전용 모드 설정
// 		    	document.fr.email2.style.background = "LIGHTGRAY"; // 배경색 회색
				$("#email2").css("background", "PINK");
		    }
		    
		};
		// --------------------------------------------------------------------
		// 8. 취미의 "전체선택" 체크박스 체크 시 취미 항목 모두 체크, => click
		//    "전체선택" 해제 시 취미 항목 모두 체크 해제하기
		document.querySelector("#cb_all").onclick = function() {
			// 전체선택 체크박스 체크 상태값을 각 체크박스의 체크 상태값으로 설정
// 			document.fr.hobby[0].checked = document.querySelector("#cb_all").checked;
// 			document.fr.hobby[1].checked = document.querySelector("#cb_all").checked;
// 			document.fr.hobby[2].checked = document.querySelector("#cb_all").checked;
			for(let hobby of document.fr.hobby) {
				hobby.checked = document.querySelector("#cb_all").checked;
			}
		};
		
		// --------------------------------------------------------------------
		// 9. 가입(submit) 클릭 시 이벤트 처리를 통해
		//    이름, 아이디, 비밀번호, 비밀번호확인, 주민번호, 주소, Email, 직업, 성별, 취미, 가입동기 항목을
		//    모두 입력했는지 체크하고 모든 항목이 입력되었을 경우에만 submit 동작이 수행되도록 처리
		//    입력되지 않은 항목이 있을 경우 해당 항목을 입력하도록 경고창 출력 및 해당 항목에 포커스 요청
		// => 폼에 대한 submit 이벤트로 처리하거나 일반 버튼으로 submit 동작 처리
		document.fr.onsubmit = function() {
			// 만족하지 않는 조건이 있을 경우 submit 동작 취소를 위해 false 값 리턴
			if(document.fr.name.value == "") {
				alert("이름 입력 필수!");
				document.fr.name.focus();
				return false;
			} else if(checkIdResult == false) { // 아이디 규칙 부적합(길이 체크 포함됨)
				alert("아이디 확인 필수!");
				document.fr.id.focus();
				return false;
			} else if(checkPasswdResult == false) { // 비밀번호 규칙 부적합(길이 체크 포함됨)
				alert("비밀번호 확인 필수!");
				document.fr.passwd.focus();
				return false;
			} else if(checkPasswd2Result == false) { // 비밀번호확인 규칙 부적합
				alert("비밀번호확인 확인 필수!");
				document.fr.passwd2.focus();
				return false;
			} else if(document.fr.jumin1.value == "") {
				alert("주민번호 입력 필수!");
				document.fr.jumin1.focus();
				return false;
			} else if(document.fr.jumin2.value == "") {
				alert("주민번호 입력 필수!");
				document.fr.jumin2.focus();
				return false;
			} else if(document.fr.postCode.value == "" || document.fr.address1.value == "" || document.fr.address2.value == "") {
				alert("주소 입력 필수!");
				document.fr.postCode.focus();
				return false;
			} else if(document.fr.email1.value == "" || document.fr.email2.value == "") {
				alert("E-Mail 입력 필수!");
				document.fr.email1.focus();
				return false;
			} else if(document.fr.job.value == "") {
				alert("직업 선택 필수!");
				document.fr.job.focus();
				return false;
			} else if(document.fr.gender.value == "") {
				alert("성별 선택 필수!");
				return false;
			} else if(!document.fr.hobby[0].checked && !document.fr.hobby[1].checked && !document.fr.hobby[2].checked) {
				alert("취미 선택 필수!");
				return false;
			} 
			
		};
		
		// --------------------------------------------------------------------
		// 10. 뒤로가기 버튼 클릭 시 이벤트 처리를 통해 이전 페이지로 이동 처리
		// => 뒤로가기 버튼 태그에 직접 기술
		// --------------------------------------------------------------------
		
	}); // document 객체의 ready 이벤트 끝
	
	function checkSamePasswd() {
		let passwd = document.fr.passwd.value; // 입력받은 패스워드 값 저장
		let passwd2 = document.fr.passwd2.value; // 입력받은 패스워드확인 값 저장
		
		if(passwd == passwd2) { // 두 패스워드 일치
	    	$("#checkPasswd2Result").text("비밀번호 일치");
			$("#checkPasswd2Result").css("color", "BLUE");
	    	
	    	// 비밀번호확인 규칙 검사 적합 여부 저장 변수에 true(적합)값 저장
	    	checkPasswd2Result = true;
		} else { // 불일치
	    	$("#checkPasswd2Result").text("비밀번호 불일치");
			$("#checkPasswd2Result").css("color", "RED");
	    	
	    	// 비밀번호확인 규칙 검사 적합 여부 저장 변수에 false(부적합)값 저장
	    	checkPasswd2Result = false;
		}
	}


</script>
<link href="${pageContext.request.contextPath}/resources/css/join_form.css" rel="stylesheet">
<meta charset="UTF-8">
<title>빌리카 회원가입</title>
<link rel="stylesheet" href="css/join_form.css">
</head>
<body>
	<header><jsp:include page="../inc/top.jsp"></jsp:include></header>
	<!--  메인 시작 -->
	<article class="sign-up-container">
		<form action="joinPro" class="box2_form" method="post" name="fr">
			<div class="title">
				<b style="color: #00AAFF">Billycar</b>
			</div>
			<div id = "id_1">
				<input type="text" placeholder="아이디" class="id_box" name="member_id" id="member_id"/>
				<input type="button" class="id_check" value="중복확인" id="btnCheckId"><br>
				<div id="checkIdResult"></div>
			</div>
			<div>
				<input type="password" placeholder="비밀번호" name="member_passwd" id="member_passwd"/><br>
			</div>
			<div>
				<input type="password" placeholder="비밀번호 확인" /><br>
			</div>
			<div>
				<input type="email" placeholder="Email" name="member_email" id="member_email"/><br>
			</div>
			<br>
			<div>
				<input type="text" placeholder="이름" name="member_name" id="member_name"/><br>
			</div>
			<div>
				<input type="text" placeholder="생년월일 8자리" name="member_birth" id="member_birth"/>
			</div>
	<!-- 		<div class="check_gender"> -->
	<!-- 			<input type="checkbox" value="여자" class="gender woman">여자 -->
	<!-- 			<input type="checkbox" value="남자" class="gender man">남자 -->
	<!-- 		</div> -->
			<div class="tel">
				<select class="telecom">
					<option>통신사</option>
					<option value="SKT">SKT</option>
					<option value="KT">KT</option>
					<option value="LGU+">LG U+</option>
					<option value="SKTaff">SKT 알뜰폰</option>
					<option value="KTaff">KT 알뜰폰</option>
					<option value="LGU+aff">LG U+ 알뜰폰</option>
				</select>
				<input type="text" placeholder="전화번호" class="telephone_num" name="member_phone" id="member_phone"/>
				<input type="button" class="check_tel" value="인증하기"><br>
			</div>
			<div>
				<input type="text" placeholder="인증번호"/>
			</div>
				<div>
				<input type="text" placeholder="추천인 아이디" name="inviter" id="member_inviter"/>
			</div>
			<div>
				<input type="submit" value="회원가입" class="btn btn-4" onsubmit="submit()">
<!-- 				<button class="btn btn-4">회원가입</button> -->
			</div>
		</form>
	</article>
	<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>
</body>
</html>









