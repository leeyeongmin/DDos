<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//document.getElementById("booklist").click = clickfunc;
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
										<li class="breadcrumb-item active" aria-current="page">Book
											Catalog</a>
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
				<c:if test="${empty sessionScope.login}">
					<a href="LoginForm">로그인</a>
				</c:if>
				<c:if test="${not empty sessionScope.login}">
		${sessionScope.login.id} 님
				</c:if>

				<!-- 도서 검색창 -->

				<a href="insertWishBook?memberId=${wishbook.memberId}"
					class="btn btn-outline-light float-right">신청하기</a>
				<div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
					<div class="card">
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table">
									<thead class="bg-light">
										<tr class="border-0">
											<td class="border-0">#</td>
											<th class="border-0">번호</th>
											<th class="border-0">ISBN</th>
											<th class="border-0">도서명</th>
											<th class="border-0">저자</th>
											<th class="border-0">출판사</th>
											<th class="border-0">상태</th>
											<th></th>
										</tr>
									</thead>

									<tbody id=wishBookList>
										<c:forEach items="${wishBookList}" var="wishbook">
											<tr>
												<td><input type="checkbox" name="numlist"
													value="${wishbook.wishNum}"></td>
												<td>${wishbook.wishNum}</td>
												<td>${wishbook.isbn}</td>
												<td>${wishbook.wishTitle}</td>
												<td>${wishbook.wishWriter}</td>
												<td>${wishbook.wishComp}</td>
												<td><span class="badge-dot badge-brand mr-1"></span>${wishbook.wishStatus}</td>
												<td>
													<button class="btn btn-sm btn-outline-light">
														<i class="far fa-trash-alt"></i>
													</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
