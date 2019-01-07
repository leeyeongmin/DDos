<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ddos.web.study.impl.StudyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

  	<%! 	
		int ary[][] = new int[2][3];	 
	 %>
	<% 	
		String year=request.getParameter("year");
		String day=request.getParameter("day");
		String month=request.getParameter("month");
		
		if(Integer.parseInt(month)>12)
			month="1";
		else if(Integer.parseInt(month)<1)
			month="12";
		
		StudyDAO sd = new StudyDAO();
		ary=sd.getDailyStudyList(Integer.parseInt(month), Integer.parseInt(day));
		sd.close();
	%>  



<div>
    <div id="studyList-b">
	    <form id="addForm" action="./insertStudy" method="post" target="studylist.do" name="studycheck" onsubmit="return checkOne();">
			<p>스터디 명&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;<input type="text" name="studyName"></p>
			<p>스터디 주제&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;<input type="text" name="studySubject"></p>
			<p>스터디 룸&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;
			<select name="studyroomNumber" id="studyroomNumber">
				<option>-선택-</option>
				<option value="1">1번방</option>
				<option value="2">2번방</option>
			</select>
			</p>
			<p id="studyTime">스터디 시간&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;
			<select name="studyTime" id="studyTime">
				<option value="9">09:00~12:00</option>
				<option value="12">12:00~15:00</option>
				<option value="15">15:00~18:00</option>
			</select>
			</p>

			<p>시작 일자&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp; <%=year %>&ensp;년 &ensp;<%=month %>&ensp;월 &ensp;<%=day %>&ensp;일</p>
			<% 
			String studyDate = null;
			if(Integer.parseInt(month)<10 && Integer.parseInt(day)<10){
				studyDate = year+"-0"+month+"-0"+day;
			}
			else if(Integer.parseInt(month)<10 && Integer.parseInt(day)>10){
				studyDate = year+"-0"+month+"-"+day; 
			}
			else if(Integer.parseInt(month)>10 && Integer.parseInt(day)<10){
				studyDate = year+"-"+month+"-0"+day; 
			}
			else{
				studyDate = year+"-"+month+"-"+day;
			}
			%>
			<input type=hidden value="<%=studyDate%>" name="studyDate" id="studyDate">
			<p>마감 기한&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;
			
			<input type="date" name="recruitEnd"
						id="recruitEnd" required="" autocomplete="off">
			
			
			</p>
			<p>최소 모집 인원&ensp;&ensp;&ensp;&ensp;:&ensp;&ensp;<input type="text" id="recruitPerson" name="recruitPerson" maxlength="2" size="2">명</p>
			<input type="hidden" value="모집중" name="status">
			<input type="hidden" value="${sessionScope.login.id}" name="memberId">
			<br>
			
			<button type="submit" class="btn btn-secondary" style="margin-left:50%;">Insert</button>
			<button type="reset" class="btn btn-warning">Reset</button>
     		<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
     	</form>
	 </div>
	 <div id="studyList-f">
	 <script>
$( function() {
    $( "#datepicker" ).datepicker();
  } );
function checkOne() {
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = yyyy+'-'+mm+'-'+dd;
	
	if(studycheck.recruitEnd.value >= studycheck.studyDate.value) {
		alert("모집 종료일이 스터디 시작일 이후입니다. 날짜를 다시 검사해주세요.");
		return false;
	}
	else if(studycheck.recruitEnd.value < today){
		alert("모집 종료일이 현재일 이전입니다. 날짜를 다시 검사해주세요.");
		return false;
	}
	else return true;
}
</script>
	 </div>
</div>
