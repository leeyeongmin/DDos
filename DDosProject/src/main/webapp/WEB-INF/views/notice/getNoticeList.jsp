<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getNoticeList.jsp</title>
</head>
<body>
 	<c:if test="${empty sessionScope.login}">
		<a href="LoginForm">로그인</a>
	</c:if>
	<c:if test="${not empty sessionScope.login}">
		${sessionScope.login.id} 님<a href="Logout">로그아웃</a>
	</c:if> 
	<h3>공지사항</h3>
 	<form>
		<select name="searchCondition">
			<option value="title">제목
			<option value="content">내용
		</select>
		<input type="text" name="searchKeyword">
		<button>검색</button>
		<input type="hidden" name="sortCol">
	</form>
	
	<script>
		function go_sort(sortCol){
			document.frm.sortCol.value = sortCol;
			document.frm.submit();
		}
	</script>
	
	<form action="getNoticeList">
		<table border="1">
			<tr>
				<td>번호<a href="#" onclick="go_sort('seq')">▲</a></td>
				<td>제목<a href="#" onclick="go_sort('title')">▲</a></td>
				<td>내용<a href="#" onclick="go_sort('content')">▲</a></td>
				<td>작성일<a href="#" onclick="go_sort('regdate')">▲</a></td>
				<td>조회수<a href="#" onclick="go_sort('cnt')">▲</a></td>
			</tr>
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					<td>${notice.noticeNum}</td>
					<td><a href="./getNotice?noticeNum=${notice.noticeNum}">${notice.noticeTitle}</a></td>
					<td>${notice.noticeCont}</td>
					<td>${notice.noticeDate}</td>
					<td>${notice.noticeCnt}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<a href="./insertNoticeform">등록</a>
</body>
</html>