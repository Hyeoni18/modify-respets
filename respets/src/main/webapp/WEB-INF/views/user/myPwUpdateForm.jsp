<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Respets :: 비밀번호 수정</title>
</head>
<body>
				<div class="container-fluid">
					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<form class="form-inline"></form>
								</div>
								<h4 class="page-title">비밀번호 수정</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="col-6">
							<div class="card">
								<div class="card-body">
									<form name="myPwUpdateForm" action="${pageContext.request.contextPath}/login/updatePw" method="post">
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group mb-3">
													<label>현재 비밀번호 <span style="color: red">*</span></label> <input
														type="password" id="nowPw" onchange="nowPwCheck();"
														class="form-control" />
														<div id="success"></div>
												</div>
												<div class="form-group mb-3">
													<label>새로운 비밀번호 <span style="color: red">*</span></label> <input
														type="password" name="newPw" id="newPw"
														onchange="pw_check();" class="form-control" />
												</div>
												<div class="form-group mb-3">
													<label>새로운 비밀번호 확인<span style="color: red">*</span></label>
													<input type="password" id="newChkPw" class="form-control"
														onchange="pw_check();" />
													<div class="registrationFormAlert" id="same"></div>
												</div>
												<div>
													<input type="submit" class="btn btn-success" id="pwOk" value="수정 완료" disabled>
												</div>
											</div>
										</div>
										<!-- end row-->
									</form>
								</div>
								<!-- end card-body -->
							</div>
							<!-- end card -->
						</div>
						<!-- end col -->
					</div>
				</div>
				<!-- container -->
</body>
<script>
$('#success').hide();
$('#same').hide();
	function nowPwCheck() {
		var nowPw = $("#nowPw").val();
		if(nowPw=="${userInfo.pw}") {
			$('#success').html("비밀번호 확인 성공").css('color', 'blue');
			$('#success').show();
		} else {
			$("#success").html("비밀번호가 일치하지 않습니다.").css('color', 'red');
			$('#success').show();
			$('#pwOk').attr('disabled', 'disabled');
		}
	}
	function pw_check() {
		var newPw = $("#newPw").val();
		var newChkPw = $('#newChkPw').val();
		if (newPw != newChkPw) {
			$("#same").html("비밀번호가 일치하지 않습니다.").css('color', 'red');
			$('#same').show();
			$('#pwOk').attr('disabled', 'disabled');
		}
		if (newPw == '' || newChkPw == '') {
			$("#same").html("비밀번호를 입력해주세요.").css('color', 'red');
			$('#same').show();
			$('#pwOk').attr('disabled', 'disabled');
		}
		if (newPw == newChkPw) {
			$("#same").html("비밀번호가 일치합니다.").css('color', 'blue');
			$('#same').show();
			$('#pwOk').removeAttr("disabled");
		}
	}
	${alert}
</script>
</html>