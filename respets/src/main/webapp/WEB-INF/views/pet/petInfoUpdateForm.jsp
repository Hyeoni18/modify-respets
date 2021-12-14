<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Respets :: 반려동물 정보 수정</title>
<style type="text/css">
#petProfile {
	width: 150px;
	height: 150px;
	margin-top: 20px;
}
</style>
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

									<form action="updatePet" name="petInfoUpdateForm"
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
													<label for="petName">이름<span style="color: red">*</span></label>
													<input type="text" name="petName" id="petName"
														class="form-control" value="${petInfo.petName}"> <span
														class="font-13 text-muted">e.g "바둑이"</span>
												</div>

												<div class="form-group mb-3">
													<label for="petKnd">품종<span style="color: red">*</span></label>
													<input type="text" name="petKnd" id="petKnd"
														class="form-control" value="${petInfo.petKnd}"> <span
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
														name="petBirth" id="petBirth" class="form-control" value="${petInfo.petBirth}">
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
														<label for="petDtlInfo">${item.cdDesc}</label> 
														<input type="text" name="petDtlInfo" id="${item.cmmnCd}" class="form-control">
														<input type="hidden" name="petInfoCd" value="${item.cmmnCd}">
													</div>
									        	</c:forEach>
												<div style="text-align: right;">
													<input type="hidden" value="${petInfo.petNo}" name="petNo" />
													<input type="reset" class="btn btn-success" value="초기화" />&nbsp;
													<input type="submit" class="btn btn-success" value="수정 완료"
														id="petUpdateSubmit" />
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
	$(document).ready(function() {
		//불러온 값에 selected속성 부여하기
		$("#petSex option").each(function() {
			if ($(this).val() == "${petInfo.petSex}")
				$(this).attr("selected", "selected");
		})
		$("#petNtr option").each(function() {
			if ($(this).val() == "${petInfo.petNtr}")
				$(this).attr("selected", "selected");
		})
		
		var list = new Array();
		<c:forEach items="${petDtlInfo}" var="item">
			list.push("${item.petInfoCd}");
			list.push("${item.petDtlInfo}");
		</c:forEach>
		for (var i = 0; i < list.length; i++) {
			$("#"+list[i]).val(list[++i]);
		}
	});
	
	$("#petUpdateSubmit").click(function() {
		console.log(this.value + " 클릭함");
		var frm = document.petInfoUpdateForm;
		var length = frm.length - 4;
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