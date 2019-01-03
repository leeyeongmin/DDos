<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getEventList.jsp</title>
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
							<h3 class="mb-2">Event</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Event</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->
				<div class="row" style="margin-top:5%;">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
							<form name="frm">
							<input type="hidden" name="page" />
							</form>
								<div class="table-responsive">
									<table id="getEventList" width="100%"
										class="table table-bordered table-hover text-center">
										<thead>
											<tr>
												<th width="10%">번호</th>
												<th>제목</th>
												<th width="20%">시작일</th>
												<th width="20%">종료일</th>
											</tr>
										</thead>
										<tbody id=eventlist>
											<c:forEach items="${eventList}" var="event">
												<c:set var="grant" value="${event.memberId}"></c:set>
												<input type="hidden" value="${event.memberId}">
												<tr>
													<td>${event.eventNum}</td>
													<td><a
														href="./getEvent?eventNum=${event.eventNum}">${event.eventTitle}</a></td>
													<td>${event.startDate}</td>
													<td>${event.endDate }
												</tr>
											</c:forEach>
										</tbody>
									</table>
										<a href="insertEventform" class="btn btn-secondary"
										style="width:20%; height:48px; margin-left:38%; margin-top:5%; font-weight:bold; padding-top:1%;">등&emsp;&emsp;&emsp;&emsp;록</a>
								</div>
								<my:paging paging="${paging}" />
							<script>
								function go_page(page) {
									document.frm.page.value = page;
									document.frm.submit();
								}
							</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>