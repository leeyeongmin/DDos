<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- ============================================================== -->
<!-- end main wrapper  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<!-- jquery 3.3.1 -->
<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- slimscroll js -->
<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<!-- main js -->
<script src="assets/libs/js/main-js.js"></script>

<script>
	$(document).ready(function() {
		$('#sortCol').children().each(function(e, i) {
			var value = $(i).val();
			if (location.search.indexOf(value) > 0) {
				i.defaultSelected = true;
			} else {
				i.defaultSelected = false;
			}
		});
	});
	/* document.ready(function (){
		
	}); */

	function check() {
		if (document.getElementById("searchUserKeyword").value == "") {
			alert("원하시는 검색 타입을 설정하시고 검색어를 입력하세요");
			document.searchUser.searchUserKeyword.focus();
			return;
		}
		document.searchUser.submit();
	}
</script>


<body>
	<div class="dashboard-main-wrapper">

		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="influence-finder">
			<div class="container-fluid dashboard-content">
				<!-- ============================================================== -->
				<!-- pageheader -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">Costomer List</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">User</li>
										<li class="breadcrumb-item active" aria-current="page">Costomer
											List</li>
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
					<!-- search bar  -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<form name="SearchUser" onsubmit="check()">
									<select class="form-control" name="searchType"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="id">Id
										<option value="name">Name
									</select> <input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										id="searchUserKeyword" type="text" name="searchUserKeyword"
										placeholder="Search">
									<button class="btn btn-primary search-btn" type="submit">Search</button>
								</form>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end search bar  -->
					<!-- ============================================================== -->

					<div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">

						<c:forEach items="${userList }" var="userList">
							<!-- ()안에 model""이거 -->



							<!-- ============================================================== -->
							<!-- card influencer one -->
							<!-- ============================================================== -->
							<div class="card">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="user-avatar float-xl-left pr-4 float-none">
												<img src="assets/images/avatar-1.jpg" alt="User Avatar"
													class="rounded-circle user-avatar-xl">
											</div>
											<div class="pl-xl-3">
												<div class="m-b-0">
													<div class="user-avatar-name d-inline-block">
														<h2 class="font-24 m-b-10">${userList.name }</h2>
													</div>
												</div>
												<div class="user-avatar-address">
													<p class="mb-2">
														<i class="fa fa-map-marker-alt mr-2  text-primary"></i>
														${userList.address } &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

														<span class="m-l-10">
															&emsp;ID&nbsp;&nbsp;:&emsp;${userList.id } </span>

													</p>


													<div class="mt-3"></div>
													<div class="mt-3">
														<span class="m-l-10">
															&emsp;Gender&nbsp;&nbsp;:&emsp;${userList.gender } <span
															class="m-l-20">
																&emsp;Phone&nbsp;&nbsp;:&emsp;${userList.phone } </span> <span
															class="m-l-20">
																&emsp;Birthday&nbsp;&nbsp;:&emsp;${userList.birth } </span>
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
											<div class="float-xl-right float-none mt-xl-0 mt-4">

												<c:if test="${userList.memSeparation == 'user'}">
													<a href="userTypeChangeForm?id=${userList.id}"
														class="btn-wishlist m-r-10"><i class="far fa-star"></i></a>
												</c:if>

												<c:if test="${userList.memSeparation == 'iuser'}">
													<a href="userTypeChangeForm?id=${userList.id}"
														class="btn-wishlist-iuser m-r-10"><i
														class="far fa-star"></i></a>
												</c:if>

												<c:if test="${userList.memSeparation == 'buser'}">
													<a href="userTypeChangeForm?id=${userList.id}"
														class="btn-wishlist-buser m-r-10"><i
														class="far fa-star"></i></a>
												</c:if>

												<a href="userDetail?id=${userList.id}"
													class="btn btn-secondary">Show User</a>
											</div>
										</div>
									</div>
								</div>
								<div class="border-top user-social-box">
									<div class="user-social-media d-xl-inline-block " style="width:33%;">
										<span class="mr-2 twitter-color"> Rental : </span>
										<span>${userList.rentalCount}</span>
									</div>
									<div class="user-social-media d-xl-inline-block" style="width:33%;">
										<span class="mr-2  pinterest-color"> ReadingRoom history : </span>
											<span>${userList.readCount}</span>
									</div>
									<div class="user-social-media d-xl-inline-block"  style="width:33%;">
										<span class="mr-2 instagram-color"> Review : </span>
										<span>${userList.reviewCount}</span>
									</div>
								</div>
							</div>
							<!-- ============================================================== -->
							<!-- end card influencer one -->
							<!-- ============================================================== -->

						</c:forEach>

						<!-- ============================================================== -->
						<!-- end content -->
						<!-- ============================================================== -->
					</div>


					<!-- ============================================================== -->
					<!-- influencer sidebar  -->
					<!-- ============================================================== -->
					<div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<h3 class="font-16">Sorting By</h3>

								<!--TODO: value값 적기  -->
								<form action="getUserList" name="changeSort">
									<select class="form-control" id="sortCol" name="sortCol"
										onchange="document.changeSort.submit()">
										<option value="" selected>SELECT</option>
										<option value="OUT_COUNT">OUT&nbsp;COUNT</option>
										<option value="EXP_DATE">EXP&nbsp;DATE</option>
										<option value="">RENTAL</option>
										<option value="">OVERDUE</option>
										<option value="">REVIEW</option>
									</select>
								</form>
							</div>
						</div>

						<div class="card">
							<div class="card-body">
								<h3 class="font-16">Member Type</h3>
							</div>
							<div class="card-body border-top" style="margin-top: 5%;">
								<a href="getUserList" class="btn btn-outline-light btn-block">All
									Member</a>
							</div>
							<div class="card-body border-top" style="margin-top: 5%;">
								<a href="getNormalUserList?memSeparation=user"
									class="btn btn-outline-info btn-block">Basic Member</a>
							</div>
							<div class="card-body border-top" style="margin-top: 5%;">
								<a href="getInterestUserList?memSeparation=iuser"
									class="btn btn-outline-warning btn-block">Interest Member</a>
							</div>
							<div class="card-body border-top" style="margin-top: 5%;">
								<a href="getBlackUserList?memSeparation=buser"
									class="btn btn-outline-dark btn-block">Black Member</a>
							</div>
						</div>

					</div>

					<!-- ============================================================== -->
					<!-- end influencer sidebar  -->
					<!-- ============================================================== -->
				</div>
			</div>

		</div>
		<!-- ============================================================== -->
		<!-- end wrapper  -->
		<!-- ============================================================== -->
	</div>

</body>
</html>