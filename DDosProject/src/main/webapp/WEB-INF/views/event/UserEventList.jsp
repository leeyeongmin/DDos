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
<title>DDos</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<script>
var eventNum, eventTitle, eventCont, startDate, endDate, writeDate;

$(function() {
	$(".identifyingClass").click(function() {
		var my_id_value = $(this).data('id');
		$(".modal-body #hiddenValue").val(my_id_value);
	})
});

function eventDetail(eventNum) {
	var modal = $('#eventDetail');
	
	$.ajax({
			url: "eventDetail?eventNum="+ eventNum,
			success: function(data){
				
				eventNum = data.eventNum;
				eventTitle = data.eventTitle;
				eventCont = data.eventCont;
				startDate = data.startDate;
				endDate = data.endDate;
				writeDate = data.writeDate;
			}
	}).done(function(response) {
		$('#resultShow').text(eventNum);
		$('#resultShow').append('<br>');
		$('#resultShow').append(eventTitle);
		$('#resultShow').append('<br>');
		$('#resultShow').append(eventCont);
		$('#resultShow').append('<br>');
		$('#resultShow').append(startDate);
		$('#resultShow').append('<br>');
		$('#resultShow').append(endDate);
		$('#resultShow').append('<br>');
		$('#resultShow').append(writeDate);
		
		
		$('#eventDetail').modal('show');
	});
	
}

function shareEvent(){
	// // 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('4e34fd015dcb3287cbdac98a3d2fda30');
	// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
	Kakao.Link.createDefaultButton({
		container : '#kakao-link-btn',
		objectType : 'feed',
		content : {
			title : eventTitle,
			description : eventCont,
			imageUrl : 'http://preimage.hankookilbo.com/i.aspx?Guid=b0ecee4d1faa46b49675f93b0835d6c1&Month=DirectUpload&size=400',
			link : {
				mobileWebUrl : 'http://180.71.250.243:8081/ddos/eventList',
				webUrl : 'http://localhost:8081/ddos/eventList'
			}
		},
	});
}
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
							<c:forEach items="${ongoingEvent}" var="ongoingEvent">

								<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
									<div class="card">
										<img class="card-img-top img-fluid p-2"
											src="assets/images/card-img.jpg" alt="Card image cap">
										<div class="card-body" style="text-align: center;">
											<h3 class="card-title">${ongoingEvent.eventTitle}</h3>
											<p class="card-text">${ongoingEvent.eventCont}</p>



											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#eventDetail"
												onclick="eventDetail(${ongoingEvent.eventNum})">Show
												Event</button>


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
							<c:forEach items="${aheadEvent}" var="aheadEvent">

								<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
									<div class="card">
										<img class="card-img-top img-fluid p-2"
											src="assets/images/card-img.jpg" alt="Card image cap">
										<div class="card-body" style="text-align: center;">
											<h3 class="card-title">${aheadEvent.eventTitle}</h3>
											<p class="card-text">${aheadEvent.eventCont}</p>
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#eventDetail"
												onclick="eventDetail(${aheadEvent.eventNum})">Show
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

	<div class="modal" tabindex="-1" role="dialog" id="eventDetail">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Event information</h5>
				</div>
				<div class="modal-body" id="modal-body">

					<div class="card-text" id="resultShow"></div>


				</div>
				<div class="modal-footer" id="modal-footer">
				
				
					<!-- <a id="kakao-link-btn" href="javascript:;">
						<button type="button" class="btn btn-primary" onclick="shareEvent()">KaKao Share</button>
					</a> -->
					<button id="kakao-link-btn" type="button" class="btn btn-primary" onclick="shareEvent()">KaKao Share</button>
					
					
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>