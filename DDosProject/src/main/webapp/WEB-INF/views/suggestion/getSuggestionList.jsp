<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getSuggestionList.jsp</title>
<script>
	function check() {
		if (document.search.searchKeyword.value == "") {
			alert("검색어를 입력하세요");
			document.search.searchKeyword.focus();
			return;
		}
		document.search.submit();
	}
</script>
<style>
div.card {
	padding: 12px 20px 12px 20px;
}
</style>
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
							<h3 class="mb-2">Suggestion</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Suggestion</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->

				<div class="row" style="margin-top: 5%;">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">

							<div class="card-body">
								<form action="search" name="search" method="post"
									onsubmit="check()">
									<select class="form-control" name="searchType"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="sugTitle"
											<c:if test="${'sugTitle' == searchType}"> selected </c:if>>제목</option>
									</select> <input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										type="text" name="searchKeyword" value="${searchKeyword}"
										placeholder="Search"> <input class="btn btn-primary"
										style="margin-left: 1%; width: 7%; height: 47px;"
										type="button" value="검색" onclick="click()">
										<input type="hidden" name="page" />
								</form>
							</div>

							<div class="card-body">
								<div class="table-responsive">
									<table id="getSuggestionList" width="100%"
										class="table table-bordered table-hover text-center">
										<thead>
											<tr>
												<th width="10%">번호</th>
												<th>제목</th>
												<th width="30%">작성일</th>
												<th width="10%">조회수</th>
											</tr>
										</thead>
										<tbody id="suggestionList">
											<c:forEach items="${suggestionList}" var="suggestion">
												<tr>
													<td>${suggestion.sugNum}</td>
													<td><a
														href="./getSuggestion?sugNum=${suggestion.sugNum}">${suggestion.sugTitle}</a></td>
													<td>${suggestion.sugDate}</td>
													<td>${suggestion.sugCnt}</td>
												</tr>
											</c:forEach>
									</table>
									
								</div>
							</div>
							<my:paging paging="${paging}" />
							<script>
								function go_page(page) {
									document.frm.page.value = page;
									document.frm.submit();
								}
							</script>
							<a href="./insertSuggestionform" class="btn btn-secondary"
										style="width:20%; height:48px; margin-left:38%; margin-top:5%; font-weight:bold; padding-top:1%;">등&emsp;&emsp;&emsp;&emsp;록</a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>