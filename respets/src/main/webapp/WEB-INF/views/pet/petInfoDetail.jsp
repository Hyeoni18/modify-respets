<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Respets :: 반려동물 상세 정보</title>
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
								<h4 class="page-title">반려동물 상세 정보</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<form name="petInfoDetail" method="post">
						<div class="row">
							<div class="col-12">
								<div class="card bg-primary">
									<div class="card-body profile-user-box">

										<div class="row">
											<div class="col-sm-8">
												<div class="media">
													<span class="float-left mr-4"><img id="upload"
														src="${petInfo.petCours}" alt="pet profile"
														style="width: 100px;height: 100px;"
														class="rounded-circle img-thumbnail"></span>
													<div class="media-body">
														<h4 class="mt-1 mb-1 text-white">${petInfo.petName}</h4>
														<p class="font-13 text-white-50">${petInfo.petKnd}</p>

														<ul class="mb-0 list-inline text-light">
															<li class="list-inline-item mr-3">
																<h5 class="mb-1">
																	${petInfo.petBirth}년생
																</h5>
															</li>
															<li class="list-inline-item">
																<h5 class="mb-1">
																	<c:if test="${'F' eq petInfo.petSex}">암컷</c:if>
																	<c:if test="${'M' eq petInfo.petSex}">수컷</c:if>
																</h5>
															</li>
														</ul>
													</div>
													<!-- end media-body-->
												</div>
											</div>
											<!-- end col-->

											<div class="col-sm-4">
												<div class="text-center mt-sm-0 mt-3 text-sm-right">
													<button type="button" class="btn btn-light"
														onclick="javascript:forward(this)" id="edit">
														<i class="mdi mdi-pencil mr-1"></i> 수정
													</button>
													<button type="button" class="btn btn-light"
														style="margin-left: 10px;" onclick="javascript:deleteChk(this)" id="delete">
														<i class="mdi mdi-delete-empty mr-1"></i> 삭제
													</button>
												</div>
											</div>
											<!-- end col-->
										</div>
										<!-- end row -->
									</div>
									<!-- end card-body/ profile-user-box-->
								</div>
								<!-- end card -->

								<div class="card">
									<div class="card-body">
										<h4 class="header-title mt-0 mb-3">Pet Detail Information</h4>
										<div class="row">
											<div class="col-lg-6">
												<div class="text-left">
												<c:forEach var="item" items="${petDtlInfo}" varStatus="status">
													<p class="text-muted">
														<strong>${item.petInfo} :</strong> <span class="ml-2">${item.petDtlInfo}</span>
													</p>
									       		</c:forEach>
									        	</div>
									        </div> 
										</div>
										<!-- end row-->
									</div>
									<!-- end card-body -->
								</div>
								<!-- end card -->
							</div>
							<!-- end col -->
						</div>
						<input type="hidden" value="${petInfo.perNo}" name="perNo" /> 
						<input type="hidden" value="${petInfo.petNo}" name="petNo" />
					</form>
				</div>
				<!-- container -->
</body>
<script>
${Fail}

function deleteChk(button) {
		var con = confirm('정말로 삭제하겠습니까?');
		con;
		if (con == false) {
			return false;
		}else forward(button);
	}
	function forward(button) {
		var frm = document.petInfoDetail;
		if (button.id == 'edit') {
			frm.action = "petInfoUpdateForm";
		}
		if (button.id == 'delete') {
			frm.action = "deletePet";
		}
		frm.submit();
	}
</script>
</html>