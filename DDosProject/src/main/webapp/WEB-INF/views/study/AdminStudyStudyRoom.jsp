<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDos</title>

<style>
div.card {
	padding: 12px 20px 12px 20px;
}
</style>
</head>
<body>
	<%
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String today = formatter.format(new java.util.Date());
		request.setAttribute("today",today);
	%>
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
							<h3 class="mb-2">Study & Study Room</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Study
											& Study Room</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->

				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table id="AdmingetNoticeList" width="100%"
										class="table table-bordered table-hover text-center">
										<thead>
											<tr>
												<th>No.</th>
												<th>Name</th>
												<th>Study Date</th>
												<th>Recruit End Date</th>
												<th>Time</th>
												<th>Recruit Person</th>
												<th>Person Status</th>
												<th>Delete</th>
											</tr>
										</thead>
										<tbody id=adminStudyList>
											<c:forEach items="${adminStudyList}" var="adminStudyList">
												<c:if
													test="${fn:substring(adminStudyList.recruitEnd,0,10)<today}">
													<tr style="background: #C17070; color: white;">
														<td>${adminStudyList.studyNumber}</td>
														<td>${adminStudyList.studyName}</td>
														<td>${fn:substring(adminStudyList.studyDate,0,10)}</td>
														<td>${fn:substring(adminStudyList.recruitEnd,0,10)}</td>
														<td>${adminStudyList.studyTime}:00</td>
														<td>${adminStudyList.recruitPerson}</td>
														<td>${adminStudyList.personStatus}</td>
														<td><a href="deleteStudyList?studyNumber=${adminStudyList.studyNumber}">삭제</a></td>
													</tr>
												</c:if>
												<c:if
													test="${fn:substring(adminStudyList.recruitEnd,0,10)>=today}">
													<tr>
														<td>${adminStudyList.studyNumber}</td>
														<td>${adminStudyList.studyName}</td>
														<td>${fn:substring(adminStudyList.studyDate,0,10)}</td>
														<td>${fn:substring(adminStudyList.recruitEnd,0,10)}</td>
														<td>${adminStudyList.studyTime}:00</td>
														<td>${adminStudyList.recruitPerson}</td>
														<td>${adminStudyList.personStatus}</td>
														<td><a href="deleteStudyList?studyNumber=${adminStudyList.studyNumber}">삭제</a></td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
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