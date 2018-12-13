<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
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
<title>Concept - Bootstrap 4 Admin Dashboard Template</title>

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
							<h3 class="mb-2">Admin Profile</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">User</li>
										<li class="breadcrumb-item active" aria-current="page">Manager
											Information</li>
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
					<!-- profile -->
					<!-- ============================================================== -->
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
						<!-- ============================================================== -->
						<!-- card profile -->
						<!-- ============================================================== -->
						<div class="card">
							<div class="card-body">
								<div class="user-avatar text-center d-block">
									<img src="assets/images/avatar-1.jpg" alt="User Avatar"
										class="rounded-circle user-avatar-xxl">
								</div>
								<div class="text-center">
									<h2 class="font-24 mb-0">${user.name}</h2>
									<p>Site Manager @Influnce</p>
								</div>
							</div>
							<div class="card-body border-top">
								<h3 class="font-16">Division</h3>
								<h1 class="mb-0">Admin</h1>

							</div>
							<div class="card-body border-top">
								<h3 class="font-16">Contact Information</h3>
								<div class="">
									<ul class="list-unstyled mb-0">
										<li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${user.id}</li>
										<li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i>${user.phone}</li>
									</ul>
								</div>
							</div>
							<div class="card-body border-top">
								<h3 class="font-16">Sub Info</h3>
								<div class="">
									<li class="mb-2">Gender:${user.gender}</li>
									<li class="mb-2">Birth Day:${user.birth}</li>
									<li class="mb-2">Address:${user.address}</li>
									</ul>
								</div>
							</div>


						</div>
						<!-- ============================================================== -->
						<!-- end card profile -->
						<!-- ============================================================== -->
					</div>
					<!-- ============================================================== -->
					<!-- end profile -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- campaign data -->
					<!-- ============================================================== -->
					<div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
						<!-- ============================================================== -->
						<!-- campaign tab one -->
						<!-- ============================================================== -->
						<div class="influence-profile-content pills-regular">
							<ul class="nav nav-pills mb-3 nav-justified" id="pills-tab"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="pills-campaign-tab" data-toggle="pill"
									aria-controls="pills-campaign" aria-selected="true">Edit
										Admin Information</a></li>
							</ul>
							<div class="tab-content" id="pills-tabContent"></div>
						</div>
						<!-- ============================================================== -->
						<!-- end campaign tab one -->
						<!-- ============================================================== -->

						<form class="splash-container joinForm" action="join"
							method="post">
							<div class="card">
								<div class="card-header">
									<h3 class="mb-1">Registrations Form</h3>
									<p>Please enter your user information.</p>
								</div>
								<div class="card-body">
									<div class="form-group">
										<input class="form-control form-control-lg" type="email"
											name="id" id="email" required="" placeholder="Your e-mail"
											autocomplete="off" oninput="checkId()">
									</div>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text"
											name="name" id="name" required="" placeholder="Your name"
											autocomplete="off">
									</div>
									<div class="form-group">
										<input class="form-control form-control-lg" type="password"
											id="password" name="password" required=""
											placeholder="Your password" oninput="checkPwd()">
									</div>
									<div class="form-group">
										<input class="form-control form-control-lg" type="password"
											id="repassword" required=""
											placeholder="Your password confirm" oninput="checkPwd()">
									</div>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text"
											name="phone" id="phone" required="" placeholder="Your phone"
											autocomplete="off" maxlength="13">
									</div>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text"
											name="birth" id="birth" required=""
											placeholder="Your Birthday" autocomplete="off">
									</div>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text"
											id="address" name="address" required=""
											placeholder="Your address">
									</div>
									<div class="form-group">
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
											<button class="btn  btn-block btn-social btn-twitter"
												type="button" onclick="findAdd()">Find Address</button>
										</div>
									</div>
									<div class="custom-controls-stacked">
										<label class="custom-control custom-checkbox"
											style="display: inline-block; margin-left: 15%;"> <input
											id="male" name="gender" type="checkbox"
											class="custom-control-input" value="male"
											onclick="check_only(this)"> <span
											class="custom-control-label">Male</span>
										</label> <label class="custom-control custom-checkbox"
											style="display: inline-block; margin-left: 25%;"> <input
											id="female" name="gender" type="checkbox"
											class="custom-control-input" value="female"
											onclick="check_only(this)"> <span
											class="custom-control-label">Female</span>
										</label>
										<div id="error-container1"></div>
									</div>
									<div class="form-group pt-2">
										<button class="btn btn-block btn-primary" type="submit">Register
											My Account</button>
									</div>
								</div>
								<div class="card-footer bg-white">
									<p>
										Already member? <a href="loginForm" class="text-secondary">Login
											Here.</a>
									</p>
								</div>
							</div>
						</form>


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