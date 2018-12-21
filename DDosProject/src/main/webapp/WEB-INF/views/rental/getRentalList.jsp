<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 현황 </title>


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
							<h3 class="mb-2">대출현황</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="#"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Borrow</a>
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
			<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 mb-5">
                            <div class="section-block">
                                <h5 class="section-title">대출현황</h5>
                                
                            </div>
                            <div class="tab-regular">
                                <ul class="nav nav-tabs " id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">대출현황</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">대출이력</a>
                                    </li>
                                   
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <p class="lead">대출현황 리스트</p><small>현재 대출중인 책의 목록을 보여드립니다.</small>
                                        <p>
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header">대출현황</h5>
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">도서명</th>
                                                <th scope="col">ISBN</th>
                                                <th scope="col">저자</th>
                                                <th scope="col">출판사</th>
                                                <th scope="col">대출일</th>
                                                <th scope="col">반납예정일</th>
                                            </tr>
                                        </thead>
										
                                        <tbody id=getRentalList>
										<c:forEach items="${getRentalList}" var="rental">
                                            <tr>
                                                <td><input type="checkbox" name="rnum" value="${rental.rentalNum}"></td>
                                                <td>${book.bookTitle}"</td>
                                                <td>${rental.rentalIsbn}</td>
												 <td>${book.bookWriter}</td>
												  <td>${book.bookComp}</td>
												   <td>${rental.rentalDate}</td>
												   <td>${rental.dueDate}</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
										</p>
                                    </div>
                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <h3>대출이력 리스트</h3>
                                        <p>대출이력 목록을 보여드립니다.</p>
                                     <a href="#" class="btn btn-secondary">내려받기</a>
									</div>
                                </div>
                            </div>
                        </div>
				
				
				</div>
				</div>
				</div>
				</body>
				</html>
			