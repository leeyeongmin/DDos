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
				
				<c:if test="${not empty sessionScope.login}">
		${sessionScope.login.id} 님
				</c:if>

				<!-- 도서 검색창 -->
				<!-- 관리자 페이지로 넣어야될꺼 같은데...음 -->


				<form name="frm" onsubmit="check()">
					<select name="searchCondition">
						<option value="wishTitle">도서명
						<option value="wishWriter">저자
						<option value="isbn">ISBN
						<option value="memberId">회원ID
					</select> <input type="text" name="searchKeyword">
					<button>검색</button>
				<input type="hidden" name="page" />
				</form>

				<input type="button" style="float: right" onclick="location.href='./adminInsertWishBookform'" value="신청하기"
					class="btn btn-primary"> 
				

				<div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12" >
						<div class="card" style="width: 100%;">
							<div class="card-body p-0">
								<div class="table-responsive">
									<table class="table">
										<thead class="bg-light">
											<tr class="border-0">
												<td class="border-0">#</td>
												<th class="border-0">회원ID &nbsp;</th>
												<th class="border-0">ISBN</th>
												<th class="border-0">도서명</th>
												<th class="border-0">저자</th>
												<th class="border-0">출판사</th>
												<th class="border-0">상태</th>
												<th></th>
											</tr>
										</thead>

										<tbody id=adminWishBookList>
											<c:forEach items="${adminWishBookList}" var="wishbook">
												<tr>
												<td><input type="checkbox" name="numlist"
														value="${wishbook.wishNum}"></td>
													<td>${wishbook.memberId}</td>
													<td>${wishbook.isbn}</td>
													<td><a href="./adminWishBookDetail?isbn=${wishbook.isbn}">${wishbook.wishTitle}</a></td>
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
		</div>
	</div>
</body>
</html>
