<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forgot_pw2.css">
</head>
<body>
    <div class="container">
        <div class="button">
            <a href="#">아이디 찾기</a> |
            <a href="#">비밀번호 찾기</a>
        </div>
		<hr>
   
        <h4>본인 명의 휴대전화로 인증</h4>

        <div class="tel">
            <input type="text" placeholder="이름" class="name">
            <br>
            <select class="telecom">
                <option>통신사</option>
                <option>SKT</option>
                <option>KT</option>
                <option>LG U+</option>
                <option>SKT 알뜰폰</option>
                <option>KT 알뜰폰</option>
                <option>LG U+ 알뜰폰</option>
            </select>
            <input type="text" placeholder="전화번호" class="telephone_num"/>
            <input type="button" class="check_btn" value="인증하기" >
            <br>
            <div>
                <input type="text" placeholder="인증번호" class="cernum"/>
                <br>
            </div>
        </div>

        <div class="next">
        <input type="button" value="다음">
        </div>
    </div>
</body>
</html>
