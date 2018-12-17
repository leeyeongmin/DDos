<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Concept - Bootstrap 4 Admin Dashboard Template</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

<style>
.inform {
	width: 80%;
	margin-top: 5%;
}

.location {
	margin-left: 15%;
}
</style>

</head>

<body>
	<div class="dashboard-main-wrapper">

		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="influence-profile">
			<div class="container-fluid dashboard-content ">
				<!-- ============================================================== -->
				<!-- pageheader -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">My Profile</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="userHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">User</li>
										<li class="breadcrumb-item active" aria-current="page">Withdrawal</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- content -->
				<!-- ============================================================== -->


				<div class="row">
					<!-- ============================================================== -->
					<!-- validation form -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Withdrawal Form</h5>
							<div class="card-body location">
								<form class="needs-validation" action="withdrawal">
									<div class="row">
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
											<input class="form-control form-control-lg inform"
												type="email" name="id" id="id" required
												placeholder="Your E-mail">
										</div>
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
											<input class="form-control form-control-lg inform"
												type="text" name="name" id="name" required
												placeholder="Your name">
										</div>
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
											<input class="form-control form-control-lg inform"
												type="password" name="password" id="password" required
												placeholder="Your password">
										</div>
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 " style=" margin-top:3%; margin-bottom:2%;">
											<button class="btn btn-block btn-primary inform"
												type="submit" style="width:20%; margin-left:30%;">Withdrawal</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end validation form -->
					<!-- ============================================================== -->
				</div>



				<!-- ============================================================== -->
				<!-- end campaign data -->
				<!-- ============================================================== -->
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- end content -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- end main wrapper -->
	<!-- ============================================================== -->
</body>


</html>