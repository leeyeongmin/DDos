<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<h3>공지 수정</h3>
	<form action="updateNotice" method="post">
		글번호 <input type="hidden" name="noticeNum" value="${notice.noticeNum}">${notice.noticeNum}<br>
		제목 <input type="text" name="noticeTitle" value="${notice.noticeTitle}"><br>
		내용
		<textarea rows="20" cols="20" name="noticeCont">${notice.noticeCont}</textarea>
		<br>
		<button>수정 완료</button>
	</form>
</body>
</html>