<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
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
										<form action="updateSuggestion" method="post">
											<tr>
												<td>글번호</td>
												<td><input type="hidden" name="sugNum"
												value="${suggestion.sugNum}">${suggestion.sugNum}</td>
											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="sugTitle"
												value="${suggestion.sugTitle}" style="width:100%"></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><textarea rows="20" cols="20" name="sugCont" style="width: 100%">${suggestion.sugCont}</textarea></td>
											</tr>
											<button class="btn btn-primary btn-sm"
												style="margin-bottom: 30px">수정 완료</button>
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