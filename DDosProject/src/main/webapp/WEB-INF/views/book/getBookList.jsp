<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	document.getElementByID("booklist").click = clickfunc;
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
										<li class="breadcrumb-item"><a href="#"
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
				<c:if test="${empty sessionScope.login}">
					<a href="LoginForm">로그인</a>
				</c:if>
				<c:if test="${not empty sessionScope.login}">
		${sessionScope.login.id} 님<a href="Logout">로그아웃</a>
				</c:if>
				<!-- 도서 검색 창 -->
				<span style="float: right">
					<input type="button" onclick="location.href='./insertBookform'" value="등록" class="btn btn-secondary">
				</span>
				<form name="frm">
				
					<select name="searchCondition">
						<option value="booktitle">도서명
						<option value="bookwriter">저자
						<option value="bookcomp">출판사
					</select> <input type="text" name="searchKeyword">
					<button>검색</button>
					
					
				</form>
				


				<div class="card">
					<h5 class="card-header">소장 자료</h5>
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

				
			</div>
		</div>
		</div>
		
</body>


</html>
