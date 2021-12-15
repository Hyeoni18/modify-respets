<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Respets :: 나의 회원 정보</title>
</head>
<body>
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<h4 class="page-title">나의 회원 정보</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<form name="myInfo" method="get">
						<div class="row">
							<div class="col-12">
								<div class="card bg-primary">
									<div class="card-body profile-user-box">

										<div class="row">
											<div class="media">
												<span class="float-left mr-4"> <img id="perProfile"
													src="${userInfo.fileId}"
													style="width: 150px; height: 150px; margin-top: 15px; margin-left: 20px;"
													class="rounded-circle img-thumbnail"></span>
												<div class="media-body">
													<br />
													<h3 class="mt-1 mb-1 text-white">${userInfo.name}</h3>
													<h5 class="mt-1 mb-1 text-white">${userInfo.email}</h5>
													<h5 class="mt-1 mb-1 text-white">${userInfo.phone}</h5>
													<br /> <br />
													<button type="button" class="btn btn-light"
														onclick="javascript:forward(this)" id="pw">
														<i class=" mdi mdi-lock"></i> 비밀번호 수정
													</button>
													&nbsp;&nbsp;
													<button type="button" class="btn btn-light"
														onclick="javascript:forward(this)" id="edit">
														<i class="mdi mdi-pencil mr-1"></i> 회원 정보 수정
													</button>
													&nbsp;&nbsp;
													<button type="button" class="btn btn-light"
														onclick="javascript:forward(this)" id="delete">
														<i class="mdi mdi-delete-empty mr-1"></i> 회원 탈퇴
													</button>
												</div>
												<!-- end media-body-->
											</div>
											<!-- end col-->
										</div>
										<!-- end row -->
									</div>
									<!-- end card-body/ profile-user-box-->
								</div>
								<!-- end card -->
								<c:if test="${userInfo.type=='B'}">
									<div class="card">
									<div class="card-body">
										<h4 class="header-title mt-0 mb-3">Detail Information</h4>
										<div class="row">
											<div class="col-lg-6">
												<div class="text-left">
													<table>
														<tr>
															<td><p class="text-muted" align="right">
																	<strong>주력 서비스 :&nbsp;&nbsp;</strong>
																</p></td>
															<td><p class="text-muted" id="svcNm">${businessInfo.svcNm}</p></td>
														</tr>
														<tr>
															<td><p class="text-muted" align="right">
																	<strong>대표자명 :&nbsp;&nbsp;</strong>
																</p></td>
															<td><p class="text-muted" id="busCeo">${businessInfo.busCeo}</p></td>
														</tr>
														<tr>
															<td><p class="text-muted" align="right">
																	<strong>사업자등록번호 :&nbsp;&nbsp;</strong>
																</p></td>
															<td><p class="text-muted" id="busLcno">${businessInfo.busLcno}</p></td>
														</tr>
													</table>
												</div>
											</div>
											<!-- end col -->
	
										</div>
										<!-- end row-->
	
									</div>
									<!-- end card-body -->
								</div>
								<!-- end card -->
							</c:if>
							</div>
						</div>
					</form>
				</div>
				<!-- container -->
			<!-- content -->
	<!-- alert -->
	
</body>
<!-- App js -->
<script>
${Fail} ${infoSuccess} ${alert}

	function forward(button) {
		var frm = document.myInfo;
		if (button.id == 'pw') {
			frm.action = "myPwUpdateForm";
		}
		if (button.id == 'edit') {
			frm.action = "myInfoUpdateForm";
		}
		if (button.id == 'delete') {
			var det;
			det = confirm("정말 탈퇴하시겠습니까?");
			if (det) {
				frm.action = "deleteUser";
			} else {
				frm.action = "myInfo"
			}
		}
		frm.submit();
	}
</script>
</html>