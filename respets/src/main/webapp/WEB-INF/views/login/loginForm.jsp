<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Respets :: 로그인</title>
<script>
	${paramMap.alert}
	${alert}
</script>
</head>
<body class="authentication-bg enlarged">
	<div class="account-pages mt-5 mb-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="card">

						<!-- Logo -->
						<div class="card-header pt-4 pb-4 text-center bg-success">
							<div class="respets-logo-white" style="height: 45px;"></div>
						</div>

						<div class="card-body p-4">
							<div class="text-center w-75 m-auto">
								<h4 class="text-dark-50 text-center mt-0 font-weight-bold">로그인</h4>
								<p class="text-muted mb-4">계정과 비밀번호를 입력해주세요.</p>
							</div>

							<form action="${pageContext.request.contextPath}/login/loginProcess" method="post">
								<div class="form-group">
									<a href="${pageContext.request.contextPath}/login/findIdForm" class="text-muted float-right">
									<small>이메일/비밀번호 찾기</small></a> 
																		
									<label for="email">이메일 주소</label> 
									<input class="form-control" type="text" id="email" name="email" placeholder="이메일을 입력해주세요.">
								</div>

								<div class="form-group">
									
									<label for="pw">비밀번호</label> <input
										class="form-control" type="password" id="pw" name="pw"
										placeholder="비밀번호를 입력해주세요.">
								</div>
								
								<div class="form-group mb-0 text-center">
									<button class="btn btn-success" type="submit">로그인</button>
								</div>
							</form>
							<div class="row mt-3">
								<div class="col-12 text-center">
									<p class="text-muted">
										계정이 없으십니까? <a href='${pageContext.request.contextPath}/login/joinChoiceForm' class="text-dark ml-1">
											<b>회원가입</b>
										</a>
									</p>
								</div>
							</div>
						</div>
						<!-- end card-body -->
					</div>
					<!-- end card -->
					<!-- end col -->
				</div>
				<!-- end row -->

			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
	<!-- end page -->

	<footer class="footer footer-alt"> Copyright Respets Corp. All rights reserved. </footer>

</body>
</html>