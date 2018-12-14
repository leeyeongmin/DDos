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
									<table id="insertSuggestion" width="100%"
										class="table table-bordered table-hover text-center">
										<form action="updateNotice" method="post">
											<tr>
												<td>글번호</td>
												<td><input type="hidden" name="noticeNum"
													value="${notice.noticeNum}">${notice.noticeNum}</td>
											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="noticeTitle"
													value="${notice.noticeTitle}" style="width: 100%" required></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><textarea rows="20" cols="20" name="noticeCont" style="width: 100%" required>${notice.noticeCont}</textarea></td>
											</tr>
											<input type="submit" class="btn btn-primary btn-sm"
													style="margin-bottom: 30px" value="수정완료">
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