<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* .ui-dialog .ui-dialog-titlebar-close {display: none } */
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		var dialog = $("#dialog_input").dialog({
			autoOpen : false,
			resizable : false,
			height : "auto",
			width : "auto",
			modal : true,
			buttons : {
				"배치" : function() {
					var params = dialog.find("form").serialize();
					if ($("#col").val() == "" || $("#row").val() == "") {
						alert("숫자를 입력하세요.");
					} else {
						$.get("settingroom", params, function(room_num) {
							console.log(room_num + "tttt");
							//localStorage.setItem("room_num", room_num);
							room_show(room_num);
						});

						dialog.dialog("close");
					}

				},
				"취소" : function() {
					$(this).dialog("close");
				}
			}
		});

		$("input:text[numberOnly]").on("keyup", function() {
			$(this).val(check_num($(this).val().replace(/[^0-9]/g, "")));
		});

		/*  $( "#seat_arrangement" ).on( "click", function() {
		 	dialog.dialog("open");
		     $('#col').val('1');
		     $('#row').val('1');
		   }); */

		room_show('A');

	}); //$()

	function dialog_open() {
		$("#dialog_input").dialog("open");
		$('#col').val('1');
		$('#row').val('1');
	}

	function check_num(num) {
		if (num > 20) {
			num = 20;
		} else if (num.length == 1) {
			if (num == 0)
				num = 1;
		}

		return num;

	}

	function click_set(seatnum) { //좌석 선택 시 
		if (seatnum.style.backgroundColor == "rgb(0, 255, 0)") {
			seatnum.style.background = "#ffffff";
		} else {
			seatnum.style.background = "#00ff00";
		}

	}

	function save_set() { //저장 버튼 클릭 시 

		var $cnts = $('.seat');
		var $save = new Array();

		for (var i = 0; i < $cnts.length; i++) {
			if ($cnts.eq(i).css("background-color") == "rgb(0, 255, 0)") { //선택된 좌석일 경우
				$save.push($cnts.eq(i).attr("name"));

			}
		}

		var num = $('input[name=room]').attr("value");

		$.ajax({
			type : "post",
			url : "saveSeat?seat=" + $save + "&room=" + num,
			success : function(num) {
				alert("저장이 완료 되었습니다.");
			}
		});

	}

	function change_ck(event) {
		var num = $('input[name=room]').attr("value");
		var type;
		$.ajax({
			type : "post",
			url : "setting_change_ck?room=" + num,
			async : false,
			success : function(num1) {
				if (num1 == "false") {
					alert("사용중인 좌석이 있습니다.");
					room_show(num);
				} else {
					if (event == "save") {
						save_set()
					} else {
						dialog_open();
					}
				}
			}
		});

	}

	function room_show(num) {
		$
				.ajax({
					type : "post",
					url : "Roomshow?room=" + num,
					success : function(result) {

						$("#show").empty();

						var maxRow = result[0].rmax;
						var maxCol = result[0].cmax;
						var add = "<table border=0 style=\"margin-left:auto; margin-right:auto; width:80%; height:auto;">";

						for (var row = 1; row <= maxRow; row++) {
							add += "<tr>";
							for (var col = 1; col <= maxCol; col++) {
								for (var i = 0; i < result.length; i++) {
									if (row == result[i].row
											&& col == result[i].col) {

										if (result[i].status == '0') {
											add += "<td><input type=button class=seat "
													+ " value= "
													+ i
													+ " name="
													+ result[i].seatNum
													+ " style=\"background:#ffffff; width:35px; height:35px;\""
													+ "onclick=click_set(this)></td>";
										} else {
											add += "<td><input type=button class=seat "
													+ " value= "
													+ i
													+ " name= "
													+ result[i].seatNum
													+ " style=\"background:#00ff00; width:35px; height:35px;\""
													+ "onclick=click_set(this)></td>";
										}

									} //if
								} //for
							} //for
							add += "</tr>";
						} //for

						$(add).prependTo("#show");

					}

				});
		$('input[name=room]').attr('value', num);
	}

	function room_ck(room_num) {

		room_show(room_num);

		return true;
	}

	/* 	$(function(){
	
	 var $refresh = 1000 * 10 * 5;	//5분 
	
	 var sample = setInterval(function() {
	 location.reload();
	 }, $refresh); 
	
	 }) */
</script>
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
							<h3 class="mb-2">Seat Setting</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Seat
											Setting</li>
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
					<!-- campaign data -->
					<!-- ============================================================== -->
					<div style="width: 100%;">
						<!-- ============================================================== -->
						<!-- campaign tab one -->
						<!-- ============================================================== -->
						<div class="influence-profile-content pills-regular">
							<ul class="nav nav-pills mb-3 nav-justified" id="pills-tab"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="pills-campaign-tab" data-toggle="pill" href="#room"
									onclick="room_ck('A')" role="tab"
									aria-controls="pills-campaign" aria-selected="true">A열람실</a></li>

								<li class="nav-item"><a class="nav-link"
									id="pills-packages-tab" data-toggle="pill" href="#room"
									onclick="room_ck('B')" role="tab"
									aria-controls="pills-packages" aria-selected="false">B열람실</a></li>

								<li class="nav-item"><a class="nav-link" id="sendMessage"
									data-toggle="pill" href="#room" role="tab"
									onclick="room_ck('C')" aria-controls="pills-msg"
									aria-selected="false">C열람실</a></li>

							</ul>

							<div class="tab-content" id="pills-tabContent">
								<div class="tab-pane fade show active" id="room" role="tabpanel"
									aria-labelledby="pills-campaign-tab">
									<div class="row">
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

											<div>
												<a href="#" onclick="change_ck('seat')"
													class="btn btn-outline-brand btn-block" style="width:45%; display:inline-block; margin-top:0.5%; margin-left:5%;">Basic Seat Setting</a> 
												<a href="#" onclick="change_ck('save')"
													class="btn btn-outline-success btn-block" style="width:45%; display:inline-block;">Seat Setting Store</a>
											</div>
										</div>
										<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
											<div>
												<div class="card-body">
													<p class="lead"></p>
													<div id="show"></div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
							<!-- ============================================================== -->
							<!-- end campaign tab one -->
							<!-- ============================================================== -->
						</div>
						<!-- ============================================================== -->
						<!-- end campaign data -->
						<!-- ============================================================== -->
					</div>



				</div>
			</div>
		</div>
	</div>

	<div id="dialog_input" title="값을 입력하세요">
		<form>
			<p>
				<input type="hidden" id="room" name="room" value="">
			</p>
			<p>
				행 : <input type="text" id="col" name="col" numberOnly>
			</p>
			<p>
				열 : <input type="text" id="row" name="row" numberOnly>
			</p>
			<p>1-20까지 입력가능 합니다.</p>
		</form>
	</div>

</body>
</html>