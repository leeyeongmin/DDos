<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>DDos</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
	
<!-- jquery 3.3.1  -->
	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- bootstap bundle js -->
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<!-- slimscroll js -->
	<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>

<script>
var chart = new CanvasJS.Chart("chartContainer1",
	    {
	        animationEnabled: true,
	        title: {
	            text: "Spline Area Chart"
	        },
	        axisX: {
	            interval: 10,
	        },
	        data: [
	        {
	            type: "splineArea",
	            color: "rgba(255,12,32,.3)",
	            type: "splineArea",
	            dataPoints: [
	                { x: new Date(1992, 0), y: 2506000 },
	                { x: new Date(1993, 0), y: 2798000 },
	                { x: new Date(1994, 0), y: 3386000 },
	                { x: new Date(1995, 0), y: 6944000 },
	                { x: new Date(1996, 0), y: 6026000 },
	                { x: new Date(1997, 0), y: 2394000 },
	                { x: new Date(1998, 0), y: 1872000 },
	                { x: new Date(1999, 0), y: 2140000 },
	                { x: new Date(2000, 0), y: 7289000 },
	                { x: new Date(2001, 0), y: 4830000 },
	                { x: new Date(2002, 0), y: 2009000 },
	                { x: new Date(2003, 0), y: 2840000 },
	                { x: new Date(2004, 0), y: 2396000 },
	                { x: new Date(2005, 0), y: 1613000 },
	                { x: new Date(2006, 0), y: 2821000 }
	            ]
	        },
	        ]
	    });
	chart.render();

	var chart = new CanvasJS.Chart("chartContainer2",
	    {
	        animationEnabled: true,
	        title: {
	            text: "Pie Chart",
	        },
	        data: [
	        {
	            type: "pie",
	            showInLegend: true,
	            dataPoints: [
	                { y: 4181563, legendText: "PS 3", indexLabel: "PlayStation 3" },
	                { y: 2175498, legendText: "Wii", indexLabel: "Wii" },
	                { y: 3125844, legendText: "360", indexLabel: "Xbox 360" },
	                { y: 1176121, legendText: "DS", indexLabel: "Nintendo DS" },
	                { y: 1727161, legendText: "PSP", indexLabel: "PSP" },
	                { y: 4303364, legendText: "3DS", indexLabel: "Nintendo 3DS" },
	                { y: 1717786, legendText: "Vita", indexLabel: "PS Vita" }
	            ]
	        },
	        ]
	    });
	chart.render();

	var chart = new CanvasJS.Chart("chartContainer3",
	    {
	        animationEnabled: true,
	        title: {
	            text: "Line Chart"
	        },
	        axisX: {
	            valueFormatString: "MMM",
	            interval: 1,
	            intervalType: "month"
	        },
	        axisY: {
	            includeZero: false
	        },
	        data: [
	        {
	          type: "line",
	          dataPoints: [
	              { x: new Date(2012, 00, 1), y: 450 },
	              { x: new Date(2012, 01, 1), y: 414 },
	              { x: new Date(2012, 02, 1), y: 520, indexLabel: "highest", markerColor: "red", markerType: "triangle" },
	              { x: new Date(2012, 03, 1), y: 460 },
	              { x: new Date(2012, 04, 1), y: 450 },
	              { x: new Date(2012, 05, 1), y: 500 },
	              { x: new Date(2012, 06, 1), y: 480 },
	              { x: new Date(2012, 07, 1), y: 480 },
	              { x: new Date(2012, 08, 1), y: 410, indexLabel: "lowest", markerColor: "DarkSlateGrey", markerType: "cross" },
	              { x: new Date(2012, 09, 1), y: 500 },
	              { x: new Date(2012, 10, 1), y: 480 },
	              { x: new Date(2012, 11, 1), y: 510 }
	            ]
	        }
	        ]
	    });
	chart.render();

	var chart = new CanvasJS.Chart("chartContainer4",
	    {
	        animationEnabled: true,
	        title: {
	            text: "Column Chart"
	        },
	        axisX: {
	            interval: 10,
	        },
	        data: [
	        {
	            type: "column",
	            legendMarkerType: "triangle",
	            legendMarkerColor: "green",
	            color: "rgba(255,12,32,.3)",
	            showInLegend: true,
	            legendText: "Country wise population",
	            dataPoints: [
	                { x: 10, y: 297571, label: "India" },
	                { x: 20, y: 267017, label: "Saudi" },
	                { x: 30, y: 175200, label: "Canada" },
	                { x: 40, y: 154580, label: "Iran" },
	                { x: 50, y: 116000, label: "Russia" },
	                { x: 60, y: 97800, label: "UAE" },
	                { x: 70, y: 20682, label: "US" },
	                { x: 80, y: 20350, label: "China" }
	            ]
	        },
	        ]
	    });
	chart.render();
</script>


</head>

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
							<h3 class="mb-2">Expenditure Statistics</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">Statistics</li>
										<li class="breadcrumb-item active" aria-current="page">Expenditure
											Statisticst</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->
				<!-- ============================================================== -->
				
				<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<div id="chartContainer1" style="width: 45%; height: 300px;display: inline-block;"></div> 
<div id="chartContainer2" style="width: 45%; height: 300px;display: inline-block;"></div><br/>
<div id="chartContainer3" style="width: 45%; height: 300px;display: inline-block;"></div>
<div id="chartContainer4" style="width: 45%; height: 300px;display: inline-block;"></div>
				
				
				
				<div class="row"
					style="display: inline-block; margin-top: 2%; width: 50%;">

					
					
				</div>
				<div class="row"
					style="display: inline-block; margin-top: 2%; margin-left: 2%; width: 50%;">
					<!-- ============================================================== -->
					<!-- start list  -->
					<!-- ============================================================== -->
					
					<h3 class="mb-2" style="text-align:center;">Expenditure Statistics</h3>
					
					
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table id="getExpenditureList" width="100%"
										class="table table-bordered table-hover text-center">
										<thead>
											<tr>
												<th width="40%">ID</th>
												<th width="20%">NAME</th>
												<th width="20%">DATE</th>
												<th width="40%">PRICE</th>
											</tr>
										</thead>
										<tbody id=expenditureList>
											<tr>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
											</tr>
											<tr>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
											</tr>
											<tr>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
											</tr>
											<tr>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
											</tr>
											
											<tr>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
												<td>aaa</td>
											</tr>
											
										
										
											<%-- <c:forEach items="${noticeList}" var="notice">
												<c:set var="grant" value="${notice.memberId}"></c:set>
												<input type="hidden" value="${notice.memberId}">
												<tr>
													<td>${notice.noticeNum}</td>
													<td><a
														href="./getNotice?noticeNum=${notice.noticeNum}">${notice.noticeTitle}</a></td>
													<td>${notice.noticeDate}</td>
													<td>${notice.noticeCnt}</td>
												</tr>
											</c:forEach> --%>
											
											
										</tbody>
									</table>
								</div>
							</div>


						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end list  -->
					<!-- ============================================================== -->
				</div>
			</div>



		</div>
	</div>
	

	
</body>
</html>
