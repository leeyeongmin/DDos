<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
		
		//댓글등록처리
		$("#btn").click(function(){
			history.back();			
		});
		
});//$() end ready event
</script>

</head>
<body>
	<%
	String memberId = (String) session.getAttribute("id");
	%>
	스터디명:${study.studyName}<br>
	스터디주제:${study.studySubject }<br>
	스터디시간${study.studyTime }<br>
	시작일${study.studyDate }<br>
	모집종료일${study.recruitEnd }<br>
	모집인원:${study.recruitPerson }<br>
	스터디룸:${study.studyroomNumber }<br>
	스터디장:${study.memberId }<br>
	<form action="./insertStudyMember" method="post">
		<input type="hidden" name="studyNum" value="${study.num}">
		<input type="hidden" name="memberId" value="<%= memberId %>">
		<input type="submit" value="가입신청">
		<input type="button" value="취소" id="btn"> 
	</form>
</body>
</html>