<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.custom-control {
	position: relative;
	display: inline;
	min-height: 1.3125rem;
	padding-left: 1.5rem;
}

#medical {
	width: 100%;
}

#beauty {
	width: 100%;
}

#hotel {
	width: 100%;
}
</style>

</head>
<body>

	<div class="container-fluid">
		<br />

		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<div class="page-title-right">
						<form class="form-inline"></form>
					</div>
					<h4 class="page-title">업종 등록 신청</h4>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<!-- <div class="col-xl-6"> -->
				<div class="card">
					<div class="card-body">
						<ul class="nav nav-pills bg-light nav-justified mb-3">
							<li class='nav-item' id='hotel_div'><a onclick='checkCode("${serviceInfo.svcCd}")' data-toggle='tab' aria-expanded='false' class='nav-link rounded-0 active show' > ${serviceInfo.svcNm} </a></li>
						</ul>
						<div class="row" id="hotel">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<form action="serviceInsert" name="hotel" method="post"	enctype="multipart/form-data">
											<div class="row">
												<div class="col-lg-6">
													<div class="form-group mb-3">
														<label for="simpleinput">업체명</label> 
														<input type="text" class="form-control" name="bus_name" value="${userInfo.name}" readonly />
													</div>
													<div class="form-group mb-3">
														<label for="simpleinput">연락처</label> 
														<input type="text" class="form-control" name="bus_phone" value="${userInfo.phone}" readonly />
													</div>
													<div class="form-group mb-3">
														<label for="simpleinput" style="margin-right: 15px;">업체 소개</label><br/>
														<textarea class="form-control" id="example-textarea" rows="3" placeholder="우리 업체를 고객들에게 자세히 설명해주세요."></textarea>
													</div>
													<div class="form-group mb-3">
														<label for="simpleinput" style="margin-right: 15px;">대표 키워드</label> 
														<p class="text-muted">업체를 대표하는 메뉴명, 서비스명, 상품명 등을 입력하세요. (최대 5개)</p>
														<input class="form-control" type="text" placeholder="예) 강아지, 고양이" id="billing-last-name">
													</div>
												</div>
												<div class="col-lg-6">
													<div class="form-group mb-3">
														<label for="simpleinput" style="margin-right: 15px;">업체 주소</label> 
														<p class="text-muted">주소를 확인해주세요. 주소가 변경됐다면 나의 회원 정보에서 수정할 수 있습니다.</p>
														<input type="text" class="form-control" value="${businessInfo.busAddr}" readonly />
														<input type="text" class="form-control" value="${businessInfo.busDtlAddr}" readonly />
													</div>
													<div class="form-group mb-3">
														<label for="simpleinput" style="margin-right: 15px;">찾아오는 길</label> 
														<textarea class="form-control" id="example-textarea" rows="3" placeholder="예) 강남역 10번 출구에서 나와 200m 직진하면 우측에 보이는 건물 2층 입니다."></textarea>
													</div>
													<div class="form-group mb-3">
														<label for="simpleinput" style="margin-right: 15px;">업체 사진</label> <br/>
														<input type="file" name="bgl_ori" multiple />
													</div>
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-lg-6">
														<div class="form-group mb-3">
															<label for="simpleinput">정기휴무일</label> 
															<div class="d-flex mb-1">
															<select class="form-control" id="example-select">
	                                                            <option>매주</option>
	                                                            <option>격주</option>
	                                                            <option>매월</option>
	                                                        </select>
	                                                        <div class="btn-group ml-2">
					                                            <button type="button" class="btn btn-light">첫번째</button>
					                                            <button type="button" class="btn btn-light">두번째</button>
					                                            <button type="button" class="btn btn-light">세번째</button>
					                                            <button type="button" class="btn btn-light">네번째</button>
					                                            <button type="button" class="btn btn-light">다섯번째</button>
					                                        </div>
	                                                        </div>
                                                        	<div class="btn-group mb-1">
					                                            <button type="button" class="btn btn-light">월</button>
					                                            <button type="button" class="btn btn-light">화</button>
					                                            <button type="button" class="btn btn-light">수</button>
					                                            <button type="button" class="btn btn-light">목</button>
					                                            <button type="button" class="btn btn-light">금</button>
					                                            <button type="button" class="btn btn-light">토</button>
					                                            <button type="button" class="btn btn-light">일</button>
					                                        </div>
															<input type="time" class="form-control" name="work_o" id="am_open" step="1800">
														</div>
														<div class="form-group mb-3">
															<label for="simpleinput">영업 마감시간</label> <input
																type="time" class="form-control" name="work_c"
																id="pm_close" step="1800">
														</div>
														<div class="form-group mb-3">
															<label for="simpleinput">점심 시작시간</label> <input
																type="time" class="form-control" name=lunch_o
																id="lunch_open" step="1800">
														</div>
														<div class="form-group mb-3">
															<label for="simpleinput">점심 마감시간</label> <input
																type="time" class="form-control" name="lunch_c"
																id="lunch_close" step="1800">
														</div>
														<div class="form-group mb-3">
															<label for="simpleinput">고정휴무일</label><br />
															<div class='custom-control custom-checkbox'>
																<input type="checkbox" class='custom-control-input'
																	name="holiday" value="월요일" id='월요일_h' /> <label
																	class='custom-control-label' for='월요일_h'>월요일</label>
															</div>
															<div class='custom-control custom-checkbox'>
																<input type="checkbox" class='custom-control-input'
																	name="holiday" value="화요일" id='화요일_h' /> <label
																	class='custom-control-label' for='화요일_h'>화요일</label>
															</div>
															<div class='custom-control custom-checkbox'>
																<input type="checkbox" class='custom-control-input'
																	name="holiday" value="수요일" id='수요일_h' /> <label
																	class='custom-control-label' for='수요일_h'>수요일</label>
															</div>
															<div class='custom-control custom-checkbox'>
																<input type="checkbox" class='custom-control-input'
																	name="holiday" value="목요일" id='목요일_h' /> <label
																	class='custom-control-label' for='목요일_h'>목요일</label>
															</div>
															<div class='custom-control custom-checkbox'>
																<input type="checkbox" class='custom-control-input'
																	name="holiday" value="금요일" id='금요일_h' /> <label
																	class='custom-control-label' for='금요일_h'>금요일</label>
															</div>
															<div class='custom-control custom-checkbox'>
																<input type="checkbox" class='custom-control-input'
																	name="holiday" value="토요일" id='토요일_h' /> <label
																	class='custom-control-label' for='토요일_h'>토요일</label>
															</div>
															<div class='custom-control custom-checkbox'>
																<input type="checkbox" class='custom-control-input'
																	name="holiday" value="일요일" id='일요일_h' /> <label
																	class='custom-control-label' for='일요일_h'>일요일</label>
															</div>
															<div class='custom-control custom-checkbox'>
																<input type="checkbox" class='custom-control-input'
																	name="holiday" value="공휴일" id='공휴일_h' /> <label
																	class='custom-control-label' for='공휴일_h'>공휴일</label>
															</div>
														</div>
													</div>
													<div class="col-lg-12">
														<input type="reset" class="btn btn-outline-danger" value="취소" onclick="cancel()" /> <br /> <br />
													</div>
											</div>
										</form>
									</div>
								</div>
								<!-- end card-body-->
							</div>
							<!-- end card-->
						</div>
						<!-- end col-xl-6 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>