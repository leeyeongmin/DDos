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
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">Event</li>
										<li class="breadcrumb-item active" aria-current="page">Show Event</li>
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
									<table id="getEvent" width="100%"
										class="table table-bordered table-hover text-center">
										<tr>
											<td width="20%">글번호</td>
											<td>${event.eventNum}</td>
										</tr>
										<tr>
											<td width="10%">등록일</td>
											<td>${event.writeDate}</td>
										</tr>
										<tr>
											<td width="10%">시작일</td>
											<td>${event.startDate}</td>
											<td width="10%">종료일</td>
											<td>${event.endDate}</td>
										</tr>
										<tr>
											<td width="10%">제목</td>
											<td>${event.eventTitle}</td>
										</tr>
										<tr>
											<td width="10%">내용</td>
											<td>${event.eventCont}</td>
										</tr>
									</table>
								</div>
								<a href="getEventList" class="btn btn-primary btn-sm" style="width:8%; margin-left:2%; margin-top: 30px">목록</a>
								<c:if test="${login.id == 'admin@gmail.com'}">  
								<a href="./updateEventform?eventNum=${event.eventNum}" class="btn btn-primary btn-sm" style="width:8%; margin-left:2%; margin-top: 30px">수정</a>
								<a href="./deleteEvent?eventNum=${event.eventNum}" class="btn btn-primary btn-sm" style="width:8%; margin-left:2%; margin-top: 30px">삭제</a>
								</c:if>
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



