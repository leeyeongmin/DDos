<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>DDos</title>

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
							<h3 class="mb-2">Customer Information</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">User</li>
										<li class="breadcrumb-item active" aria-current="page"><a
											href="getUserList" class="breadcrumb-link">Customer List</a></li>
										<li class="breadcrumb-item active" aria-current="page">Customer
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
								<h1 class="mb-0">User</h1>

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
									id="pills-campaign-tab" data-toggle="pill" href="#history"
									role="tab" aria-controls="pills-campaign" aria-selected="true">History</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-packages-tab" data-toggle="pill" href="#review"
									role="tab" aria-controls="pills-packages" aria-selected="false">Review</a>
								</li>
							</ul>
							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="history"
									role="tabpanel" aria-labelledby="pills-campaign-tab">
									<div class="row">
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="section-block">
												<h3 class="section-title">History</h3>
											</div>
										</div>
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="card">
												<div class="card-body">
													<p class="lead">This page is show your History about
														number of using readingroom & number of rental & number of
														your review.</p>
													<ul class="list-unstyled arrow" style="margin-top: 7%;">
														<li style="marimargin-top: 3%;">RENTAL COUNT :
															${user.rentalCount }</li>
														<li style="margin-top: 3%;">USING READING ROOM COUNT
															: ${user.readCount}</li>
														<li style="margin-top: 3%;">REVIEW COUNT :
															${user.reviewCount}</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="tab-pane fade" id="review" role="tabpanel"
									aria-labelledby="pills-review-tab">
									<div class="card">
										<h5 class="card-header">Your Recent Book Reviews</h5>

										<c:forEach items="${reviewHistory}" var="reviewHistory">

											<div class="card-body">
												<div class="review-block">

													<span class="text-dark font-weight-bold">
														${reviewHistory.bookTitle} </span> <small class="text-mute">&ensp;&ensp;&ensp;${reviewHistory.reviewDate}</small>
														
													<!-- ---------------------------------------------- -->
													<!-- 리뷰 별점 -->
													<div class="rating-star mb-4">
														
														${reviewHistory.reviewPoint}
														
														
													</div>
													
													<!-- ------------------------------------------- -->

													<p class="review-text font-italic m-0">
													제목&ensp;:&ensp;  ${reviewHistory.reviewTitle} </p>

													<p class="review-text font-italic m-0">“
														${reviewHistory.reviewCont} ”<br></p>
												</div>
											</div>

										</c:forEach>

									</div>
								</div>
								<!-- ============================================================== -->
								<!-- end campaign tab one -->
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
			</div>



		</div>
		<!-- ============================================================== -->
		<!-- end main wrapper -->
		<!-- ============================================================== -->
</body>

</html>