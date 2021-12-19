<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Respets :: 기업 공지사항 상세</title>
</head>
<body>
				<div class="container-fluid">
					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<h4 class="page-title">게시글 내용</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">
							<div class="card d-block">
								<div class="card-body">
									<div class="dropdown card-widgets" id='dot'>
										<a href="javascript:void(0);"
											class="dropdown-toggle arrow-none" data-toggle="dropdown"
											aria-expanded="false"> <i class="dripicons-dots-3"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-right"
											x-placement="bottom-end"
											style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-142px, 20px, 0px);">
											<!-- item-->
											<a href="businessNoticeUpdateForm?${boardInfo.boardNo}"
												class="dropdown-item"><i class="mdi mdi-pencil mr-1"></i>Edit</a>
											<!-- item-->
											<a href="businessNoticeDelete?${boardInfo.boardNo}"
												onclick="return deleteChk(this)" class="dropdown-item"><i
												class="mdi mdi-delete mr-1"></i> Delete</a>
										</div>
									</div>

									<!-- badge-->
									<div class="badge badge-secondary mb-2"
										style="margin-bottom: 0.5rem">
										<c:if test="${'BBC0001' == boardInfo.ctgrNm}">공지사항</c:if>
										<c:if test="${'BBC0002' == boardInfo.ctgrNm}">이벤트</c:if>
									</div>
									<!-- title-->
									<h3 class="mt-0 mb-3">${boardInfo.boardTitle}</h3>

									<h5>내용</h5>
									<p class="text-muted mb-2">${boardInfo.boardContent}</p>

									<div class="row">
										<div class="col-md-4">
											<div class="mb-4">
												<h5>작성일</h5>
												<p>${boardInfo.inputDt}</p>
											</div>
										</div>
									</div>
									<div style="text-align: right">
										<input type="hidden" value="${boardInfo.boardNo}" name="boardNo" /> <input
											type="button" class="btn btn-warning"
											onclick="javascript:history.back();" value="목록" />
									</div>

								</div>
								<!-- end card-body-->

							</div>
							<!-- end card -->

						</div>
						<!-- end col -->
					</div>
					<!-- end row -->

				</div>
				<!-- content -->
</body>
<script>
	function deleteChk(a) {
		var con = confirm('정말로 삭제하겠습니까?');
		con;
		if (con == false) {
			return false;
		}
	}
	
	if ('${userInfo.no}' != null && '${userInfo.no}' != '${boardInfo.inputNo}') {
		$('#dot').hide();
	} else {
		$('#dot').show();
	}
</script>
</html>