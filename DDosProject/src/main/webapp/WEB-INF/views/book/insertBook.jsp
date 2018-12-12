<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>
	<div class="card">
		<h5 class="card-header">도서 등록</h5>
		<div class="card-body">
			<form id="validationform" data-parsley-validate="" novalidate="">
				<form action="insertBook" method="post">
					<div class="form-group row">
						<label class="col-12 col-sm-3 col-form-label text-sm-right">isbn</label>
						<div class="col-12 col-sm-8 col-lg-6">
							<input data-parsley-type="number" type="text"
								class="form-control" name="isbn">
						</div>

						<div class="form-group row">
							<label class="col-12 col-sm-3 col-form-label text-sm-right">저자</label>
							<div class="col-12 col-sm-8 col-lg-6">
								<input data-parsley-type="alphanum" type="text"
									class="form-control" name="bookTitle">
							</div>
								<label class="col-12 col-sm-3 col-form-label text-sm-right">출판사</label>
								<div class="col-12 col-sm-8 col-lg-6">
									<input data-parsley-type="text" type="text"
										class="form-control" name="bookWriter">
								</div>
								<label class="col-12 col-sm-3 col-form-label text-sm-right">위치</label>
								<div class="col-12 col-sm-8 col-lg-6">
									<input data-parsley-type="text" type="text"
										class="form-control" name="bookWriter">
								</div>

							</div>




							<input type="text" name="bookTitle"><br> 저자<input
								type="text" name="bookWriter"><br> 출판사<input
								type="text" name="bookComp"><br> 장르<select
								name="bookGenre">
								<option value="총류">총류</option>
								<option value="철학 및 역사">철학 및 역사</option>
								<option value="과학">과학</option>
								<option value="예술">예술</option>
								<option value="언어 및 문학">언어 및 문학</option>
							</select><br> 수량<input type="text" name="bookAmount"><br>
							위치<input type="text" name="bookLoc"><br> 도서 내용
							<textarea rows="2" cols="30" name="content"></textarea>
							<br>
							<button>저장</button>
				</form>
</body>
</html>