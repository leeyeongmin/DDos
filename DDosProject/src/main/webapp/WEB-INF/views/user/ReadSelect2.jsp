<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.seat{
	background-color: black
}
.myseat{	
	background-color : #0066FF;
}

.roomstyle {
	font-size: 50px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	
	$(function() {
		var seat;
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
		    			url : "extension?loginId=${login.id}",
		    			success : function() {
		    				dialog.dialog("close");
		    			}
		        	})
		        },
		        "반납": function() {
		        	$.ajax({
		    			type : "post",
		    			url : "return_seat?loginId=${login.id}&selectSeat="+ seat,
		    			success : function() {
		    				//location.reload();
		    				var today = new Date();
		    				location.href="getRoom?room="+ "${readVO.room}"+"&time="+today.getTime();
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
		    			url : "return_seat?loginId=${login.id}&selectSeat="+ seat,
		    			success : function() {
		    				var today = new Date();
		    				location.href="getRoom?room="+ "${readVO.room}"+"&time="+today.getTime();
		    			}
		        	})
		        	dialog2.dialog( "close" );
		        	
			    }, 
			    "취소": function() {
			    		alert($(this));
				          $( this ).dialog( "close" );
				    }
		      }
		    });
//----------------------------------------------------------------------------//
		//좌석 선택 시 
		$(".seat").click(function() {
			seat = $(this).attr("name");
			if($(this).hasClass("myseat")){
				//남은 시간 확인 
				$.ajax({
					type : "post",
					url : "remaining?loginId=${login.id}",
					success : function(result) {
						if(result <= 29){		//30분 이하로 남을 시 
							dialog.dialog("open");
						}else{
							dialog2.dialog("open");
						}
					}
				});

			}else if (confirm("'" + $(this).attr("value") + "' 자리를 선택하시겠습니까?")) {
				$.ajax({
					type : "post",
					url : "overlap?selectSeat=" + $(this).attr("name"),
					success : function(result) {
						if (result.status == "2") {
							alert("이미 선택된 좌석입니다.");
							location.reload();
						} else {
							insertSeat(result.seatNum);
						}
					}
				})
			}
		})
		
		function callback(){
			$(".ui-dialog-buttonset").dialog( "close" );
		}
		
		useing_seat("${login.id}");
		
	}); //$()
	
	
	 function useing_seat(id){
		$.ajax({
			type : "post",
			url : "useing_seat?loginId="+id,
			success:function(result){
				if(result != ""){
					$("[name="+result+"]").attr("disabled", false);
					$("[name="+ result + "]").addClass("myseat");
					$("input[name!="+result+"]").attr("disabled", true);
					timer();
				}
				
			}
		});
	}
	
	function insertSeat(seat) {
		login_id = $('input:hidden[name="login_name"]').val();
		location.href = "updateSeat?selectSeat=" + seat + "&room="
				+ $("#roomNum").text() + "&loginId=" + login_id;
	}
	
	function timer(){
		var time_ck;
		$.ajax({
			type : "post",
			url : "usetimer?loginId="+"${login.id}",
			success : function(result) {
				localStorage.setItem("time_ck", result);
				//time_ck =result;
			}
		})
			
		var timer_start = setInterval(function(){
			var now = new Date(Date.now());
			var get_time = new Date(localStorage.getItem("time_ck"));
			var a = now - get_time;
			  var timeGap = new Date(0, 0, 0, 0, 0, 0, get_time - now); 
			  var diffHour = timeGap.getHours();       // 시간 
			  var diffMin  = timeGap.getMinutes();      // 분
			  var diffSec  = timeGap.getSeconds();      // 초
			  var time_end = diffHour + "시간 " + diffMin + "분 "  + diffSec + "초 ";
			  $("#use").html(time_end);
			  if(diffHour == "0" && diffMin=="0" && diffSec=="0"){
				  clearInterval(timer_start);
			  }
			  
		} , 1000);
	}
	
	function time_rename(time){
		
	}
	/* 	if(result =="00:00:00"){
	clearInterval(timer_start);
}else{
	$("#use").html("남은 시간 : " + result);
} */
</script>
</head>
<body>
<%   
	response.setHeader("Cache-Control","no-store");   
	response.setHeader("Pragma","no-cache");   
	response.setDateHeader("Expires",0);   
	if (request.getProtocol().equals("HTTP/1.1")) 
       	 response.setHeader("Cache-Control", "no-cache"); 
%>   

	<%
		int set = 1;
	%>
	<div align="center">
		<span id="roomNum" class="roomstyle">${readVO.room}</span><span
			class="roomstyle">열람실</span> <input type="hidden" value="${login.id}"
			name="login_name">
		<table border="1">

			<c:forEach begin="1" end="${roomsize.row}" varStatus="r">
				<tr>
					<c:forEach begin="1" end="${roomsize.col}" varStatus="c">
						<c:forEach items="${setList}" var="setlist" varStatus="roomseat">
							<c:if
								test="${r.index == setlist.row and c.index == setlist.col}">
								<c:choose>

									<c:when test="${setlist.status =='1'}">
										<td><input type="button" class="seat"
											value="<% if(set < 10) { %>0<%=set++%><%}else{ %><%=set++ %><% } %>"
											name="${setlist.seatNum }"
											style="background: #ffffff; width: 100%; height: 100%"></td>
									</c:when>

									<c:when test="${setlist.status=='2'}">
										<td><input type="button" class="seat"
											value="<% if(set < 10) { %>0<%=set++%><%}else{ %><%=set++ %><% } %>"
											name="${setlist.seatNum }" 
											disabled="disabled"></td>
									</c:when>

									<c:otherwise>
										<td><input type="button" style="visibility: hidden;"></td>
									</c:otherwise>

								</c:choose>
							</c:if>

						</c:forEach>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>

		<div id="use">
			
		</div>
		
		
		<div id="dialog-confirm" title="작업을 선택하세요">
  			<p>작업을 선택하시오.</p>
		</div>
		<div id="dialog-confirm2" title="작업을 선택하세요">
  			<p>작업을 선택하시오.</p>
  			<p>(연장은 끝나기 30분전부터 가능합니다.)</p>
		</div>
	</div>
</body>
</html>