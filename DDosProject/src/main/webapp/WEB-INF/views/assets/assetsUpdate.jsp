<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDos</title>

<style>
div.card {
	padding: 12px 20px 12px 20px;
}
</style>
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
							<h3 class="mb-2">Assets Manage</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Assets
											Update</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->

				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<div class="card-body">
							<form id="assetsUpdate" action="assetsUpdate" method="post" encType="multipart/form-data">
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">적요</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<select class="form-control" id="input-select"
											name="assetsCont" value="${assets.assetsCont}">
											<option value="assetsCont">${assets.assetsCont}</option>
											<option value="연체비">연체비</option>
											<option value="행사비">행사비</option>
											<option value="도서구입비">도서구입비</option>
											<option value="수용비">수용비</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">구분</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<select class="form-control" id="input-select"
											name="assetsSeparation" value="${assets.assetsSeparation}">
											<option value="assetsSeparation">${assets.assetsSeparation}</option>
											<option value="수입">수입</option>
											<option value="지출">지출</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">날짜</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<input type="date" name="assetsDate" class="form-control"
											value="${assets.assetsDate}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">금액</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<input type="text" name="assetsPrice" class="form-control"
											value="${assets.assetsPrice}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">회원ID</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<input type="text" name="memberId" class="form-control"
											value="${assets.memberId}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right">비고</label>
									<div class="col-12 col-sm-8 col-lg-6">
										<select class="form-control" id="input-select"
											name="contDetail" value="${assets.contDetail}">
											<option value="contDetail">${assets.contDetail}</option>
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</div>
								</div>

								<!-- 첨부파일 -->
								<div class="form-group row">
									<label class="col-12 col-sm-3 col-form-label text-sm-right"></label>
									<div class="col-12 col-sm-8 col-lg-6">
										<input type="file" name="uploadFile" class="form-control"
											value="${assets.uploadFile}">
									</div>
								</div>

								<div class="form-group row text-right">
									<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">

										<input type="submit" class="btn btn-space btn-primary"
											value="수정">
											 <a href="javascript:history.go(-2);"
											class="btn btn-space btn-secondary">목록</a>
									</div>
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