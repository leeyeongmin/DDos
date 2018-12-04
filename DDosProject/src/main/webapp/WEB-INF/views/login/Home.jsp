<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>Aerial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		<style type="text/css">
		.pen{
		margin-top:5%;
		width:80%;
		height:80%;
		}
		</style>
		
	</head>
	<body class="is-preload">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
						<h1>DDos</h1>
						<p>대구 &nbsp;&bull;&nbsp; 도서관 &nbsp;&bull;&nbsp; 스터디</p>
						<nav>
								<a class="cbtn" href="main"><img class="pen" src="assets/css/images/book.png"/></a>
								<a class="cbtn" href="main_index.html"><img class="pen" src="assets/css/images/room.png"/></a>
								<a class="cbtn" href="main_index.html"><img class="pen" src="assets/css/images/study.png"/></a>
								<a class="cbtn" href="main_index.html"><img class="pen" src="assets/css/images/suggest.png"/></a>
								<a class="cbtn" href="main_index.html"><img class="pen" src="assets/css/images/notice.png"/></a>
								<a class="cbtn" href="main_index.html"><img class="pen" src="assets/css/images/messenger.png"/></a>

						</nav>
					</header>

				<!-- Footer -->
					<footer id="footer">
						<span class="copyright">&copy; Designed by : YeDam Final Project Group 2.</span>
					</footer>

			</div>
		</div>
		<script>
			window.onload = function() { document.body.classList.remove('is-preload'); }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
	</body>
</html>