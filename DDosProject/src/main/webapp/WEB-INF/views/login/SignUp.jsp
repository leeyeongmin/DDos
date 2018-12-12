<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Concept - Bootstrap 4 Admin Dashboard Template</title>
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
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    /* document.getElementById("sample6_extraAddress").value = extraAddr; */
                
                } else {
                    /* document.getElementById("sample6_extraAddress").value = ''; */
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                /* document.getElementById('sample6_postcode').value = data.zonecode; */
                document.getElementById("address").value = addr;
            }
        }).open();
    }
</script>
<script>
	//id 중복 체크
	var idCheck = 0;
	function checkId() {
		var inputed = $('.joinform').find('#email');
		$
				.ajax({
					data : {
						id : inputed.val()
					},
					url : "checkId",
					success : function(data) {
						if (data == 2) {
							document.getElementById("checkIdResult").innerHTML = '<img src=""/>'
						} else if (data == 0) {
							document.getElementById("checkIdResult").innerHTML = '<img src="" style="margin-left:1%; padding-top:2%; display:inline-block; width:5%; height:7%;"/>';
						} else {
							document.getElementById("checkIdResult").innerHTML = '<img src="" style="margin-left:1%; padding-top:2%; display:inline-block; width:5%; height:7%;"/>';
						}
					}
				})
	}
	
	function check_only(chk){
		var obj = document.getElementsByName("chkbox");
		for(var i=0; i<obj.length; i++){
			if(obj[i] != chk){
				obj[i].checked=false;
			}
		}
	}
</script>
</head>
<!-- ============================================================== -->
<!-- signup form  -->
<!-- ============================================================== -->

<body class="bgimg">
	<!-- ============================================================== -->
	<!-- signup form  -->
	<!-- ============================================================== -->
	<form class="splash-container joinform">
		<div class="card">
			<div class="card-header">
				<h3 class="mb-1">Registrations Form</h3>
				<p>Please enter your user information.</p>
			</div>
			<div class="card-body">
				<div class="form-group">
					<input class="form-control form-control-lg" type="email" name="id"
						id="email" required="" placeholder="E-mail" autocomplete="off"
						oninput="checkId()">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="text" name="name"
						id="name" required="" placeholder="Username" autocomplete="off">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="password"
						id="password" name="password" required="" placeholder="Password">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" required=""
						placeholder="Password Confirm">
				</div>
				<div class="form-group">
					<input class="form-control form-control-lg" type="text"
						id="address" name="maddress" required="" placeholder="Address">
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
						name="chkbox" type="checkbox" class="custom-control-input" value="male" onclick="check_only(this)">
						<span class="custom-control-label">Male</span>
					</label> <label class="custom-control custom-checkbox"
						style="display: inline-block; margin-left:25%;"> <input id="female"
						name="chkbox" type="checkbox" class="custom-control-input" value="female" onclick="check_only(this)">
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
					Already member? <a href="#" class="text-secondary">Login Here.</a>
				</p>
			</div>
		</div>
	</form>
</body>


</html>