<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="updateBook" method="post">
<input type ="hidden" name ="isbn" value="${book.isbn}"><br>
	도서명 <input type ="text" name ="bookTitle" value="${book.bookTitle}"><br>
	내용  <textarea rows="2" cols="30" name ="content">"${board.content}"</textarea><br>
	<button>저장</button>
</form> 

</body>
</html>