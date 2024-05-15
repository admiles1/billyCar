<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새로운 모델 추가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function closeWindowAfterSubmit(event) {
    event.preventDefault(); // 폼 기본 제출 방지
    $.ajax({
        url: 'addModel',
        type: 'POST',
        data: $('form').serialize(),
        success: function() {
            window.opener.location.reload();
            window.close();
        }
    });
}
</script>
</head>
<body>
<div class="container">
    <h2>새로운 모델 추가</h2>
    <form onsubmit="closeWindowAfterSubmit(event)">
        <div class="form-group">
            <label for="brandName">브랜드 이름</label>
            <input type="text" class="form-control" name="brandName" value="${param.brand}" readonly>
        </div>
        <div class="form-group">
            <label for="newModelName">모델 이름</label>
            <input type="text" class="form-control" name="newModelName" required>
        </div>
        <button type="submit" class="btn btn-primary">추가</button>
    </form>
</div>
</body>
</html>
