<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Respets :: 미인증 기업 목록</title>
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
								<h4 class="page-title">미인증 기업 목록</h4>
							</div>
						</div>
					</div>
					<!-- end page title -->
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-0">
								<div class="card-body">
									<span class="text-muted font-14 mb-4">인증 절차가 필요한 기업
										목록입니다.</span> <br /><br />
									<div class="table-responsive-sm">
										<table class="table table-centered mb-0" style='text-align: center;'>
											<thead>
												<tr style="text-align: center;">
													<th>회원번호</th>
													<th>업종</th>
													<th>이메일</th>
													<th>업체명</th>
													<th>가입일</th>
												</tr>
												${bList}
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
</body>
</html>