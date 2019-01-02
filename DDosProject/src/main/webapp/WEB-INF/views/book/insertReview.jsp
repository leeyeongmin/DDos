<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$('.starRev span').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		return false;
	});
</script>
<style>
.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
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
							<h3 class="mb-2">리뷰 등록</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Review
											Insert</a>
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
						<div class="section-block" id="basicform"></div>
						<div class="card">
							<form action="insertReview" method="post" style="margin: 25px">
								<div class="form-group">
									<label for="inputText3" class="col-form-label">ISBN</label> <input
										name="isbn" type="hidden" value="${review}" readonly>${review}</div>
								<div class="form-group">
									<label for="inputText3" class="col-form-label">아이디</label><input
										name="memberId" type="hidden" value="${sessionScope.login.id}">${sessionScope.login.id}
								</div>
								<div class="form-group">
									<label for="inputText3" class="col-form-label">리뷰 제목</label> <input
										name="reviewTitle" type="text" class="form-control">
								</div>
								<div class="form-group">
									<label for="exampleFormControlTextarea1">리뷰 내용</label>
									<textarea class="form-control" name="reviewCont" rows="3"></textarea>
								</div>
								<div class="starRev">
									<span class="starR on">별1</span> <span class="starR">별2</span>
									<span class="starR">별3</span> <span class="starR">별4</span> <span
										class="starR">별5</span> <span class="starR">별6</span> <span
										class="starR">별7</span> <span class="starR">별8</span> <span
										class="starR">별9</span> <span class="starR">별10</span>
								</div>
								<div class="col-sm-6 pl-0">
									<p class="text-right">
										<button type="submit" class="btn btn-space btn-primary">저장</button>
										<button class="btn btn-space btn-secondary">취소</button>
									</p>
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