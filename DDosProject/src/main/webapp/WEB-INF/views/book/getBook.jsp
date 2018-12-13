<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

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
						<div class="page-header">
							<h3 class="mb-2">상세 정보</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Full
											Record</a>
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

				<!-- 여기서 부터 내용 -->
				<div class="row">
					<div
						class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pr-xl-0 pr-lg-0 pr-md-0  m-b-30"  style="width:30%;">
						<div class="product-slider">
							<!--사진넣는 곳-->
							<div id="productslider-1" class="product-carousel carousel slide"
								data-ride="carousel" >
								<ol class="carousel-indicators">
								</ol>
								<div class="carousel-inner">
									<div class="carousel-item">
										<img class="d-block" src="assets/images/eco-slider-img-1.png"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="d-block" src="assets/images/eco-slider-img-2.png"
											alt="Second slide">
									</div>
									<div class="carousel-item active">
										<img class="d-block" src="assets/images/eco-slider-img-3.png"
											alt="Third slide">
									</div>
								</div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
					
					
					<div
						class="col-xl-6 col-lg-6 col-sm-12 col-12 pl-xl-0 pl-lg-0 pl-md-0 border-left m-b-30">
						<div class="product-details">
							<div class="border-bottom pb-3 mb-3">
								<h2 class="mb-3">${book.bookTitle}</h2>
								<div class="product-rating d-inline-block float-right">
									<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
									<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
									<i class="fa fa-fw fa-star"></i>
								</div>
								<h3 class="mb-0 text-primary">${book.bookWriter}</h3>
							</div>
						</div>
						<div class="product-description">
							<h4 class="mb-1"></h4>
							<p></p>

							<a href="#" class="btn btn-primary btn-block btn-lg">대출</a>
						</div>
					</div>
				
				
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-60">
					<div class="simple-card">
						<ul class="nav nav-tabs" id="myTab5" role="tablist">
							<li class="nav-item"><a
								class="nav-link active border-left-0" id="product-tab-1"
								data-toggle="tab" href="#tab-1" role="tab"
								aria-controls="product-tab-1" aria-selected="true">내용</a>
							</li>
							<li class="nav-item"><a class="nav-link" id="product-tab-2"
								data-toggle="tab" href="#tab-2" role="tab"
								aria-controls="product-tab-2" aria-selected="false">Reviews</a>
							</li>
						</ul>
						<div class="tab-content" id="myTabContent5">
							<div class="tab-pane fade show active" id="tab-1" role="tabpanel"
								aria-labelledby="product-tab-1">
								<p>${book.bookCont}</p>
							</div>
							<div class="tab-pane fade" id="tab-2" role="tabpanel"
								aria-labelledby="product-tab-2">
								<div class="review-block">
									<p class="review-text font-italic m-0">리뷰 내용</p>
									<div class="rating-star mb-4">
										<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
										<i class="fa fa-fw fa-star"></i> <i class="fa fa-fw fa-star"></i>
										<i class="fa fa-fw fa-star"></i>
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


</body>
</html>