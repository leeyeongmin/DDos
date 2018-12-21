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

<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "Monthly Expenses, 2016-17"
	},
	axisY :{
		includeZero: false,
		prefix: "$"
	},
	toolTip: {
		shared: true
	},
	legend: {
		fontSize: 13
	},
	data: [{
		type: "splineArea",
		showInLegend: true,
		name: "Salaries",
		yValueFormatString: "$#,##0",
		xValueFormatString: "MMM YYYY",
		dataPoints: [
			{ x: new Date(2016, 2), y: 30000 },
			{ x: new Date(2016, 3), y: 35000 },
			{ x: new Date(2016, 4), y: 30000 },
			{ x: new Date(2016, 5), y: 30400 },
			{ x: new Date(2016, 6), y: 20900 },
			{ x: new Date(2016, 7), y: 31000 },
			{ x: new Date(2016, 8), y: 30200 },
			{ x: new Date(2016, 9), y: 30000 },
			{ x: new Date(2016, 10), y: 33000 },
			{ x: new Date(2016, 11), y: 38000 },
			{ x: new Date(2017, 0),  y: 38900 },
			{ x: new Date(2017, 1),  y: 39000 }
		]
 	},
	{
		type: "splineArea", 
		showInLegend: true,
		name: "Office Cost",
		yValueFormatString: "$#,##0",
		dataPoints: [
			{ x: new Date(2016, 2), y: 20100 },
			{ x: new Date(2016, 3), y: 16000 },
			{ x: new Date(2016, 4), y: 14000 },
			{ x: new Date(2016, 5), y: 18000 },
			{ x: new Date(2016, 6), y: 18000 },
			{ x: new Date(2016, 7), y: 21000 },
			{ x: new Date(2016, 8), y: 22000 },
			{ x: new Date(2016, 9), y: 25000 },
			{ x: new Date(2016, 10), y: 23000 },
			{ x: new Date(2016, 11), y: 25000 },
			{ x: new Date(2017, 0), y: 26000 },
			{ x: new Date(2017, 1), y: 25000 }
		]
 	},
	{
		type: "splineArea", 
		showInLegend: true,
		name: "Entertainment",
		yValueFormatString: "$#,##0",     
		dataPoints: [
			{ x: new Date(2016, 2), y: 10100 },
			{ x: new Date(2016, 3), y: 6000 },
			{ x: new Date(2016, 4), y: 3400 },
			{ x: new Date(2016, 5), y: 4000 },
			{ x: new Date(2016, 6), y: 9000 },
			{ x: new Date(2016, 7), y: 3900 },
			{ x: new Date(2016, 8), y: 4200 },
			{ x: new Date(2016, 9), y: 5000 },
			{ x: new Date(2016, 10), y: 14300 },
			{ x: new Date(2016, 11), y: 12300 },
			{ x: new Date(2017, 0), y: 8300 },
			{ x: new Date(2017, 1), y: 6300 }
		]
 	},
	{
		type: "splineArea", 
		showInLegend: true,
		yValueFormatString: "$#,##0",      
		name: "Maintenance",
		dataPoints: [
			{ x: new Date(2016, 2), y: 1700 },
			{ x: new Date(2016, 3), y: 2600 },
			{ x: new Date(2016, 4), y: 1000 },
			{ x: new Date(2016, 5), y: 1400 },
			{ x: new Date(2016, 6), y: 900 },
			{ x: new Date(2016, 7), y: 1000 },
			{ x: new Date(2016, 8), y: 1200 },
			{ x: new Date(2016, 9), y: 5000 },
			{ x: new Date(2016, 10), y: 1300 },
			{ x: new Date(2016, 11), y: 2300 },
			{ x: new Date(2017, 0), y: 2800 },
			{ x: new Date(2017, 1), y: 1300 }
		]
	}]
});
chart.render();

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
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->
				<!-- ============================================================== -->
				<div class="row"
					style="display: inline-block; margin-top: 2%; width: 50%;">
					<!-- ============================================================== -->
					<!-- search bar  -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<form name="SearchUser" onsubmit="check()">
									<select class="form-control" name="searchType"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="id">Id
										<option value="name">Name
									</select> <input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										id="searchUserKeyword" type="text" name="searchUserKeyword"
										placeholder="Search">
									<button class="btn btn-primary search-btn" type="submit">Search</button>
								</form>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end search bar  -->
					<!-- ============================================================== -->
					<div id="chartContainer"
						style="margin-left: 2.5%; height: 370px; width: 95%;"></div>
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

				</div>
				<div class="row"
					style="display: inline-block; margin-top: 2%; margin-left: 2%; width: 50%;">
					<!-- ============================================================== -->
					<!-- start list  -->
					<!-- ============================================================== -->
					
					<h3 class="mb-2" style="text-align:center;">Total Assets Statistics</h3>
					
					
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