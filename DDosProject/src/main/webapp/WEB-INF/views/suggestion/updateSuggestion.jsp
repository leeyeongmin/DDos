<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
</head>
<body>
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->

		<div class="dashboard-finance">
			<div class="container-fluid dashboard-content">
				<!-- ============================================================== -->
				<!-- pageheader  -->
				<!-- ============================================================== -->
				<form action="updateSuggestion" method="post">
					글번호 <input type="hidden" name="sugNum" value="${suggestion.sugNum}">${suggestion.sugNum}<br>
					제목 <input type="text" name="sugTitle"
						value="${suggestion.sugTitle}"><br> 내용
					<textarea rows="20" cols="20" name="sugCont">${suggestion.sugCont}</textarea>
					<br>
					<button>수정 완료</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>