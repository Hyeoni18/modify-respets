<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Respets :: 나의 반려동물 정보</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />

<style type="text/css">
#petProfile {
	width: 150px;
	height: 150px;
	margin-top: 20px;
}
</style>
<script>

function selectPetList(){
	
	var data = {};
	//data.currentPage = page;
	
	$.ajax({
		url : "${pageContext.request.contextPath}/selectPetList",	
		type : 'POST',
		data : data,
		success : function(result){
			var tbody = $(".card-deck");
			tbody.children().remove();
			
			if(result.petList.length > 0){
				$(result.petList).each(function(index, item){
					tbodyHtml = "";
					tbodyHtml += '<div class="col-lg-4" style="padding: 0;">';
					tbodyHtml += '<div class="card d-block" style="text-align: center; margin-bottom: 20px;">';
					tbodyHtml += '<a href="petInfoDetail?petNo='+item["petNo"]+'">';
					tbodyHtml += '<img class="rounded-circle img-thumbnail" id="petProfile" src="'+item["petCours"]+'" alt="pet profile"></a>';
					tbodyHtml += '<div class="card-body">';
					tbodyHtml += '<h5 class="card-title">'+item["petName"]+'</h5>';
					tbodyHtml += '<p class="card-text">품종 : '+item["petCd"]+'<br/>성별 : '+item["petNtr"]+'<br/>나이 : '+item["petBirth"]+'살</p>';
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
			} /* else {
				tbodyHtml = "";
				tbodyHtml += '<tr class="noData">';
				if(authCd=="AUTH000" || authCd=="AUTH001") {
					tbodyHtml += '<td colspan=9>';
				} else {
					tbodyHtml += '<td colspan=8>';
				}
				tbodyHtml += '<div class="text">';
				tbodyHtml += '<i class="fa fa-exclamation-triangle"></i><br/>검색된 데이터가 없습니다.';
				tbodyHtml += '</div>';
				tbodyHtml += '</td>';
				tbodyHtml += '</tr>';
				tbody.append(tbodyHtml);
				showPaging(Math.floor(result.total / 10) + 1,10,parseInt(page),'selectAccdtExaminDtaList', $("#paging"+tab));
			}  */ 
		},
		error : function(){
			console.log("error");
		}
	});	
};

$(document).ready(function(){
	selectPetList();
});
</script>
</head>
<body>
				<!-- Start Content-->
				<div class="container-fluid">
				
					<!-- start page title -->
					<div class="page-title-box">
						<div class="page-title-right">
							<form class="form-inline">
								<a href="petInsertForm?perNo=${perNo}" class="btn btn-outline-success">반려동물
									등록</a>
							</form>
						</div>
						<h4 class="page-title">나의 반려동물 목록</h4>
						<c:if test="${empty petList}">
							<div class='alert alert-info' role='alert' style='margin-bottom:0;'>
							<i class='dripicons-information mr-2'></i> 반려동물을 등록하셔야 <strong>예약 서비스</strong>
						&nbsp;이용이 가능합니다!</div>
						</c:if>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-12">
						
							<div class="card-deck-wrapper">
								<div class="card-deck">
									
									
								</div>
								<!-- end card-deck-->
							</div>
							<!-- end card-deck-wrapper-->
						</div>
						<!-- end col-->
					</div>
					<!-- end row-->
				</div>
				<!-- container -->
</body>
</html>