<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Respets</title>

<body onunload="logout();">
	<!-- Topbar Start -->
	<div class="navbar-custom topnav-navbar">
		<div class="container-fluid">

			<!-- LOGO -->
			<a href="./" class="topnav-logo"> <span	class="topnav-logo-lg topnav-logo-lg-img"> <img src="${pageContext.request.contextPath}/resources/images/logo-mint.png" alt="respets logo" height="30">
			</span> <span class="topnav-logo-sm"> <img
					src="${pageContext.request.contextPath}/resources/images/logo-sm.png"
					alt="respets logo" height="30">
			</span>
			</a>

			<!-- 로그인 하지 않았을때 -->
			<div id="logoutTopBar">
				<a href='${pageContext.request.contextPath}/login/loginForm' id='loginForm'>로그인</a>
				<a href='${pageContext.request.contextPath}/login/joinChoiceForm' id='joinChoiceForm'>회원가입</a>
			</div>

			<ul class="list-unstyled topbar-right-menu float-right mb-0"
				id="loginTopBar">
				<form id="logoutFrm" action="${pageContext.request.contextPath}/login/logout" method="post">
					<a href="javascript:logoutFrm()">로그아웃</a>
				</form>
				
				<a href='./dashboard' id='dashboard'>마이페이지</a>
				<!-- <form id="dashboard" action="dashboard">
					<button>개인마이페이지</button>
				</form> -->
				
				<a href='./myPage' id='myPage'>기업마이페이지</a>
				<a href='./personalCalendar' id='personalCalendar'>스케줄</a>

				<button id="myPage" onclick="location.href='./todayScheduleList'">
					기업마이페이지</button>
				<button onclick="location.href='./personalCalendar'">스케줄</button>


				<li class="dropdown notification-list"><a
					class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown"
					href="#" role="button" aria-haspopup="false" aria-expanded="false">
						<i class="dripicons-bell noti-icon"></i> <span
						class="noti-icon-badge"></span>
				</a>
					<div
						class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg">

						<!-- item-->
						<div class="dropdown-item noti-title">
							<h5 class="m-0">
								<span class="float-right"> <a href="javascript: void(0);"
									class="text-dark"> <small>Clear All</small>
								</a>
								</span>알림
							</h5>
						</div>

						<ul class="list-unstyled topbar-right-menu float-right mb-0"
							id="loginTopBar">
							<form id="logoutFrm" action="${pageContext.request.contextPath}/login/logout" method="post">
								<a href="javascript:logoutFrm()">로그아웃</a>
							</form>
							
							<form id="dashboard" action="./dashboard">
								<button>개인마이페이지</button>
							</form>

							<form id="myPage" action="./myPage">
								<button>기업마이페이지</button>
							</form>

							<button onclick="location.href='#'">스케줄</button>

							<li class="dropdown notification-list"><a
								class="nav-link dropdown-toggle arrow-none"
								data-toggle="dropdown" href="#" role="button"
								aria-haspopup="false" aria-expanded="false"> <i
									class="dripicons-bell noti-icon"></i> <span
									class="noti-icon-badge"></span>
									<div class="slimscroll" style="max-height: 230px;">
										<!-- item-->
										<a href="javascript:void(0);"
											class="dropdown-item notify-item">
											<div class="notify-icon bg-primary">
												<i class="mdi mdi-comment-account-outline"></i>
											</div>
											<p class="notify-details">
												Caleb Flakelar commented on Admin <small class="text-muted">1
													min ago</small>
											</p>
										</a>

										<!-- item-->
										<a href="javascript:void(0);"
											class="dropdown-item notify-item">
											<div class="notify-icon bg-info">
												<i class="mdi mdi-account-plus"></i>
											</div>
											<p class="notify-details">
												New user registered. <small class="text-muted">5
													hours ago</small>
											</p>
										</a>
									</div> <!-- All--> <a href="javascript:void(0);"
									class="dropdown-item text-center text-primary notify-item notify-all">
										View All </a>
					</div></li>

				<li class="dropdown notification-list"><a
					class="nav-link dropdown-toggle nav-user arrow-none mr-0"
					data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
					aria-expanded="false"> <span class="account-user-avatar">
							<img
							src="${loc}${photo}"
							alt="user-image" class="rounded-circle">
					</span> <span> <span class="account-user-name">${name}</span> <span
							class="account-position" id="memberType"></span>
					</span>
				</a>
					<div
						class="dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown ">
						<!-- item-->
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome Respets!</h6>
						</div>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="mdi mdi-account-settings-variant"></i> <span>스케줄</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="mdi mdi-account-circle"></i> <span>마이페이지</span>
						</a>

						<!-- item-->
						<a href="javascript:void(0);" class="dropdown-item notify-item">
							<i class="mdi mdi-logout"></i> <span>로그아웃</span>
						</a>

					</div></li>

			</ul>
			<a class="navbar-toggle" data-toggle="collapse"
				data-target="#topnav-menu-content">
				<div class="lines">
					<span></span> <span></span> <span></span>
				</div>
			</a>
		</div>
	</div>

	<div id="no">${userInfo.no}</div>
</body>
<script>
	$('#no').hide();

	var no = '${userInfo.no}';
	console.log(no);

	$('#dashboard').hide();
	$('#myPage').hide();
	$('#personalCalendar').hide();

	if ('${userInfo.no}'.match(/B/)) {
		$('#dashboard').hide();
		$('#myPage').show();
		$('#personalCalendar').hide();
	} else if ('${userInfo.no}'.indexOf(/P/)) {
		$('#dashboard').show();
		$('#myPage').hide();
		$('#personalCalendar').show();
	}

	if (no == null || no == "") {
		$('#loginTopBar').hide();
		$('#logoutTopBar').show();
	} else {
		$('#loginTopBar').show();
		$('#logoutTopBar').hide();
	}

	if ('${userInfo.no}'.match(/P/)) {
		$('#memberType').html('개인회원');
	} else if ('${userInfo.no}'.match(/B/)) {
		$('#memberType').html('기업회원');
	} else {
		$('#memberType').html(' ');
	}

	function logoutFrm() {
		$('#logoutFrm').submit();
	}

	function logout() {
		location.href = '${pageContext.request.contextPath}/login/logout'
	}
</script>
