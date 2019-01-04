<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 현황</title>
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<script type="text/javascript">
	function renewBook(isbn) {
		$.ajax({
			url : "renewBook",
			data : {
				loginId : "${login.id}",
				isbn : isbn,
			},
			type : "post",
			dataType : "json",
			success : function() {
				alert ("연장 완료되었습니다");
				location.href = "./rental"
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
							<h3 class="mb-2">대출현황</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="userHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Borrow</a>
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
				<div>
					<div class="section-block">
						<h5 class="section-title">대출현황</h5>
					</div>
					<div class="tab-regular">
						<ul class="nav nav-tabs " id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link" id="home-tab"
								data-toggle="tab" href="#home" role="tab" aria-controls="home"
								aria-selected="false">대출현황</a></li>

							<li class="nav-item"><a class="nav-link active show"
								id="profile-tab" data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected= "true">대출이력</a></li>
						</ul>
					
						<div class="tab-content" id="myTabContent" style="width: 100%;">
							<!--대출 현황-->
							<div class="tab-pane fade" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="card-body" style="width: 100%;">
									<h3>대출 현황</h3>
									<table class="table">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">ISBN</th>
												<th scope="col">도서명</th>
												<th scope="col">저자</th>
												<th scope="col">출판사</th>
												<th scope="col">대출일자</th>
												<th scope="col">반납예정일</th>
												<th scope="col">연장</th>
											</tr>
										</thead>
										<tbody id=getRentalList>
											<c:forEach items="${getRentalList}" var="rental">
												<tr>
													<td><input type="checkbox" name="rnum"
														value="${rental.rentalNum}"></td>
													<td>${rental.isbn}</td>
													<td>${rental.bookTitle}</td>
													<td>${rental.bookWriter}</td>
													<td>${rental.bookComp}</td>
													<td>${rental.rentalDate}</td>
													<td>${rental.dueDate}</td>
													<c:choose>
														<c:when test="${rental.renewCnt == '1'}">
															<td></td>
														</c:when>
														<c:otherwise>
															<td><input type="button" class="btn btn-brand"
															onclick="renewBook('${rental.isbn}');" value="연장"></td>
														</c:otherwise>					
													</c:choose>
													<%-- <td><input type="button" class="btn btn-brand"
														onclick="renewBook('${rental.isbn}', '${rental.dueDate}');" value="연장"></td> --%>
									<%-- 			<c:choose>
													<c:when test="${rental.renewCnt ne null}">
														<td><input type="hidden" class="btn btn-brand"
														onclick="renewBook('${rental.isbn}', '${rental.dueDate}');" value="연장"></td>
														</c:when>
														<c:when test="${rental.renewCnt eq null}">
														<td><input type="button" class="btn btn-brand"
														onclick="renewBook('${rental.isbn}', '${rental.dueDate}');" value="연장"></td>
														</c:when>
												</c:choose> --%>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>


							<div class="tab-pane fade active show" id="profile"
								role="tabpanel" aria-labelledby="profile-tab">
								<h3>대출 이력</h3>
								<div class="card-body">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">ISBN</th>
											<th scope="col">도서명</th>
											<th scope="col">저자</th>
											<th scope="col">출판사</th>
											<th scope="col">대출일자</th>
											<th scope="col">반납일자</th>
											<th scope="col">반납예정일</th>
										</tr>
									</thead>
									<tbody id=getHistoryList>
										<c:forEach items="${getHistoryList}" var="rental">
											<tr>
												<td>${rental.isbn}</td>
												<td>${rental.bookTitle}</td>
												<td>${rental.bookWriter}</td>
												<td>${rental.bookComp}</td>
												<td>${rental.rentalDate}</td>
												<td>${rental.returnDate}</td>
												<td>${rental.dueDate}</td>
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
