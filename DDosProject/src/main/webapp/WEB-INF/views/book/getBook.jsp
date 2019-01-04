<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>도서 상세 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function rentalBook() {
		$.ajax({
			url : "rentalBook",
			data : {
				loginId : "${login.id}",
				isbn : "${book.isbn}"
			},
			type : "post",
			dataType : "json",
			success : function() {
				alert("대출 완료되었습니다");
				location.reload();
			}
		})
	}
</script>

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
							<h3 class="mb-2">Book Detail</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Book
											Detail</a>
										</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
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
														<img class="d-block" src="./bookImg/${book.isbn}.jpg"
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
												</div>
												<h3 class="mb-0 text-primary">${book.bookWriter}</h3>
											</div>
										</div>
										<table
											style="font-size: 17px; margin: 25px; border-collapse =separate; border-spacing: 2px;">
											<thead>
												<tr>
													<th>ISBN &nbsp;</th>
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

										<c:choose>
											<c:when test="${book.bookAmount == '0'}">
												<input type="button" class="btn btn-primary"
													onclick="rentalBook();" value="대출불가" disabled="disabled">
											</c:when>
											<c:otherwise>
												<input type="button" class="btn btn-primary"
													onclick="rentalBook();" value="대출">
											</c:otherwise>
										</c:choose>

									</div>
								</div>
							</div>

							<div
								class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-60">
								<div class="simple-card">
									<ul class="nav nav-tabs" id="myTab5" role="tablist">
										<li class="nav-item"><a class="nav-link border-left-0"
											id="product-tab-1" data-toggle="tab" href="#tab-1" role="tab"
											aria-controls="product-tab-1" aria-selected="false">내용</a></li>
										<li class="nav-item"><a class="nav-link active show"
											id="product-tab-2" data-toggle="tab" href="#tab-2" role="tab"
											aria-controls="product-tab-2" aria-selected="true">리뷰</a></li>
									</ul>
									<div class="tab-content" id="myTabContent5">
										<div class="tab-pane fade" id="tab-1" role="tabpanel"
											aria-labelledby="product-tab-1">
											<p id="bookCont">${book.bookCont}</p>
										</div>
										<script>
											var text = document
													.querySelector('#bookCont');
											text.innerHTML = text.innerHTML
													.replace(/(\n|\r\n)/g,
															'<br>');
										</script>
										<div class="tab-pane active show" id="tab-2" role="tabpanel"
											aria-labelledby="product-tab-2">
											<!-- <div class="review-block"> -->

											<h5 class="card-header">
												<a href="./insertReviewform?isbn=${book.isbn}"
													class="btn btn-primary">리뷰쓰기</a>
											</h5>
											<div class="card-body">
												<ul class="list-unstyled">
													<li class="media">
														<div class="media-body">
															<table class="table">
																<thead>
																	<tr>
																		<th scope="row" style="width: 30%">제목</th>
																		<th scope="row" width="30%">내용</th>
																		<th scope="row" width="20%">별점</th>
																		<th scope="row" width="20%">작성일자</th>
																		<th scope="row" colspan="2"></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${review}" var="review">
																		<tr>
																			<td>${review.reviewTitle}</td>
																			<td>${review.reviewCont}</td>
																			<td><c:if test="${review.reviewPoint == 1}">
																					<img src="assets/images/reviewImg/star_1.png"
																						width="90">
																				</c:if> <c:if test="${review.reviewPoint == 2}">
																					<img src="assets/images/reviewImg/star_2.png"
																						width="90">
																				</c:if> <c:if test="${review.reviewPoint == 3}">
																					<img src="assets/images/reviewImg/star_3.png"
																						width="90">
																				</c:if> <c:if test="${review.reviewPoint == 4}">
																					<img src="assets/images/reviewImg/star_4.png"
																						width="90">
																				</c:if> <c:if test="${review.reviewPoint == 5}">
																					<img src="assets/images/reviewImg/star_5.png"
																						width="90">
																				</c:if></td>
																			<td>${review.reviewDate}</td>
																			<td>
																			<c:if test="${login.id == review.memberId}">
																			<a href="./updateReviewform?reviewNum=${review.reviewNum}&isbn=${review.isbn}" class="btn btn-primary">수정</a> 
																			<a href="./deleteReview?reviewNum=${review.reviewNum}&isbn=${review.isbn}" class="btn btn-space btn-secondary">삭제</a>
																			</c:if>
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</li>
												</ul>
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