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
									<table id="getNotice" width="100%"
										class="table table-bordered table-hover text-center">
										<tr>
											<td width="20%">글번호</td>
											<td>${suggestion.sugNum}</td>
										</tr>
										<tr>
											<td width="20%">제목</td>
											<td>${suggestion.sugTitle}</td>
										</tr>
										<tr>
											<td>등록일</td>
											<td>${suggestion.sugDate}</td>
										</tr>
										<tr>
											<td>조회수</td>
											<td>${suggestion.sugCnt}</td>
										</tr>
										<tr>
											<td>내용</td>
											<td>${suggestion.sugCont}</td>
										</tr>
									</table>
								</div>
								<a href="getSuggestionList" class="btn btn-primary btn-sm"
									style="margin-top: 30px">목록</a> <a
									href="./updateSuggestionform?sugNum=${suggestion.sugNum}"
									class="btn btn-primary btn-sm" style="margin-top: 30px">수정</a>
								<a href="./deleteSuggestion?sugNum=${suggestion.sugNum}"
									class="btn btn-primary btn-sm" style="margin-top: 30px">삭제</a>
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



