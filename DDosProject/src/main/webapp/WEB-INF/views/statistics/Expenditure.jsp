<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<title>DDos</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	var chart, data, sear_day, chart1, data1;

	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	
	$(function(){
		input_table(); 
		output_table();
	}) 
	
	/*--------------------------------inTable--------------------------------*/
	function input_table(){
		var s_year = document.getElementById('year').value;
		var s_month = document.getElementById('month').value; 
		sear_day = s_year + "/" + s_month;
		
		$("#addRow").empty();
		
		var $add = "";
		
		$.ajax({
			url : "month_inputList?day=" + sear_day,
			method : "post",
			success : function(datas) {
				for(var i=0; i<datas.length; i++){
					$add += "<tr><td>" + datas[i].day + "</td>" + 
					"<td>" + datas[i].content + "</td>" + 
					"<td>" + datas[i].money + "</td>" + 
					"<td>" + datas[i].id + "</td></tr>";
				}
	
				$($add).prependTo("#addRow"); 		
			}
		
			
		});
	}
	
	/*------------------------outTable--------------------------*/
	function output_table(){
		var s_year = document.getElementById('year').value;
		var s_month = document.getElementById('month').value; 
		sear_day = s_year + "/" + s_month;
		
		$("#addRow2").empty();
		
		var $add = "";
		
		$.ajax({
			url : "month_outputList?day=" + sear_day,
			method : "post",
			success : function(datas) {
				for(var i=0; i<datas.length; i++){
					$add += "<tr><td>" + datas[i].day + "</td>" + 
					"<td>" + datas[i].content + "</td>" + 
					"<td>" + datas[i].money + "</td>" + 
					"<td>" + datas[i].id + "</td></tr>";
				}
	
				$($add).prependTo("#addRow2"); 		
			}
		
			
		});
	}
	
	
	
	function drawChart() {
		var s_year = document.getElementById('year').value;
		var s_month = document.getElementById('month').value; 
		sear_day = s_year + "/" + s_month;
		
		/*--------------------------------in--------------------------------*/
		$.ajax({
			url : "month_inputchart?day=" + sear_day,
			method : "post",
			success : function(datas) {
		 	 data = new google.visualization.DataTable();
				
				 data.addColumn('string', 'content');
				 data.addColumn('number', 'total');  
				
				for(var i=0; i<datas.length; i++){
					data.addRow([datas[i].content, datas[i].total]);
				}
				
				 var options = {
				          title: '수입',
				          pieHole: 0.4, 
				          colors : ['yellow', 'green' , 'pink', 'blue', 'orange'], 
				          annotations:{ textStyle:{ fontSize:7, color:'black'} },
				          height : "400" ,
				 };

				chart = new google.visualization.PieChart(document.getElementById('month_inputchart'));

				chart.draw(data, options);
				        
				google.visualization.events.addListener(chart, 'select', selectHandler);	
			}
		})
		
		/*-----------------------------------out------------------------------------*/
		$.ajax({
			url : "month_outputchart?day=" + sear_day,
			method : "post",
			success : function(datas) {
		 	 	data1 = new google.visualization.DataTable();
				
				 data1.addColumn('string', 'content');
				 data1.addColumn('number', 'total'); 
				
				for(var i=0; i<datas.length; i++){
					data1.addRow([datas[i].content, datas[i].total]);
				}
				
				 var options1 = {
				          title: '지출',
				          pieHole: 0.4, 
				          colors : ['yellow', 'green' , 'pink', 'blue', 'orange'], 
				          annotations:{ textStyle:{ fontSize:7, color:'black'} },
				          height : "400" ,
				 };

				chart1 = new google.visualization.PieChart(document.getElementById('month_outputchart'));

				chart1.draw(data1, options1);
				        
				google.visualization.events.addListener(chart1, 'select', selectHandler2);	
			}
		})
		
		
		/*--------------------------------in_click--------------------------------*/
        function selectHandler(){			//클릭 시 
      	  var selection = chart.getSelection();
      	  
      	  for(var i=0; i<selection.length; i++){
      		  var item = selection[i];
      		  if(item.row != null && item.column == null){
      			  var ck = data.getValue(chart.getSelection()[0].row, 0)
      		  }
      	  }
      	  inclick(ck, sear_day);
        }
		
		/*-------------------------------out_click---------------------------------*/
		function selectHandler2(){
			  var selection = chart1.getSelection();
	      	  
	      	  for(var i=0; i<selection.length; i++){
	      		  var item = selection[i];
	      		  if(item.row != null && item.column == null){
	      			  var ck = data1.getValue(chart1.getSelection()[0].row, 0)
	      		  }
	      	  }
	      	  outclick(ck, sear_day);
      	}
	}
      
	
	/*--------------------------------click event--------------------------------*/
      function inclick(choose_ck, day){
			var $click_add ="";
			$.ajax({
				url : "click_input",
				data : {day : sear_day , click : choose_ck},
				method : "post",
				success : function(datas) {
					$("#addRow").empty();
					
					for(var i=0; i<datas.length; i++){
						$click_add += "<tr><td>" + datas[i].day + "</td>" + 
						"<td>" + datas[i].content + "</td>" + 
						"<td>" + datas[i].money + "</td>" + 
						"<td>" + datas[i].id + "</td></tr>";
					}
					$($click_add).prependTo("#addRow"); 	
				}
			});
      }
	
	/*-----------------------------------out click-------------------------*/
	function outclick(choose_ck, day){
		var $click_add ="";
		$.ajax({
			url : "click_output",
			data : {day : sear_day , click : choose_ck},
			method : "post",
			success : function(datas) {
				$("#addRow2").empty();
				
				for(var i=0; i<datas.length; i++){
					$click_add += "<tr><td>" + datas[i].day + "</td>" + 
					"<td>" + datas[i].content + "</td>" + 
					"<td>" + datas[i].money + "</td>" + 
					"<td>" + datas[i].id + "</td></tr>";
				}
				$($click_add).prependTo("#addRow2"); 	
			}
		});
	}
	
	function searchChar(){
		input_table(); 
		output_table();
		drawChart();
	}
	
	
</script>
</head>
<!-- ============================================================== -->
<!-- end main wrapper  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<!-- jquery 3.3.1 -->
<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- slimscroll js -->
<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<!-- main js -->
<script src="assets/libs/js/main-js.js"></script>

<body>
	<div class="dashboard-main-wrapper">

		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="influence-finder">
					
			<div class="container-fluid dashboard-content">
				<div class="row"> 
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">Income Statistics</h3> 
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">Statistics</li>
										<li class="breadcrumb-item active" aria-current="page">Income
											Expenditure</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
					<%  Date date = new Date();
						SimpleDateFormat sim = new SimpleDateFormat("yyyy");
						String sear_year = sim.format(date);
						SimpleDateFormat sim2 = new SimpleDateFormat("MM");
						String sear_month = sim2.format(date);
					%>
					<input type="text" style="width: 50px;" id="year" value=<%= sear_year %>>년 &nbsp;&nbsp; 
					<input type="text" style="width: 30px;" id="month" value=<%= sear_month %>>월  &nbsp;&nbsp; 
					<input type="button" value="보기" onclick="searchChar()"> 
				<!-- 페이징처리 부분 -->	<input type="hidden" name="page" />
				</div>
					
					
					<div class="row" style="margin-top: 2%; ">
						<div class="col-sm" style="height: 500px;">
							<div id="month_inputchart"></div>
						</div> 
					
					<div class="col-sm">
						<div class="card">
							<div class="card-body">
								<div align="right"><input type="button" value="전체보기" onclick="input_table()"></div>
								<div class="table-responsive">
								<h3 class="mb-2" style="text-align:center;">수입 목록</h3>
									<table id="inputList" width="100%"
										class="table table-bordered table-hover text-center">
										<thead>
											<tr>
												<th width="40%">날짜</th>
												<th width="20%">내용</th>
												<th width="20%">금액</th>
												<th width="30%">ID</th>
											</tr>
										</thead>
										<tbody id=addRow></tbody>
									</table>
								</div>
							</div> 
							<my:paging paging="${paging}" />
							<script>
								function go_page(page) {
									document.frm.page.value = page;
									document.frm.submit();
								}
							</script>
						</div>
					</div>
				</div>		<!--  row -->
				
				<div class="row" style="margin-top: 2%; ">
						<div class="col-sm" style="height: 500px;">
							<div id="month_outputchart"></div>
						</div> 
					
					<div class="col-sm"> 
						<div class="card">
							<div class="card-body"> 
							<div align="right"><input type="button" value="전체보기" onclick="output_table()"></div>
								<!-- 페이징처리 부분 -->	<input type="hidden" name="page" />
								<div class="table-responsive">
								<h3 class="mb-2" style="text-align:center;">지출 목록</h3>
									<table id="inputList" width="100%"
										class="table table-bordered table-hover text-center">
										<thead>
											<tr>
												<th width="40%">날짜</th>
												<th width="20%">내용</th>
												<th width="20%">금액</th>
												<th width="30%">ID</th>
											</tr>
										</thead>
										<tbody id=addRow2></tbody>
									</table>
								</div>
							</div>
							<my:paging paging="${paging}" />
							<script>
								function go_page(page) {
									document.frm.page.value = page;
									document.frm.submit();
								}
							</script> 
						</div>
					</div>
				</div>		<!--  row -->
				
				
			</div>
		</div>
	</div>
</body>
</html>