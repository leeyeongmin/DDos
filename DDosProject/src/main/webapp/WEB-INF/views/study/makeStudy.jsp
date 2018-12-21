<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ddos.web.study.impl.StudyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDos</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
  
  	<%! 	
		int ary[][] = new int[2][3];	 
	 %>
	<% 	
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



</head>
<!-- <style>
	#wrapper{
	margin:40px 0px 0px 350px;
	}
</style> -->




<body>
<div>
    <div id="studyList-b">
	    <form id="addForm" action="./insertStudy" method="post" target="studylist.do">
			<p>스터디 명:<input type="text" name="studyName"></p>
			<p>스터디 주제:<input type="text" name="studySubject"></p>
			<p>스터디 룸:
			<select name="studyroomNumber" id="studyroomNumber">
				<option>-선택-</option>
				<option value="1">1번방</option>
				<option value="2">2번방</option>
			</select>
			</p>
			<p id="studyTime">스터디 시간:
			<select name="studyTime" id="studyTime">
				<option value="9">09:00~12:00</option>
				<option value="12">12:00~15:00</option>
				<option value="15">15:00~18:00</option>
			</select>
			</p>

			<p>시작 일자: <%=month %>월 <%=day %>일</p>
			<% String studyDate = month+"/"+day; %>
			<input type=hidden value="<%=studyDate%>" name="studyDate">
			<p>마감 기한:<input type="text" id="testDatepicker" name="recruitEnd" size="10">(mm/dd/yyyy)</p>
			<p>모집 인원:<input type="text" id="recruitPerson" name="recruitPerson" maxlength="2" size="2"></p>
			<input type="hidden" value="모집중" name="status">
			<input type="hidden" value="${sessionScope.login.id}" name="memberId">
			<br>
			
			<button type="submit" class="btn btn-secondary" style="margin-left:50%;">Insert</button>
			<button type="reset" class="btn btn-warning">Reset</button>
     		<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
     	</form>
	 </div>
	 <div id="studyList-f"></div>
</div>
</body>
</html>