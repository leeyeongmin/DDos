<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<h3>공지사항 보기</h3>
글번호 : ${notice.noticeNum} <br>
제목: ${notice.noticeTitle} <br>
등록일: ${notice.noticeDate} <br>
조회수: ${notice.noticeCnt} <br>
내용: ${notice.noticeCont} <br><hr>
<a href="./updateNoticeform?noticeNum=${notice.noticeNum}">수정</a>  
<a href="./deleteNotice?noticeNum=${notice.noticeNum}">삭제</a>
</body>
</html>



