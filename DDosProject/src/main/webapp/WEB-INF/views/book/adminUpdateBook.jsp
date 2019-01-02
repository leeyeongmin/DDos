<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>도서 수정</title>

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
							<h3 class="mb-2">도서 수정</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Admin Book Update</a>
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
	
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="section-block" id="basicform">
			
			</div>
			<div class="card-body" width="100%" >
				<form action ="adminUpdateBook" method="post">
					<div class="form-group">
						<label for="inputText3" class="col-form-label">도서명</label> 
						<input	name="bookTitle" type="text" class="form-control" value="${book.bookTitle}">
					</div>
					<div class="form-group">
						<label for="inputText3" class="col-form-label">저자</label>
						 <input	name="bookWriter" type="text" class="form-control" value="${book.bookWriter}">
					</div>

					<div class="form-group">
						<label for="inputText3" class="col-form-label">출판사</label>
						 <input name="bookComp" type="text" class="form-control"  value="${book.bookComp}">
					</div>
					<div class="form-group">
						<label for="inputText4" class="col-form-label">수량</label>
						 <input name="bookAmount" type="number" class="form-control"  value="${book.bookAmount}">
					</div>


					<div class="form-group">
						<label for="inputText3" class="col-form-label">ISBN</label> 
						<input name="isbn" type="text" class="form-control"  value="${book.isbn}" readonly>
					</div>


					<div class="form-group">
						<label for="input-select">위치</label> 
						<select class="form-control" name="bookLoc" >
							<option value="${book.bookLoc}">${book.bookLoc}</option>
							<option value="총류">총류</option>
							<option value="철학 및 역사">철학 및 역사</option>
							<option value="과학">과학</option>
							<option value="예술">예술</option>
							<option value="언어 및 문학">언어 및 문학</option>
						</select>
					</div>

					<div class="form-group">
						<label for="input-select">장르</label> <select class="form-control"
							name="bookGenre" >
							<option value="${book.bookGenre}">${book.bookGenre}</option>
							<option value="총류">총류</option>
							<option value="철학 및 역사">철학 및 역사</option>
							<option value="과학">과학</option>
							<option value="예술">예술</option>
							<option value="언어 및 문학">언어 및 문학</option>
						</select>
					</div>


					<div class="form-group">
						<label for="exampleFormControlTextarea1">도서 내용</label>
						<textarea class="form-control" name="bookCont" rows="3" value="${book.bookCont}">${book.bookCont}</textarea>
					</div>
					<div class="form-group row text-right">
						<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
							<button type="submit" class="btn btn-space btn-primary">저장</button>
							<button class="btn btn-space btn-secondary">취소</button>
						</div>
					</div>
					</form>
			</div>
			
		</div>
	</div>
	</div>
	</div>
	</div>
	
</body>
</html>

