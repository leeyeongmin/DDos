<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(function(){
		loadChart();
	})

	function loadChart(){
		$.ajax({
			type : "post",
			url : "readChart",
			async: false,
			success : function(result) {
				console.log(result);
			}
		})
	}
	
</script>
</head>
<body>
	<div id="yesterday"></div>
</body>
</html>