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



								<li class="nav-item"><a class="nav-link" id="sendMessage"
									data-toggle="pill" href="#insertMessageform" role="tab"
									aria-controls="pills-msg" aria-selected="false">Send
										Messages</a></li>

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
													<ul class="list-unstyled arrow" style="margin-top:7%;">
														<li style="marimargin-top:3%;">
															RENTAL COUNT : ${user.rentalCount }
														</li>
														<li style="margin-top:3%;">
															USING READING ROOM COUNT : ${user.readCount}
														</li>
														<li style="margin-top:3%;">
															REVIEW COUNT : ${user.reviewCount}
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="tab-pane fade" id="review" role="tabpanel"
									aria-labelledby="pills-review-tab">
									<div class="card">
										<h5 class="card-header">Campaign Reviews</h5>
										<div class="card-body">
											<div class="review-block">
												<p class="review-text font-italic m-0">“Quisque lobortis
													vestibulum elit, vel fermentum elit pretium et. Nullam id
													ultrices odio. Cras id nulla mollis, molestie diam eu,
													facilisis tortor. Mauris ultrices lectus laoreet commodo
													hendrerit. Nullam varius arcu sed aliquam imperdiet. Etiam
													ut luctus augue.”</p>
												<div class="rating-star mb-4">
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i>
												</div>
												<span class="text-dark font-weight-bold">Tabitha C.
													Campbell</span><small class="text-mute"> (Company name)</small>
											</div>
										</div>
										<div class="card-body border-top">
											<div class="review-block">
												<p class="review-text font-italic m-0">“Maecenas rutrum
													viverra augue. Nulla in eros vitae ante ullamcorper congue.
													Praesent tristique massa ac arcu dapibus tincidunt. Mauris
													arcu mi, lacinia et ipsum vel, sollicitudin laoreet risus.”</p>
												<div class="rating-star mb-4">
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i>
												</div>
												<span class="text-dark font-weight-bold">Luise M.
													Michet</span><small class="text-mute"> (Company name)</small>
											</div>
										</div>
										<div class="card-body border-top">
											<div class="review-block">
												<p class="review-text font-italic m-0">“ Cras non rutrum
													neque. Sed lacinia ex elit, vel viverra nisl faucibus eu.
													Aenean faucibus neque vestibulum condimentum maximus. In id
													porttitor nisi. Quisque sit amet commodo arcu, cursus
													pharetra elit. Nam tincidunt lobortis augueat euismod ante
													sodales non. ”</p>
												<div class="rating-star mb-4">
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i>
												</div>
												<span class="text-dark font-weight-bold">Gloria S.
													Castillo</span><small class="text-mute"> (Company name)</small>
											</div>
										</div>
									</div>
									<nav aria-label="Page navigation example">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item active"><a class="page-link "
												href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
										</ul>
									</nav>
								</div>





								<div class="tab-pane fade" id="insertMessageform" role="tabpanel"
									aria-labelledby="pills-msg-tab">
									<div class="card">
										<h5 class="card-header">Send Messages</h5>
										<div class="card-body">
											<form action="insertMessage">
												<div class="row">
													<div
														class="offset-xl-3 col-xl-6 offset-lg-3 col-lg-3 col-md-12 col-sm-12 col-12 p-4">
<%-- 														<div class="form-group">
															<label for="messageNum"></label> <input type="hidden"
																class="form-control form-control-lg" name="messageNum"
																value="${message.messageNum}">
														</div> --%>
														<div class="form-group">
															<label for="memberId">회원 아이디</label> <input type="email"
																class="form-control form-control-lg" name="memberId"
																value="${user.id}">
														</div>
														<div class="form-group">
															<label for="messageTitle">제목</label> <input type="text"
																class="form-control form-control-lg" name="messageTitle"
																placeholder="">
														</div>
														<div class="form-group">
															<label for="messageCont">내용</label>
															<textarea class="form-control" name="messageCont" rows="3"></textarea>
														</div>
														<button type="submit" class="btn btn-primary float-right">Send
															Message</button>
													</div>
												</div>
											</form>
										</div>
									</div>
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