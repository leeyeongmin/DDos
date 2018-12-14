<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 페이지</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
						<div class="card">
							<div class="card-body">

								<!-- 여기서 부터 내용 -->
								<div class="row">
									<div style="width: 30%;">
										<div class="product-slider">
											<!--사진넣는 곳-->
											<div id="productslider-1"
												class="product-carousel carousel slide" data-ride="carousel">
												<ol class="carousel-indicators">
												</ol>
												<div class="carousel-inner">
													<div class="carousel-item active">
														<img class="d-block"
															src="assets/images/eco-slider-img-3.png"
															alt="Third slide">
													</div>
												</div>

											</div>
										</div>
									</div>


									<div style="width: 70%;">
										<div class="product-details">
											<div class="border-bottom pb-3 mb-3">
												<h2 class="mb-3">${book.bookTitle}</h2>
												<div class="product-rating d-inline-block float-right">
													<!-- 별점 평균 넣기 -->
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i>
												</div>
												<h3 class="mb-0 text-primary">${book.bookWriter}</h3>
											</div>
										</div>
										<table
											style="font-size: 17px; margin: 25px; th ,td{padding: 15px; border-collapse =separate; border-spacing: 2px;">
											<thead>
												<tr>
													<th>ISBN&nbsp;</th>
													<th>${book.isbn}</th>
												</tr>
												<tr>
													<td>출판사 &nbsp;</td>
													<td>${book.bookComp}</td>
												</tr>
												<tr>
													<td>장르 &nbsp;</td>
													<td>${book.bookGenre}</td>
												</tr>
											</thead>
										</table>

										<table
											style="font-size: 17px; margin: 25px; text-align: center">
											<thead>
												<tr>
													<th>소장처/자료실 &nbsp;</th>
													<th>도서상태 &nbsp;</th>
													<th>반납예정일 &nbsp;</th>
												</tr>
												<tr>
													<td>${book.bookLoc}</td>
													<td>${book.bookAmount}</td>
													<td>${book.dueDate}</td>
											
											</thead>
										</table>


										<a href="#" class="btn btn-primary btn-block btn-default"
											style="">대출</a> <a href="./updateBookform?isbn=${book.isbn}"
											class="btn btn-primary btn-block btn-default" style="">수정</a>
									</div>
								</div>


							</div>
							<div
								class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-60">
								<div class="simple-card">
									<ul class="nav nav-tabs" id="myTab5" role="tablist">
										<li class="nav-item"><a
											class="nav-link active border-left-0" id="product-tab-1"
											data-toggle="tab" href="#tab-1" role="tab"
											aria-controls="product-tab-1" aria-selected="true">내용</a></li>
										<li class="nav-item"><a class="nav-link"
											id="product-tab-2" data-toggle="tab" href="#tab-2" role="tab"
											aria-controls="product-tab-2" aria-selected="false">Reviews</a></li>
									</ul>
									<div class="tab-content" id="myTabContent5">
									<p>${book.bookCont}</p>
										<div class="tab-pane fade show active" id="tab-1"
											role="tabpanel" aria-labelledby="product-tab-1">
											
										</div>
										<div class="tab-pane fade" id="tab-2" role="tabpanel"
											aria-labelledby="product-tab-2">
											<div class="review-block">
												<p class="review-text font-italic m-0">리뷰 내용</p>
												<div class="rating-star mb-4">
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
													<i class="fa fa-fw fa-star"></i> <i
														class="fa fa-fw fa-star"></i>
												</div>
												<span class="text-dark font-weight-bold">회원 id</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>