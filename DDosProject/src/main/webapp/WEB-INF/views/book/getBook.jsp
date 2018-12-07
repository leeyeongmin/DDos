<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	<h3>도서명${book.bookTitle}</h3>
	<div>
		<img class="imgifluid" width="100"
			src="http://menu.mt.co.kr/ize/thumb/2016/06/06/2016060523587270403_1.jpg"
			alt="나미야잡화점" border=1 align=lef style="width: 20%; margin-left: 20%" />
		<ul style="list-style-type: none">
			<li>저자 &nbsp ${book.bookWriter}</li>
			<li>출판사&nbsp ${book.bookComp}</li>
			<li>ISBN&nbsp ${book.isbn}</li>
			<li>장르 &nbsp ${book.bookGenre}</li>
			<li>수량 &nbsp ${book.bookAmount}</li>
			<li>내용 &nbsp ${book.bookCont}</li>
		</ul>
	</div>

	<div class="container" style="width: 50%; margin-left: 20%">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">소장처/자료실</th>
						<th scope="col">도서상태</th>
						<th scope="col">반납예정일</th>
						<th scope="col">대출</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>${book.bookGenre}</td>
						<td>${book.bookAmount}</td>
						<td>${rental.returnDate}</td>
						<td><button type="submit" name="borrow">대출</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>