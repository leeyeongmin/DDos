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
	window.onload = function() {

		var dps = [];
		var chart = new CanvasJS.Chart("chartContainer", {
			exportEnabled : true,
			title : {
				text : "Expenditure Chart"
			},
			axisY : {
				includeZero : false
			},
			data : [ {
				type : "spline",
				markerSize : 0,
				dataPoints : dps
			} ]
		});

		var xVal = 0;
		var yVal = 100;
		var updateInterval = 1000;
		var dataLength = 50; // number of dataPoints visible at any point

		var updateChart = function(count) {
			count = count || 1;
			// count is number of times loop runs to generate random dataPoints.
			for (var j = 0; j < count; j++) {
				yVal = yVal + Math.round(5 + Math.random() * (-5 - 5));
				dps.push({
					x : xVal,
					y : yVal
				});
				xVal++;
			}
			if (dps.length > dataLength) {
				dps.shift();
			}
			chart.render();
		};

		updateChart(dataLength);
		setInterval(function() {
			updateChart()
		}, updateInterval);

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