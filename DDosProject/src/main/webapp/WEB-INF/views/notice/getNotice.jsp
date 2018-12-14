<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<table id="getNotice" width="100%"
										class="table table-bordered table-hover text-center">
										<tr>
											<td width="20%">글번호</td>
											<td>${notice.noticeNum}</td>
										</tr>
										<tr>
											<td width="10%">등록일</td>
											<td>${notice.noticeDate}</td>
										</tr>
										<tr>
											<td width="10%">조회수</td>
											<td>${notice.noticeCnt}</td>
										</tr>
										<tr>
											<td width="10%">제목</td>
											<td>${notice.noticeTitle}</td>
										</tr>
										<tr>
											<td width="10%">내용</td>
											<td>${notice.noticeCont}</td>
										</tr>
									</table>
								</div>
								<c:if test="${login.id == suggestion.memberId}"> 
								<a href="getNoticeList" class="btn btn-primary btn-sm" style="margin-top: 30px">목록</a> 
								<a href="./updateNoticeform?noticeNum=${notice.noticeNum}" class="btn btn-primary btn-sm" style="margin-top: 30px">수정</a>
								<a href="./deleteNotice?noticeNum=${notice.noticeNum}" class="btn btn-primary btn-sm" style="margin-top: 30px">삭제</a>
								</c:if>
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



