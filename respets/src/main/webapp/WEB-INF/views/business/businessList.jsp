<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Respets :: 기업 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />
</head>
<body data-layout="topnav">
	<div class="wrapper">
		<div class="content-page">
			<div class="content">
				<div class="container-fluid">				

					<div class="card bg-mint text-white" style="margin: 30px 0 30px 0;">
						<div class="card-body">
							<h5 class="card-title mb-0"><span style="margin-right:20px;">키워드로 검색</span>${tagList}</h5>

							<%-- <div id="cardCollpase2" class="pt-3 collapse" style="">
								<div id="tag">${tagList}</div>
								
							</div> --%>
						</div>
					</div>
					<div class="row" id="businessList">
						<c:forEach items="${businessList}" var="list">
							<div class="col-4" style="padding:15px;">
								<div class='card-deck-wrapper'>
									<div class='card-deck'>
										<div class='card d-block'>
											<a href='businessDetail?busNo=${list.busNo}&svcCd=${list.svcCd}'> <img
												class='card-img-top img-fluid' src='' />
												<div class='card-body'>
													<h5 class='card-title'>
														<c:out value="${list.busName}" />
													</h5>
													<h5 class='card-text'>
														<c:out value="${list.busAddr}" />
														<br>
														<c:out value="${list.busPhone}" />
													</h5>
												</div>
											</a>
										</div>
									</div>
									<!-- end card-deck-->
								</div>
								<!-- end card-deck-wrapper-->
							</div>
							<!-- end col-->
						</c:forEach>
					</div>
					<br />
					<div id="page">${paging}</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	function businessList(bct_code, tag_no, date, city, pno) {
		console.log(bct_code);
		console.log(tag_no);
		console.log(date);
		console.log(city);
		console.log(pno)
		var url = "tagSelectList?bct_code=" + bct_code + "&tag_no=" + tag_no
				+ "&bsd_date=" + date + "&bus_addr=" + city + "&pageNum=" + pno;
		console.log(url);
		Aj(url, "#businessList");
		function Aj(url, position) {
			$.ajax({
				url : url,
				type : "post",
				dataType : "text",
				//async : false,
				success : function(data) {
					console.log(data);
					$(position).html(data);
					url = "tagSelectListAddr?bct_code=" + bct_code + "&tag_no="
							+ tag_no + "&bsd_date=" + date + "&bus_addr="
							+ city + "&pageNum=" + pno;
					position = "#page";
					$.ajax({
						url : url,
						type : "post",
						dataType : "text",
						//async : false,
						success : function(data) {
							console.log(data);
							$(position).html(data);
						},
						error : function(error) {
							console.log("error");
						}
					}); //ajax End
				},
				error : function(error) {
					console.log("error");
				}
			}); //ajax End
		}
	};
	function butTagSelectList(bct_code, tag_no, pno) {
		console.log(bct_code);
		console.log(tag_no);
		var url = "butTagSelectList?bct_code=" + bct_code + "&tag_no=" + tag_no
				+ "&pageNum=" + pno;
		console.log(url);
		Aj(url, "#businessList");
		function Aj(url, position) {
			$.ajax({
				url : url,
				type : "post",
				dataType : "text",
				//async : false,
				success : function(data) {
					console.log(data);
					$(position).html(data);
					url = "butTagSelectListPaging?bct_code=" + bct_code
							+ "&tag_no=" + tag_no + "&pageNum=" + pno;
					position = "#page";
					$.ajax({
						url : url,
						type : "post",
						dataType : "text",
						//async : false,
						success : function(data) {
							console.log(data);
							$(position).html(data);
						},
						error : function(error) {
							console.log("error");
						}
					}); //ajax End
				},
				error : function(error) {
					console.log("error");
				}
			}); //ajax End
		}
	};
</script>
</html>