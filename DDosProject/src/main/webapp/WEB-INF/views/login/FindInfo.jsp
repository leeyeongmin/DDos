<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Aerial by HTML5 UP</title>
<meta charset="utf-8" />

<jsp:include page="homeIndex.jsp" flush="false" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/login.css" />

</head>
<body>
	<section class="container login-bg">
		<article>
			<h1 style="margin-top: 5%;">Find Information</h1>
			<div class="tabs">
				<span class="tab signin active"><a href="#signin">Find Id</a></span>
				<span class="tab signup"><a href="#signup">Find Password</a></span>
			</div>
			<div class="content">
				<div class="signin-cont cont">
					<form class="loginform" action="findId"
						enctype="multipart/form-data">
						
						<input type="text" name="name" id="name" class="inpt"
							required="required" placeholder="Your name" style="color:black;" value="${user.name }"> 
							
						<input type="text" name="phone" id="phone" class="inpt"
							required="required" placeholder="Your phone" style="color:black;"  value="${user.phone }">
						
						<div class="submit-wrap">
							<input type="submit" value="Find Id" class="submit"> 
						</div>
					</form>
					<input onClick="location.href='loginForm'" type="button" value="Back" class="submit2">
				</div>
				<div class="signup-cont cont">
					<form class="loginform" action="findPwd" enctype="multipart/form-data">
					
						<input type="email" name="id" id="email" class="inpt"
							required="required" placeholder="Your email"  style="color:black;" value="${user.id }"/>
							
						<input type="text" name="name" id="name" class="inpt"
							required="required" placeholder="Your name" style="color:black;" value="${user.name }"> 
							
						<input type="text" name="phone" id="phone" class="inpt"
							required="required" placeholder="Your phone" style="color:black;"  value="${user.phone }">
							
						<div class="submit-wrap">
							<input type="submit" value="Find Password" class="submit">
							<input onClick="location.href='loginForm'"  type="button" value="Back" class="submit2">
						</div>
					</form>
				</div>
			</div>
		</article>
	</section>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$('.tabs .tab').click(function() {
			if ($(this).hasClass('signin')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signin-cont').show();
			}
			if ($(this).hasClass('signup')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signup-cont').show();
			}
		});
		$('.container .bg').mousemove(
				function(e) {
					var amountMovedX = (e.pageX * -1 / 30);
					var amountMovedY = (e.pageY * -1 / 9);
					$(this).css('background-position',
							amountMovedX + 'px ' + amountMovedY + 'px');
				});
	</script>

</body>


</html>