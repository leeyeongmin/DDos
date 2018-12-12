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
										글번호 : ${suggestion.sugNum}
										<br> 제목: ${suggestion.sugTitle}
										<br> 등록일: ${suggestion.sugDate}
										<br> 조회수: ${suggestion.sugCnt}
										<br> 내용: ${suggestion.sugCont}
										<br>
										<hr>
										<a href="getSuggestionList">목록</a>
										<a href="./updateSuggestionform?sugNum=${suggestion.sugNum}">수정</a>
										<a href="./deleteSuggestion?sugNum=${suggestion.sugNum}">삭제</a>
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



