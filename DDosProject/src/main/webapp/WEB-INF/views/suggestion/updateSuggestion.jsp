<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
</head>
<body>
	<h3>건의 수정</h3>
	<form action="updateSuggestion" method="post">
		글번호 <input type="hidden" name="sugNum" value="${suggestion.sugNum}">${suggestion.sugNum}<br>
		제목 <input type="text" name="sugTitle" value="${suggestion.sugTitle}"><br>
		내용
		<textarea rows="20" cols="20" name="sugCont">${suggestion.sugCont}</textarea>
		<br>
		<button>수정 완료</button>
	</form>
</body>
</html>