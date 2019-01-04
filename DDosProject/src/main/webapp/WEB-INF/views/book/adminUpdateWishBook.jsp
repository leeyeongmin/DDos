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
							<h3 class="mb-2">희망도서 수정</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Admin Wish
											Book Update</li>
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
					<div class="col-md-8">
						<div class="card"  style="width: 1000px;">
							<div class="card-header">
								<h4 class="mb-0">희망도서 수정</h4>
							</div>
							<div class="card-body">
								<form class="needs-validation" action ="adminUpdateWishBook" method="post">
									<div class="row">
										<div class="col-md-6 mb-3">
											<label for="isbn">ISBN</label>
											<input type="text" class="form-control" name="isbn" value="${wishbook.isbn}" readonly>
										</div>
										<div class="col-md-6 mb-3">
											<label for="wishTitle">도서명</label>
											<input type="text" class="form-control" name="wishTitle" value="${wishbook.wishTitle}">
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 mb-3">
											<label for="wishWriter">저자</label>
											<input type="text"  class="form-control" name="wishWriter" value="${wishbook.wishWriter}">
										</div>
										<div class="col-md-6 mb-3">
											<label for="wishComp">출판사</label>
											<input type="text" class="form-control" name="wishComp" value="${wishbook.wishComp}">
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 mb-3">
											<label for="wishPrice">가격</label>
											<input type="text" class="form-control" name="wishPrice" value="${wishbook.wishPrice}">
										</div>
										<div class="col-md-6 mb-3">
										<label for="wishStatus">상태</label> <select class="form-control" name="wishStatus"
												value="${wishbook.wishStatus}">
												
												<option value="${wishbook.wishStatus}">${wishbook.wishStatus}</option>
												<option value="취소">취소</option>
												<option value="처리완료">처리완료</option>
												<option value="주문중">주문중</option>
											</select>
									</div>
									</div>
									<div class="row">
									<div class="col-md-6 mb-3">
										<label for="wishGenre">장르</label> <select class="form-control" name="wishGenre"
												value="${wishbook.wishGenre}">
												<option value="${wishbook.wishGenre}">${wishbook.wishGenre}</option>
												<option value="총류">총류</option>
												<option value="철학 및 역사">철학 및 역사</option>
												<option value="과학">과학</option>
												<option value="예술">예술</option>
												<option value="언어 및 문학">언어 및 문학</option>
											</select>
									</div>
										<div class="col-md-6 mb-3">
											<label for="wishReason">사유</label>
											<textarea class="form-control" name="wishReason" value="${wishbook.wishReason}" readonly></textarea >
										</div>
									</div>
									<button type="submit" class="btn btn-primary">저장 </button>
									<a href="javascript:history.go(-2);" class="btn btn-secondary">목록</a>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

