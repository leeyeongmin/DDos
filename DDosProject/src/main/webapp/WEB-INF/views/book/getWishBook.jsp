<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//document.getElementById("booklist").click = clickfunc;
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
							<h3 class="mb-2">희망도서</h3>
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
				<c:if test="${not empty sessionScope.login}">
		${sessionScope.login.id} 님
				</c:if>

				<div class="row">
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="mb-0">희망도서 상세보기</h4>
                                        </div>
                                        <div class="card-body">
                                            <form class="needs-validation">
                                                <div class="row">
                                                    <%--           <div class="col-md-6 mb-3">
                                              <label for="memberId">회원 ID </label>
                                                        <input type="text" class="form-control" id="memberId" value="${sessionScope.login.id}" >                                                        <div class="invalid-feedback">
                                                        
                                                        </div> --%>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label for="isbn">ISBN</label>
                                                        <input type="text" class="form-control" id="isbn" value="${wishbook.isbn}">
                                                        <div class="invalid-feedback">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label for="wishTitle">도서명</label>
                                                        <input type="text" class="form-control" id="wishTitle" value="${wishbook.wishTitle}" >
                                                        <div class="invalid-feedback">
                                                         
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label for="wishWriter">저자</label>
                                                        <input type="text" class="form-control" id="wishWriter" value="${wishbook.wishWriter}">
                                                        <div class="invalid-feedback">
                                                           
                                                        </div>
                                                    </div>
													 <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label for="wishComp">출판사</label>
                                                        <input type="text" class="form-control" id="wishComp" value="${wishbook.wishComp}" >
                                                        <div class="invalid-feedback">
                                                           
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label for="wishPrice">가격</label>
                                                        <input type="text" class="form-control" id="wishPrice" value="${wishbook.wishPrice}" >
                                                        <div class="invalid-feedback">
                                                          
                                                        </div>
                                                    </div>
													 <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label for="wishGenre">장르</label>
                                                        <input type="text" class="form-control" id="wishGenre" placeholder="" value="${wishbook.wishGenre}"  required="">
                                                        <div class="invalid-feedback">
                                                          
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label for="wishReason">사유</label>
                                                        <input type="text" class="form-control" id="wishReason" placeholder="" value="${wishbook.wishReason}"  required="">
                                                        <div class="invalid-feedback">
                                                        
                                                        </div>
                                                    </div>
													<div class="form-group">
									<label for="exampleFormControlTextarea1">사유</label>
									<textarea class="form-control" name="wishReason" rows="3"></textarea>
								</div>
                                                </div>
                                                </div>
                                                <hr class="mb-4">
												<a href="#" class="btn btn-primary">수정</a>
                                                <a href="#" class="btn btn-brand">삭제</a>
												<a href="#" class="btn btn-secondary">취소</a>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                </body>
                                </html>
                               
                              