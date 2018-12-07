<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<form name="frm">
		<select name="searchCondition">
			<option value="title">제목 
			<option value="content">내용
		</select>
		<input type="text" name="searchKeyword">
		<button>검색</button>
	</form>
	<div class="table-responsive">
            <table class="table table-striped">
	
	<tr>
		<th>도서명 </th>
		<th>저자</th>
		<th>출판사</th>
		<th>위치</th>
	</tr>
	
	<c:forEach items="${bookList}" var="book">
	<tr>
		<td>${book.bookTitle} </td>
		<td>${book.bookWriter}</td>
		<td>${book.bookComp}</td>
		<td>${book.bookLoc}</td>
	</tr>
	</c:forEach>
	
	</table>
	</div>
</body>
</html>