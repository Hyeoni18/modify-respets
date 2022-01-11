<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>

</script>
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <h4 class="modal-title" id="myModalLabel">가격정보 추가하기</h4>
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
               </div>
               <div class="modal-body">
               		<div class="form-group mb-3">
						<label for="simpleinput">상품명</label> 
						<input type="text" class="form-control" name="" id="priceNm" placeholder="상품명을 입력해주세요."/>
					</div>
					<div class="form-group mb-3">
						<label for="simpleinput">가격</label> 
						<input type="text" class="form-control price" name="" placeholder="가격을 입력해주세요."/>
						
						<div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="autoSizingCheck5">
                            <!-- 클릭시 price readonly 추가 -->
                            <label class="custom-control-label" for="autoSizingCheck5">변동가격(싯가로 표시됩니다.)</label>
                        </div>
					</div>
					<div class="form-group mb-3">
						<label for="simpleinput" style="margin-right: 15px;">상품 사진</label> <br/>
						<input type="file" name="" multiple />
					</div>
                   <hr>
                   <div class="form-group mb-3">
						<div class="custom-control custom-checkbox mb-3">
                            <input type="checkbox" class="custom-control-input" id="autoSizingCheck6">
                            <label class="custom-control-label" for="autoSizingCheck6">추천메뉴로 등록하기</label>
                        </div>
					</div>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>&ensp;
                   <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addPriceInfo('text')">추가하기</button>
               </div>
           </div><!-- /.modal-content -->
       </div><!-- /.modal-dialog -->
   </div>
