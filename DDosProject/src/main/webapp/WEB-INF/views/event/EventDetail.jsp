<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="eDetail">
	번호:${eventDetail.eventNum}<br>
	제목:${eventDetail.eventTitle}<br>
	내용 :${eventDetail.eventCont}<br>
	시작일:${eventDetail.startDate}<br>
	종료일:${eventDetail.endDate }<br>
	작성일:${eventDetail.writeDate }<br>
</div>
	
</body>
</html>