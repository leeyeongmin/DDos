<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> 도서명</h3>
<div>
<img class="imgifluid"  width="100" src="http://menu.mt.co.kr/ize/thumb/2016/06/06/2016060523587270403_1.jpg" alt="나미야잡화점"
			 border=1 align=lef/>
<ul>
				<li>저자</li>
				<li>출판사</li>
				<li>장르</li>
				<li>수량</li>
				<li>내용</li>
			</ul>
</div>

<table class="table" style="width:50%; margin-left:20%">
  <thead class="thead-light">
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
      <td>${book.bookAmount}</td>
      <td>${book.bookAmount}</td>
    </tr>
  </tbody>
</table>
</body>
</html>