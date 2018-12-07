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

<script>
//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
var idCheck = 0;
//아이디 체크하여 가입버튼 비활성화, 중복확인.
function checkId() {
    var inputed = $('.joinform').find('#email');
    $.ajax({
        data : {
            id : inputed.val()
        },
        url : "checkId",
        success : function(data) {
        	if(data=='2'){
        		/* 
        		inputed.css("background-color", "transparent"); */
        		
        		document.getElementById("checkIdResult").innerHTML = '<img src=""/>';
        		
        		
        	} else if (data == '0') {/* 
            	inputed.css("background-color", "#B0F6AC");		//녹색 */
            	
            	document.getElementById("checkIdResult").innerHTML = '<img src="assets/css/images/yes.png" style="margin-left:1%; padding-top:2%; display:inline-block; width:5%; height:7%px;"/>';
                
            	idCheck = 1;
            } else if (data == '1') {
            	/* inputed.css("background-color", "#FFCECE");		//빨강
            	 */
            	document.getElementById("checkIdResult").innerHTML = '<img src="assets/css/images/no.png" style="margin-left:1%; padding-top:2%; display:inline-block; width:5%; height:7%;"/>';
            	
                idCheck = 0;
            } 
        }
    });
}
</script>

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
							required="required" placeholder="Your email" value="${user.id }" style="color:black;" />
						<input type="password" name="password" id="password" class="inpt"
							required="required" placeholder="Your password"
							value="${user.password }" style="color:black;">
						<div class="submit-wrap">
							<input type="submit" value="Sign in" class="submit"> 
							<a href="findForm" class="more" style="color: black;">Forgot your password?</a>
						</div>
					</form>
				</div>
				<div class="signup-cont cont">
					<form class="joinform" action="join" enctype="multipart/form-data">
					
					
							<input type="email" name="id" id="email" class="inpt1"
							required="required" placeholder="Your email" style="color:black;" oninput="checkId()">
							
							<span id="checkIdResult"></span>
							 
							<input type="password" name="password" id="password" class="inpt"
							required="required" placeholder="Your password" style="color:black;"> 
							<input type="text" name="name" id="name" class="inpt"
							required="required" placeholder="Your name" style="color:black;"> 
							<input type="text" name="phone" id="phone" class="inpt"
							required="required" placeholder="Your phone" style="color:black;"> 
							<input type="text" name="birth" id="birth" class="inpt"
							required="required" placeholder="Your birth" style="color:black;">
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