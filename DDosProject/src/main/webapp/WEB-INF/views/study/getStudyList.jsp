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
<title>DDos</title>

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
		
	    $("#testDatepicker").datepicker({
	    });
	}
</script>



<body>
	<div class="dashboard-main-wrapper">

		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="influence-finder">
			<div class="container-fluid dashboard-content">
				<!-- ============================================================== -->
				<!-- pageheader -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">Stydy & Study Room</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Study
											& Study Room</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->
				<!-- ============================================================== -->
				<div>


					<%
						String prevStudy[] = new String[31];
						String curStudy[] = new String[31];
						String nextStudy[] = new String[31];
						String studyName;
						String studyNumber;
						String recruitDay;
						String[] tmp;
						StudyDAO sd = new StudyDAO();

						java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
						String today = formatter.format(new java.util.Date());
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

					<table id="calendartable" border="1"
						style="width: 100%; height: 400px;">

						<tr>

							<td align="center" colspan="7"><%=y%>년 <%=(m + 1)%>월</td>

						</tr>

						<tr style="text-align: center;">

							<%
								String[] a = { "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT" };

								for (int i = 0; i < 7; i++) {
							%>
							<td width="35"><%=a[i]%></td>

							<%
								}
							%>

						</tr>



						<tr height="120px" valign="top">
							<%
								for (int k = prevLastDay - yo + 2; k <= prevLastDay; k++) {
							%>

							<td>
								<button
									style="color: gray; cursor: pointer; border: none; background: none;"
									onclick="event.stopPropagation(); popup(<%=m%>, <%=k%>)">
									<%=k%>
								</button>
								<div style="overflow-y: auto; height: 80%; width: 100%">
									<%
										if (prevStudy[k] != "") {
												tmp = new String[12];
												tmp = prevStudy[k].split("\t");
												for (String wo : tmp) {
													studyName = wo.split(",")[0];
													studyNumber = wo.split(",")[1];
													recruitDay = wo.split(",")[2].substring(0, 10);

													if (today.compareTo(recruitDay) > 0) {
									%>
									<button
										style="color: white; cursor: pointer; width: 100%; height: 50px; border: none; background: #EC4646;">
										<%=studyName%></button>
									<%
										} else {
									%>
									<button
										style="color: white; cursor: pointer; width: 100%; height: 50px; border: none; background: #7DC74B;"
										onclick="event.stopPropagation(); getStudyDetail(<%=studyNumber%>)"><%=studyName%></button>
									<%
										}
									%>
								</div>
							</td>
							<%
								}
									}
								}
							%>

							<%
								for (int j = 1; j <= last_day; j++) {
							%>

							<td>
								<button
									style="color: gray; cursor: pointer; border: none; background: none;"
									onclick="event.stopPropagation(); popup(<%=m + 1%>,<%=j%>)">
									<%=j%>
								</button>
								<div style="overflow-y: auto; height: 80%; width: 100%">
									<%
										if (curStudy[j] != "") {
												tmp = new String[12];
												tmp = curStudy[j].split("\t");
												for (String wo : tmp) {
													studyName = wo.split(",")[0];
													studyNumber = wo.split(",")[1];
													recruitDay = wo.split(",")[2].substring(0, 10);

													if (today.compareTo(recruitDay) > 0) {
									%>
									<button
										style="color: white; cursor: pointer; width: 100%; height: 50px; border: none; background: #EC4646;">
										<%=studyName%></button>
									<%
										} else {
									%>
									<button
										style="color: white; cursor: pointer; width: 100%; height: 50px; border: none; background: #7DC74B;"
										onclick="event.stopPropagation(); getStudyDetail(<%=studyNumber%>)"><%=studyName%></button>
									<%
										}

												}
											}
											if ((yo + j - 1) % 7 == 0) {
												if (j == last_day) {
													continue;
												}
									%>
								</div>
							</td>
						</tr>
						<tr height="120px" valign="top">

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
								<button
									style="color: gray; cursor: pointer; border: none; background: none;"
									onclick="event.stopPropagation(); popup(<%=m + 2%>,<%=e%>)">
									<%=e%>
								</button>
								<div style="overflow-y: auto; height: 80%; width: 100%">
									<%
										if (nextStudy[e] != "") {
												tmp = new String[12];
												tmp = nextStudy[e].split("\t");
												for (String wo : tmp) {
													studyName = wo.split(",")[0];
													studyNumber = wo.split(",")[1];
													recruitDay = wo.split(",")[2].substring(0,10);

													if (today.compareTo(recruitDay) > 0) {
									%>
									<button
										style="color: white; cursor: pointer; width: 100%; height: 50px; border: none; background: #EC4646;">
										<%=studyName%></button>
									<%
										} else {
									%>
									<button
										style="color: white; cursor: pointer; width: 100%; height: 50px; border: none; background: #7DC74B;"
										onclick="event.stopPropagation(); getStudyDetail(<%=studyNumber%>)"><%=studyName%></button>
									<%
										}
									%>

								</div>
							</td>

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
							</div>
							<div class="modal-body" id="modal-body"></div>
							<div class="modal-footer" id="modal-footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>