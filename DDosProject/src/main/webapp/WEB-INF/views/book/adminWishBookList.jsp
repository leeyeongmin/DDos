<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	document.getElementById("wishbook").click = clickfunc;
	function clickfunc(e) {
		var tdele = e.target.parentNode.children[x].innerHTML;
		var trele = e.target.parentNode;
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
							<h3 class="mb-2">희망도서</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Admin
											Wish Book List</a>
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
						<div class="card">
							<!-- 검색 -->
							<div class="card-body">
								<form name="frm" onsubmit="check()">

									<select class="form-control" name="searchCondition"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="wishTitle">도서명</option>
										<option value="wishWriter">저자</option>
										<option value="isbn">ISBN</option>
										<option value="memberId">회원ID</option>
									</select> <input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										type="text" name="searchKeyword" placeholder="Search">
									<button class="btn btn-primary"
										style="margin-left: 1%; width: 7%; height: 48px;">Search</button>
									<input type="hidden" name="page">

								</form>
							</div>


							<div class="card">
								<div class="card-body">
									<table class="table" id="adminWishBookList">

										<thead>
											<tr>
												<th class="border-0">회원ID &nbsp;</th>
												<th class="border-0">ISBN</th>
												<th class="border-0">도서명</th>
												<th class="border-0">저자</th>
												<th class="border-0">출판사</th>
												<th class="border-0">상태</th>
											</tr>
										</thead>
										<tbody id="adminWishBookList">
											<c:forEach items="${adminWishBookList}" var="wishbook">
												<tr>
													<%-- <td><input type="checkbox" name="numlist"
														value="${wishbook.wishNum}"></td> --%>
													<td>${wishbook.memberId}</td>
													<td>${wishbook.isbn}</td>
													<td><a
														href="./adminWishBookDetail?isbn=${wishbook.isbn}">${wishbook.wishTitle}</a></td>
													<td>${wishbook.wishWriter}</td>
													<td>${wishbook.wishComp}</td>
													<td><span class="badge-dot badge-brand mr-1"></span>${wishbook.wishStatus}</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>


						</div>
					</div>
				
					<my:paging paging="${paging}" />
					<script>
						function go_page(page) {
							document.frm.page.value = page;
							document.frm.submit();
						}
					</script>
				</div>
				<input type="button" style="float: right"
						onclick="location.href='./adminInsertWishBookform'" value="신청하기"
						class="btn btn-primary">
			</div>
		</div>
</body>
</html>
