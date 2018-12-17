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
#wrapper {
	margin: 40px 0px 0px 100px;
}

#calendartable {
	width: 700px;
	height: 300px;
	table-layout: fixed;
}
</style>

<script>
//팝업창 띄움
	function popup(month, day){
		var modal = $('<div class="modal" tabindex="-1" role="dialog" id="stydySubmit">'+
			'<div class="modal-dialog" role="document">'+
				'<div class="modal-content">'+
					'<div class="modal-header">'+
						'<h5 class="modal-title">스터디 생성</h5>'+
						'<button type="button" class="close" data-dismiss="modal" aria-label="Close">'+
							'<span aria-hidden="true">&times;</span>'+
						'</button>'+
					'</div>'+
					'<div class="modal-body" id="modal-body"></div>'+
					'<div class="modal-footer" id="modal-footer"></div>'+
				'</div>'+
			'</div>'+
		'</div>');

		$.ajax({
  			url: "./makeStudy?month="+ month +'&&day='+ day,
		}).done(function(response) {
			var response = $(response);
			$(modal).find('#modal-body').append($(response).find('#studyList-b'));
			$(modal).find('#modal-footer').append($(response).find('#studyList-f'));
			$(modal).modal('toggle');	
		}); 
	}
	
	
	
	function getStudyDetail(studyNumber) {
		var modal = $('#stydyDetail');
		$('#modal-body').children().remove();
		$('#modal-footer').children().remove();
		
		$.ajax({
  			url: "./getStudy?studyNumber="+ studyNumber,
		}).done(function(response) {
			var response = jQuery.parseHTML(response)
			response = $(response).find('div');
			$('#modal-body').append(response.find('#info'));
			$('#modal-footer').append(response.find('#studyMember'));
			$('#modal-footer').append(response.find('#studyCaptin'));
			modal.modal('toggle');	
		});
		
	}
</script>



<body>
	<div id="wrapper">
		<%
			String prevStudy[] = new String[31];
			String curStudy[] = new String[31];
			String nextStudy[] = new String[31];
			String studyName;
			String studyNumber;
			String[] tmp;
			StudyDAO sd = new StudyDAO();
		%>
		<%
			Calendar tDay = Calendar.getInstance();

			int y = tDay.get(Calendar.YEAR);
			int m = tDay.get(Calendar.MONTH);
			int d = tDay.get(Calendar.DATE);
			int pm, nm;

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

			prevStudy = sd.studyListCalender(y, m);
			curStudy = sd.studyListCalender(y, m + 1);
			nextStudy = sd.studyListCalender(y, m + 2);
		%>

		<a
			href="getStudyList?year=<%out.print(y - 1);%>&month=<%out.print(m);%>">◀</a>
		<%
			out.print(y);
		%>년 <a
			href="getStudyList?year=<%out.print(y + 1);%>&month=<%out.print(m);%>">▶</a>
		<!-- 월 -->
		<a
			href="getStudyList?year=<%out.print(y);%>&month=<%out.print(m - 1);%>">◀</a>
		<%
			out.print(m + 1);
		%>월 <a
			href="getStudyList?year=<%out.print(y);%>&month=<%out.print(m + 1);%>">▶</a>

		<table id="calendartable" border="1">

			<tr>

				<td align="center" colspan="7"><%=y%>년 <%=(m + 1)%>월</td>

			</tr>

			<tr>

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
					<button style="color: gray; cursor: pointer;"
						onclick="event.stopPropagation(); popup(<%=m%>, <%=k%>)">
						<%=k%>
					</button> <%	
 					if (prevStudy[k] != "") {
 						tmp = new String[12];
 						tmp = prevStudy[k].split("\t");
 						for (String wo : tmp) {
 							studyName = wo.split(",")[0];
 							studyNumber = wo.split(",")[1];
 						
				%>
					<button
						onclick="event.stopPropagation(); getStudyDetail(<%=studyNumber%>)"><%=studyName%></button>
				</td>
				<%
				
					}
						}
					}
				%>

				<%
					for (int j = 1; j <= last_day; j++) {
				%>

				<td><button style="color: gray; cursor: pointer;"
						onclick="event.stopPropagation(); popup(<%=m + 1%>,<%=j%>)">
						<%=j%>
					</button> <%
 	if (curStudy[j] != "") {
 			tmp = new String[12];
 			tmp = curStudy[j].split("\t");
 			for (String wo : tmp) {
 				studyName = wo.split(",")[0];
 				studyNumber = wo.split(",")[1];
 %>
					<button
						onclick="event.stopPropagation(); getStudyDetail(<%=studyNumber%>)"><%=studyName%></button>
					<%
 	}
 		}
 		if ((yo + j - 1) % 7 == 0) {
 			if (j == last_day) {
 				continue;
 			}
 %></td>
			</tr>
			<tr height="80" valign="top">

				<%
					}

					}

					int nextend;
					if (yo == 7) {
						nextend = 7;
					} else if (yo == 6) {
						nextend = 8;
					} else
						nextend = 7 - yo;
					for (int e = 1; e < nextend - 1; e++) {
				%>

				<td>
				<button style="color: gray; cursor: pointer;" onclick="event.stopPropagation(); popup(<%=m + 2%>,<%=e%>)">
					 <%=e%>
					</button>
					 <%
 	if (nextStudy[e] != "") {
 			tmp = new String[12];
 			tmp = nextStudy[e].split("\t");
 			for (String wo : tmp) {
 				studyName = wo.split(",")[0];
 				studyNumber = wo.split(",")[1];
 %>
						<button onclick="event.stopPropagation(); getStudyDetail(<%=studyNumber%>)"><%=studyName%></button></td>

				<%
					}
						}
					}
				%>

			</tr>

		</table>
		<%
			sd.close();
		%>
	</div>



	<div class="modal" tabindex="-1" role="dialog" id="stydyDetail">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">수강 신청</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body"></div>
				<div class="modal-footer" id="modal-footer"></div>
			</div>
		</div>
	</div>
</body>
</html>






</div>