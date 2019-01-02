<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>DDos</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
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
    .bgimg{
    background-image: url("assets/images/intro.png");
    min-height:100%;
    background-position: center;
    background-size: cover;
    }
    </style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- <script type="text/javascript">
		
	var IMP = window.IMP; // 생략가능
	IMP.init('imp93998128'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	
	function check(){
		
	}
	
	
	function pay(){
		IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '연회비',
			amount : 100,
			buyer_email : document.getElementById("email").value,
			buyer_name : document.getElementById("name").value,
			buyer_tel : document.getElementById("phone").value,
			buyer_addr : document.getElementById("address").value,
			buyer_postcode : '123-456',
			m_redirect_url : 'http://localhost:8081/ddos/payList'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				document.form.submit();
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	}
</script> -->




</head>

<body class="bgimg">
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center">
            <img class="logo-img" src="assets/images/ddoslogo.png" alt="logo" style="width:50%;">
            <span class="splash-description">Please enter your user information.</span>
            </div>
            <div class="card-body">
            
                <form action="login" name="form">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="id" name="id" type="email" placeholder="UserEmail" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" name="password" type="password" placeholder="Password" required>
                    </div>
                    
                    <button type="submit"  class="btn btn-primary btn-lg btn-block">Sign in</button>
                </form>
            </div>
            <div class="card-footer bg-white p-0  ">
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="joinForm" class="footer-link">Create An Account</a></div>
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="findForm" class="footer-link">Forgot Password</a>
                </div>
            </div>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script>
    	if('${NO}'=='noId')
        	alert("이메일이 올바르지 않습니다. 다시 한번 확인해주십시오.");
    	else if('${NO}' == 'noPw')
    		alert("회원님의 이메일과 비밀번호가 올바르지 않습니다. 다시 한번 확인해주십시오.");
    </script>
</body>
 
</html>