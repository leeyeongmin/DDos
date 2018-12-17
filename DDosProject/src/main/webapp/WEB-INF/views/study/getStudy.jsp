<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<%
	//String memberId = (String) session.getAttribute("id");
	%>
	<div id="info">
		스터디명:${study.studyName}<br>
		스터디주제:${study.studySubject}<br>
		스터디시간:${study.studyTime}<br>
		시작일${study.studyDate}<br>
		모집종료일${study.recruitEnd }<br>
		모집인원:${study.recruitPerson }<br>
		스터디룸:${study.studyroomNumber}<br>
		스터디장:${study.memberId }<br>
	</div>
	

<!-- 
스터디장과 로그인한 회원의 ID를 비교 같으면 삭제 다르면 가입-->	
<c:if test="${sessionScope.login.id != study.memberId}">
	<form action="./insertStudyMember" method="post" id="studyMember">
		<input type="hidden" name="studyNumber" value="${study.studyNumber}">
		<input type="hidden" name="memberId" value="${sessionScope.login.id }">
		<%-- <input type="hidden" name="memberId" value="<%= memberId %>">
		 --%>
		 <input class="btn btn-primary" type="submit" value="가입신청">
		 <input class="btn btn-secondary" type="button" value="취소" id="btn" onclick="history.back()"> 
		
	</form>
</c:if>

<!-- 
스터디장과 로그인한 회원의 ID를 비교 같으면 삭제 다르면 가입-->
<c:if test="${sessionScope.login.id == study.memberId}">
	<form action="./deleteStudy" method="post" id="studyCaptin">
		<input type="hidden" name="studyNumber" value="${study.studyNumber}">
		 <input  class="btn btn-secondary" type="submit" value="삭제">
		 <input class="btn btn-secondary" type="button" value="취소" id="btn" onclick="history.back()"> 
		 
	</form>
</c:if>