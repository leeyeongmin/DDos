<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
							<h3 class="mb-2">Insert Notice</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">Notice</li>
										<li class="breadcrumb-item active" aria-current="page">Show Notice</li>
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
									<table id="UsergetNotice" width="100%"
										class="table table-bordered table-hover text-center">
										<tr>
											<td width="20%">글번호</td>
											<td>${notice.noticeNum}</td>
										</tr>
										<tr>
											<td width="10%">등록일</td>
											<td>${notice.noticeDate}</td>
										</tr>
										<tr>
											<td width="10%">조회수</td>
											<td>${notice.noticeCnt}</td>
										</tr>
										<tr>
											<td width="10%">제목</td>
											<td>${notice.noticeTitle}</td>
										</tr>
										<tr>
											<td width="10%">내용</td>
											<td>${notice.noticeCont}</td>
										</tr>
									</table>
								</div>
								<a href="UsergetNoticeList" class="btn btn-primary btn-sm" style="width:8%; margin-left:2%; margin-top: 30px">목록</a>
							</div>
							<!-- end card-body -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



