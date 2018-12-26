<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    
</head>
<script>

/* 	function openForm() { 
		window.open("popup.jsp", "a", "width=400, height=300, left=100, top=50"); 
	} */
	
	function openPopup() {		//팝업창 오픈 
		var cookieCheck = getCookie("popupYN");
		console.log(cookieCheck);
		if (cookieCheck != "N") 
			window.open('popup.jsp', 'a', 'width=400, height=400') 
	}
	
	function getCookie(name) {
		var cookie = document.cookie;
		
		if (document.cookie != "") {
			var cookie_array = cookie.split("; ");
			for ( var index in cookie_array) {
				var cookie_name = cookie_array[index].split("=");
				if (cookie_name[0] == "popupYN") {
					return cookie_name[1]; 
					} 
				} 
			} 
		return ; 
	} 
	
</script>

<body onload="openPopup()">
     user여라!.
</body>
</html>