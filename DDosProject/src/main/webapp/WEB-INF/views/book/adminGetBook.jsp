<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>도서 상세 페이지</title>
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
										<li class="breadcrumb-item"><a href="adminHome"
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
															>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div style="width: 70%;">
										<div class="product-details">
											<div class="border-bottom pb-3 mb-3">
												<span class="mb-3" style="font-size: 25pt;">${book.bookTitle}</span>
												<div class="product-rating d-inline-block float-right">
													<!-- 별점 평균 넣기 -->
												</div>
												<span style="font-size: 20pt;" class="mb-0 text-primary">${book.bookWriter}</span>
<%-- 			<c:forEach var="review" items="${result.review}">
												<tr>
													<td><c:out value="${review.reviewPoint}"/></td>
												</tr>
												</c:forEach> --%>
											</div>
										</div>
										<table
												style="font-size: 15px; border-collapse: separate; border-spacing: 30px; border-radius: 20%;">
												<thead>
													<tr>
														<td width="15%">ISBN &nbsp;
														</th>
														<td width="40%">${book.isbn}
														</th>
													</tr>
													<tr>
														<td width="15%">출판사 &nbsp;</td>
														<td width="30%">${book.bookComp}</td>
													</tr>
													<tr>
														<td width="15%">장르 &nbsp;</td>
														<td width="40%">${book.bookGenre}</td>
													</tr>
													<tr>
														<td width="15%">소장처/자료실 &nbsp;</td>
														<td>${book.bookLoc}</td>
													</tr>
													<tr>
														<td width="15%">도서상태 &nbsp;</td>
														<td>${book.bookAmount}</td>
													</tr>
													<c:if test="${book.bookAmount == '0'}">
														<tr>
															<td width="15%">반납예정일&nbsp;</td>
															<td>${book.dueDate}</td>
														</tr>
													</c:if>
												</thead>
											</table>
										 <a
											href="./adminUpdateBookform?isbn=${book.isbn}"
											class="btn btn-space btn-secondary">수정</a>
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
																		<th scope="row">아이디</th>
																		<th scope="row">제목</th>
																		<th scope="row">내용</th>
																		<th scope="row">별점</th>
																		<th scope="row">작성일자</th>
																		<th scope="row" colspan="2"></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${review}" var="review">
																		<tr>
																			<td>${review.memberId}</td>
																			<td>${review.reviewTitle}</td>
																			<td>${review.reviewCont}</td>
																			<td>${review.reviewPoint}</td>
																			<td>${review.reviewDate}</td>
																			<td colspan="2"><a
																				href="./deleteReview?reviewNum=${review.reviewNum}"
																				class="btn btn-space btn-secondary">삭제</a></td>
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