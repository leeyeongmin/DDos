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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$(".seat").click(function() {
			var seat = $(this).attr("name");
			if($(this).hasClass("myseat")){

				
				$("#dialog-confirm").dialog({
				      resizable: false,
				      height: "auto",
				      width: 400,
				      modal: true,
				      buttons: {
				        "연장": function() {

				          $( this ).dialog( "close" );
				        },
				        "반납": function() {
				        	$.ajax({
				    			type : "post",
				    			url : "return_seat?loginId=${login.id}&selectSeat="+ seat
				        	})
				        	$( this ).dialog( "close" );
				        	location.reload();
					    }, 
					    "취소": function() {
					    		alert($(this));
						          $( this ).dialog( "close" );
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
				//$("[name="+result+"]").
				
				if(result != ""){
		
					$("[name="+result+"]").attr("disabled", false);
					//$("[name="+result+"]").css("backgroundColor","#ff0000");
					$("[name="+ result + "]").addClass("myseat");
					$("input[name!="+result+"]").attr("disabled", true);
					//$("input[name!="+result+"]").css("backgroundColor","gray");
					
				}
				
			}
		});
	} 
	function insertSeat(seat) {
		login_id = $('input:hidden[name="login_name"]').val();
		location.href = "updateSeat?selectSeat=" + seat + "&room="
				+ $("#roomNum").text() + "&loginId=" + login_id;
	}
	/* 	window.onload=function(){			//로딩 될 때 실행 
	 alert("ss");// 시간타임 체크
	 location.href="timecheck";
	
	 } */
</script>
<style type="text/css">
.roomstyle {
	font-size: 50px;
}
</style>
</head>
<body>
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

			<%-- <c:forEach items="${setList}" var="setlist" varStatus="status">
		 		
		 	
		 		<c:if test="${status.index mod roomsize.col == 0}">
						<tr>
				</c:if>
				
				<c:choose>
					<c:when test="${setlist.status =='1'}">
						<td><input type="button" class="seat" value="<% if(set < 10) { %>0<%=set++%><%}else{ %><%=set++ %><% } %>" name="${setlist.seat_num }"
						style="background: #ffffff; width: 100%; height: 100%" ></td>
					</c:when>
					
					<c:when test="${setlist.status=='2'}">
						<td><input type="button" class="seat" value="<% if(set < 10) { %>0<%=set++%><%}else{ %><%=set++ %><% } %>" name="${setlist.seat_num }"
						style="background: gray" disabled="disabled"></td>
					</c:when>
					
					<c:otherwise>
						<td><input type="button" style="visibility: hidden;"></td>
					</c:otherwise>
					
				</c:choose> 
				
				<c:if test="${status.index mod roomsize.row == roomsize.row-1}">
					</tr>
				</c:if>
				
			</c:forEach> --%>

		</table>

		<div id="use"></div>
		<div id="dialog-confirm" title="작업을 선택하세요">
  			
		</div>
	</div>
</body>
</html>