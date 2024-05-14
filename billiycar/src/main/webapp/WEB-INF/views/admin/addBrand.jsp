<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새로운 제조사 추가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>새로운 제조사 추가</h2>
    <form action="addBrandModel" method="post">
        <div class="form-group">
            <label for="newBrandName">제조사 이름</label>
            <input type="text" class="form-control" name="newBrandName" required>
        </div>
        <button type="submit" class="btn btn-primary">추가</button>
    </form>
</div>
</body>
</html>
