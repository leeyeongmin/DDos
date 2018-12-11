<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
</head>
<body>
<h3>건의 등록</h3>
<form action="insertSuggestion" method="post">	
	작성자<input type="hidden" name="memberId" value="${sessionScope.login.id}">${sessionScope.login.id}<br>
	제목<input type="text" name="sugTitle" ><br>
	내용<textarea rows="20" cols="40" name="sugCont"></textarea><br>
	<button>등록</button>
</form>
</body>
</html>