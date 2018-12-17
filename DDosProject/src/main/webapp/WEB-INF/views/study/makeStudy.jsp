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
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  
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

<script>
$(function() {
	//사용안함
    $("#okay").click(function(){
    	
    	var params = $("#addForm").serialize();    	
    	$.getJSON("./insertStudy", params, function(data){
    		/* makeCommentView(datas) */
		});
		
    	
    	//opener.parent.location="./insertStudy";
    	opener.parent.location.reload();
    	window.close();
    });
    
    //스터디룸별 사용 가능한 스터디 시간 구하는 함수
    $("#studyroomNumber").on("change",function(){
		var roomNum=document.getElementById("studyroomNumber").value;
		var opt = document.getElementById("studyTime");
		opt.innerHTML='스터디시간:';
		if(roomNum == 1)
		{
			opt.innerHTML+='<select name="studyTime" id="studyTime">'
			+ '<%	if(ary[0][0]==1){	%>'
			+ '<option value="9">09:00~12:00</option>'
			+ '<%	}if(ary[0][1]==1){	%>'
			+ '<option value="12">12:00~15:00</option>'
			+ '<%	}if(ary[0][2]==1){		%>'
			+ '<option value="15">15:00~18:00</option>'
			+ '<%} %>	</select>';					
		}
		else if(roomNum==2){
			opt.innerHTML+='<select name="studyTime" id="studyTime">'
			+ '<%	if(ary[1][0]==1){	%>'
			+ '<option value="9">09:00~12:00</option>'
			+ '<%	}if(ary[1][1]==1){	%>'
			+ '<option value="12">12:00~15:00</option>'
			+ '<%	}if(ary[1][2]==1){		%>'
			+ '<option value="15">15:00~18:00</option>'
			+ '<%} %>	</select>';					
		}
	 });
    $("#testDatepicker").datepicker({
    });
});

			
	
	

</script>

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
			
			</p>
			<p>시작 일자: <%=month %>월 <%=day %>일</p>
			<% String studyDate = month+"/"+day; %>
			<input type=hidden value="<%=studyDate%>" name="studyDate">
			<p>마감 기한:<input type="text" id="testDatepicker" name="recruitEnd" size="10"></p>
			<p>모집 인원:<input type="text" id="recruitPerson" name="recruitPerson" maxlength="2" size="2"></p>
			<input type="hidden" value="모집중" name="status">
			스터디장:<input type="hidden" value="${sessionScope.login.id}" name="memberId">
			<br>
		 </form>
	 </div>
	 <div id="studyList-f">
	 	<input type="submit" value="예약" onclick="window.close()">
   	 	<input type="reset" value="리셋">
     	<input type="button" value="취소" onclick="self.close()">
     </div>
</div>
</body>
</html>