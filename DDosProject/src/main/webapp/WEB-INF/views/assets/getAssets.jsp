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
											Detail</li>
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
							<div class="form-group row">
								<label class="col-12 col-sm-3 col-form-label text-sm-right">문서번호</label>
								<div class="col-12 col-sm-8 col-lg-6" id="assetsNum"
									name="assetsNum">${assets.assetsNum}</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-sm-3 col-form-label text-sm-right">적요</label>
								<div class="col-12 col-sm-8 col-lg-6" id="assetsCont"
									name="assetsCont">${assets.assetsCont}</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-sm-3 col-form-label text-sm-right">구분</label>
								<div class="col-12 col-sm-8 col-lg-6" id="assetsSeparation"
									name="assetsSeparation">${assets.assetsSeparation}</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-sm-3 col-form-label text-sm-right">날짜</label>
								<div class="col-12 col-sm-8 col-lg-6" id="assetsDate"
									name="assetsDate">${assets.assetsDate}</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-sm-3 col-form-label text-sm-right">금액</label>
								<div class="col-12 col-sm-8 col-lg-6" id="assetsPrice"
									name="assetsPrice">${assets.assetsPrice}</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-sm-3 col-form-label text-sm-right">회원ID</label>
								<div class="col-12 col-sm-8 col-lg-6" id="memberId"
									name="memberId">${assets.memberId}</div>
							</div>
							<div class="form-group row">
								<label class="col-12 col-sm-3 col-form-label text-sm-right">비고</label>
								<div class="col-12 col-sm-8 col-lg-6" id="contDetail"
									name="contDetail">${assets.contDetail}</div>
							</div>

							<div class="form-group row">
							<label class="col-12 col-sm-3 col-form-label text-sm-right" id="uploadFileName"
									name="uploadFileName">파일</label>
							<c:if test="${not empty assets.uploadFileName}">
	<a href="FileDown?atchFileId=${assets.uploadFileName}" i class="far fa-file" >${assets.uploadFileName}</a>
	
	
	</c:if>
</div>
							<div class="form-group row text-right">
								<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
									<a href="./assetsUpdateform?assetsNum=${assets.assetsNum}"
										class="btn btn-space btn-primary">수정</a> <a
										href="javascript:history.back();"
										class="btn btn-space btn-secondary">목록</a>
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