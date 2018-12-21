<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.seatuse {
	background-color: black;
}

.seat{
	background:#ffffff;
}

.myseat {
	background-color: #0066FF;
}

.roomstyle {
	font-size: 50px;
}
</style>

<script type="text/javascript">

	function room_ck(room_num){
		
		localStorage.setItem("room", room_num);
		console.log("room_ck : " + localStorage.getItem("room"));
		room_show(room_num);
		
		return true;
	}	
	
	
	$(function(){
		//localStorage.clear();
		useing("${login.id}");
		
		//-----------------------------------------------//
		
		var dialog = $("#dialog-confirm").dialog({
			  autoOpen: false,
		      resizable: false,
		      height: "auto",
		      width: 400,
		      modal: true,
		      buttons: {
		        "연장": function() {
		        	$.ajax({
		    			type : "post",
		    			url : "extension?loginId=${login.id}&selectSeat="+localStorage.getItem('seating'),
		    			success : function() {
		    				dialog.dialog("close");
		    				room_show(localStorage.getItem("room"));
		    			}
		        	})
		        }, 
		        "반납": function() {
		        	$.ajax({
		    			type : "post",
		    			url : "return_seat?loginId=${login.id}"+"&selectSeat="+localStorage.getItem('seating'),
		    			success : function() {
		    				localStorage.removeItem("seating");
		    				localStorage.removeItem("time_ck");
		    				room_show(localStorage.getItem("room"));	
		    			}
		        	})
		        	dialog.dialog( "close" );
	
			    }, 
			    "취소": function() {
			    		alert($(this));
				          $( this ).dialog( "close" );
				    }
		      }
		    });
		
		var dialog2 = $("#dialog-confirm2").dialog({
			  autoOpen: false,
		      resizable: false,
		      height: "auto",
		      width: 400,
		      modal: true,
		      buttons: {
		        "반납": function() {
		        	$.ajax({
		    			type : "post",
		    			url : "return_seat?loginId=${login.id}&selectSeat="+localStorage.getItem('seating'),
		    			success : function() {
		    				localStorage.removeItem("seating");
		    				localStorage.removeItem("time_ck");
		    				room_show(localStorage.getItem("room"));
		    			}
		        	})
		        	dialog2.dialog("close");
		        	
			    }, 
			    "취소": function() {
				          $(this).dialog( "close" );
				    }
		      }
		    });
//----------------------------------------------------------------------------//
		//좌석 선택 시 

	})		//$()
	
	function insertSeat(seat) {
		$.ajax({
			type : "post",
			url : "updateSeat?selectSeat=" + seat + "&loginId=${login.id}",
			success : function() {
				//alert(localStorage.getItem("room"));
				room_show(localStorage.getItem("room"));
			}
		});
		
	}
	
	
	function useing(login_id){
		$.ajax({
			type : "post",
			url : "useing_seat?loginId="+login_id,
			success:function(result){
				var room_num;
				
				localStorage.setItem("seating", result);		//자리 번호 저장
				
				if(result==null || result==undefined || result=="null" || typeof result == "undefined" || !result){
					room_num = 'A';
				}else{
					room_num = result.substr(0,1);
				}
				
				localStorage.setItem("room", room_num);
				
				$("#" + room_num ).attr("aria-selected", true);
				$("#" + room_num).attr("class","nav-link active");
				
				room_show(room_num);
				
			}
    	});
	}
	
	function room_show(room_num){
		
		$.ajax({
			type : "post",
			url : "Roomshow?room="+room_num,
			success:function(result){
				
				$("#readingroom").empty();
				var cnt = 1;
				var maxRow = result[0].rmax;
				var maxCol = result[0].cmax;
				
				var add = "<table border=1>";
				
				for(var row = 1; row<=maxRow; row++){
					add += "<tr>";
					for(var col = 1; col <= maxCol; col++){
						for(var i=0; i<result.length; i++ ){
							if(row == result[i].row && col == result[i].col){
								
								if(result[i].status == '1'){ 
										add += "<td><input type=button class=seat " +  
												" value= "+ cnt++ +
												" name=" + result[i].seatNum +
												" onclick=on_seat(this)" +
												" id=" + result[i].seatNum + 
												" style=width:100%;height:100%></td>";
								}else if(result[i].status == '2'){
									add += "<td><input type=button class=seatuse " + 
									"value= " + cnt++ +
									" name=" + result[i].seatNum + 
									" onclick=on_seat(this)" +
									" id=" + result[i].seatNum + 
									" disabled=disabled></td>";
								}else{
									add += "<td><input type=button style=visibility:hidden;disabled=disabled></td>";
								}

							}	//if
						}	//for
					}	//for
					add += "</tr>";
				}	//for
					
				$(add).prependTo("#readingroom");
				
				var seat = localStorage.getItem('seating');
				
				if(seat){
					$("input[name="+seat+"]").attr("disabled", false);
					$("input[name="+ seat + "]").addClass("myseat");
					$("input[name!="+seat+"]").attr("disabled", true); 
					timer();
				}
				
			}				
		});
	}
	
	
	function on_seat(choose){
		var seat;

		seat = $(choose).attr("name");
		
		if($(choose).hasClass("myseat")){
			//남은 시간 확인 
			console.log("${login.id}");
			$.ajax({
				type : "post",
				url : "remaining?loginId=${login.id}",
				success : function(result) {
					console.log(result);
					if(result <= 29){		//30분 이하로 남을 시 
						$("#dialog-confirm").dialog("open");
					}else{
						$("#dialog-confirm2").dialog("open");
					}
				}
			});

		}else if (confirm("'" + $(choose).attr("value") + "' 자리를 선택하시겠습니까?")) {
			$.ajax({
				type : "post",
				url : "overlap?selectSeat=" + $(choose).attr("name"),
				success : function(result) {
					if (result.status == "2") {
						alert("이미 선택된 좌석입니다.");
						location.reload();
					} else {
						console.log("click : " + localStorage.getItem("room"));
						localStorage.setItem("seating", $(choose).attr("name"));
						insertSeat(result.seatNum);
					}
				}
			})
		}
	}
 
	 function timer(){
			var time_ck;
			$.ajax({
				type : "post",
				url : "usetimer?loginId="+"${login.id}",
				success : function(result) {
					localStorage.setItem("time_ck", result);		//끝나는 시간
				}
			});
			
			var timer_start = setInterval(function(){
				  var now;

				   $.ajax({
					  type : "post",
						url : "servertime",
						async: false,
						success : function(result) {
							now = new Date(result);		//서버시간
						}
				  });
				   
				  var get_time = new Date(localStorage.getItem("time_ck"));
				  var timeGap = new Date(0, 0, 0, 0, 0, 0, get_time - now); 
				  var diffHour = timeGap.getHours();       // 시간 
				  var diffMin  = timeGap.getMinutes();      // 분
				  var diffSec  = timeGap.getSeconds();      // 초
				  var time_end = diffHour + "시간 " + diffMin + "분 "  + diffSec + "초 ";
				  /* console.log(time_end);    */
				  $("#timer").html(time_end);
				  console.log(diffHour + ":" +  diffMin + ":" +  diffSec);
				  if(diffHour == "0" && diffMin=="0" && diffSec=="0" || !localStorage.getItem("time_ck")){
					  $("#timer").html("");
					  $.ajax({
							type : "post",
							url : "timecheck",
							success : function() {  
								room_show(localStorage.getItem("room"));
							}
					  });
					  clearInterval(timer_start);
					  localStorage.removeItem("seating");
	    			  localStorage.removeItem("time_ck");
				  }
				  
			} , 1000);
		}
	 
</script>

</head>
<body>

	<!-- campaign data -->
	<!-- ============================================================== -->
	<div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
		<!-- ============================================================== -->
		<!-- campaign tab one -->
		<!-- ============================================================== -->
		<div class="influence-profile-content pills-regular">
			<ul class="nav nav-pills mb-3 nav-justified" id="pills-tab"
				role="tablist">
				<li class="nav-item"><a class="nav-link" id="A"
					data-toggle="pill" href="#room" onclick="room_ck('A')" role="tab"
					aria-controls="pills-campaign" aria-selected="false">A열람실</a></li>

				<li class="nav-item"><a class="nav-link" id="B"
					data-toggle="pill" href="#room" onclick="room_ck('B')" role="tab"
					aria-controls="pills-packages" aria-selected="false">B열람실</a></li>

				<li class="nav-item"><a class="nav-link" id="C"
					data-toggle="pill" href="#room" role="tab" onclick="room_ck('C')"
					aria-controls="pills-msg" aria-selected="false">C열람실</a></li>

			</ul>

			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="room" role="tabpanel"
					aria-labelledby="pills-campaign-tab">
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="section-block">
								<h3 class="section-title">열람실</h3>
							</div>
						</div>
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="card">
								<div class="card-body">
									<p class="lead"></p>
									<div id="readingroom"></div>

									
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
	
	<div id="timer"></div>
	
	<div id="dialog-confirm" title="작업을 선택하세요">
  			<p>작업을 선택하시오.</p>
	</div>
	<div id="dialog-confirm2" title="작업을 선택하세요">
  		<p>작업을 선택하시오.</p>
  		<p>(연장은 끝나기 30분전부터 가능합니다.)</p>
	</div>	
</body>
</html>