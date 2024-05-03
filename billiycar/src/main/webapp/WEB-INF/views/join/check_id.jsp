<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
form {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: 'Montserrat', sans-serif;
  height: 100vh;
  margin: -20px 0 50px;
  overflow: hidden;
}

input {
  background-color: #eee;
  border: none;
  padding: 12px 15px;
  margin: 8px 0;
  width: 300px;
  border-radius: 20px ;
}

.id_check{
  border-radius: 20px;
  border: 1px solid #00AAFF;
  background-color: #00AAFF;
  color: #FFFFFF;
  font-size: 12px;
  font-weight: bold;
  padding: 7px 9px;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
  margin:10px;
  position: relative;
  width: 80px;
  cursor: pointer;
}
</style>
<title>아이디 중복확인</title>
</head>
<body>
	<form action="">
		<input type="text" placeholder="아이디" class="id_box" name="member_id" id="member_id"/>
		<input type="button" class="id_check" value="중복확인" id="btnCheckId"><br>
		<div id="checkIdResult"></div>
	</form>
</body>
</html>