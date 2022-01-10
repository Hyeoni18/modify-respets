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

.all-time-schedule {
	display: none;
}

.weekly-time-schedule {
	display: none;
}

a {
	color: #6c757d;
}

</style>
<script>
function createDateBtn(start, end) {
	var id = $(".daterangepicker").find(".btn-primary")[0].id;
	if(id==="once") {
		console.log($(".drp-selected").text());
	} else if(id==="month") {
		console.log("매월");
		console.log($(".drp-selected-month").text());
	} else if(id==="year") {
		console.log("매년");
		console.log($(".drp-selected-year").text());
	}
}
</script>
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
														<div class="d-flex">
														<div class="form-group">
															<select class="form-control" id="example-select">
	                                                            <option>매주</option>
	                                                            <option>격주</option>
	                                                            <option>매월</option>
	                                                        </select>
														</div>
														<div class="form-group ml-2">
															<div class="btn-group">
					                                            <button type="button" class="btn btn-light">월</button>
					                                            <button type="button" class="btn btn-light">화</button>
					                                            <button type="button" class="btn btn-light">수</button>
					                                            <button type="button" class="btn btn-light">목</button>
					                                            <button type="button" class="btn btn-light">금</button>
					                                            <button type="button" class="btn btn-light">토</button>
					                                            <button type="button" class="btn btn-light">일</button>
				                                        	</div>
			                                        	</div>
				                                        </div>
	                                                    <div class="btn-group">
				                                            <button type="button" class="btn btn-light">첫번째</button>
				                                            <button type="button" class="btn btn-light">두번째</button>
				                                            <button type="button" class="btn btn-light">세번째</button>
				                                            <button type="button" class="btn btn-light">네번째</button>
				                                            <button type="button" class="btn btn-light">다섯번째</button>
				                                        </div>
													</div>
													<div class="form-group mb-3">
														<label for="simpleinput">공휴일 중 휴무일</label> <br/>
														<div class="form-group">
															<div class="custom-control custom-checkbox mb-3">
		                                                        <input type="checkbox" class="custom-control-input" id="autoSizingCheck">
		                                                        <label class="custom-control-label" for="autoSizingCheck">설,추석 당일만 휴무</label>
		                                                    </div>&ensp;
		                                                    <div class="custom-control custom-checkbox mb-3">
		                                                        <input type="checkbox" class="custom-control-input" id="autoSizingCheck2">
		                                                        <label class="custom-control-label" for="autoSizingCheck2">전체 휴무</label>
		                                                    </div>
	                                                    </div>
	                                                    <!-- 반복 -->
	                                                    <div class="btn-group mb-1">
				                                            <button type="button" class="btn btn-light">새해 첫날</button>
				                                        </div>
													</div>
												</div>
												<div class="col-lg-6">
													<div class="form-group">
														<label for="simpleinput">그 외 휴무일</label> <br/>
														<div class="btn-group">
															<button type="button" class="btn btn-light" data-toggle="date-picker" data-cancel-class="btn-warning"> 
																<i class="mdi mdi-plus"></i> <span>날짜로 추가</span> 
															</button>
														</div>
													</div>
													<!-- 반복 -->
													<div class="btn-group">
														<div class="alert alert-info alert-dismissible fade show" role="alert">
				                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				                                                <span aria-hidden="true">×</span>
				                                            </button>
				                                            2021-01-10
				                                        </div>
			                                         </div>
												</div>
											</div>
											<hr/>
											<div class="row">
												<div class="col-lg-6">
													<div class="form-group mb-3">
														<label for="simpleinput">영업 시간</label> <br/>
	                                                    <div class="custom-control custom-radio">
	                                                         <input type="radio" id="shippingMethodRadio1" name="shippingOptions" class="custom-control-input" checked>
	                                                         <label class="custom-control-label" for="shippingMethodRadio1">모든 영업일 같음</label>
	                                                    </div>&ensp;
	                                                    <div class="custom-control custom-radio">
	                                                         <input type="radio" id="shippingMethodRadio2" name="shippingOptions" class="custom-control-input">
	                                                         <label class="custom-control-label" for="shippingMethodRadio2">평일/주말 다름</label>
	                                                    </div>&ensp;
	                                                    <div class="custom-control custom-radio">
	                                                         <input type="radio" id="shippingMethodRadio3" name="shippingOptions" class="custom-control-input">
	                                                         <label class="custom-control-label" for="shippingMethodRadio3">요일별로 다름</label>
	                                                    </div>
	                                                </div>
	                                                
	                                                <!-- 모든 영업일이 같음 -->
	                                                <div class="all-time-schedule">
		                                                <div class="form-group row mb-3">
			                                                <label for="inputEmail3" class="col-2 col-form-label">오픈시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
	
			 												<label for="inputEmail3" class="col-2 col-form-label">마감시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
		                                                </div>
		                                                
		                                                <div class="form-group">
															<div class="btn-group">
																<button type="button" class="btn btn-light"> 
																	<i class="mdi mdi-plus"></i> <span>휴게시간 추가</span> 
																</button>
															</div>
														</div>
		                                                <!-- 반복 -->
			                                            <div class="form-group row mb-3">
			                                                <label for="inputEmail3" class="col-2 col-form-label">시작시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
			 												<label for="inputEmail3" class="col-2 col-form-label">종료시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
		                                                </div>
	                                                </div>
	                                                
	                                                <!-- 평일/주말 다름 -->
	                                                <div class="weekly-time-schedule">
		                                                <div class="form-group row mb-3">
			                                                <label for="inputEmail3" class="col-3 col-form-label">월 || 오픈시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
	
			 												<label for="inputEmail3" class="col-2 col-form-label">마감시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
		                                                </div>
		                                                
		                                                <div class="weekend-time-all"> <!-- weekend-time-div 로 토/일 나눠서 추가하기 -->
			                                                <div class="form-group row mb-3">
				                                                <label for="inputEmail3" class="col-3 col-form-label" data-toggle="tooltip" data-placement="top" data-original-title="토요일/일요일 분리" title=""><a>주말 || 오픈시간</a></label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
		
				 												<label for="inputEmail3" class="col-2 col-form-label">마감시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
			                                                </div>
		                                                </div>
		                                                
		                                                <div class="form-group">
															<div class="btn-group">
																<button type="button" class="btn btn-light"> 
																	<i class="mdi mdi-plus"></i> <span>휴게시간 추가</span> 
																</button>
															</div>
														</div>
		                                                <!-- 반복 -->
			                                            <div class="form-group row mb-3">
			                                                <label for="inputEmail3" class="col-2 col-form-label">시작시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
			 												<label for="inputEmail3" class="col-2 col-form-label">종료시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
		                                                </div>
	                                                </div>
	                                                
	                                                <!-- 요일별로 다름 -->
	                                                <div class="every-time-schedule">
	                                                	
	                                                	<div class="day-check">
		                                                	<div class="form-group ml-2">
																<div class="btn-group">
						                                            <button type="button" class="btn btn-primary">월</button>
						                                            <button type="button" class="btn btn-primary">화</button>
						                                            <button type="button" class="btn btn-primary">수</button>
						                                            <button type="button" class="btn btn-primary">목</button>
						                                            <button type="button" class="btn btn-primary">금</button>
						                                            <button type="button" class="btn btn-primary">토</button>
						                                            <button type="button" class="btn btn-primary">일</button>
					                                        	</div>
				                                        	</div>
				                                        	
			                                                <div class="form-group row mb-3">
				                                                <label for="inputEmail3" class="col-3 col-form-label">오픈시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
		
				 												<label for="inputEmail3" class="col-2 col-form-label">마감시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
			                                                </div>
			                                                
			                                                <div class="form-group">
																<div class="btn-group">
																	<button type="button" class="btn btn-light"> 
																		<i class="mdi mdi-plus"></i> <span>휴게시간 추가</span> 
																	</button>
																</div>
															</div>
			                                                <!-- 반복 -->
				                                            <div class="form-group row mb-3">
				                                                <label for="inputEmail3" class="col-2 col-form-label">시작시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
				 												<label for="inputEmail3" class="col-2 col-form-label">종료시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
			                                                </div>
			                                             </div>
			                                             <!-- day-check div end -->
			                                             <hr/>
			                                             <div class="day-check">
		                                                	<div class="form-group ml-2">
																<div class="btn-group">
						                                            <button type="button" class="btn btn-light">월</button>
						                                            <button type="button" class="btn btn-light">화</button>
						                                            <button type="button" class="btn btn-light">수</button>
						                                            <button type="button" class="btn btn-light">목</button>
						                                            <button type="button" class="btn btn-light">금</button>
						                                            <button type="button" class="btn btn-light">토</button>
						                                            <button type="button" class="btn btn-light">일</button>
					                                        	</div>
				                                        	</div>
				                                        	
			                                                <div class="form-group row mb-3">
				                                                <label for="inputEmail3" class="col-3 col-form-label">오픈시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
		
				 												<label for="inputEmail3" class="col-2 col-form-label">마감시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
			                                                </div>
			                                                
			                                                <div class="form-group">
																<div class="btn-group">
																	<button type="button" class="btn btn-light"> 
																		<i class="mdi mdi-plus"></i> <span>휴게시간 추가</span> 
																	</button>
																</div>
															</div>
			                                                <!-- 반복 -->
				                                            <div class="form-group row mb-3">
				                                                <label for="inputEmail3" class="col-2 col-form-label">시작시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
				 												<label for="inputEmail3" class="col-2 col-form-label">종료시간</label>
				                                                <div class="input-group col-3">
				                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
				                                                </div>
			                                                </div>
			                                             </div>
			                                             
			                                             <!-- 요일 추가하면 day-check 반복 -->
			                                             <div class="form-group">
															<button type="button" class="btn btn-block btn-light"> 
																<i class="mdi mdi-plus"></i> <span>요일 추가</span> 
															</button>
														</div>
	                                                </div>
	                                                
												</div>
												<div class="col-lg-6">
													<div class="form-group">
														<label for="simpleinput">평소와 다른 영업시간 추가</label> <br/>
														<div class="custom-control custom-checkbox mb-3">
	                                                        <input type="checkbox" class="custom-control-input" id="autoSizingCheck3">
	                                                        <label class="custom-control-label" for="autoSizingCheck3">법정공휴일 영업시간</label>
	                                                    </div>&ensp;
	                                                    <div class="custom-control custom-checkbox mb-3">
	                                                        <input type="checkbox" class="custom-control-input" id="autoSizingCheck4">
	                                                        <label class="custom-control-label" for="autoSizingCheck4">특별한 날 영업시간</label>
	                                                    </div>
                                                    </div>
                                                  
	                                                  <!-- 법정공휴일 체크시 -->
	                                                  <div class="all-people-holiday">
	                                                    <div class="form-group row mb-3">
			                                                <label for="inputEmail3" class="col-3 col-form-label">공휴일 || 오픈시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
	
			 												<label for="inputEmail3" class="col-2 col-form-label">마감시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
		                                                </div>
		                                                
		                                                <div class="form-group">
															<div class="btn-group">
																<button type="button" class="btn btn-light"> 
																	<i class="mdi mdi-plus"></i> <span>휴게시간 추가</span> 
																</button>
															</div>
														</div>
		                                                <!-- 반복 -->
			                                            <div class="form-group row mb-3">
			                                                <label for="inputEmail3" class="col-2 col-form-label">시작시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
			 												<label for="inputEmail3" class="col-2 col-form-label">종료시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
		                                                </div>
		                                              </div>
	
	                                                  <!-- 특별한 날 체크시 /// 좀 더 생각해보자 -->
	                                                  <div class="all-people-holiday">
	                                                    <div class="form-group row mb-3">
			                                                <label for="inputEmail3" class="col-3 col-form-label">특정일 || 오픈시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
	
			 												<label for="inputEmail3" class="col-2 col-form-label">마감시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
		                                                </div>
		                                                
		                                                <div class="form-group">
															<div class="btn-group">
																<button type="button" class="btn btn-light"> 
																	<i class="mdi mdi-plus"></i> <span>휴게시간 추가</span> 
																</button>
															</div>
														</div>
		                                                <!-- 반복 -->
			                                            <div class="form-group row mb-3">
			                                                <label for="inputEmail3" class="col-2 col-form-label">시작시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
			 												<label for="inputEmail3" class="col-2 col-form-label">종료시간</label>
			                                                <div class="input-group col-3">
			                                                    <input type="text" class="form-control" data-toggle="timepicker" data-minute-step="5">
			                                                </div>
		                                                </div>
		                                              </div>
	                                              
			                                            <div class="form-group mb-3">
															<label for="simpleinput" style="margin-right: 15px;">영업시간이나 휴무일 관련 추가 안내</label><br/>
															<textarea class="form-control" id="example-textarea" rows="3" placeholder=""></textarea>
														</div>
												</div>
											</div>
											<hr/>
											<div class="row">
												<div class="col-lg-6">
													<div class="form-group mb-3">
														<label for="simpleinput" style="margin-right: 15px;">가격표 사진 추가</label> <br/>
														<input type="file" name="bgl_ori" multiple />
													</div>
													
													<div class="form-group mb-3">
														<label for="simpleinput" style="margin-right: 15px;">가격표 사진 추가</label> <br/>
														<div class="dropzone dz-clickable" id="myAwesomeDropzone" data-plugin="dropzone" data-previews-container="#file-previews" data-upload-preview-template="#uploadPreviewTemplate">
															<div class="dz-message needsclick">
					                                            <i class="h1 text-muted dripicons-cloud-upload"></i>
					                                            <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">여기에 파일을 드롭하거나 업로드하려면 클릭하세요.</font></font></h3>
					                                        </div>
														</div>
														<div class="dropzone-previews mt-3" id="file-previews"></div>
													</div>
												</div>
												<div class="col-lg-6">
		                                             <div class="form-group">
		                                             	<label for="simpleinput" style="margin-right: 15px;">가격 정보</label> <br/>
														<button type="button" class="btn btn-block btn-light"> 
															<i class="mdi mdi-plus"></i> <span>가격 추가</span> 
														</button>
													 </div>
													 
												</div>
											</div>
											<hr/>
											<div class="row">
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
	
	<div class="d-none" id="uploadPreviewTemplate">
        <div class="card mt-1 mb-0 shadow-none border border-light">
            <div class="p-2">
                <div class="row align-items-center">
                    <div class="col-auto">
                        <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" alt="">
                    </div>
                    <div class="col pl-0">
                        <a href="javascript:void(0);" class="text-muted font-weight-bold" data-dz-name=""></a>
                        <p class="mb-0" data-dz-size=""></p>
                    </div>
                    <div class="col-auto">
                        <!-- Button -->
                        <a href="" class="btn btn-link btn-lg text-muted" data-dz-remove="">
                            <i class="dripicons-cross"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
