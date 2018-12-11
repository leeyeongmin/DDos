<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Resume - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet">
<link href="assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="assets/css/resume.min.css" rel="stylesheet">

<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	// html dom ì´ ë¤ ë¡ë©ë í ì¤íëë¤.
	$(document).ready(function() {
		// menu í´ëì¤ ë°ë¡ íìì ìë a íê·¸ë¥¼ í´ë¦­íìë
		$(".menu>a").click(function() {
			var submenu = $(this).next("ul");

			// submenu ê° íë©´ìì ë³´ì¼ëë ìë¡ ë³´ëëê² ì ê³  ìëë©´ ìëë¡ ë³´ëëê² í¼ì¹ê¸°
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
</script>
<style>
.menu a {
	cursor: pointer;
}

.menu .hide {
	display: none;
}
</style>

</head>

<body id="page-top">

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
		id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> </a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<span class="d-none d-lg-block">
			<ul>
			<li class="menu"><a><img
					class="img-fluid img-profile rounded-circle mx-auto mb-2"
					src="assets/css/images/profile.jpg" /></a>
				<ul class="hide navbar-nav">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">About</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#experience">Experience</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#education">Education</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#skills">Skills</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#interests">Interests</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#awards">Awards</a></li>
				</ul></li>
				</ul>
		</span>

	</nav>
	
	<tiles:insertAttribute name="content" />
	

	<%-- <div class="container-fluid p-0">

		<section class="resume-section p-3 p-lg-5 d-flex d-column" id="about">
			<div class="my-auto">
				<h1 class="mb-0">
					LIBRARY & <span class="text-primary">RENTAL & RETURN</span>
				</h1>
				<div class="subheading mb-5">This page allows you to view
					information about book information, rental and return books.</div>
				<!-- <div class="social-icons">
            <a href="#">
              <i class="fab fa-linkedin-in"></i>
            </a>
            <a href="#">
              <i class="fab fa-github"></i>
            </a>
            <a href="#">
              <i class="fab fa-twitter"></i>
            </a>
            <a href="#">
              <i class="fab fa-facebook-f"></i>
            </a>
          </div> -->
			</div>
		</section>

			<tiles:insertAttribute name="content" />


		<!-- <hr class="m-0">

		<section class="resume-section p-3 p-lg-5 d-flex flex-column"
			id="interests">
			<div class="my-auto">
				<h2 class="mb-5">Interests</h2>
				<p>Apart from being a web developer, I enjoy most of my time
					being outdoors. In the winter, I am an avid skier and novice ice
					climber. During the warmer months here in Colorado, I enjoy
					mountain biking, free climbing, and kayaking.</p>
				<p class="mb-0">When forced indoors, I follow a number of sci-fi
					and fantasy genre movies and television shows, I am an aspiring
					chef, and I spend a large amount of my free time exploring the
					latest technology advancements in the front-end web development
					world.</p>
			</div>
		</section> -->

	</div> --%>

	<!-- Bootstrap core JavaScript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="assets/js/resume.min.js"></script>

</body>

</html>