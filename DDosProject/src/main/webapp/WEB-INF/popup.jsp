<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function setCookie(name, value, expiredays) {
    	var date = new Date();
    	date.setDate(date.getDate() + expiredays);
    	document.cookie = escape(name) + "=" + escape(value) + "; expires=" + date.toUTCString();
	}

	function closePopup() {
    	if (document.getElementById("close_checkbox").checked) {
        	setCookie("popupYN", "N", 30);
    	}
    	self.close();
	}
	

	window.onbeforeunload = closePopup;
	

</script>
</head>
<body>
	<div style="top: 0%;" align="center">
		<h1> 안내사항 </h1>
	</div>
	<div style="top: 30%; height: 250px; overflow: scroll; " align="left" >
		<h4>1. 회원가입 후 1년 동안 이용가능합니다.</h4>
		<h4>2. 책 대여 후 14일 안에 반납하셔야 됩니다.</h4>
		<h4>3. 스터디룸에서 인원미달시 자동으로 스터디가 해체 됩니다.</h4>
		<h4>4. 책 연체시 하루 당 1000원이 부과됩니다.</h4>
		<h4>5. 도서관은 9:00 ~ 21:00 이용이 가능합니다.</h4>
		<h4>6. 열람실은 3시간 동안 사용가능하며 연장은 30분 남았을 때 부터 가능합니다.</h4>
	</div>
	
	<div style=" background-color: black; height: 25px; padding: 5px;">
		<div style=" float: left;"><input type="checkbox" id="close_checkbox" >
   	 	<font style="color: white;">30일 동안 보지 않기</font></div>
    	<div style=" float: right;" ><input type="button" onclick="closePopup();" value="닫기" ></div>
	</div>

</body>
</html>