<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

</head>
<script>
	/* 	function openForm() { 
	 window.open("popup.jsp", "a", "width=400, height=300, left=100, top=50"); 
	 } */

	function openPopup() { //팝업창 오픈 
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
		return;
	}
</script>

<body onload="openPopup()">
	<!--  user여라!. -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->

		<div class="dashboard-finance">
			<div class="container-fluid dashboard-content">
				<!-- ============================================================== -->
				<!-- pageheader  -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">메인 페이지</h3>
							<div class="page-breadcrumb"> 
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb"> 
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Main
											
										</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<!-- 검색 -->
							<div class="card-body">
								<form name="frm" onsubmit="check()">
									<select class="form-control" name="searchCondition"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="booktitle">도서명
										<option value="bookwriter">저자
										<option value="bookcomp">출판사
									</select> <input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										type="text" name="searchKeyword" placeholder="Search">
									<button class="btn btn-primary"
										style="margin-left: 1%; width: 7%; height: 48px;">Search</button>
									<input type="hidden" name="page" />

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>