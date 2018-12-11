<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getSuggestionList.jsp</title>
<script>
	function check(){
		if(document.search.searchKeyword.value == "") {
			alert("검색어를 입력하세요");
			document.search.searchKeyword.focus();
			return;
		}
		document.search.submit();
	}
</script>
</head>
<body>
 	<c:if test="${empty sessionScope.login}">
		<a href="LoginForm">로그인</a>
	</c:if>
	<c:if test="${not empty sessionScope.login}">
		${sessionScope.login.id} 님<a href="Logout">로그아웃</a>
	</c:if> 
	<h3>건의사항</h3>
 	<form action="search" name="search" method="post">
		<select name="searchType">
			<option value="sugTitle"<c:if test="${'sugTitle' == searchType}"> selected </c:if>>제목</option>
		</select>
		<input type="text" name="searchKeyword" value="${searchKeyword}">
		<input type="button" value="검색" onclick="click()">
	</form>
	
	<form action="getSuggestionList">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${suggestionList}" var="suggestion">
				<tr>
					<td>${suggestion.sugNum}</td>
					<td><a href="./getSuggestion?sugNum=${suggestion.sugNum}">${suggestion.sugTitle}</a></td>
					<td>${suggestion.sugCont}</td>
					<td>${suggestion.sugDate}</td>
					<td>${suggestion.sugCnt}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<a href="./insertSuggestionform">등록</a>
</body>
</html>