<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<h3>공지 등록</h3>
<form action="insertNotice" method="post">	
	작성자	<input type="hidden" name="memberId" value="${sessionScope.login.id}">${sessionScope.login.id}<br>
	제목	<input type="text" name="noticeTitle" ><br>
	내용	<textarea rows="20" cols="40" name="noticeCont"></textarea><br>
	<button>등록</button>
</form>
</body>
</html>