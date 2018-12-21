<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function check(){
		if (document.getElementById("searchKeyword").value == "") {
			alert("검색어를 입력하세요.");
			document.searchKeyword.searchUserKeyword.focus();
			return;
		}
		document.Search.submit();
	}
</script>

</head>
<body>
<div class="dashboard-main-wrapper">

		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="influence-finder">
			<div class="container-fluid dashboard-content">
				<!-- ============================================================== -->
				<!-- pageheader -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">Return</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">Book</li>
										<li class="breadcrumb-item active" aria-current="page">Return</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->
				<!-- ============================================================== -->
				
				<!-- ============================================================== -->
				<!-- content -->
				<!-- ============================================================== -->
				<div class="row">
					<!-- ============================================================== -->
					<!-- search bar  -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<form name="Search" onsubmit="check()" action="rentalSearch">
									<select class="form-control" name="searchTitle"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="book_title">책제목
										<option value="member_id">Id
										<option value="isbn">ISBN
									</select> 
									<input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										id="searchKeyword" type="text" name="searchKeyword"
										placeholder="Search">
									<button class="btn btn-primary search-btn" type="submit">Search</button>
								</form>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end search bar  -->
					<!-- ============================================================== -->
			 
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<!-- 검색 -->
							<div class="card-body">
								<div class="table-responsive">
									<table id="getNoticeList" width="100%"
										class="table table-bordered table-hover text-center">
										<tr>
											<td><input type="checkbox" onclick="all_check()"></td>
											<td>책제목</td>
											<td>ISBN</td>
											<td>대여일자</td>
											<td>반납일자</td>
											<td>대출자</td>
										</tr>
										<tbody id = "searchData">
										
										</tbody>
									</table>
								</div>							
							</div>
						</div>
					</div>	
					<!-- ============================================================== -->
					<!-- end content -->
					<!-- ============================================================== -->
				</div>
			</div>

		</div>
		<!-- ============================================================== -->
		<!-- end wrapper  -->
		<!-- ============================================================== -->
	</div>

</body>
</html>