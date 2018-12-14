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
							<h3 class="mb-2">Customer Type Change</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">User</li>
										<li class="breadcrumb-item active" aria-current="page"><a
											href="getUserList" class="breadcrumb-link">Customer List</a></li>
										<li class="breadcrumb-item active" aria-current="page">Customer
											Type Change</li>
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
					<div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
						<!-- ============================================================== -->
						<!-- campaign tab one -->
						<!-- ============================================================== -->
						<div class="influence-profile-content pills-regular">
							<ul class="nav nav-pills mb-3 nav-justified" id="pills-tab"
								role="tablist">

								<li class="nav-item"><a class="nav-link active"
									id="pills-campaign-tab" data-toggle="pill"
									aria-controls="pills-campaign" aria-selected="true">Customer
										Type Change</a></li>
							</ul>
							<div class="tab-content" id="pills-tabContent"></div>
						</div>


						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="history"
								role="tabpanel" aria-labelledby="pills-campaign-tab">
								<div class="row">
								
									<div style="margin-left:7%; margin-top:5%; width:25%;">
										<div class="card">
											<div class="card-header bg-warning text-center p-3">
												<h4 class="mb-0 text-white">BASIC</h4>
											</div>
											<div class="card-body text-center">
												<h1 class="mb-1">BASIC MEMBER</h1>
											</div>
											<div class="card-body border-top">
												<ul class="list-unstyled bullet-check font-14">
													<li>A member who sets nomal</li>
												</ul>
												
												
												
												<a href="updateUserInfo?id=${user.id}&&memSeparation=user" 
												class="btn btn-secondary btn-block btn-lg">Change</a>
											
											
											
											</div>
										</div>
									</div>
									
									<div style="margin-left:5%; margin-top:5%; width:25%;">
										<div class="card">
											<div class="card-header bg-warning text-center p-3">
												<h4 class="mb-0 text-white">GREEN</h4>
											</div>
											<div class="card-body text-center">
												<h1 class="mb-1">INTERESTED MEMBER</h1>
											</div>
											<div class="card-body border-top">
												<ul class="list-unstyled bullet-check font-14">
													<li>A member who sets a good example for other members</li>
												</ul>
												
												
												
												<a href="updateUserInfo?id=${user.id}&&memSeparation=iuser" 
												class="btn btn-secondary-i btn-block btn-lg">Change</a>
											
											
											
											</div>
										</div>
									</div>


									<div style="margin-left:5%; margin-top:5%; width:25%;">
										<div class="card">
											<div class="card-header bg-warning text-center p-3">
												<h4 class="mb-0 text-white">BLACK</h4>
											</div>
											<div class="card-body text-center">
												<h1 class="mb-1">BLACK MEMBER</h1>
											</div>
											<div class="card-body border-top">
												<ul class="list-unstyled bullet-check font-14">
													<li>Members who are harmed by other members as a bad act</li>
												</ul>
												<a href="updateUserInfo?id=${user.id}&&memSeparation=buser" class="btn btn-secondary-b btn-block btn-lg">Change</a>
											</div>
										</div>
									</div>


								</div>
							</div>
						</div>
					</div>


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