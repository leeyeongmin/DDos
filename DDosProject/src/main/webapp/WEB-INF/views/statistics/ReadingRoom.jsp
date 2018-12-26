<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	$(function(){
		google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(loadChart);
	})
	
	function loadChart(){
		$.ajax({
			type : "post",
			url : "readChart",
			async: false,
			success : function(datas) {
				console.log(datas);
				yesterday(datas.yesterday);
			 	lastWeekend(datas.lastweekend);
			 	lastweekday(datas.lastweekday);
			}
		})
	}
	
	function yesterday(use){
		
		var data = google.visualization.arrayToDataTable([
			  ['Task', '어제 열람실 사용현황'],
	          ['use',     use.use],
	          ['No-use',  100-use.use]
			]);
		
		 var options = {
		          title: '어제 열람실 사용현황',
		          is3D: true,
		          colors: ['blue', 'gray'],
		          width: 400, 
				  height: 500 ,
		 }; 

		var chart = new google.visualization.PieChart(document.getElementById('yesterday'));
		chart.draw(data, options);
	}
	
	function lastWeekend(use){
		console.log(use);
		
		var data = google.visualization.arrayToDataTable([
			  ['Task', '전주 주말 열람실 사용현황'],
	          ['use',     use.use],
	          ['No-use',  100-use.use]
			]);
		
		 var options = {
		          title: '전주 주말 열람실 사용현황',
		          is3D: true,
		          colors: ['blue', 'gray'],
		          width: 400, 
				  height: 500 ,
		 };

		var chart = new google.visualization.PieChart(document.getElementById('lastweekend'));
		chart.draw(data, options);
	}
	
	
	function lastweekday(use){
		
		var data = google.visualization.arrayToDataTable([
			  ['Task', '전주 평일 열람실 사용현황'],
	          ['use',     use.use],
	          ['No-use',  100-use.use]
			]);
		
		 var options = {
		          title: '전주 평일 열람실 사용현황',
		          is3D: true,
		          colors: ['blue', 'gray'],
		          width: 400, 
				  height: 500 ,
		 };

		var chart = new google.visualization.PieChart(document.getElementById('lastweekday'));
		chart.draw(data, options);
	}
	
	

	
	
	
</script>
</head>
<body>
	<h1>열람실 이용 현황</h1>
	<div id="yesterday" style="display: inline-block; float: left;"></div>
	<div id="lastweekend" style="display: inline-block;"></div>
	<div id="lastweekday" style="display: inline-block; float: right;"></div>
</body>
</html>