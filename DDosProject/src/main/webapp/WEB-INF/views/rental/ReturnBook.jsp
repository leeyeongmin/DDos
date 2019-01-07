<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function check(){
		if (document.getElementById("searchKeyword").value == "") {
			alert("검색어를 입력하세요.");
			document.getElementById("searchKeyword").focus();
		}else{
			var params = $("#Search").serialize();
			
			$.ajax({
				url : "rentalSearch",
				type : "post",
				dataType : "json",
				data : params,
				success: function(datas){
				 	var $add = "";
				 	$("#searchData").empty(); 
					for(var i=0; i<datas.length; i++){
						$add += "<tr>"; 
						$add += "<td><input type=checkbox name=check></td>";
						$add += "<td>"+ datas[i].bookTitle + "</td>" + 
								"<td>" + datas[i].isbn + "</td>" + 
								"<td>" + datas[i].rentalDate + "</td>" + 
								"<td>" + datas[i].dueDate + "</td>" + 
								"<td>" + datas[i].memberId + "</td>" +
								"</tr>";
					}	//for	
					
					$($add).prependTo("#searchData"); 
					document.getElementById("searchKeyword").focus();
				}
				 
			});
		}
	}

	function all_check(){
		if($("#checkyn").prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			 $("input[type=checkbox]").prop("checked",false);
		}
	}
	
	function returnBook(){
		
		var checkbox = $("input[name=check]:checked");
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {

			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();

			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var isbn = td.eq(2).text();
			var rental_date = td.eq(3).text();
			var login = td.eq(5).text();
	
			var params = {isbn : isbn, rentalDate : rental_date, memberId : login };
			
			$.ajax({
				url : "returnBook",
				type : "post",
				dataType : "json",
				data : params,
				async: false
			})
		});
		
		if($("input:checkbox[name=check]").length != 0){
			check();	
		}
		
	}
	
</script>

</head>
<body>
<div class="dashboard-main-wrapper">

		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="influence-finder">
			<div class="container-fluid dashboard-content">
				<!-- ============================================================== -->
				<!-- pageheader -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h3 class="mb-2">Return</h3>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminHome"
											class="breadcrumb-link">DDos</a></li>
										<li class="breadcrumb-item">Book</li>
										<li class="breadcrumb-item active" aria-current="page">Return</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end pageheader -->
				<!-- ============================================================== -->
				
				<!-- ============================================================== -->
				<!-- content -->
				<!-- ============================================================== -->
				<div class="row">
					<!-- ============================================================== -->
					<!-- search bar  -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-body">
								<form name="Search" id="Search"   method="post">
									<select class="form-control" name="searchTitle"
										style="text-align: center; width: 15%; height: 45px; display: inline-block;">
										<option value="book_title">책제목
										<option value="member_id">Id
										<option value="isbn">ISBN
									</select> 
									<input class="form-control form-control-lg"
										style="width: 75%; margin-left: 1%; display: inline-block;"
										id="searchKeyword" type="text" name="searchKeyword"
										placeholder="Search">
										<input type="hidden" name="page" />
								</form>
								<button class="btn btn-primary search-btn" onclick="check()">Search</button>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end search bar  -->
					<!-- ============================================================== -->
			 
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<!-- 검색 -->
							<div class="card-body">
								<div class="table-responsive">
									<table id="rentalSearch" width="100%"
										class="table table-bordered table-hover text-center">
										<tr>
											<td><input type="checkbox" onclick="all_check()" id="checkyn"></td>
											<td>책제목</td>
											<td>ISBN</td>
											<td>대여일자</td>
											<td>반납예정일</td>
											<td>대출자</td>
										</tr>
										<tbody id="searchData">
										
										</tbody>
									</table>
								</div>							
							</div>
							<my:paging paging="${paging}" />
								<script>
								function go_page(page) {
									document.Search.page.value = page;
									document.Search.submit();
								}
							</script>
						</div>
					</div>	
					<!-- ============================================================== -->
					<!-- end content -->
					<!-- ============================================================== -->
				</div>
			</div>

		</div>
		<!-- ============================================================== -->
		<!-- end wrapper  -->
		<!-- ============================================================== -->
	</div>
	
	<div align="center">
		<input type="button" class="btn btn-secondary" value="반납" onclick="returnBook()"/>
	</div>

</body>
</html>