<%@page import="com.ddos.web.login.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	이름 : ${login.name} 
		<input type="button" value="A열람실"  onclick="location.href='getRoom?room=A'"> &nbsp;&nbsp;
		<input type="button" value="B열람실"  onclick="location.href='getRoom?room=B'"> &nbsp;&nbsp;
		<input type="button" value="C열람실"  onclick="location.href='getRoom?room=C'"> &nbsp;&nbsp;

</body>
</html>