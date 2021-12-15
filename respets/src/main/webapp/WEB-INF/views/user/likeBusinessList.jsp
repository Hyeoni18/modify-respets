<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Respets :: 즐겨찾기 목록</title>
<script>
function selectLikeBusiness(){
	
	var data = {};
	//data.currentPage = page;
	
	$.ajax({
		url : "${pageContext.request.contextPath}/selectLikeBusiness",	
		type : 'POST',
		data : data,
		success : function(result){
			var tbody = $(".card-deck");
			tbody.children().remove();
			
			if(result.likeBusinessList.length > 0){
				$(result.likeBusinessList).each(function(index, item){
					tbodyHtml = "";
					tbodyHtml += '<div class="col-lg-4" style="padding: 0;">';
					tbodyHtml += '<div class="card d-block" style="text-align: center; margin-bottom: 20px;">';
					tbodyHtml += '<a href="businessDetailPage?bus_no='+item["busNo"]+'&bct_code='+item["svcCd"]+'">';
					tbodyHtml += '<img class="rounded-circle img-thumbnail" id="petProfile" src="'+item["busFileCours"]+'" alt="pet profile"></a>';
					tbodyHtml += '<div class="card-body"><h5 class="card-title">'+item["busName"]+'</h5><br/>';
					tbodyHtml += '<a class="btn btn-outline-danger btn-rounded" href="./deleteLikeBusiness?busNo='+item["busNo"]+'" onclick="return check();">삭제</a>';
					tbodyHtml += '</div></div></div>';
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
				var tbody = $(".card-empty");
				tbodyHtml = "";
				tbodyHtml += '<div class="alert alert-info" role="alert" style="margin-bottom:0;">';
				tbodyHtml += '<i class="dripicons-information mr-2"></i> 자주 이용하는 기업의 상세페이지를 <strong>즐겨찾기</strong>로 등록하고 간편하게 이용하세요!</div>';
				tbody.append(tbodyHtml);
			}  
		},
		error : function(){
			console.log("error");
		}
	});	
};

$(document).ready(function(){
	selectLikeBusiness();
});
</script>
</head>
<body>
				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="page-title-box">
						<h4 class="page-title">나의 즐겨찾기 목록</h4>
						<div class="card-empty"></div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="col-12">
							<div class="card-deck-wrapper">
								<div class="card-deck"></div>
								<!-- end card-deck-wrapper-->
							</div>
							<!-- end col-->
						</div>
					</div>
					<!-- container -->

				</div>
				<!-- content -->
</body>
<script>
	function check() {
		var result = confirm('즐겨찾기를 삭제하시겠습니까?');
		if (result === true) {
			return true;
		} // if End
		return false;
	} // fct End
</script>
</html>