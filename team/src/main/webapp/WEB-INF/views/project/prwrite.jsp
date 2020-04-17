<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <div class="modal-header">
              <h4 class="modal-title">새 프로젝트</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form id="writeform" role="form" action="write.action" method="post">
	            <div class="modal-body">
	                <div class="card-body">
	                  <div class="form-group">
	                    <label for="exampleInputEmail1">제목</label>
	                    <input id="projectName" name="projectName" class="form-control" type="text" placeholder="제목을 입력해주세요">
	                  </div>
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">설명</label>
	                    <input id="content" name="content" class="form-control" type="text" placeholder="선택사항">
	                  </div>
                      <!-- radio -->
                      <div class="form-group"  style="display: none;">
                        <div class="custom-control custom-radio float-left" style="width:50%;">
                          <input id="publicRadio1" name="isPublic" value="false" class="custom-control-input" type="radio" checked>
                          <label for="publicRadio1" class="custom-control-label">비공개
                          <br><p style="font-weight: 400; font-size: 0.9rem;">추가된 멤버만 엑세스 가능</p>
                          </label>
                        </div>
                        <div class="custom-control custom-radio float-left" style="width:50%;">
                          <input id="publicRadio2" name="isPublic" value="true"  class="custom-control-input" type="radio">
                          <label for="publicRadio2" class="custom-control-label">공개
                          <br><p style="font-weight: 400; font-size: 0.9rem;" >워크스페이스의 모든 멤버 엑세스 가능</p>
                          </label>
                        </div>
                      </div>
					  <div class="row">
				 		<label for="publicRadio1" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel2" class="selected2 info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-user-lock"></i></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">비공개</span>
			                <span class="info-box-text">추가된 멤버만 엑세스 가능</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			            <label for="publicRadio2" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel2" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-globe"></i></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">공개</span>
			                <span class="info-box-text">모든가 멤버 엑세스 가능</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			          </div>
                      
                      <div>
                        <label for="exampleInputEmail1">프로젝트 멤버(선택사항)</label>
	                  	  <div class="form-group">			              
			              <div class="row" style="padding:10px">
			              	<div id="add_mem" class="btn btn-secondary float_left" style="width:37px;">+</div>
			              	<div class="float_left mem">
			              		<div class="mem_img">사진</div>
			              		<div class="mem_name">멤버1</div>
			              		<div class="mem_rm" aria-hidden="true">&times;</div>
			              	</div>
			              	<div class="float_left mem">
			              		<div class="mem_img">사진</div>
			              		<div class="mem_name">멤버1</div>
			              		<div class="mem_rm" aria-hidden="true">&times;</div>
			              	</div>
			              	<div class="float_left mem">
			              		<div class="mem_img">사진</div>
			              		<div class="mem_name">멤버1</div>
			              		<div class="mem_rm" aria-hidden="true">&times;</div>
			              	</div>
			              </div>
			              </div>
                      </div>
                      
                      <div>
	                    <label for="exampleInputEmail1">템플릿 선택</label>
                      </div>
	                   <div class="form-group" style="display: none;">
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template1" name="templateNo" value="basics"  class="custom-control-input" type="radio" checked>
		                         <label for="template1" class="custom-control-label">기본</label>
		                      </div>
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template2" name="templateNo" value="weekday"  class="custom-control-input" type="radio">
		                         <label for="template2" class="custom-control-label">평일</label>
		                      </div>
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template3" name="templateNo" value="individual"  class="custom-control-input" type="radio">
		                         <label for="template3" class="custom-control-label">개인</label>
		                      </div>
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template4" name="templateNo" value="department"  class="custom-control-input" type="radio">
		                         <label for="template4" class="custom-control-label">부서</label>
		                      </div>
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template5" name="templateNo" value="khanban"  class="custom-control-input" type="radio">
		                         <label for="template5" class="custom-control-label">칸반(Kanban)</label>
		                      </div>
			            </div>
					
					  <div class="row">
				 		<label for="template1" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel1" class="selected1 info-box-icon bg-info elevation-1 width-50px"><i   id="nametemplate" class="fas fa-border-none"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">기본</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
			
				 		<label for="template2" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel1" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-calendar-alt"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">평일</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
				 		<label for="template3" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel1" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-users"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">개인</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
				 		<label for="template4" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel1" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-briefcase"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">부서</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
				 		<label for="template5" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel1" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-chalkboard"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">칸반</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
			          </div>
			          
			          
	                </div>
	                <!-- /.card-body -->
	            </div>

	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	              <button type="button" class="btn btn-primary" id="saveSubmit">프로젝트 만들기</button>
	            </div>
            </form>
          
  
      <!-- 멤버 추가 모달 -->
      <div class="modal fade" id="memberAddModal">
        <div class="modal-dialog modal-sm" style="top:50%;left:0">
          <div class="modal-content">
            <div class="modal-header">
              <h6 class="modal-title" style="font-weight:bold">멤버</h6>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="padding:10px;">
              <input style="width:100%;height:30px;border:1px solid #17a2b8;border-radius:.20rem;padding:10px;margin-bottom:10px;"type="text" placeholder="이름 혹은 이메일로 찾기">
            
            	<div style="margin-bottom:20px;">
            	<div class="_mem">
            		<div class="_mem_img">사진</div>
            		<div class="_mem_name">멤버이름</div>
            		<div class="_mem_icon">아이콘</div>
            	</div>
            	<div class="_mem">
            		<div class="_mem_img">사진</div>
            		<div class="_mem_name">멤버이름</div>
            		<div class="_mem_icon">아이콘</div>
            	</div>
            	<div class="_mem">
            		<div class="_mem_img">사진</div>
            		<div class="_mem_name">멤버이름</div>
            		<div class="_mem_icon">아이콘</div>
            	</div>
            	</div>
            	
            </div>
            <div id="addFooter" class="modal-footer" style="border:none;color: white;background-color: #17a2b8;font-weight: bold;">
              <img src="/dist/img/add-user-icon.png">
              <div>멤버 초대하기</div>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      


