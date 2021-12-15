<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Respets :: 회원 정보 수정</title>
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
								<h4 class="page-title">회원 정보 수정</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="col-6">
							<div class="card">
								<div class="card-body">
									<!-- form으로 파일을 업로드할 땐 꼭 enctype을 적어줘야 한다. -->
									<form action="updateUserInfo" method="post"
										enctype="multipart/form-data">
										<div class="row">
											<div class="col-lg-12">
												<div class="form-group mb-3">
													<label style="margin-right: 15px;">프로필 사진</label> <input
														type="file" name="upload" />
													<input type="hidden" name="perNo" id="perNo"
														value="${userInfo.no}" />
												</div>
												<div class="form-group mb-3">
													<label>이메일 <span style="color: red">*</span></label> <input
														type="text" class="form-control" value="${userInfo.email}"
														disabled="disabled" />
												</div>
												<div class="form-group mb-3">
													<label>이름 <span style="color: red">*</span></label> <input
														type="text" class="form-control" value="${userInfo.name}"
														disabled="disabled" />
												</div>
												<div class="form-group mb-3">
													<label>연락처 <span style="color: red">*</span></label> <input
														type="text" class="form-control" name="perPhone"
														value="${userInfo.phone}" />
													<div class="registrationFormAlert" id="same"></div>
												</div>
												<div>
													<input type="submit" class="btn btn-success"
														onclick="return check();" value="수정 완료" />
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
	function check() {
		var result = confirm('회원 정보를 수정하시겠습니까?');
		if (result) {
			alert('수정이 완료되었습니다.');
			return true;
		}
		return false;
	}
</script>
</html>