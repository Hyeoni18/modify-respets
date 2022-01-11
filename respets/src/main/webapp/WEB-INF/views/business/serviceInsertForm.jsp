<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/app.min.js"></script>
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

function addPriceInfo(aaa) {
	console.log(aaa);
	console.log($("#priceNm").val());
	//
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
														<input type="file" multiple="multiple" class="dz-hidden-input" style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
													</div>
												</div>
												<div class="col-lg-6">
		                                             <div class="form-group">
		                                             	<label for="simpleinput" style="margin-right: 15px;">가격 정보</label> <br/>
														<button type="button" class="btn btn-block btn-light" data-toggle="modal" data-target="#myModal"> 
															<i class="mdi mdi-plus"></i> <span>가격 추가</span> 
														</button>
													 </div>
													 
													 <div class="form-group">
													 	<div class="card mt-1 mb-0 shadow-none border border-light dz-processing dz-error dz-complete dz-image-preview">
												            <div class="p-2">
												                <div class="row align-items-center">
												                    <div class="col-auto">
												                        <img data-dz-thumbnail="" class="avatar-sm rounded bg-light" alt="20160429020751309120.png" src="data:image/png;base64,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">
												                    </div>
												                    <div class="col pl-0">
												                        <a href="javascript:void(0);" class="text-muted font-weight-bold" data-dz-name="">상품면</a>
												                        <p class="mb-0" data-dz-size=""><strong>가격</strong> 원</p>
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
<%@include file="./popup/serviceInsertPopup.jsp" %>