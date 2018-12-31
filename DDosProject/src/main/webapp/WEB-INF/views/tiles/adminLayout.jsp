<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="assets/libs/css/style.css">
<link rel="stylesheet"
	href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet" href="assets/vendor/vector-map/jqvmap.css">
<link href="assets/vendor/jvectormap/jquery-jvectormap-2.0.2.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="assets/vendor/charts/chartist-bundle/chartist.css">
<link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
<link rel="stylesheet"
	href="assets/vendor/charts/morris-bundle/morris.css">
<link rel="stylesheet" type="text/css"
	href="assets/vendor/daterangepicker/daterangepicker.css" />
<title>DDos</title>

<style>
.logoutbtn{
margin-left:2%;
margin-rigth:2%;
margin-top:2%;
}

</style>

</head>
<!-- Optional JavaScript -->
            <!-- jquery 3.3.1 -->
            <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
            <!-- bootstap bundle js -->
            <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
            <!-- slimscroll js -->
            <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
            <!-- main js -->
            <script src="assets/libs/js/main-js.js"></script>
<body>

	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- navbar -->
		<!-- ============================================================== -->
		<div class="dashboard-header">
			<nav class="navbar navbar-expand-lg bg-white fixed-top">
				<a class="navbar-brand" href="adminHome">DDOS</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse " id="navbarSupportedContent">
					<ul class="navbar-nav navbar-right-top" style="margin-left:78%;">
						<li class="nav-item">
							<div id="custom-search" class="top-search-bar">
								<input class="form-control" type="text" placeholder="Search..">
							</div>
						</li>
						<li class="nav-item dropdown notification"><a
							class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
								class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
							<ul
								class="dropdown-menu dropdown-menu-right notification-dropdown">
								<li>
									<div class="notification-title">Notification</div>
									<div class="notification-list">
										<div class="list-group">
											<a href="#"
												class="list-group-item list-group-item-action active">
												<div class="notification-info">
													<div class="notification-list-user-img">
														<img src="assets/images/avatar-2.jpg" alt=""
															class="user-avatar-md rounded-circle">
													</div>
													<div class="notification-list-user-block">
														<span class="notification-list-user-name">Jeremy
															Rakestraw</span>accepted your invitation to join the team.
														<div class="notification-date">2 min ago</div>
													</div>
												</div>
											</a> 
										</div>
									</div>
								</li>
								<li>
									<div class="list-footer">
										<a href="#">View all notifications</a>
									</div>
								</li>
							</ul></li>
						
						<li class="nav-item dropdown nav-user logoutbtn">
							<a href="logout" class="btn btn-rounded btn-dark">Log&nbsp;Out</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<!-- ============================================================== -->
		<!-- end navbar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- left sidebar -->
		<!-- ============================================================== -->
		<div class="nav-left-sidebar sidebar-dark">
			<div class="menu-list">
				<nav class="navbar navbar-expand-lg navbar-light">
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav flex-column">
							<li class="nav-divider">MEMBER</li>
							
							
							<li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>User</a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        
                                        <li class="nav-item">
                                            <a class="nav-link" href="getUserList?id=${login.id}" style="margin-top:2%; margin-bottom:2%;">Customer List</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="userDetail?id=${login.id}" style="margin-top:2%; margin-bottom:2%;">Manager Information</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </li>
							<li class="nav-divider">Function</li>
							
						<li class="nav-item">
                                <a class="nav-link collapsed" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fas fa-book"></i>Library</a>
                                <div id="submenu-2" class="submenu collapse" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="adminWishBook">WishBook <span class="badge badge-secondary">New</span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="admincollection">Collection</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="adminreturn">Return</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </li>
							
							
							<li class="nav-item ">
								<a class="nav-link" href="adminread">
									<i class="fab fa-fw fa-wpforms"></i>
									Seat Setting
								</a>
							</li>
							
							<li class="nav-item">
								<a class="nav-link" href="getStudyList">
									<i class="fas fa-fw fa-file"></i> 
									Study & Study Room
								</a>
							</li>
							
							<li class="nav-item">
								<a class="nav-link" href="getNoticeList">
									<i class="fas fa-bullhorn"></i>
									Notice
								</a>
							</li>
							
							<li class="nav-item">
								<a class="nav-link" href="AdmingetSuggestionList">
									<i class="fas fa-comment-dots"></i>
									Suggestion
								</a>
							</li>
							
							<li class="nav-item">
								<a class="nav-link" href="getEventList">
									<i class="fas fa-fw fa-columns"></i>
									Events
								</a>
							</li>
							
							
							<li class="nav-item">
                                <a class="nav-link collapsed" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-fw fa-chart-pie"></i>Chart</a>
                                <div id="submenu-3" class="submenu collapse" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="GenreForm">STATISTICS</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="readingRoom">Reading Room</a>
                                        </li>
                                       
                                    </ul>
                                </div>
                            </li>
							<!-- <li class="nav-divider"></li>
							<li class="nav-item">
								<a class="nav-link" href="GenreForm">
									<i class="fas fa-fw fa-columns"></i>
									Book
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="readingRoom">
									<i class="fas fa-fw fa-columns"></i>
									Reading Room
								</a>
							</li>
							 -->
							<li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fa fa-fw fa-user-circle"></i>Assets</a>
                                <div id="submenu-3" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        
                                        <li class="nav-item">
                                            <a class="nav-link" href="expenditureForm" style="margin-top:2%; margin-bottom:2%;">Monthly earnings</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="incomeForm" style="margin-top:2%; margin-bottom:2%;">unsuccessful list</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="totalAssetsForm" style="margin-top:2%; margin-bottom:2%;">Total</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </li>
							
						</ul>
						
					</div>
				</nav>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- end left sidebar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="dashboard-finance">
				<div class="container-fluid dashboard-content">
					<tiles:insertAttribute name="content" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>