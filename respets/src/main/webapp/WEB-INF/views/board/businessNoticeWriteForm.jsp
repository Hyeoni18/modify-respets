<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
</head>
<body>
		<div class="container-fluid">
			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<h4 class="page-title">게시글 작성</h4>
					</div>
				</div>
			</div>
			<!-- end page title -->
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<form action="insertBoard" name="businessNoticeWriteForm" method="get">
								<div class="form-group mb-3">
									<label for="example-select">카테고리</label> 
									<select	class="form-control" name="ctgrCd" id="ctgrCd">
										<option value="">선택</option>
											<c:if test="${userInfo.type=='B'}">
												<option value="BBC0001">공지사항</option>
												<option value="BBC0002">이벤트</option>
											</c:if>
											<c:if test="${userInfo.type=='A'}">
												<option value="ABC0001">개인</option>
												<option value="ABC0002">기업</option>
											</c:if>
									</select>
								</div>
								<div class="form-group">
									<label for="simpleinput">제목</label> <input type="text"
										id="simpleinput" class="form-control" name="boardTitle" value="${boardInfo.boardTitle}"
										placeholder="게시글 제목을 입력하세요">
								</div>
								<div class="form-group">
									<label for="simpleinput">내용</label>
									<textarea data-toggle="maxlength" class="form-control"
										maxlength="1000" rows="10" name="boardContent" 
										placeholder="게시글 내용을 입력하세요"> ${boardInfo.boardContent} </textarea>
								</div>
								<div style="text-align: right">
									<button id="businessNoticeInsertSubmit"
										class="btn btn-success btn-sm mt-2">
										<i class="mdi mdi-content-save-outline mr-1"></i> Save
									</button>
								</div>
							</form>
						</div>
					</div>
					<!-- end card-->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->

		</div>
 </body>
<script>

	$(document).ready(function() {
		//불러온 값에 selected속성 부여하기
		$("#ctgrCd option").each(function() {
			if ($(this).val() == "${boardInfo.ctgrCd}")
				$(this).attr("selected", "selected");
		})
	});

	$("#businessNoticeInsertSubmit").click(function() {
		var frm = document.businessNoticeWriteForm;
		var length = frm.length - 1;
		for (var i = 0; i < length; i++) {
			if (frm[i].name == "ctgrCd") {
				if (frm[i].value == "" || frm[i].value == null) {
					alert("카테고리가 입력되지 않았습니다");
					frm[i].focus();
					return false;
				}
			} else if (frm[i].name == "boardTitle") {
				if (frm[i].value == "" || frm[i].value == null) {
					alert("제목이 입력되지 않았습니다");
					frm[i].focus();
					return false;
				}
			} else if (frm[i].name == "boardContent") {
				if (frm[i].value == "" || frm[i].value == null) {
					alert("내용이 입력되지 않았습니다");
					frm[i].focus();
					return false;
				}
			}
		}
		frm.submit();
	});
</script>
</html>