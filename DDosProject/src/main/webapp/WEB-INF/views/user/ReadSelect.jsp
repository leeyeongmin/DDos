<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		$(".seat").click(function () {
			if(confirm("'" + $(this).attr("value") + "' 자리를 선택하시겠습니까?")){
				$.ajax({
					type : "post",
					url : "overlap?selectSeat=" + $(this).attr("name"),
					success:function(result){
						if(result.status == "2"){
							alert("이미 선택된 좌석입니다.");
							location.reload();
						}else{
							insertSeat(result.seat_num);
						}
					}
				})
			}
		})
	});		//$()
	
	function insertSeat(seat){
		alert(seat);
	}

</script>
</head>
<body>
	<% int set = 1; %>
	<div align="center">
	<h3>${ReadVO.room} 열람실</h3>
	${setList }
		<table border="1">
			<c:forEach items="${setList}" var="setlist" varStatus="status">
				
		 		<c:if test="${status.index mod 7 == 0}">
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
				
				<c:if test="${status.index mod 7 == 6}">
					</tr>
				</c:if>
				
			</c:forEach>
		
	</table>
	</div>
</body>
</html>