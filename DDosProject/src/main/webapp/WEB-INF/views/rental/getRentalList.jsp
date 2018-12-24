<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 현황</title>
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">

</head>
<body>
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
							<h3 class="mb-2">대출현황</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Borrow</a>
										</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 mb-5">
					<div class="section-block">
						<h5 class="section-title">대출현황</h5>
					</div>
					<div class="tab-regular">
						<ul class="nav nav-tabs " id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active show"
								id="rentalStatus" data-toggle="tab" href="./getRentalList" role="tab"
								aria-controls="home" aria-selected="true">대출현황</a></li>
							<li class="nav-item"><a class="nav-link" id=""
								data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false">대출이력</a></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<!--대출 현황-->
							<div class="tab-pane fade" id="rentalStatus" role="tabpanel"
								aria-labelledby="contact-tab">
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="card">
										<div class="card-body">
											<table class="table" id="getRentalList">
												<thead>
													<tr>
														<th scope="col">#</th>
														<th scope="col">ISBN</th>
														<th scope="col">도서명</th>
														<th scope="col">출판사</th>
														<th scope="col">저자</th>
														<th scope="col">대출일자</th>
													</tr>
												</thead>
												<tbody id=getBookList>
													<c:forEach items="${getBookList}" var="rental">
														<tr>
															<td><input type="checkbox" name="rnum"
																value="${rental.rentalNum}"></td>
															<td>${rental.bookTitle}"</td>
															<td>${rental.isbn}</td>
															<td>${rental.bookWriter}</td>
															<td>${rental.bookComp}</td>
															<td>${rental.rentalDate}</td>
															<td>${rental.dueDate}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>



							</div>


							<!--대출 이력-->
							<div class="tab-pane fade" id="rentalStatus" role="tabpanel"
								aria-labelledby="profile-tab">
								<h3>Tab Heading Content</h3>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
