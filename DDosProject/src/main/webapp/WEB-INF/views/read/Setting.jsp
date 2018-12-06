<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	function click_set(seatnum){			//좌석 선택 시 
	
		if(seatnum.style.backgroundColor == "rgb(0, 255, 0)"){
			seatnum.style.background = "#ffffff";
		}else{
			seatnum.style.background = "#00ff00";
		}
	
	}
	
	function save_set(){		//저장 버튼 클릭 시 
		
		var $cnts = $('.seat');
		var $save = new Array();
		
		for(var i=0; i<$cnts.length; i++){
			if($cnts.eq(i).css("background-color") == "rgb(0, 255, 0)" ){	//선택된 좌석일 경우
				$save.push($cnts.eq(i).attr("name"));
			
			}
		}
		
		//var $set = $save.join("','");		//배열 => String 문자로  
		alert($save);
		
		location.href="saveSeat?seat="+$save;
		
	}
	
	$(function(){
		
		var $refresh = 1000 * 10 * 5;	//5분 
		
		var sample = setInterval(function() {
			location.reload();
		}, $refresh);
	})
	
</script>
<body>
<% int set = 1; %>
	<div align="center">
	<h3>${readVO.room} 열람실 </h3>	
	${setList }
	<table>
		<c:forEach items="${setList}" var="setlist" varStatus="status">
	 	<c:if test="${status.index mod 7 == 0}">
					<tr>
			</c:if>
				 <c:choose>
				 <c:when test="${setlist.status=='0'}">
					<td><input type="button" class="seat" value="<% if(set < 10) { %>0<%=set++%><%}else{ %><%=set++ %><% } %>" name="${setlist.seat_num}"
					style="background: #ffffff" onclick="click_set(this)"></td> 
				</c:when>
				
			 	<c:otherwise>
					<td><input type="button" class="seat" value="<% if(set < 10) { %>0<%=set++%><%}else{ %><%=set++ %><% } %>" name="${setlist.seat_num}"
					style="background: #00ff00" onclick="click_set(this)"></td>
				</c:otherwise> 
				
			</c:choose> 
			<c:if test="${status.index mod 7 == 6}">
				</tr>
			</c:if> 
		</c:forEach>
		
	</table>
	
	<input type="button" value="저장" onclick="save_set()">
	</div>
</body>
</html>