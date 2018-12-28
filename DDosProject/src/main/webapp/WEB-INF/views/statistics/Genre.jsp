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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>DDos</title>

<script>

	  $(function(){
		  topRentalList();
		  topRentalBook();
	  })
	
		
		//google.charts.load('visualization', '1.0', {'packages':['corechart', 'line']});
	  google.charts.load("current", {packages:["corechart"]});
	  google.charts.setOnLoadCallback(function(){
			book_chart();
			lineChart();
		});
		
		
	    var arr , leng;
	    var data , chart, options;
	    var data1, chart1, options1;
		window.onresize = function(){
			chart.draw(data, options);
			chart1.draw(data1, options1);
		}

		function lineChart(){
			
			  arr = new Array();
			  $.ajax({
				    url : "rentalCount", 
					method : "post",
					success : function(datas) {
						
						for(var i=0; i<datas.length; i++){
						   arr[i] = Array();
						   arr[i] = datas[i];
						}
						
						leng = arr.length;
						booklistdraw(0);
						
					}
			  });
			
		     
		}

	function booklistdraw(chg){

		  data1 = new google.visualization.DataTable();
		  data1.addColumn('string', 'Day');
		  data1.addColumn('number', 'Guardians of the Galaxy'); 
		  
		  leng = leng + chg;

		  for(var i=leng-7; i<leng; i++){ 
			  data1.addRow([arr[i].day, arr[i].cnt])
		  }

		    options1 = {
			        chart: {
			          title: '일별 대여 횟수',
			        },
			        legend : {position : 'none' }, // 항목 표시 여부 (현재 설정은 안함),
			        height : "400" ,
			        //vAxis: { minValue: 0 }, 
			        //pointSize: 30,
			        //pointShape: { type: 'star', sides: 4 },
			        //colors : 'gray',
			         animation: {
			            duration: 3000,
			            easing: 'out'
			       }, 
			       vAxis: { minValue: 0},
			       colors: ['gray'],
			       pointSize: 10,
			       pointShape: { type: 'star' }
		};
			
	      chart1 = new google.visualization.LineChart(document.getElementById('BookChart'));	  	   
	      chart1.draw(data1, options1);
	}

	
	function topRentalList(){
		 $.ajax({
			url : "toprental", 
			method : "post",
			success : function(datas) {
				var $add = "";
				for(var i=0; i<datas.length; i++){
					$add += "<tr><td>" + datas[i].memberId + "</td>" +
							"<td>" + datas[i].name + "</td>" + 
							"<td>" + datas[i].bookComp + "</td>" + 
							"<td>" + datas[i].phone + "</td></tr>";	
				}
				$($add).prependTo("#expenditureList"); 
			}
		}) 
	}

	function topRentalBook(){
		 $.ajax({
				url : "toprentalbook", 
				method : "post",
				success : function(datas) {
					var $add = "";
					for(var i=0; i<datas.length; i++){
						$add += "<tr><td>" + datas[i].rankCnt + "</td>" +
								"<td>" + datas[i].bookTitle + "</td>" + 
								"<td>" + datas[i].bookLoc + "</td>" + 
								"<td>" + datas[i].cnt + "</td></tr>";	
					} 
					$($add).prependTo("#bookGenre"); 
				}
			});
	}
	
		
	//chartContainer
	function book_chart(){
		$.ajax({
			url : "bookChart", 	
			method : "post", 
			async: false,
			success : function(datas) {
				data = new google.visualization.arrayToDataTable([
					 ['genre' , '권' , {role : 'style'}],
					 ["철학 및 역사",  datas.History.cnt, 'blue'],
				     ["총류",  datas.Total.cnt, 'orange'],
				     ["예술",  datas.art.cnt, 'yellow'],
				     ["과학",  datas.Science.cnt, 'red'],
				     ["언어 및 문학",  datas.Language.cnt, 'green']
				]);
				 
				options = {
				          title: '장르별 책 대여 현황 ',
				          is3D: true,
				          colors: ['blue', 'gray' , 'yellow', 'red', 'orange'],
				          vAxis : { format : '0'},
				          legend : {position : 'none' }, // 항목 표시 여부 (현재 설정은 안함),
				          height : "400"  
				 };

				chart = new google.visualization.ColumnChart(document.getElementById('chartContainer'));

				chart.draw(data, options);
			}
		});//ajax

	}
	
	function searchChar(){
		var s_year = document.getElementById('year').value;
		var s_month = document.getElementById('month').value; 
	
		if(s_year == "" || s_month == ""){
			alert("빈칸을 입력하세요.")
		}else if(s_month > 12  || s_month <= 0){
			alert("1- 12 입력하세요");
		}else{
			
		}
		
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
							<h3 class="mb-2">Income Statistics</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">Statistics</li>
										<li class="breadcrumb-item active" aria-current="page">Income
											Statisticst</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
					<input type="text" style="width: 50px;" id="year">년 &nbsp;&nbsp; 
					<input type="text" style="width: 30px;" id="month">월  &nbsp;&nbsp; 
					<input type="button" value="보기" onclick="searchChar()"> 
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->
				<!-- ============================================================== -->
				<div class="row" style="margin-top: 2%; ">
					<div class="col-sm" style="height: 500px;">
							<div id="chartContainer"></div>
					</div>
					
					<div class="col-sm">
					<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<h3 class="mb-2" style="text-align:center;">도서 대여 횟수 </h3>
							<table id="getExpenditureList" width="100%"
										class="table table-bordered table-hover text-center">
								<thead>
											<tr>
												<th width="40%">ID</th>
												<th width="20%">NAME</th>
												<th width="20%">COUNT</th>
												<th width="40%">PHONE</th>
											</tr>
										</thead>
										<tbody id=expenditureList>
										</tbody>
							</table>
							</div>
							</div> 
						</div>
					</div>
				</div>		<!--  row -->
				
				
				<div class="row" style="margin-top: 2%; ">
					<div class="col-sm" style="height: 500px;">
							 <div style="width: 5%; display: inline-block; font-size: 30pt;"><label onclick="booklistdraw(-1)">&lt;</label></div>
							 <div style="width: 80%; display: inline-block;" id="BookChartShow">
								 
								 <div id="BookChart"></div>
								
							
							</div> 
							 <div style="width: 5%; display: inline-block; padding-left: 2%" onclick="booklistdraw(1)"> &gt; </div>
					</div>
					
					<div class="col-sm">
						<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<h3 class="mb-2" style="text-align:center;">도서 대여 횟수 </h3>
									<table id="getExpenditureList" width="100%"
												class="table table-bordered table-hover text-center">
										<thead>
													<tr>
														<th width="20%">RANK</th>
														<th width="40%">TITLE</th>
														<th width="40%">GENRE</th>
														<th width="20%">COUNT</th>
													</tr>
												</thead>
												<tbody id=bookGenre>
												</tbody>
									</table>
								</div>
							</div> 
						</div>
					</div>
				</div>		<!--  row -->
					<!-- ============================================================== -->
					<!-- search bar  -->
					<!-- ============================================================== -->
					<!--  <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
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
					</div>  -->
					<!-- ============================================================== -->
					<!-- end search bar  -->
					<!-- ============================================================== -->
					
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
					
				
				<!-- <div class="row"
					style="display: inline-block; margin-top: 2%; margin-left: 2%; width: 50%;"> -->
					<!-- ============================================================== -->
					<!-- start list  -->
					<!-- ============================================================== -->
					
				<%--	<h3 class="mb-2" style="text-align:center;">도서 대여 횟수 </h3> 
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
												<th width="20%">COUNT</th>
												<th width="40%">PHONE</th>
											</tr>
										</thead>
										<tbody id=expenditureList>
											<c:forEach items="${noticeList}" var="notice">
												<c:set var="grant" value="${notice.memberId}"></c:set>
												<input type="hidden" value="${notice.memberId}">
												<tr>
													<td>${notice.noticeNum}</td>
													<td><a
														href="./getNotice?noticeNum=${notice.noticeNum}">${notice.noticeTitle}</a></td>
													<td>${notice.noticeDate}</td>
													<td>${notice.noticeCnt}</td>
												</tr>
											</c:forEach>
											
											
										</tbody>
									</table> 
								</div> --%>
							</div>


						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end list  -->
					<!-- ============================================================== -->

</body>
</html>