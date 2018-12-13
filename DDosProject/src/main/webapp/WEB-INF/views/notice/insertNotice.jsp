<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table id="insertNotice" width="100%"
										class="table table-bordered table-hover text-center">
										<form action="insertNotice" method="post">
											<tr>
												<td>작성자</td>
												<td><input type="hidden" name="memberId"
												value="${sessionScope.login.id}">${sessionScope.login.id}</td>
											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="noticeTitle" style="width: 100%"></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><textarea rows="20" cols="40" name="noticeCont" style="width: 100%"></textarea></td>
											</tr>
											<button class="btn btn-primary btn-sm"
												style="margin-bottom: 30px" onclick="check()">등록</button>
										</form>
									</table>
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