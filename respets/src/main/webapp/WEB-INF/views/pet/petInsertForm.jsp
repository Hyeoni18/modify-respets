<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">
<html>
<head>
<title>Respets :: 반려동물 등록</title>
</head>
<body>
				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<div class="page-title-right">
									<form class="form-inline"></form>
								</div>
								<h4 class="page-title">반려동물 정보 등록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<p class="text-muted">반려동물의 정보는 업체에게 매우 필요한 정보로써 최대한 구체적으로
										작성하실 수록 상호간 소통이 원활합니다.</p>
									<form action="insertPet" name="petInsertForm"
										enctype="multipart/form-data" method="post">
										<div class="row">
											<div class="col-lg-12">

												<div class="form-group mb-3">
													<label for="example-fileinput" style="margin-right:15px;">프로필 사진</label><input
														type="file" name="upload"/>
												</div>
											</div>
											<div class="col-lg-6">

												<div class="form-group mb-3">
													<label for="simpleinput">이름<span style="color: red">*</span></label>
													<input type="text" name="petName" id="simpleinput"
														class="form-control"> <span
														class="font-13 text-muted">e.g "바둑이"</span>
												</div>

												<div class="form-group mb-3">
													<label for="petKnd">품종<span style="color: red">*</span></label>
													<input type="text" name="petKnd" id="petKnd"
														class="form-control"> <span
														class="font-13 text-muted">e.g "진돗개"</span>
												</div>

												<div class="form-group mb-3">
													<label for="petSex">성별<span
														style="color: red">*</span></label> <select class="form-control"
														id="petSex" name='petSex'>
														<option value="">선택</option>
														<option value='F'>암컷</option>
														<option value='M'>수컷</option>
													</select> <span class="font-13 text-muted">e.g "암컷"</span>
												</div>

												<div class="form-group mb-3">
													<label for="petBirth">출생년도<span
														style="color: red">*</span></label> <input type="text"
														name="petBirth" id="petBirth" class="form-control">
													<span class="font-13 text-muted">e.g "YYYY"</span>
												</div>

												<div class="form-group mb-3">
													<label for="petNtr">중성화 수술<span
														style="color: red">*</span></label> <select class="form-control"
														id="petNtr" name="petNtr">
														<option value="">선택</option>
														<option value='O'>중성화 했음</option>
														<option value='X'>중성화 안했음</option>
													</select> <span class="font-13 text-muted">e.g "중성화 했음"</span>
												</div>
											</div>
											<!-- end col -->

											<div class="col-lg-6">
											
												<c:forEach var="item" items="${petInfoCode}">
													<div class="form-group mb-3">
														<label for="petDtlInfo">${item.cdDesc}</label> <input type="text"
															name="petDtlInfo" id="petDtlInfo" class="form-control">
														<input type="hidden" id="petInfoCd" name="petInfoCd" value="${item.cmmnCd}">
													</div>
									        	</c:forEach>

												<div style="text-align: right;">
													<input type="hidden" value="${userInfo.no}" name="perNo" />
													<input type="reset" class="btn btn-success" value="초기화" />&nbsp;
													<input type="button" class="btn btn-success" value="등록 완료"
														id="petInsertSubmit" />
												</div>


											</div>
											<!-- end col -->
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
${alert}

	$("#petInsertSubmit").click(function() {
		var frm = document.petInsertForm;
		var length = frm.length - 3;
		for (var i = 0; i < length; i++) {
			if (frm[i].name == "petName") {
				if (frm[i].value == "" || frm[i].value == null) {
					alert("이름이 입력되지 않았습니다");
					frm[i].focus();
					return false;
				}
			} else if (frm[i].name == "petKnd") {
				if (frm[i].value == "" || frm[i].value == null) {
					alert("품종이 입력되지 않았습니다");
					frm[i].focus();
					return false;
				}
			} else if (frm[i].name == "petSex") {
				if (frm[i].value == "" || frm[i].value == null) {
					alert("성별이 입력되지 않았습니다");
					frm[i].focus();
					return false;
				}
			} else if (frm[i].name == "petBirth") {
				if (frm[i].value == "" || frm[i].value == null) {
					alert("출생년도가 입력되지 않았습니다");
					frm[i].focus();
					return false;
				}
			} else if (frm[i].name == "petNtr") {
				if (frm[i].value == "" || frm[i].value == null) {
					alert("중성화수술 여부가 입력되지 않았습니다");
					frm[i].focus();
					return false;
				}
			}
		}
		frm.submit();
	});

</script>
</html>