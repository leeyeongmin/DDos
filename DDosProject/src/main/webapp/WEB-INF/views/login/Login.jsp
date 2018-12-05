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
			<h1 style="margin-top: 5%;">Login</h1>
			<div class="tabs">
				<span class="tab signin active"><a href="#signin">Sign in</a></span>
				<span class="tab signup"><a href="#signup">Sign up</a></span>
			</div>
			<div class="content">
				<div class="signin-cont cont">
					<form class="loginform" action="login"
						enctype="multipart/form-data">
						<input type="email" name="id" id="email" class="inpt"
							required="required" placeholder="Your email" value="${user.id }" />
						<input type="password" name="password" id="password" class="inpt"
							required="required" placeholder="Your password"
							value="${user.password }">
						<div class="submit-wrap">
							<input type="submit" value="Sign in" class="submit"> 
							<a href="Home.jsp" class="more" style="color: black;">Forgot your password?</a>
						</div>
					</form>
				</div>
				<div class="signup-cont cont">
					<form class="joinform" action="join" enctype="multipart/form-data" method="post">
						<input type="email" name="id" id="email" class="inpt"
							required="required" placeholder="Your email" > 
							<input type="password" name="password" id="password" class="inpt"
							required="required" placeholder="Your password"> 
							<input type="text" name="name" id="name" class="inpt"
							required="required" placeholder="Your name"> 
							<input type="text" name="phone" id="phone" class="inpt"
							required="required" placeholder="Your phone"> 
							<input type="text" name="birth" id="birth" class="inpt"
							required="required" placeholder="Your birth">
						<div class="submit-wrap">
							<input type="submit" value="Sign up" class="submit">
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