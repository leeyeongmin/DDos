<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<%
	//String memberId = (String) session.getAttribute("id");
	%>
	<div id="info">
		스터디 명&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;${study.studyName}<br>
		스터디 주제&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;${study.studySubject}<br>
		스터디 시간&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;${study.studyTime}&ensp;:&ensp;00<br>
		시작 일&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;${study.studyDate}<br>
		모집 종료일&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;${study.recruitEnd }<br>
		모집 인원&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;${study.recruitPerson }명<br>
		스터디 룸&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;${study.studyroomNumber}번 방<br>
		스터디 장&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;${study.memberId }<br>
	</div>
	

<!-- 
스터디장과 로그인한 회원의 ID를 비교 같으면 삭제 다르면 가입-->	
<c:if test="${sessionScope.login.id != study.memberId}">
	<form action="./insertStudyMember" method="post" id="studyMember">
		<input type="hidden" name="studyNumber" value="${study.studyNumber}">
		<input type="hidden" name="memberId" value="${sessionScope.login.id }">
		<%-- <input type="hidden" name="memberId" value="<%= memberId %>">
		 --%>
		 
		<button type="submit" class="btn btn-secondary">Sign Up</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        
	</form>
</c:if>

<!-- 
스터디장과 로그인한 회원의 ID를 비교 같으면 삭제 다르면 가입-->
<c:if test="${sessionScope.login.id == study.memberId}">
	<form action="./deleteStudy" method="post" id="studyCaptin">
		<input type="hidden" name="studyNumber" value="${study.studyNumber}">
		<button type="submit" class="btn btn-secondary">Delete</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	</form>
</c:if>