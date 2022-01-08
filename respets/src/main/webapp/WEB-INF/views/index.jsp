<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Respets</title>
<script>
function selectSvcCode(){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/selectSvcCode",	
		type : 'POST',
		success : function(result){
			var tbody = $("#svcCd");
			tbody.children().remove();
			
			if(result.svcCode.length > 0){
				$(result.svcCode).each(function(index, item){
					tbodyHtml = "";
					tbodyHtml += '<option value="'+item["cmmnCd"]+'">'+item["cdDesc"]+'</option> ';
					tbody.append(tbodyHtml);
				}); 
			}
		},
		error : function(){
			console.log("error");
		}
	});	
};

//공지사항 조회
function selectMainNotice(){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/board/selectMainNotice",	
		type : 'POST',
		success : function(result){
			var tbody = $(".table tbody");
			tbody.children().remove();
			
			if(result.selectMainNotice.length > 0){
				$(result.selectMainNotice).each(function(index, item){
					tbodyHtml = "";
					tbodyHtml += '<tr><td style="text-align: center;">'+item["boardNo"]+'</td>';
					tbodyHtml += '<td style="text-align: center;"><a href="businessNoticeDetail?boardNo='+item["boardNo"]+'">'+item["boardTitle"]+'</a></td>';
					tbodyHtml += '<td style="text-align: center;">'+item["inputDt"]+'</td></tr>';
					tbody.append(tbodyHtml);
				}); 
			}  else {
				tbodyHtml = "";
				tbodyHtml += '<tr><td colspan=3 style="text-align: center;">검색된 데이터가 없습니다.</td></tr>';
				tbody.append(tbodyHtml);
			}  
		},
		error : function(){
			console.log("error");
		}
	});	
};

$(document).ready(function(){
	selectSvcCode();
	selectMainNotice();
});
</script>
</head>
<body data-layout="topnav">
	

	<!-- Begin page -->
	<div class="wrapper">

		<!-- ============================================================== -->
		<!-- Start Page Content here -->
		<!-- ============================================================== -->

		<div class="content-page">
			<div class="content">

				<!-- Start Content-->
				<div class="container-fluid">

					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div class="page-title-box">
								<h4 class="page-title" style="text-align: center;">
									<c:if test="${userInfo.no == null}">
								로그인을 하면 더 많은 서비스 이용이 가능합니다!
								</c:if>
									<c:if test="${userInfo.no != null}">
										<c:if test="${fn:substring(userInfo.no,0,1) eq 'P'}">
											${userInfo.name} 회원님, 반갑습니다! 반려동물 관련 예약서비스를 편리하게 누려보세요:)
										</c:if>
										<c:if test="${fn:substring(userInfo.no,0,1) eq 'B'}">
											${userInfo.name} 회원님, 반갑습니다! 새로운 예약을 확인해보세요:)
										</c:if>
										<c:if test="${fn:substring(userInfo.no,0,1) eq '1'}">
											관리자로 로그인 했습니다.
										</c:if>
									</c:if>
								</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">

						<div class="col-12">

							<!-- Search-card Start-->
							<div class="card text-white bg-mint">
								<div class="card-body">
									<blockquote class="card-bodyquote">
										<form action="searchList" method="get" name="searchFrm">
											<div class="col-lg-2" data-select2-id="276"
												style="float: left;">
												<h5>서비스 선택</h5>
												<select name="svcCd" id="svcCd" class="form-control select2" data&ndash;toggle="select2">
												</select>
											</div>

											<div class="col-lg-3" data-select2-id="160"
												style="float: left;">
												<h5>지역 선택</h5>
												<select name="city"
													class="select2 form-control select2-multiple select2-hidden-accessible"
													data-toggle="select2" multiple=""
													data-placeholder="Choose ..." data-select2-id="4"
													tabindex="-1" aria-hidden="true">
													<option value="서울">서울</option>
													<option value="부산">부산</option>
													<option value="대구">대구</option>
													<option value="인천">인천</option>
													<option value="광주">광주</option>
													<option value="대전">대전</option>
													<option value="울산">울산</option>
													<option value="세종시">세종시</option>
													<option value="경기">경기도</option>
													<option value="고양">고양</option>
													<option value="부천">부천</option>
													<option value="성남">성남</option>
													<option value="수원">수원</option>
													<option value="안양">안양</option>
													<option value="용인">용인</option>
													<option value="의정부">의정부</option>
													<option value="강원도">강원도</option>
													<option value="강릉">강릉</option>
													<option value="속초">속초</option>
													<option value="춘천">춘천</option>
													<option value="충청북도">충청북도</option>
													<option value="청주시">청주시</option>
													<option value="충주시">충주시</option>
													<option value="충청남도">충청남도</option>
													<option value="천안시">천안시</option>
													<option value="전라북도">전라북도</option>
													<option value="전주시">전주시</option>
													<option value="전라남도">전라남도</option>
													<option value="목포시">목포시</option>
													<option value="순천시">순천시</option>
													<option value="여수시">여수시</option>
													<option value="경상북도">경상북도</option>
													<option value="경주시">경주시</option>
													<option value="안동시">안동시</option>
													<option value="포항시">포항시</option>
													<option value="경상남도">경상남도</option>
													<option value="김해시">김해시</option>
													<option value="밀양시">밀양시</option>
													<option value="창원시">창원시</option>
													<option value="제주">제주</option>
												</select>
											</div>
											<div class="col-lg-5" style="float: left;">
												<div class="form-group mb-3">
													<h5>날짜 선택</h5>
													<input type="text" name="bkDate" class="form-control date"
														id="singledaterange" data-toggle="date-picker"
														data-cancel-class="btn-warning">
												</div>
											</div>
											<div class="col-lg-2"
												style="float: left; margin-top: 26px; text-align: center;">
												<input type="submit" class="btn btn-secondary btn-big"
													id="searchBtn" value="검색" />
											</div>
											<!-- end col -->
										</form>
									</blockquote>
								</div>
							</div>
							<!-- end Search-card -->
							<div class="card-deck-wrapper">
								<div class="card-deck">
									<div class="card">
										<img class="card-img-top img-fluid"
											src="${pageContext.request.contextPath}/resources/images/card-medical.jpg" alt="Card image cap">
										<div class="card-body">
											<a href="./businessList?svcCd=M"
												class="btn btn-block btn-success">병원</a>
										</div>
									</div>
									<!-- end card-->
									<div class="card">
										<img class="card-img-top img-fluid"
											src="${pageContext.request.contextPath}/resources/images/card-beauty.jpg" alt="Card image cap">
										<div class="card-body">
											<a href="./businessList?svcCd=B"
												class="btn btn-block btn-success">미용</a>
										</div>
									</div>
									<!-- end card-->
									<div class="card">
										<img class="card-img-top img-fluid"
											src="${pageContext.request.contextPath}/resources/images/card-hotel.jpg" alt="Card image cap">
										<div class="card-body">
											<a href="./businessList?svcCd=H"
												class="btn btn-block btn-success">호텔</a>
										</div>
									</div>
									<!-- end card-->
								</div>
								<!-- end card-deck-->
							</div>
							<!-- end card-deck-wrapper-->


							<div class="card" style="margin-top: 30px;">
								<div class="card-body">
									<h3 class="card-title" style="text-align: center;">공지사항</h3>
									<div class="table-responsive-sm" style="margin-top: 20px;">
										<table class="table table-centered mb-0">
											<thead>
												<tr style="text-align: center;">
													<th width="25%">번호</th>
													<th>제목</th>
													<th width="25%">날짜</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>

								</div>
							</div>

						</div>
						<!-- end col -->

					</div>
					<!-- end row -->

				</div>
				<!-- container -->

			</div>
			<!-- content -->

		</div>

	</div>
	<!-- END wrapper -->
<!-- App js -->
	<script src="resources/dist/assets/js/app.min.js"></script>

	<!-- demo app -->
	<script src="resources/dist/assets/js/pages/demo.dashboard.js"></script>
	<!-- end demo js-->
</body>
<script>
	$("#searchBtn").click(function() {
		var frm = document.searchFrm;
		for (var i = 0; i < frm.length; i++) {
			if (frm[i].value == "" || frm[i].value == null) {
				if (frm[i].name == "svcCd") {
					alert("서비스를 선택해주세요");
					frm[i].focus();
					return false;
				} else if (frm[i].name == "city") {
					alert("지역을 선택해주세요");
					frm[i].focus();
					return false;
				} else if (frm[i].name == "bkDate") {
					alert("날짜를 선택해주세요");
					frm[i].focus();
					return false;
				}
			}
		}
	});
</script>
</html>
