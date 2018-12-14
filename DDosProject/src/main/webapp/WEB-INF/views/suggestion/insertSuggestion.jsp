<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
<script type="text/javascript">
	function check() {
		if (document.post.title.value == "" || document.post.title.value == null) {
			alert("제목을 입력하세요");
			document.post.title.focus();
			return;
		} else {
			document.post.submit();	
		}
	}
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
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table id="insertSuggestion" width="100%"
										class="table table-bordered table-hover text-center">
										<form action="insertSuggestion" method="post">
											<tr>
												<td width="20%">작성자</td>
												<td><input type="hidden" name="memberId"
													value="${sessionScope.login.id}">${sessionScope.login.id}</td>
											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="sugTitle" style="width:100%" required></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><textarea rows="20" name="sugCont" style="width:100%" required></textarea></td>
											</tr>
											<input type="submit" class="btn btn-primary btn-sm"
													style="margin-bottom: 30px" value="등록">
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