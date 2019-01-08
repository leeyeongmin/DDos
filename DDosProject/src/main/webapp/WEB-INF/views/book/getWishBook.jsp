<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
										<li class="breadcrumb-item active" aria-current="page">Wish
											Book details</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->
				

					<div class="row" style="margin-top:2%;">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
							<div class="table-responsive">
							<table id="getWishBook"  class="table table-bordered table-hover text-center">
										<tr>
											<td width="20%">ISBN</td>
											<td>${wishbook.isbn}</td>
										</tr>
										<tr>
											<td width="10%">도서명</td>
											<td>${wishbook.wishTitle}</td>
										</tr>
										<tr>
											<td width="10%">저자</td>
											<td>${wishbook.wishWriter}</td>
										</tr>
										<tr>
											<td width="10%">사유</td>
											<td>${wishbook.wishReason}</td>
										</tr>
										
									</table>
									<script>
											var text = $('#wishReason').html().replace(/(\n|\r\n)/g, '<br>');
											$('#wishReason').html(text);
									</script>
							
							</div>
													<c:if test="${login.id == wishbook.memberId}">
								<a href="./wishbook" class="btn btn-secondary"  style="width:8%; margin-left:2%; margin-top: 30px">취소</a>
							</c:if>			
					
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

</body>
</html>

