<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
</head>
<body>
<h3>건의사항 보기</h3>
글번호 : ${suggestion.sugNum} <br>
제목: ${suggestion.sugTitle} <br>
등록일: ${suggestion.sugDate} <br>
조회수: ${suggestion.sugCnt} <br>
내용: ${suggestion.sugCont} <br><hr>
<a href="getSuggestionList">목록</a>
<a href="./updateSuggestionform?sugNum=${suggestion.sugNum}">수정</a>  
<a href="./deleteSuggestion?sugNum=${suggestion.sugNum}">삭제</a>
</body>
</html>



