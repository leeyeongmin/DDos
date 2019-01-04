<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDos</title>
<script type="text/javascript">
	function check() {
		if (document.search.searchKeyword.value == "") {
			alert("검색어를 입력하세요");
			document.search.searchKeyword.focus();
			return;
		}
		document.search.submit();
	}
</script>
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
										<li class="breadcrumb-item active" aria-current="page">Assets Manage List</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->
				<div class="row" style="margin-top: 5%;">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<form name="search" onsubmit="check()">
									<select class="form-control" name="searchType"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="memberId">회원ID
									</select> <input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										id="searchUserKeyword" type="text" name="searchKeyword"
										placeholder="Search">
									<button class="btn btn-primary"
										style="margin-left: 1%; width: 7%; height: 48px;">검색</button>
									<input type="hidden" name="page" />
								</form>
							</div>

								<div class="card">
									<div class="card-body">
										<table class="table table-hover" id="getAssetsList" width="100%">
											<thead>
												<tr>
												<th scope="col">문서번호</th>
												<th scope="col">적요</th>
													<th scope="col">구분</th>
													<th scope="col">날짜</th>
													<th scope="col">금액</th>
													<th scope="col">회원ID</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody id=getAssetsList>
												<c:forEach items="${getAssetsList}" var="assets">
													<tr>
													<td>${assets.assetsNum}</td>
													<td><a href="./getAssets?assetsNum=${assets.assetsNum}">${assets.assetsCont}</a>
													</td>
														<td>${assets.assetsSeparation}</td>
														<td>${assets.assetsDate}</td>
														<td>${assets.assetsPrice}</td>
														<td>${assets.memberId}</td>
														<td>${assets.contDetail}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<my:paging paging="${paging}" />
								<script>
								function go_page(page) {
									document.search.page.value = page;
									document.search.submit();
								}
							</script>
							
							
							</div>
							<input type="button" style="float: right"
								onclick="location.href='./assetsInsertform'" value="등록"
								class="btn btn-primary">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>