<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function check(page){
		if (document.getElementById("searchKeyword").value == "") {
			alert("검색어를 입력하세요.");
			document.getElementById("searchKeyword").focus();
		}else{
			var params = $("#Search").serialize();
			
			if(page == undefined || page == ""){
		         page=1
		    }
			
			var params = $("#Search").serialize() + "&page=" + page;
			
			console.log(params);
				
			$.ajax({
				url : "rentalSearch",
				type : "post",
				dataType : "json",
				data : params,
				success: function(datas){
					console.log(datas);
				 	var $add = "";
				 	var $page = "";
				 	$("#searchData").empty();
					$("#paging").empty(); 
					for(var i=0; i<datas.result.length; i++){
						$add += "<tr>"; 
						$add += "<td><input type=checkbox name=check></td>";
						$add += "<td>"+ datas.result[i].bookTitle + "</td>" + 
								"<td>" + datas.result[i].isbn + "</td>" + 
								"<td>" + datas.result[i].rentalDate + "</td>" + 
								"<td>" + datas.result[i].dueDate + "</td>" + 
								"<td>" + datas.result[i].memberId + "</td>" +
								"</tr>";
					}	//for	
					
					$page += "<nav aria-label='Page navigation example'>" + 
					  "<ul class=pagination style='text-align:right'>" + 
					  "<li class=page-item>" +  
				 	  "<a href='#'class='page-link'  onclick='check(1)' >&laquo;</a></li>";
	            
	          		var begin = datas.paging.startPage;
	           		var end = datas.paging.lastPage;               
	          	    for(j = begin; j <= end; j++ ) {
	              		if(j != datas.paging.page) {
	                	  $page += "<li class='page-item'><a href='#' class='page-link' onclick='check("+j+")'>"+j+"</a></li>";
	              		}
	               		else if(j == datas.paging.page) {
	                 		$page += "<li class='page-item active'><a href='#' class='page-link' class='active'>"+j+"</a></li>";
	              		}  
	           		}
	           		
	          	    $page += "<li class=page-item><a href='#' class='page-link' onclick='check("+datas.paging.lastPage+")'>&raquo;</a></li></ul></nav>";
	           		$($page).appendTo("#paging");		

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
		
		alert("반납완료 되었습니다.");
		$("input:checkbox[name=checkyn]").prop("checked",false);
		
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
											<td><input type="checkbox" onclick="all_check()" name="checkyn" id="checkyn"></td>
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
							<div id="paging"  class="card-footer" style="margin: auto; background-color: #fff; border-top: 0px;" ></div>
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