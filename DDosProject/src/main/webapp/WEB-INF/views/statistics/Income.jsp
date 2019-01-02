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

	$(function(){
		$("#addRow").empty();
		var $add ="";
		$.ajax({
			url : "UnpaidList",
			method : "post", 
			success : function(datas) {
				for(var i=0; i<datas.length; i++){
					$add += "<tr><td>" + datas[i].id + "</td>" +
					"<td>" + datas[i].money + "</td>" + 
					"<td>" + datas[i].content + "</td>" + 
					"<td>" + datas[i].day + "</td>" +
					"<td>" + datas[i].delay + "</td></tr>";	
				}		
				$($add).prependTo("#addRow"); 
			}
		});  
	}); 

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
										<li class="breadcrumb-item active" aria-current="page">unsuccessful
											Total</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
					
				<div class="row"
					style="display: inline-block; margin-top: 2%; width: 100%;">
					<!-- ============================================================== -->
					<!-- search bar  -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12"> 
						<h1 align="center">미납자 명단</h1>
						<div class="card">
							<div class="card-body">
								<table id="UnpaidList" width="100%"
										class="table table-bordered table-hover text-center">
										<tr>
											<td width="25%">ID</td>
											<td width="15%">미납금</td>
											<td width="25%">내용</td>
											<td width="25%">연체일자</td>
											<td width="15%">연체일수</td>
										</tr>
										<tbody id="addRow">
										
										</tbody>
									</table>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end search bar  -->
					<!-- ============================================================== -->
					
					<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

				</div>
					<!-- ============================================================== -->
					<!-- end list  -->
					<!-- ============================================================== -->
			</div>
		</div>
	</div>
</body>
</html>