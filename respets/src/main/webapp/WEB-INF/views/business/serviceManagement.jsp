<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Respets :: 서비스 관리</title>
</head>
<body>
	<!-- Start Content-->
	<div class="container-fluid">

		<!-- start page title -->
		<div class="page-title-box">
			<div class="page-title-right">
				<%-- <form action="serviceInsertForm">
					<input type="hidden" name="no" value="${no}" /> --%>
					<button class="btn btn-outline-info" onclick="location.href='./serviceInsertForm'">업종 등록 신청</button>
				<!-- </form> -->
			</div>
			<h4 class="page-title">서비스 관리</h4>
		</div>
		<!-- end page title -->

		<div class="row">
			<div class="col-12">
				<div class="row mb-3"></div>
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->

	</div>
	<!-- container -->

</body>
<script>
	function forward(button) {
		var frm = document.servicePage;
		if (button.value == '회원탈퇴') {
			var det;
			det = confirm("예약 내역을 제외한 모든 데이터가 삭제되고, 재가입 시 데이터 복구가 어렵습니다.정말 탈퇴하시겠습니까?");
			if (det) {
				frm.action = "businessPartDelete";
			} else {
				frm.action = "servicePage";
			}
		}
		frm.submit();
	}
</script>
</html>