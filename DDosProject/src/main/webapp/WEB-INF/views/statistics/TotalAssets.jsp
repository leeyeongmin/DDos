<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
   /*    
      window.onresize = function(){
			chart.draw(data, options);
			chart1.draw(data1, options1);
		} */

      function drawChart() {
			
	  var choose = $("#year option:selected").text();
			
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'month');
		data.addColumn('number', 'money');      
         
		 $.ajax({
				url : "totalChart_input?year=" + choose,
				method : "post",
				success : function(datas) {
					for(var i=0; i<datas.length; i++){ 
						data.addRow([datas[i].month, datas[i].money]); 
					}
					
					var options = { 
					          title: '수입',
					          hAxis: {title: 'month',  titleTextStyle: {color: '#333'}},
					          vAxis: {minValue: 0},
					          height : "400" ,
					          legend : {position : 'none' },
					        };

				   var chart = new google.visualization.AreaChart(document.getElementById('totalchart'));
				   chart.draw(data, options); 
				}
		}); 
		 
		 var data1 = new google.visualization.DataTable();
	     data1.addColumn('string', 'month');
		 data1.addColumn('number', 'money');      
		 
		 /*-----------------------------out----------------------------------------*/
		 $.ajax({
				url : "totalChart_output?year=" + choose,
				method : "post",
				success : function(datas) {

					for(var i=0; i<datas.length; i++){ 
						data1.addRow([datas[i].month, datas[i].money]); 
					}
					
				var options1 = { 
					          title: '지출',
					          hAxis: {title: 'month',  titleTextStyle: {color: '#333'}},
					          vAxis: {minValue: 0},
					          height : "400" ,
					          legend : {position : 'none' },
					          colors : ['red'], 
					        };

				   var chart1 = new google.visualization.AreaChart(document.getElementById('totalchar_output'));
				   chart1.draw(data1, options1); 
				}
					 
		 })
		 
		 /*--------------------------------------------------------------------*/
		 
		 $("#totalList").empty();
		 var $add = "";
		 
		 $.ajax({
			 	url : "totalList?year=" + choose,
				method : "post",
				success : function(datas) {
					for(var i=0; i<datas.length; i++){
						console.log(datas);
						$add += "<tr><td>" + datas[i].gubun + "</td>" +
								"<td>" + datas[i].content + "</td>" +  
								"<td>" + datas[i].money + "</td>" + 
								"<td>" + datas[i].day + "</td></tr>";	
					}
					$($add).prependTo("#totalList"); 
				}
		 }) 
 
      }
		function Change(){
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
				<!-- ============================================================== -->
				<!-- pageheader -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">Total Assets Statistics</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">Statistics</li>
										<li class="breadcrumb-item active" aria-current="page">Total Assets
											Statisticst</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
					<% Date date = new Date();
					   SimpleDateFormat sim = new SimpleDateFormat("yyyy");
					   int sear_year =  Integer.parseInt(sim.format(date));
					%>
					
					<select name="year" id="year" onchange="Change()">
						<option value="today_year" selected="selected"><%= sear_year %></option>
						<option value="last_year"><%= sear_year-1 %></option>
						<option value="before_year"><%= sear_year-2 %></option>
					</select>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->
				<!-- ============================================================== -->
				<div class="row" style="margin-top: 2%; ">
					<div class="col-sm" style="height: 500px; display: block;">
							<div id=totalchart></div>
					</div>
					<div class="col-sm" style="height: 500px;  display: block;">
						    <div id="totalchar_output"></div>
					</div>
				</div>		<!--  row -->
					<!-- ============================================================== -->
					<!-- end search bar  -->
					<!-- ============================================================== -->
					
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

				
				<div class="row"
					style="display: inline-block; margin-top: 2%; margin-left: 2%; width: 50%;">
					<!-- ============================================================== -->
					<!-- start list  -->
					<!-- ============================================================== -->
						<div class="col-sm">
						<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<h3 class="mb-2" style="text-align:center;">자산 내역 리스트</h3>
								<table id="getExpenditureList" width="100%"
											class="table table-bordered table-hover text-center">
									<thead>
												<tr>
													<th width="20%">구분</th>
													<th width="30%">내용</th>
													<th width="30%">금액</th>
													<th width="20%">날짜</th>
												</tr>
											</thead>
											<tbody id=totalList>
											</tbody>
									</table>
								</div>
								</div> 
							</div>
						</div>
					
				</div>
			</div>



		</div>
	</div>
</body>
</html>