<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script>
	document.getElementById('startDate').valueAsDate = new Date();
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
							<h3 class="mb-2">Insert Event</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item"><a href="getEventList"
											class="breadcrumb-link">Event</a></li>
										<li class="breadcrumb-item active" aria-current="page">Insert
											Event</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->
				<div class="row" style="margin-top: 2%;">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<form action="insertEvent" method="post" encType="multipart/form-data">
										<table id="insertEvent" width="100%"
											class="table table-bordered table-hover text-center">
											<tr>
												<td>작성자</td>
												<td><input type="hidden" name="memberId"
													value="${sessionScope.login.id}">${sessionScope.login.id}</td>
											</tr>
											<tr>
												<td>첨부파일</td>
												<td>
													<input type="file" name="fileName" style="width:100%;"><br/>
												</td>
											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="eventTitle"
													style="width: 100%" required></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><textarea rows="20" cols="40" name="eventCont"
														style="width: 100%" required></textarea></td>
											</tr>
											<tr>
												<td>시작일</td>
												<td><input type="date" id="startDate" name="startDate"
													value="${sysdate}" min="${sysdate}" style="width:100%;" required></td>
											</tr>
											<tr>
												<td>종료일</td>
												<td><input type="date" id="endDate" name="endDate" style="width:100%;" required></td>
											<tr>
												<td colspan="2"><input type="submit"
													class="btn btn-primary btn-sm"
													style="width: 20%; height: 48px; font-weight: bold;"
													value="등    록"></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>