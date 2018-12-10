<%@page import="com.ddos.web.study.impl.StudyDAO"%>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<!-- 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 -->
 <title>Insert title here</title>
</head>
<style>
	#wrapper{
	margin:40px 0px 0px 350px;
	}
	#calendartable{
		width:700px;
		height:300px;
		table-layout:fixed;
	}
</style>

<script>
	function popup(month,day){
		var tempDay = window.open("makeStudy?month="+month+"&day="+day, "reservation", "width=400, height=600, left=150, top=150"); 
	}
</script>



<body>
	<div id="wrapper">
<%
	String prevStudy[] = new String[31];
	String curStudy[] = new String[31];
	String nextStudy[] = new String[31];
	StudyDAO sd = new StudyDAO();
%>
	<%
		Calendar tDay = Calendar.getInstance();

		int y = tDay.get(Calendar.YEAR);
		int m = tDay.get(Calendar.MONTH);
		int d = tDay.get(Calendar.DATE);
		int pm,nm;

		String Year = request.getParameter("year");
		String Month = request.getParameter("month");

		if (Year == null && Month == null) { //처음 호출했을 때
		} else { //나타내고자 하는 날짜를 숫자로 변환
			y = Integer.parseInt(Year);
			m = Integer.parseInt(Month);
			if (m < 0) {
				m = 11;
				y = y - 1;
			} //1월부터 12월까지 범위 지정.
			if (m > 11) {
				m = 0;
				y = y + 1;
			}
		}
		Calendar dSet = Calendar.getInstance();
		dSet.set(y, m, 1);
		int yo = dSet.get(Calendar.DAY_OF_WEEK);
		int last_day = tDay.getActualMaximum(Calendar.DATE);

		Calendar prev = Calendar.getInstance();
		prev.set(y, m - 1, 1);
		int prevLastDay = prev.getMaximum(Calendar.DAY_OF_MONTH);
		
		
		prevStudy=sd.studyListCalender(y,m);
		curStudy=sd.studyListCalender(y,m+1);
		nextStudy=sd.studyListCalender(y,m+2);
	%>

	<a
		href="getStudyList?year=<%out.print(y - 1);%>&month=<%out.print(m);%>">◀</a>
	<%
		out.print(y);
	%>년
	<a
		href="getStudyList?year=<%out.print(y + 1);%>&month=<%out.print(m);%>">▶</a>
	<!-- 월 -->
	<a
		href="getStudyList?year=<%out.print(y);%>&month=<%out.print(m - 1);%>">◀</a>
	<%
		out.print(m + 1);
	%>월
	<a
		href="getStudyList?year=<%out.print(y);%>&month=<%out.print(m + 1);%>">▶</a>

	<table id="calendartable" border="1">

		<tr>

			<td align="center" colspan="7"><%=y%>년 <%=(m + 1)%>월</td>

		</tr>

		<tr >

			<%
				String[] a = { "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT" };

				for (int i = 0; i < 7; i++) {
			%>
			<td width="35"><%=a[i]%></td>

			<%
				}
			%>

		</tr>



		<tr height="80" valign="top">
			<%
				for (int k = prevLastDay - yo + 2; k <= prevLastDay; k++) {
			%>

			<td>
			<a style="color:gray; cursor:pointer;" href="makeStudy?month=<%=m+2%>&day=<%=k%>">
				<%=k%></a><FONT color="blue" SIZE=2><%=prevStudy[k] %></FONT><br>
				</td>
			<%
				}
			%>

			<%
				for (int j = 1; j <= last_day; j++) {
			%>

			<td>
				<a style="color:gray; cursor:pointer;" href="makeStudy?month=<%=m+2%>&day=<%=j%>">
				<%=j%></a><FONT color="blue" SIZE=2> <%=curStudy[j] %> </FONT><br>
				<% 	if ((yo + j - 1) % 7 == 0) { if(j==last_day){continue;}%>
			</td>
		</tr>
		<tr height="80" valign="top">

			<%
				}
				}
				int nextend;
				if(yo == 7){
					nextend = 7;
				}
				else if(yo==6){
					nextend=8;
				}else
					nextend=7-yo;
				for (int e = 1; e < nextend-1; e++) {
			%>
		
			<td>			
			<a style="color:gray; cursor:pointer;" href="makeStudy?month=<%=m+2%>&day=<%=e%>"><%=e%></a>
			<FONT color="blue" SIZE=2> <%=nextStudy[e] %></FONT></td>

			<%
				}
			%>

		</tr>

	</table>
	<%sd.close(); %>
	</div>
</body>
</html>