<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Respets :: 회원 가입 선택</title>
</head>
<body class="authentication-bg">
	<div class="row justify-content-center">
		<div class="col-7" style="margin-top:150px;">
			<div class="card-deck-wrapper">
				<div class="card-deck">
					<div class="card d-block" style="text-align: center;">
					<div class="personal-img"></div>
						<div class="card-body" style="margin-bottom:30px;">
							<h5 class="card-title" style="margin-bottom:30px;">개인 회원</h5>
							<button class="btn btn-success"
								onclick="location.href='${pageContext.request.contextPath}/login/personalJoinAgreement'">가입하기</button>
						</div>
						<!-- end card-body -->
					</div>
					<!-- end card d-block -->

					<div class="card d-block" style="text-align: center;">
						<div class="business-img"></div>
						<div class="card-body" style="margin-bottom:30px;">
							<h5 class="card-title" style="margin-bottom:30px;">기업 회원</h5>
							<button class="btn btn-success"
								onclick="location.href='${pageContext.request.contextPath}/login/businessJoinAgreement'">가입하기</button>
						</div>
						<!-- end card-body -->
					</div>
					<!-- end card d-block -->
				</div>
				<!-- end card-deck -->
			</div>
			<!-- end card-deck-wrapper -->
		</div>
		<!-- col-7 -->
	</div>
	<!-- footer start -->
	<footer class="footer footer-alt"> Copyright Respets Corp. All rights reserved. </footer>
	<!-- end footer -->
</body>
</html>