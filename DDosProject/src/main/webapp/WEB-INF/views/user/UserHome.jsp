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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<style>
.myAutoSlides {
	display: none;
}

.grid-item {
	margin-top: 30px;
	margin-bottom: 30px;
	background-color: rgba(255, 255, 255, 0.8);
	border: none;
	padding: 20px;
	font-size: 30px;
	text-align: center;
}

h2 {
	letter-spacing: 20px;
}

.title-style {
	color: #2196F3;
	text-align: center;
	font-size: 20px;
}
</style>
<script type="text/javascript">

function check() {
	if (document.frm.searchKeyword.value == "") {
		alert("검색어를 입력하세요");
		document.frm.searchKeyword.focus();
		return false;
	}
	return true;
}
	
</script>


<body>
	<!-- onload="openPopup()"> -->
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
				<div class="grid-item title-style">
					<div class="w3-content w3-section">
						<img src="assets/images/home/home.jpg" style="width: 500px">
					</div>
				</div>
				<!-- 				<div class="row">
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
				</div> -->

				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<!-- 검색 -->
							<div class="card-body">
								<form name="frm" action="getBookList" onsubmit="check()">
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
				<div class="grid-item title-style">
					<p class="chapter-style">
						<b>이달의 추천 도서</b>
					</p>

					<div class="w3-content w3-section">
						<img class="myAutoSlides" src="assets/images/home/book_1.jpg"
							style="width: 100%"> <img class="myAutoSlides"
							src="assets/images/home/book_2.jpg" style="width: 100%"> <img
							class="myAutoSlides" src="assets/images/home/book_3.jpg"
							style="width: 100%">
					</div>
				</div>

			
			</div>
		</div>
	</div>
</body>
<script>
	/* 	function openForm() { 
	 window.open("popup.jsp", "a", "width=400, height=300, left=100, top=50"); 
	 } */

	/* function openPopup() { //팝업창 오픈 
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
	} */

	/* 이달의 추천 도서 */
	var myIndex = 0;
	carousel();

	function carousel() {
		var i;
		var x = document.getElementsByClassName("myAutoSlides");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		myIndex++;
		if (myIndex > x.length) {
			myIndex = 1
		}
		x[myIndex - 1].style.display = "block";
		setTimeout(carousel, 3000); // Change image every 2 seconds
	}
</script>
</html>