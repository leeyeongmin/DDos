<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getNoticeList.jsp</title>
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
							<h3 class="mb-2">Notice</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Notice</a></li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->
				<c:if test="${empty sessionScope.login}">
					<a href="LoginForm">로그인</a>
				</c:if>
				<c:if test="${not empty sessionScope.login}">
		${sessionScope.login.id} 님<a href="Logout">로그아웃</a>
				</c:if>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<form action="search" name="search" method="post">
								<select name="searchType">
									<option value="noticeTitle"
										<c:if test="${'noticeTitle' == searchType}"> selected </c:if>>제목</option>
								</select> <input type="text" name="searchKeyword"
									value="${searchKeyword}"> <input type="button"
									value="검색" class="btn btn-primary btn-sm" onclick="click()">
							</form>
							<div class="card-body">
								<div class="table-responsive">
									<table id="AdmingetNoticeList" width="100%"
										class="table table-bordered table-hover text-center">
										<thead>
											<tr>
												<th width="10%">번호</th>
												<th>제목</th>
												<th width="30%">작성일</th>
												<th width="10%">조회수</th>
											</tr>
										</thead>
										<tbody id=noticelist>
											<c:forEach items="${noticeList}" var="notice">
												<tr>
													<td>${notice.noticeNum}</td>
													<td><a
														href="./getNotice?noticeNum=${notice.noticeNum}">${notice.noticeTitle}</a></td>
													<td>${notice.noticeDate}</td>
													<td>${notice.noticeCnt}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
										<a href="insertNoticeform" class="btn btn-secondary" style="margin-top: 30px">등록</a>
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