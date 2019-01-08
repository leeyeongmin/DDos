<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

	var IMP = window.IMP; // 생략가능
	IMP.init('imp93998128'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	function pay(){
		if('${user.expDate}' != ""){
			alert("사용기간이 만료되었습니다.");
		}else{
			alert("이용하기 위해선 연회비를 납부하셔야합니다.");
		}
		IMP.request_pay({
				pg : 'html5_inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '연회비',
				amount : 100,
				buyer_email : '${user.id}',
				buyer_name : '${user.name}',
				buyer_tel : '${user.phone}',
				buyer_addr : '${user.memSeparation}',
				buyer_postcode : '123-456',
				m_redirect_url : 'http://localhost:8081/app/ShowPay'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					document.location = "extensionUser";
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					document.location="loginHomepage";
				}
				alert(msg);
			});
	}
</script>
</head>
<body onload="pay()">
	
</body>
</html>