<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>DDos</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
}

.bgimg {
	background-image: url("assets/images/intro.png");
	min-height: 100%;
	background-position: center;
	background-size: cover;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function findAdd() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
            }
        }).open();
    }
	//id 중복 체크
	var idCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
        var inputed = $('#email').val();
        $.ajax({
            data : {
                id : inputed
            },
            url : "checkId",
            success : function(data) {
                if(data=='2') {
                    $("#email").css("background-color", "transparent");
                    idCheck = 0;
                } else if (data == '0') {
                    $("#email").css("background-color", "#92C2F4");
                    idCheck = 1;
                } else if (data == '1') {
                    $("#email").css("background-color", "#FF9666");
                    idCheck = 0;
                } 
            }
        });
    }
	
	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
	var pwdCheck = 0;
    function checkPwd() {
        var inputed = $('#password').val();
        var reinputed = $('#repassword').val();
        if(reinputed=="" && inputed==""){
        	$("#password").css("background-color", "transparent");
            $("#repassword").css("background-color", "transparent");
        }
        else if (inputed == reinputed) {
        	$("#password").css("background-color", "#92C2F4");
            $("#repassword").css("background-color", "#92C2F4");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {
                signupCheck();
            }
        } else{
            pwdCheck = 0;
            $("#password").css("background-color", "#FF9666");
            $("#repassword").css("background-color", "#FF9666");
        }
    }
	
	function check_only(chk){
		var obj = document.getElementsByName("gender");
		for(var i=0; i<obj.length; i++){
			if(obj[i] != chk){
				obj[i].checked=false;
			}
		}
	}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
<script>

$(document).ready(function () {
   $(function () {
            
            $('#phone').keydown(function (event) {
             var key = event.charCode || event.keyCode || 0;
             $text = $(this); 
             if (key !== 8 && key !== 9) {
                 if ($text.val().length === 3) {
                     $text.val($text.val() + '-');
                 }
                 if ($text.val().length === 8) {
                     $text.val($text.val() + '-');
                 }
             }

             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
			 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
			 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
         })
   });

});
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
$(function() {
  $( "#birth" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>

</head>
<!-- ============================================================== -->
<!-- signup form  -->
<!-- ============================================================== -->

<body class="bgimg">
	<!-- ============================================================== -->
	<!-- signup form  -->
	<!-- ============================================================== -->
	<form class="splash-container joinForm" action="join" method="post">
		<div class="card">
			<div class="card-header">
				<h3 class="mb-1">Registrations Form</h3>
				<p>Please enter your user information.</p>
			</div>
			<div class="card-body">
				<div class="form-group">
					<input class="form-control form-control-lg" type="email" name="id"
						id="email" required="" placeholder="Your e-mail" autocomplete="off"
						oninput="checkId()">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="text" name="name"
						id="name" required="" placeholder="Your name" autocomplete="off">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="password"
						id="password" name="password" required="" placeholder="Your password"
						oninput="checkPwd()">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="password" 
						id="repassword" required="" placeholder="Your password confirm"
						oninput="checkPwd()">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="text" name="phone"
						id="phone" required="" placeholder="Your phone" autocomplete="off" maxlength="13">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="text" name="birth"
						id="birth" required="" placeholder="Your Birthday" autocomplete="off">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="text"
						id="address" name="address" required="" placeholder="Your address">
				</div>
				<div class="form-group">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <button class="btn  btn-block btn-social btn-twitter" type="button"
                        onclick="findAdd()">Find Address</button>
                    </div>
                </div>
				<div class="custom-controls-stacked">
					<label class="custom-control custom-checkbox"
						style="display: inline-block; margin-left:15%;"> <input id="male"
						name="gender" type="checkbox" class="custom-control-input" value="male" onclick="check_only(this)">
						<span class="custom-control-label">Male</span>
					</label> <label class="custom-control custom-checkbox"
						style="display: inline-block; margin-left:25%;"> <input id="female"
						name="gender" type="checkbox" class="custom-control-input" value="female" onclick="check_only(this)">
						<span class="custom-control-label">Female</span>
					</label>
					<div id="error-container1"></div>
				</div>
				<div class="form-group pt-2">
					<button class="btn btn-block btn-primary" type="submit">Register
						My Account</button>
				</div>
			</div>
			<div class="card-footer bg-white">
				<p>
					Already member? <a href="loginForm" class="text-secondary">Login Here.</a>
				</p>
			</div>
		</div>
	</form>
</body>


</html>