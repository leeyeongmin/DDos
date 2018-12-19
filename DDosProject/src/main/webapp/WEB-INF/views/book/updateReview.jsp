<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
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
							<h3 class="mb-2">리뷰 수정</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Review
											Update</a>
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
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="section-block" id="basicform"></div>
						<div class="card">
							<form id="updateReview" action="updateReview" method="post" style="margin: 25px">
									<div class="form-group">
										<label for="inputText3" class="col-form-label">ISBN</label> <input
											name="isbn" type="hidden" value="${review.isbn}">${review.isbn}</div>
									<div class="form-group">
										<label for="inputText3" class="col-form-label">리뷰 제목</label> <input
											name="reviewTitle" type="text" class="form-control"
											value="${review.reviewTitle}">${review.reviewTitle}
									</div>
									<div class="form-group">
										<label for="exampleFormControlTextarea1">리뷰 내용</label>
										<textarea class="form-control" name="reviewCont" rows="3">${review.reviewCont}</textarea>
									</div>
									<div class="form-group">
										<label for="input-select">평점</label> 
										<select class="form-control" name="reviewPoint" value="${review.reviewPoint}">
											<option value="${review.reviewPoint}">${review.reviewPoint}</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>

									<div class="col-sm-6 pl-0">
										<p class="text-right">
											<button type="submit" class="btn btn-space btn-primary">저장</button>
											<a href="javascript:history.back();">이전페이지로</a>
										</p>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>