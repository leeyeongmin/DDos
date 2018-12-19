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
						<div class="page-header">
							<h3 class="mb-2">Edit Notice</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item"><a href="getNoticeList"
											class="breadcrumb-link">Notice</a></li>
										<li class="breadcrumb-item active" aria-current="page">Edit Notice</li>
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
											<tr>
												<td>
													<input type="submit" class="btn btn-primary btn-sm"
													style="width:20%; height:48px; font-weight:bold; " value="수정완료">
												</td>
											</tr>
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