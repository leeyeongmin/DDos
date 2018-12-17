<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<title>Concept - Bootstrap 4 Admin Dashboard Template</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
	$('#exampleModal').modal(options)
</script>


</head>

<!-- ============================================================== -->
<!-- end main wrapper  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<!-- jquery 3.3.1 -->
<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- slimscroll js -->
<script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<!-- main js -->
<script src="assets/libs/js/main-js.js"></script>



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
							<h3 class="mb-2">Events List</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Events</li>
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

					<div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
						<!-- ============================================================== -->
						<!-- Ongoing Event -->
						<!-- ============================================================== -->
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="section-block" id="image-card">
									<h3 class="section-title">Ongoing event</h3>
									<p>Choose from appending “image caps” at either end of a
										card, overlaying images with card content, or simply embedding
										the image in a card.</p>
								</div>
							</div>
							<c:forEach items="${ongoingEvent}" var="ongoingList">
							
							<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card">
									<img class="card-img-top img-fluid p-2" src="assets/images/card-img.jpg" alt="Card image cap">
									<div class="card-body" style="text-align: center;">
										<h3 class="card-title">${ongoingEvent.title}</h3>
										<p class="card-text">${ongoingEvent.content}</p>
										<a href="eventDetail?eventNo=1" data-target="#exampleModal" data-toggle="modal" class="btn btn-primary showEvent" data-id="my_id_value">Show Event</a>
										
									</div>
								</div>
							</div>

							</c:forEach>
							<!-- ============================================================== -->
							<!-- Going Ahead Event -->
							<!-- ============================================================== -->

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="section-block" id="image-card">
									<h3 class="section-title">Going ahead event</h3>
									<p>Choose from appending “image caps” at either end of a
										card, overlaying images with card content, or simply embedding
										the image in a card.</p>
								</div>
							</div>
							<c:forEach items="${aheadEvent}" var="aheadList">
							
							<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card">
									<img class="card-img-top img-fluid p-2"
										src="assets/images/card-img.jpg" alt="Card image cap">
									<div class="card-body" style="text-align: center;">
										<h3 class="card-title">${aheadEvent.title}</h3>
										<p class="card-text">${aheadEvent.content}</p>
										<button type="button" class="btn btn-primary" 
											data-toggle="modal" data-target="#exampleModal">Show
											Event</button>
									</div>
								</div>
							</div>

							</c:forEach>

						</div>

						<!-- ============================================================== -->
						<!-- end content -->
						<!-- ============================================================== -->
					</div>


					<!-- ============================================================== -->
					<!-- end total content -->
					<!-- ============================================================== -->
				</div>
			</div>

		</div>
		<!-- ============================================================== -->
		<!-- end wrapper  -->
		<!-- ============================================================== -->

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
					<p>ppppppppppppppppppppppppp</p>
					
					<p>${eventDetail.eventNo }</p>
					<p>${eventDetail.title }</p>
					
				
				
				</div>
				<div class="modal-footer">

					<a id="kakao-link-btn" href="javascript:;"><button
							type="button" class="btn btn-primary">KaKao Share</button></a>

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript'>
		// // 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('4e34fd015dcb3287cbdac98a3d2fda30');
		// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
		Kakao.Link
				.createDefaultButton({
					container : '#kakao-link-btn',
					objectType : 'feed',
					content : {
						title : '딸기 치즈 케익',
						description : '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
						imageUrl : 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
						link : {
							mobileWebUrl : 'http://localhost:8081/ddos/eventList',
							webUrl : 'http://localhost:8081/ddos/eventList'
						}
					},
					social : {
						likeCount : 286,
						commentCount : 45,
						sharedCount : 845
					},
				});
	</script>
</body>
</html>