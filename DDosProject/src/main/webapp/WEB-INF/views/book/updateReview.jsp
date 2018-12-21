<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
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
							<h3 class="mb-2">Edit Review</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item"><a href="getReviewList"
											class="breadcrumb-link">Review</a></li>
										<li class="breadcrumb-item active" aria-current="page">Edit
											Review</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->
				<div class="row" style="margin-top: 2%;">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<form action="updateReview" width="100%">
										<table width="100%"
											class="table table-bordered table-hover text-center">
											<tr>
												<td>ISBN</td>
												<td><input type="text" name="isbn"
													value="${review.isbn}" style="width: 100%" required></td>
											</tr>
											<tr>
												<td>번호</td>
												<td><input type="text" name="reviewNum"
													value="${review.reviewNum}" style="width: 100%" required></td>
											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="reviewTitle"
													value="${review.reviewTitle}" style="width: 100%" required></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><textarea rows="20" cols="20" name="reviewCont"
														style="width: 100%" required>${review.reviewCont}</textarea></td>
											</tr>
											<tr>
												<td>별점</td>
												<td><select class="form-control" name="reviewPoint"
													value="${review.reviewPoint}">
														<option value="${review.reviewPoint}">${review.reviewPoint}</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
												</select></td>
											</tr>
											<tr>
												<td><input type="submit" class="btn btn-primary btn-sm"
													style="width: 20%; height: 48px; font-weight: bold;"
													value="수정완료"></td>
											</tr>
										</table>
									</form>
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