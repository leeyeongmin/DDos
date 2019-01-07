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
	var in_click, out_click;
	var options, options1;
	
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	
	window.onresize = function(){
		chart.draw(data, options);
		chart1.draw(data1, options1);
	}
	
	
	$(function(){
		combobox();
		input_table(); 
		output_table();
	}) 
	
	
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
	
	function change_show(){
		input_table();
		output_table();
		drawChart();
	}
	 
	/*--------------------------------inTable 수입 목록 테이블--------------------------------*/
	function input_table(e, page){
		
		if(e)
			e.preventDefault();
		
		/* var s_year = document.getElementById('year').value;
		var s_month = document.getElementById('month').value;  */
		var s_year = $("#year option:selected").val();
		var s_month = $("#month option:selected").val();
		
		sear_day = s_year + "/" + s_month;
		
		$("#addRow").empty();
		
		if(page == undefined || page == ""){
	         page=1
	    }
		
		console.log(page);
	    $("#paging").val(page);
		
		var $add = "";
		
		$.ajax({
			data : { "day" : sear_day, "page" : page},
			url : "month_inputList",
			method : "post",
			success : function(datas) {
					console.log(datas);
				if (datas.result.length == 0){
					$add += "<tr><td colspan='4'>검색결과가 없습니다.</td></tr>";
				}else{ 
					for(var i=0; i<datas.result.length; i++){
						$add += "<tr><td>" + datas.result[i].day + "</td>" + 
						"<td>" + datas.result[i].content + "</td>" + 
						"<td>" + datas.result[i].money + "</td>" + 
						"<td>" + datas.result[i].id + "</td></tr>";
					}	
				} 
			 
				$($add).prependTo("#addRow"); 		
				$("#paging").empty(); 
				var $dd = "";
				
				 $dd += "<nav aria-label='Page navigation example'>" + 
						  "<ul class=pagination>" + 
						  "<li class=page-item>" +  
					 	  "<a href='#'class='page-link' onclick='input_table(event, 1)' >&laquo;</a></li>";
		         //$(dd).appendTo("#paging"); 
		            
		            var begin = datas.paging.startPage;
		            var end = datas.paging.lastPage;               
		            for(j = begin; j <= end; j++ ) {
		               if(j != datas.paging.page) {
		                  $dd += "<li class='page-item'><a href='#' class='page-link' onclick='input_table(event, "+j+")'>"+j+"</a></li>";
		                  //$(bb).appendTo("#paging");
		               }
		                else if(j == datas.paging.page) {
		                  $dd += "<li class='page-item active'><a href='#' class='page-link'>"+j+"</a></li>";
		                  //$(cc).appendTo("#paging");
		               }  
		            }
		            $dd += "<li class=page-item><a href='#' class='page-link' onclick='input_table(event, "+datas.paging.lastPage+")'>&raquo;</a></li></ul></nav>";
		            $($dd).appendTo("#paging");
		            
		            console.log($dd);
			}
		});
	}
	
	/*------------------------outTable 지출 테이블--------------------------*/
	function output_table(e, page){
		e = window.event||e;
		
		
		if(e)
			e.preventDefault();
		/* var s_year = document.getElementById('year').value;
		var s_month = document.getElementById('month').value;  */
		var s_year = $("#year option:selected").val();
		var s_month = $("#month option:selected").val();
		sear_day = s_year + "/" + s_month;
		
		$("#addRow2").empty();
		var $add = "";
		
		if(page == undefined || page == ""){
	         page=1
	         
	    }
		
		
	    $("#outpaging").val(page);
		
			 
		$.ajax({
			data : { "day" : sear_day, "page" : page},
			url : "month_outputList",
			method : "post",
			success : function(datas) {
				console.log(datas);
				/* if (datas.length == 0){
					$add += "<tr><td colspan='4'>검색결과가 없습니다.</td></tr>";
				}else{
					for(var i=0; i<datas.length; i++){
						$add += "<tr><td>" + datas[i].day + "</td>" + 
						"<td>" + datas[i].content + "</td>" + 
						"<td>" + datas[i].money + "</td>" + 
						"<td>" + datas[i].id + "</td></tr>";
					}
				} */
				if (datas.result.length == 0){
					$add += "<tr><td colspan='4'>검색결과가 없습니다.</td></tr>";
				}else{ 
					for(var i=0; i<datas.result.length; i++){
						$add += "<tr><td>" + datas.result[i].day + "</td>" + 
						"<td>" + datas.result[i].content + "</td>" + 
						"<td>" + datas.result[i].money + "</td>" + 
						"<td>" + datas.result[i].id + "</td></tr>";
					}	
				} 
				$($add).prependTo("#addRow2"); 		
				
				$("#outpaging").empty(); 
				var $dd = "";
				
				 $dd += "<nav aria-label='Page navigation example'>" + 
						  "<ul class=pagination>" + 
						  "<li class=page-item>" +  
					 	  "<a href='#'class='page-link' onclick='output_table(event, 1)' >&laquo;</a></li>";
		         //$(dd).appendTo("#paging"); 
		            
		            var begin = datas.paging.startPage;
		            var end = datas.paging.lastPage;               
		            for(j = begin; j <= end; j++ ) {
		               if(j != datas.paging.page) {
		                  $dd += "<li class='page-item'><a href='#' class='page-link' onclick='output_table(event,"+j+")'>"+j+"</a></li>";
		                  //$(bb).appendTo("#paging");
		               }
		                else if(j == datas.paging.page) {
		                  $dd += "<li class='page-item active'><a href='#' class='page-link'>"+j+"</a></li>";
		                  //$(cc).appendTo("#paging");
		               }  
		            }
		            $dd += "<li class=page-item><a href='#' class='page-link' onclick='output_table(event,"+datas.paging.lastPage+")'>&raquo;</a></li></ul></nav>";
		            $($dd).appendTo("#outpaging");
				
			}
		
			
		});
		return false;
	}
	
	
	
	function drawChart() {
		/* var s_year = document.getElementById('year').value;
		var s_month = document.getElementById('month').value;  */
		var s_year = $("#year option:selected").val();
		var s_month = $("#month option:selected").val();
		sear_day = s_year + "/" + s_month;
		
		/*--------------------------------in 수입 그래프--------------------------------*/
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
				
				 options = {
				          title: '수입',
				          pieHole: 0.4, 
				          colors : ['gray', 'green' , 'pink', 'blue', 'orange'], 
				          annotations:{ textStyle:{ fontSize:7, color:'black'} },
				          height : "400" ,
				 };

				chart = new google.visualization.PieChart(document.getElementById('month_inputchart'));

				chart.draw(data, options);
				        
				google.visualization.events.addListener(chart, 'select', selectHandler);	
			}
		})
		
		/*-----------------------------------out 지출 그래프------------------------------------*/
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
				
				options1 = {
				          title: '지출',
				          pieHole: 0.4, 
				          colors : ['gray', 'green' , 'pink', 'blue', 'orange'], 
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
      			  in_click = data.getValue(chart.getSelection()[0].row, 0)
      		  }
      	  }
      	  inclick();
        }
		
		/*-------------------------------out_click---------------------------------*/
		function selectHandler2(){
			  var selection = chart1.getSelection();
	      	  
	      	  for(var i=0; i<selection.length; i++){
	      		  var item = selection[i];
	      		  if(item.row != null && item.column == null){
	      			out_click = data1.getValue(chart1.getSelection()[0].row, 0)
	      		  }
	      	  }
	      	  outclick();
      	}
	}
      
	
	/*--------------------------------click event in--------------------------------*/
      function inclick(e, page){
    	  	if(e)
  				e.preventDefault();
    	  
			var $click_add ="";
			
			var s_year = $("#year option:selected").val();
			var s_month = $("#month option:selected").val();
			
			sear_day = s_year + "/" + s_month;
			
			
			if(page == undefined || page == ""){
		         page=1
		         
		    }
			$("#paging").empty();

			$.ajax({
				url : "click_input",
				data : {day : sear_day , click : in_click, "page" : page},
				method : "post",
				success : function(datas) {
					$("#addRow").empty();
				
					for(var i=0; i<datas.result.length; i++){
						$click_add += "<tr><td>" + datas.result[i].day + "</td>" + 
						"<td>" + datas.result[i].content + "</td>" + 
						"<td>" + datas.result[i].money + "</td>" + 
						"<td>" + datas.result[i].id + "</td></tr>";
					}	
			
					
				/* 	for(var i=0; i<datas.length; i++){
						$click_add += "<tr><td>" + datas[i].day + "</td>" + 
						"<td>" + datas[i].content + "</td>" + 
						"<td>" + datas[i].money + "</td>" + 
						"<td>" + datas[i].id + "</td></tr>";
					} */
					$($click_add).prependTo("#addRow"); 	
					
					
					var $dd = "";
					
					 $dd += "<nav aria-label='Page navigation example'>" + 
							  "<ul class=pagination>" + 
							  "<li class=page-item>" +  
						 	  "<a href='#'class='page-link' onclick='inclick(event, 1)' >&laquo;</a></li>";
			         //$(dd).appendTo("#paging"); 
			            
			            var begin = datas.paging.startPage;
			            var end = datas.paging.lastPage;               
			            for(j = begin; j <= end; j++ ) {
			               if(j != datas.paging.page) {
			                  $dd += "<li class='page-item'><a href='#' class='page-link' onclick='inclick(event, "+j+")'>"+j+"</a></li>";
			                  //$(bb).appendTo("#paging");
			               }
			                else if(j == datas.paging.page) {
			                  $dd += "<li class='page-item active'><a href='#' class='page-link'>"+j+"</a></li>";
			                  //$(cc).appendTo("#paging");
			               }  
			            }
			            $dd += "<li class=page-item><a href='#' class='page-link' onclick='inclick(event, "+datas.paging.lastPage+")'>&raquo;</a></li></ul></nav>";
			            $($dd).appendTo("#paging");
				}
			});
      }
	
	/*-----------------------------------out click-------------------------*/
	function outclick(e, page){
		
		if(e)
			e.preventDefault();
		
		var $click_add ="";
		var $dd = "";
		
		var s_year = $("#year option:selected").val();
		var s_month = $("#month option:selected").val();
		
		sear_day = s_year + "/" + s_month;
		
		if(page == undefined || page == ""){
	         page=1  
	    }

		$.ajax({
			url : "click_output",
			data : {day : sear_day , click : out_click, page : page},
			method : "post",
			success : function(datas) {
				$("#addRow2").empty();
				$("#outpaging").empty();

				for(var i=0; i<datas.result.length; i++){
					$click_add += "<tr><td>" + datas.result[i].day + "</td>" + 
					"<td>" + datas.result[i].content + "</td>" + 
					"<td>" + datas.result[i].money + "</td>" + 
					"<td>" + datas.result[i].id + "</td></tr>";
				}	
		
				/* for(var i=0; i<datas.length; i++){
					$click_add += "<tr><td>" + datas[i].day + "</td>" + 
					"<td>" + datas[i].content + "</td>" + 
					"<td>" + datas[i].money + "</td>" + 
					"<td>" + datas[i].id + "</td></tr>";
				} */
				$($click_add).prependTo("#addRow2"); 	 
				
				 $dd += "<nav aria-label='Page navigation example'>" + 
				  "<ul class=pagination style='text-align:right'>" + 
				  "<li class=page-item>" +  
			 	  "<a href='#'class='page-link'  onclick='outclick(event, 1)' >&laquo;</a></li>";
        //$(dd).appendTo("#paging"); 
            
           var begin = datas.paging.startPage;
           var end = datas.paging.lastPage;               
           for(j = begin; j <= end; j++ ) {
              if(j != datas.paging.page) {
                 $dd += "<li class='page-item'><a href='#' class='page-link' onclick='outclick(event, "+j+")'>"+j+"</a></li>";
                 //$(bb).appendTo("#paging");
              }
               else if(j == datas.paging.page) {
                 $dd += "<li class='page-item active'><a href='#' class='page-link' class='active'>"+j+"</a></li>";
                 //$(cc).appendTo("#paging");
              }  
           }
           $dd += "<li class=page-item><a href='#' class='page-link' onclick='outclick(event, "+datas.paging.lastPage+")'>&raquo;</a></li></ul></nav>";
           $($dd).appendTo("#outpaging");
				
				
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
				<%-- 	<%  Date date = new Date();
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
					<input type="button" value="검색" onclick="change_show()" class="btn btn-primary"> 
				<!-- <input type="hidden" name="page" />  -->
				
				</div>
					
					
					<div class="row" style="margin-top: 2%; ">
						<div class="col-sm" style="height: 500px;">
							<div id="month_inputchart"></div>
						</div> 
					
					<div class="col-sm">
						<div class="card">
							<div class="card-body"> 
						
								<div align="right"><input type="button" value="전체보기" onclick="input_table()" class="btn btn-primary"></div>
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
							<div id="paging"  class="card-footer" style="margin: auto; background-color: #fff; border-top: 0px;" ></div>
							
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
							
							<div align="right"><input type="button" value="전체보기" onclick="output_table()" class="btn btn-primary"></div>
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
							<div id="outpaging"  class="card-footer" style="margin: auto; background-color: #fff; border-top: 0px;" ></div>
				
						</div>
					</div>
				</div>		<!--  row -->
				
				
			</div>
		</div>
	</div>
</body>
</html>