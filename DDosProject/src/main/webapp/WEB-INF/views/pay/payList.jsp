<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

	$(function(){
		Nonpay_search();
	})
	
	
	function Nonpay_search(){
		$("#overdueList").empty();
		document.getElementById("hap").innerHTML = '0';
		var $add = "";
		$.ajax({
			data : { id : "${login.id}"},
			type : "post",
			url : "Nonpayment_book",
			async: false,
			success : function(datas) {
				if(datas.length == 0){
					$add += "<tr><Td colspan='7'>연체 목록이 없습니다.</td></tr>";
				}else{  
					for(var i=0; i<datas.length; i++){
						$add += "<tr>" +
								"<td><input type=	checkbox name='check' value='" + datas[i].rentalNum + "' onclick=check_ck()></td>" +
								"<td>" + datas[i].bookTitle + "</td>" + 
								"<td>" + datas[i].rentalDate + "</td>" +
								"<td>" + datas[i].dueDate + "</td>" +
								"<td>" + datas[i].returnDate + "</td>" +
								"<td>" + datas[i].overdue + "</td>" + 
								"<td>" + datas[i].money + "</td></tr>";
					}
				}
				
				$($add).prependTo("#overdueList");
			}
		})
	}
	
	function check_ck(){
		var checkbox = $("input[name=check]:checked");
		var result = 0;
		result = Number(result);
		
		checkbox.each(function(i) {
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();

			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var money = td.eq(6).text();
			
			money = Number(money);
			
			result = result + money; 	
			
		})
		
		document.getElementById("hap").innerHTML = result;
		 
	}  

	function all_check(){
		if($("#checkyn").prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			 $("input[type=checkbox]").prop("checked",false);
		}
		check_ck();
	}

	var IMP = window.IMP; // 생략가능
	IMP.init('imp39765501'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	function pay() {
			var $name, $tel, $addr;
			
			$.ajax({
				data : {id : "${login.id}" },
				url : "getUser",
				method : "post", 
				success : function(result) {	
					IMP.request_pay({
						pg : 'html5_inicis', // version 1.1.0부터 지원.
						pay_method : 'card',
						merchant_uid : 'merchant_' + new Date().getTime(),
						name : '연체비',
						amount : $("#hap").text(),
						buyer_email : "${login.id}",
						buyer_name : result.name,
						buyer_tel : result.phone,
						buyer_addr : result.address ,
						buyer_postcode : '123-456',
						m_redirect_url : 'http://localhost:8081/ddos/payList'
					}, function(rsp) {
						if (rsp.success) {
							var msg = '결제가 완료되었습니다.';
							msg += '고유ID : ' + rsp.imp_uid;
							msg += '상점 거래ID : ' + rsp.merchant_uid;
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							payment_book();
						} else {
							var msg = '결제에 실패하였습니다.';
							msg += '에러내용 : ' + rsp.error_msg;
						}
						alert(msg);
						Nonpay_search();
					});
					
				}
			});
	}
	
	function payment_book(){
		var checkbox = $("input[name=check]:checked");
		var $save = new Array();
		 
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i,obj) {
			
			var num = obj.value;
			$save.push(num);
			
		});
		
		var params = { "arr" : $save };
		
		console.log($save);
		
		$.ajax({
			url : "paymentBook",
			type : "post",
			dataType : "json",
			contentType:'application/json;charset=utf-8',
			data : JSON.stringify(params),
			async: false
		});

	}
</script>

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
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">결제 페이지</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item active" aria-current="page">Pay</a></li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!--  header -->

				<div class="row">
					<div class="col-sm">
					<h1 align="center">연체 내역</h1>
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<form name="checkform">
									<table id="getOverdue" width="100%"
										class="table table-bordered table-hover text-center">
										<tr>
											<td width="8%"><input type="checkbox" onclick="all_check()"
												id="checkyn">전체선택</td>
											<td width="35">책 제목</td>
											<td width="13%">대여일자</td> 
											<td width="13%">반납예정일</td>
											<td width="13%">반납일</td>
											<td width="10%">연체일수</td>
											<td width="10%">금액</td>
										</tr>
										<tbody id="overdueList">
											
										</tbody>
									</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div align="right">
					<span style="font-size: 30pt;">합계 :</span>
					<span id="hap" style="font-size: 30pt;"></span>
					<span style="font-size: 30pt;">원</span>
				</div>
				
				<div align="center">
					<input type="button" class="btn btn-secondary" value="결제" onclick="pay()" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>