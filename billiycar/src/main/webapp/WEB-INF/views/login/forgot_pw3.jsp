<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forgot_pw3.css">
<style>
.g-recaptcha-container {
    display: flex;
    justify-content: left;
    align-items: center;
    margin-top: 20px;
    margin-left: 15px;
}
</style>
</head>
<body>
<header><jsp:include page="../inc/top.jsp"></jsp:include></header>

<%
    // URL 파라미터에서 member_id 값을 가져옵니다.
    String memberId = request.getParameter("member_id");
%>

<form method="post" action="forgot_pw_step3" name="fr">
    <div class="container">
        <div class="button">
            <a href="forgot_id" class="forgot_id">아이디 찾기</a> |
            <a class="forgot_pw">비밀번호 찾기</a>
        </div>
        <hr>
        <input type="hidden" value="<%= memberId %>" name="member_id">
        <div>
            <input type="password" placeholder="새 비밀번호" name="member_passwd" id="member_passwd" required/><br>
        </div>
        <div>
            <input type="password" placeholder="새 비밀번호 확인" name="member_passwd2" id="member_passwd2" required/><br>
            <div id="checkPwResult"></div>
        </div>
        <div class="g-recaptcha-container">
            <div class="g-recaptcha" data-sitekey="6LfQ8swpAAAAAMfwmMU-_UGqKZL_96D04eJGk2CA"></div>
        </div>
        <div class="next">
            <input type="submit" value="완료">
        </div>
    </div>
</form>

<footer><jsp:include page="../inc/bottom.jsp"></jsp:include></footer>

<script type="text/javascript">
    let checkPasswdResult = false;
    let checkPasswd2Result = false;
    // JSP에서 URL 파라미터를 JavaScript 변수에 할당
    let id = "<%= memberId %>";

    $(function() {
        $("#member_passwd").keyup(function() { // 비밀번호 유효성 검사
            let passwd = $("#member_passwd").val();
            let msg = "";
            let color = "";
            let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;

            if(lengthRegex.test(passwd)) {
                let engUpperRegex = /[A-Z]/; // 대문자
                let engLowerRegex = /[a-z]/; // 소문자
                let numRegex = /\d/; // 숫자
                let specRegex = /[!@#$%^&*]/; // 특수문자
                let count = 0;
                if(engUpperRegex.test(passwd)) { count++; }
                if(engLowerRegex.test(passwd)) { count++; }
                if(numRegex.test(passwd)) { count++; }
                if(specRegex.test(passwd)) { count++; }

                switch (count) {
                    case 4: msg = "안전"; color = "GREEN"; checkPasswdResult = true; break;
                    case 3: msg = "보통"; color = "ORANGE"; checkPasswdResult = true; break;
                    case 2: msg = "위험"; color = "RED"; checkPasswdResult = true; break;
                    case 1:
                    case 0: 
                        msg = "영문 대소문자,숫자,특수문자 중 2개 이상을 포함시켜주세요."; 
                        color = "RED"; 
                        checkPasswdResult = false;
                }
            } else {
                msg = "영문 대소문자,숫자,특수문자 중 2개 이상을 포함시켜주세요."; 
                color = "RED";
                checkPasswdResult = false;
            }

            if(passwd.includes(id)) {
                msg = "비밀번호에 아이디가 포함되었습니다.";
                color = "RED";
                checkPasswdResult = false;
            }

            $("#checkPwResult").text(msg);
            $("#checkPwResult").css("color", color);
        });

        $("#member_passwd2").keyup(checkSamePasswd);
    });

    function checkSamePasswd() {
        let passwd = $("#member_passwd").val(); 
        let passwd2 = $("#member_passwd2").val();

        if(passwd === passwd2) {
            $("#checkPwResult").text("*비밀번호가 일치합니다.");
            $("#checkPwResult").css("color", "BLUE");
            checkPasswd2Result = true;
        } else {
            $("#checkPwResult").text("*비밀번호가 일치하지 않습니다.");
            $("#checkPwResult").css("color", "RED");
            checkPasswd2Result = false;
        }
    }

    document.fr.onsubmit = function() {
        let response = grecaptcha.getResponse();
        if (response.length == 0) {
            alert("자동입력 방지 체크를 완료해주세요!");
            return false;
        }

        if(!checkPasswdResult) {
            alert("새 비밀번호를 확인해주세요!");
            document.fr.member_passwd.focus();
            return false;
        } else if(!checkPasswd2Result) {
            alert("비밀번호가 일치하지 않습니다!");
            document.fr.member_passwd2.focus();
            return false;
        } 
        return true;
    }
</script>
</body>
</html>
