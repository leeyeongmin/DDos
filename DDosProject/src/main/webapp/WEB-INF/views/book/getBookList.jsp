<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	document.getElementById("booklist").click = clickfunc;
	function clickfunc(e) {
		var tdele = e.target.parentNode.children[x].innerHTML;
		var trele = e.target.parentNode;
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
						<div class="page-header">
							<h3 class="mb-2">소장 정보</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Book
											Catalog</a>
										</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader  -->
				<!-- ============================================================== -->

				<div class="row" >
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<!-- 검색 -->
							<div class="card-body">
								<form name="frm" onsubmit="check()">

									<select class="form-control" name="searchCondition"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="booktitle">도서명
										<option value="bookwriter">저자
										<option value="bookcomp">출판사
									</select> <input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										type="text" name="searchKeyword" placeholder="Search">
									<button class="btn btn-primary"
										style="margin-left: 1%; width: 7%; height: 48px;">Search</button>


								</form>
							</div>


							<div class="card">
								<div class="card-body">
									<table class="table" id="getBookList">

										<thead>
											<tr>
												<th>도서명</th>
												<th>저자</th>
												<th>출판사</th>
												<th>ISBN</th>
												<th>위치</th>
											</tr>
										</thead>
										<tbody id=booklist>
											<c:forEach items="${bookList}" var="book">
												<tr>
													<td><a href="./getBook?isbn=${book.isbn}">${book.bookTitle}</a></td>
													<td>${book.bookWriter}</td>
													<td>${book.bookComp}</td>
													<td>${book.isbn}</td>
													<td>${book.bookLoc}&nbsp;자료실</td>
												</tr>
											</c:forEach>
										</tbody>

									</table>


								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<my:paging paging="${paging}">
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item active"><a class="page-link "
												href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
										</my:paging>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>