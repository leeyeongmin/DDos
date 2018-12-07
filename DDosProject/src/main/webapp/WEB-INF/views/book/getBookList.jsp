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
<!-- 도서 검색 창 -->
	<form name="frm">
		<select name="searchCondition">
			<option value="booktitle">도서명
			<option value="bookwriter">저자
			<option value="bookcomp">출판사
		</select> <input type="text" name="searchKeyword">
		<button>검색</button>
	</form>
	<button>
		<a href="${pageContext.request.contextPath}/insertBook">등록</a>
	</button>

	<br>
	<div class="row">
		<table id="getBookList" width="100%"
			class="table table-bordered table-hover text-center">
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
						<td>${book.bookTitle}</td>
						<td>${book.bookWriter}</td>
						<td>${book.bookComp}</td>
						<td>${book.isbn}></td>
						<td>${book.bookLoc}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
</body>
</html>
