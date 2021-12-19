<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html auto-config="true">
<head>
<head>
<meta charset="utf-8" />
<title>Respets :: 기업 공지사항 관리</title>
<script>
function selectBusinessNotice(){
	
	var data = {};
	//data.currentPage = page;
	
	$.ajax({
		url : "${pageContext.request.contextPath}/selectBusinessNotice",	
		type : 'POST',
		data : data,
		success : function(result){
			var tbody = $(".table tbody");
			tbody.children().remove();
			
			if(result.selectBusinessNotice.length > 0){
				$(result.selectBusinessNotice).each(function(index, item){
					tbodyHtml = "";
					tbodyHtml += '<tr><td>'+item["boardNo"]+'</td>';
					tbodyHtml += '<td>'+item["ctgrNm"]+'</td>';
					tbodyHtml += '<td><a href="businessNoticeDetail?boardNo='+item["boardNo"]+'">'+item["boardTitle"]+'</a></td>';
					tbodyHtml += '<td>'+item["inputDt"]+'</td>';
					tbodyHtml += '<td class="table-action"><a href="./businessNoticeWriteForm?boardNo='+item["boardNo"]+'" class="action-icon"><i class="mdi mdi-pencil"></i></a>/';
					tbodyHtml += '<a href="./deleteBoard?boardNo='+item["boardNo"]+'" class="action-icon" onclick="return deleteChk(this);"><i class="mdi mdi-delete"></i></a></td></tr>';
					tbody.append(tbodyHtml);
				}); 
			/* 	if(result.total % $('#pagePerRowSelect'+tab).val() == 0) {
					var totPage = Math.floor(result.total / $('#pagePerRowSelect'+tab).val());
					totPage = totPage == 0 ? totPage+1 : totPage;
					showPaging(totPage,10,parseInt(page),'selectAccdtExaminDtaList', $("#paging"+tab));
				} else {
					showPaging(Math.floor(result.total / $('#pagePerRowSelect'+tab).val()) + 1,10,parseInt(page),'selectAccdtExaminDtaList', $("#paging"+tab));
				} */
			}  else {
				tbodyHtml = "";
				tbodyHtml += '<tr><td colspan=5>검색된 데이터가 없습니다.</td></tr>';
				tbody.append(tbodyHtml);
			}  
		},
		error : function(){
			console.log("error");
		}
	});	
};

$(document).ready(function(){
	selectBusinessNotice();
});
</script>
</head>
<body>
			<div class="container-fluid">
				<!-- start page title -->
				<div class="row">
					<div class="col-12">
						<div class="page-title-box">
							<h4 class="page-title">공지사항</h4>
						</div>
					</div>
				</div>
				<!-- end page title -->

				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="row mb-2">
									<div class="col-lg-6">
										<form action="searchBusinessNotice"
											name="businessNoticeListForm" class="form-inline">
											<div class="form-group mb-3">
												<label for="status-select" class="mr-2"> <!-- 카테고리&nbsp; -->
													<select class="custom-select" name="select" id="select">
														<option>전체</option>
														<option>공지사항</option>
														<option>이벤트</option>
												</select>
												</label>
											</div>
											<div class="form-group mb-3">
												<label for="status-select" class="mr-2"> <!-- 검색&nbsp; -->
													<input type="search" class="form-control form-control-sm"
													placeholder="제목" aria-controls="basic-datatable"
													name="search">
													<button type="submit" class="btn btn-success btn-sm">검색</button>
												</label>
											</div>
										</form>
									</div>
									<div class="col-lg-6">
										<div class="text-lg-right">
											<a href="businessNoticeWriteForm" class="btn btn-danger mb-2"><i
												class="mdi mdi-plus-circle mr-2"></i> 등록</a>
										</div>
									</div>
									<!-- end col-->
								</div>
								<!-- end row -->

								${searchNotifications}
								<div class="table-responsive-sm">
									<table class="table table-striped table-centered mb-0">
										<thead>
											<tr>
												<th>글번호</th>
												<th>카테고리</th>
												<th>제목</th>
												<th>작성일</th>
												<th>수정/삭제</th>
											</tr>
										</thead>
										<tbody>
										
										</tbody>
									</table>
								</div>
							</div>
							<!-- end card-body-->
						</div>
						<!-- end card-->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
				<div class="row mb-2" style="">
					<div class="col-lg-8">${paging}</div>
				</div>
				<!-- end row -->
			</div>
</body>
<script>
	$(document).ready(function() {
		//불러온 값에 selected속성 부여하기
		$("#select option").each(function() {
			if ($(this).val() == "${param.select}")
				$(this).attr("selected", "selected");
		})
	});
	$
	{
		alert
	}
	function deleteChk(a) {
		var con = confirm('정말로 삭제하겠습니까?');
		con;
		if (con == false) {
			return false;
		}
	}
</script>
</html>