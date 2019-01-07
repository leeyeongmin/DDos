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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>DDos</title>

<script>


	var sear_day , sta_leng, max;
	$(function(){ 
		  combobox();
		  var s_year = $("#year option:selected").val();
		  var s_month = $("#month option:selected").val();
		  sear_day = s_year + "/" + s_month;
		  topRentalList(); 
		  topRentalBook();
	  })
	
	  google.charts.load("current", {packages:["corechart"]});
	  google.charts.setOnLoadCallback(function(){
			book_chart(sear_day);
			lineChart(sear_day);
		});
		
		
	    var arr , leng;
	    var data , chart, options;
	    var data1, chart1, options1;
		window.onresize = function(){
			chart.draw(data, options);
			chart1.draw(data1, options1);
		}

		
		function combobox(){
			
			var today = new Date();
			
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			 
			console.log(today);
			console.log(mm);
			console.log(yyyy);
			
			
	        // 올해 기준으로 -3년부터 +0년을 보여준다.
	        for(var y = yyyy-2; y <= yyyy; y++){ 
	        	if(yyyy == y){
	        		$("#year").append("<option value='"+ y +"' selected=selected>"+ y + " 년" +"</option>");
	        	}else{
	        		$("#year").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
	        	}
	            
	        }  
	        // 월 뿌려주기(1월부터 12월)  
	        var month;
	        for(var i = 1; i <= 12; i++){
	        	if(i == mm) {
	        		if(1 < 10){
	        			$("#month").append("<option value='"+ "0" + i +"' selected=selected>"+ i + " 월" +"</option>");
	        		}else{
	        			$("#month").append("<option value='"+ i +"' selected=selected>"+ i + " 월" +"</option>");
	        		}
	        	}else{
	        		$("#month").append("<option value='"+ i +"'>"+ i + " 월" +"</option>");
	        	}
	            
	        }
	   
		}
		
		
		function lineChart(sear_day){
			  arr = new Array();
			  max = 0;
			  $.ajax({
				    url : "rentalCount?day="+ sear_day, 
					method : "post",
					success : function(datas) {
						
						for(var i=0; i<datas.length; i++){
						   arr[i] = Array();
						   arr[i] = datas[i];
						   if(max < arr[i].cnt){
								max = arr[i].cnt;
							}
						}
						
						leng = arr.length;
						sta = arr.length;
						if(leng == "0"){
							
						}
						
						booklistdraw(0);
						
					}
			  });
			
		     
		}

	function booklistdraw(chg){
		  data1 = new google.visualization.DataTable();
		  data1.addColumn('string', 'Day');
		  data1.addColumn('number', 'Guardians of the Galaxy'); 
		  
		  leng = leng + chg;
		  
		  if(chg != 0 ){
			  if(sta < leng){
				  alert("마지막데이터입니다.");
				  leng = leng - chg;
			  }else if(sta <7){
				  alert("마지막데이터입니다.");
			  }else if(leng < 7){
				  alert("첫번째 데이터입니다.");
				  leng = leng - chg;
			  } 
		  }

		  if(leng == "0"){
			  for(var i=0; i<7; i++){
				  data1.addRow(null, null);	  
			  }
		  }else if(sta < 7){
			  for(var i=0; i<sta; i++){ 
				  data1.addRow([arr[i].day, arr[i].cnt]);
			  }
		  }else{
			  for(var i=leng-7; i<leng; i++){  
				  data1.addRow([arr[i].day, arr[i].cnt]);
			  }
		  }
			  
		    options1 = {
			        chart: {
			          title: '일별 대여 횟수',
			        },
			        legend : {position : 'none' }, // 항목 표시 여부 (현재 설정은 안함),
			        height : "400" ,
			       vAxis: { minValue: 0 , maxValue : max+2, format : '0'}, 
			       colors: ['gray'],
			       pointSize: 10,
			       pointShape: { type: 'star' }
		};
			
	      chart1 = new google.visualization.LineChart(document.getElementById('BookChart'));	  	   
	      chart1.draw(data1, options1);
	}

	
	function topRentalList(event, page){
		
		if(event)
			event.preventDefault();
		
		  var s_year = $("#year option:selected").val();
		  var s_month = $("#month option:selected").val();
		  sear_day = s_year + "/" + s_month;
		
		$("#expenditureList").empty();
		
		if(page == undefined || page == ""){
	         page=1  
	    }
		
		 $.ajax({
			data : {day : sear_day , page : page},
			url : "toprental", 
			method : "post",
			success : function(datas) {
				console.log(datas);
					var $add = "";
					
					/* for (var i = 0; i < datas.length; i++) {
						$add += "<tr><td>" + datas[i].memberId + "</td>"
								+ "<td>" + datas[i].name + "</td>" + "<td>"
								+ datas[i].bookComp + "</td></tr>"
					
					} */
					for (var i=0; i<datas.result.length; i++){
						$add += "<tr><td>" + datas.result[i].memberId + "</td>" 
							 + "<td>" + datas.result[i].name + "</td>" 
							 + "<td>" + datas.result[i].bookComp + "</td></tr>";
					} 
					
					$($add).prependTo("#expenditureList");
				
					$("#rentalpage").empty(); 
					var $dd = "";
					
					 $dd += "<nav aria-label='Page navigation example'>" + 
							  "<ul class=pagination>" + 
							  "<li class=page-item>" +  
						 	  "<a href='#'class='page-link' onclick='topRentalList(event, 1)' >&laquo;</a></li>";
			            
			            var begin = datas.paging.startPage;
			            var end = datas.paging.lastPage;               
			            for(j = begin; j <= end; j++ ) {
			               if(j != datas.paging.page) {
			                  $dd += "<li class='page-item'><a href='#' class='page-link' onclick='topRentalList(event, "+j+")'>"+j+"</a></li>";
			                  //$(bb).appendTo("#paging");
			               }
			                else if(j == datas.paging.page) {
			                  $dd += "<li class='page-item active'><a href='#' class='page-link'>"+j+"</a></li>";
			                  //$(cc).appendTo("#paging");
			               }  
			            }
			            $dd += "<li class=page-item><a href='#' class='page-link' onclick='topRentalList(event, "+datas.paging.lastPage+")'>&raquo;</a></li></ul></nav>";
			        
			    $($dd).appendTo("#rentalpage");
	
			}
		});
	}

	function topRentalBook(event, page) {

		if(event)
			event.preventDefault();
		
		 var s_year = $("#year option:selected").val();
		 var s_month = $("#month option:selected").val();
		 sear_day = s_year + "/" + s_month;
		
		
		$("#bookGenre").empty();
		$("#rentalBookpage").empty();

		console.log(sear_day);
		console.log(page);
		
		if(page == undefined || page == ""){
	         page=1  
	    }
		
		$.ajax({
			data : {day : sear_day, page : page},
			url : "toprentalbook",
			method : "post",
			success : function(datas) {
				console.log(datas);
				var $add = "";
				for (var i = 0; i < datas.result.length; i++) {
					$add += "<tr><td>" + datas.result[i].rankCnt + "</td>" + "<td>"
							+ datas.result[i].bookTitle + "</td>" + "<td>"
							+ datas.result[i].bookLoc + "</td>" + "<td>"
							+ datas.result[i].cnt + "</td></tr>";
				}
				$($add).prependTo("#bookGenre");
				
				var $dd = "";
				
				 $dd += "<nav aria-label='Page navigation example'>" + 
						  "<ul class=pagination>" + 
						  "<li class=page-item>" +  
					 	  "<a href='#'class='page-link' onclick='topRentalBook(event, 1)' >&laquo;</a></li>";
		            
		            var begin = datas.paging.startPage;
		            var end = datas.paging.lastPage;               
		            for(j = begin; j <= end; j++ ) {
		               if(j != datas.paging.page) {
		                  $dd += "<li class='page-item'><a href='#' class='page-link' onclick='topRentalBook(event, "+j+")'>"+j+"</a></li>";
		                  //$(bb).appendTo("#paging");
		               }
		                else if(j == datas.paging.page) {
		                  $dd += "<li class='page-item active'><a href='#' class='page-link'>"+j+"</a></li>";
		                  //$(cc).appendTo("#paging");
		               }  
		            }
		            $dd += "<li class=page-item><a href='#' class='page-link' onclick='topRentalBook(event, "+datas.paging.lastPage+")'>&raquo;</a></li></ul></nav>";
		        
		    $($dd).appendTo("#rentalBookpage");
				
				//rentalBookpage
			}
		});
	}

	//chartContainer
	function book_chart(sear_day) {

		$.ajax({
			url : "bookChart?day=" + sear_day,
			method : "post",
			async : false,
			success : function(datas) {
				data = new google.visualization.arrayToDataTable([
						[ 'genre', '권', {
							role : 'style'
						} ], [ "철학 및 역사", datas.History.cnt, 'blue' ],
						[ "총류", datas.Total.cnt, 'orange' ],
						[ "예술", datas.art.cnt, 'yellow' ],
						[ "과학", datas.Science.cnt, 'red' ],
						[ "언어 및 문학", datas.Language.cnt, 'green' ] ]);

				options = {
					title : '장르별 책 대여 현황 ',
					is3D : true,
					colors : [ 'blue', 'gray', 'yellow', 'red', 'orange' ],
					vAxis : {
						format : '0'
					},
					legend : {
						position : 'none'
					}, // 항목 표시 여부 (현재 설정은 안함),
					height : "400"
				};

				chart = new google.visualization.ColumnChart(document
						.getElementById('chartContainer'));

				chart.draw(data, options);
			}
		});//ajax

	}

	function searchChar() {
		var s_year = $("#year option:selected").val();
		var s_month = $("#month option:selected").val();
		
		var sear_day = s_year + "/" + s_month;
		topRentalList();
		topRentalBook();
		book_chart(sear_day);
		lineChart(sear_day);
	
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
					<%-- <% 	Date date = new Date();
						SimpleDateFormat sim = new SimpleDateFormat("yyyy");
						String sear_year = sim.format(date);
						SimpleDateFormat sim2 = new SimpleDateFormat("MM");
						String sear_month = sim2.format(date);
					%>
					<input type="text" style="width: 50px;" id="year" value=<%= sear_year %>>년 &nbsp;&nbsp; 
					<input type="text" style="width: 30px;" id="month" value=<%= sear_month %>>월  &nbsp;&nbsp; 
					<input type="button" value="보기" onclick="searchChar()">  --%>
					<select name="year" id="year"></select> &nbsp;&nbsp;
					<select name="month" id="month" ></select> &nbsp;&nbsp;
					<input type="button" value="검색" onclick="searchChar()" class="btn btn-primary"> 
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
												<th width="30%">NAME</th>
												<th width="30%">COUNT</th>
												
											</tr>
										</thead>
										<tbody id=expenditureList>
										</tbody>
									</table>
								</div>
							</div>
							<!-- <div id="rentalpage"></div> -->
							<div id="rentalpage"  class="card-footer" style="margin: auto; background-color: #fff; border-top: 0px;" ></div>
						</div>
					</div>
				</div>		<!--  row -->
				
				
				<div class="row" style="margin-top: 2%; ">
					<div class="col-sm" style="height: 500px;">
							 <div style="width: 5%; display: inline-block; "><input type="button" value="&lt" onclick="booklistdraw(-1)"></div>
							 <div style="width: 80%; display: inline-block;" id="BookChartShow">
								 
								 <div id="BookChart"></div>
								
							
							</div> 
							 <div style="width: 5%; display: inline-block; padding-left: 2%"><input type="button" value="&gt" onclick="booklistdraw(1)"> </div>				 
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
														<th width="5%">RANK</th>
														<th width="60%">TITLE</th>
														<th width="30%">GENRE</th>
														<th width="10%">COUNT</th>
													</tr>
												</thead>
												<tbody id=bookGenre>
												</tbody>
									</table>
								</div>
							</div>
						 <!--  <div id="rentalBookpage"></div>  -->
						  <div id="rentalBookpage"  class="card-footer" style="margin: auto; background-color: #fff; border-top: 0px;" ></div>
						</div>
					</div>
				</div>		<!--  row -->
					


						</div>
					</div>
					</div>
					<!-- ============================================================== -->
					<!-- end list  -->
					<!-- ============================================================== -->

</body>
</html>