<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>

<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
	#passForm {
		width: 300px;
		margin-top : 200px;
		margin-bottom : 200px;
		margin-left : 400px;
		text-align: center;
		padding : 20px;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		width: 300px;
		margin: auto;
		text-align: center;
	}
	
	#passwd_adimin {
		margin-top : 10px;
	}
	
	#btn_area{
		margin-top : 10px;
	}
	
	#btn_area input {
		padding : 10px;
		border-radius : 10px;
		background-color : #275efe;
		border : none;
		color : white;
	}
	
</style>


</head>
<body>

	<header>
  		<jsp:include page="../inc/top.jsp"/>
  	</header>
  	
  	<main class="container">

<article id="passForm">
		<h2>게시판 글 삭제</h2>
		<form action="noticeDelete" name="deleteForm" method="post">
		
			<!-- 파라미터 전달 -->
  			<input type="hidden" name="notice_idx" value="${param.notice_idx}">
  			<input type="hidden" name="pageNum" value="${param.pageNum}">
		
			<table>
				<tr id ="passwd_adimin">
					<td><label>관리자 비밀번호</label></td>
					<td><input type="password" name="notice_passwd" required="required"></td>
				</tr>
			</table>
			
			<div id="btn_area">
				<input type="submit" value="삭제">&nbsp;&nbsp;
				<input type="button" value="돌아가기" onclick="javascript:history.back()">
			</div>
			
		</form>
	</article>
	</main>
  	<footer>
		<jsp:include page="../inc/bottom.jsp"/>
	</footer>
	
		<!-- 부트 스트랩-->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
</body>


</html>