<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <div class="modal-header">
              <h4 class="modal-title">새 프로젝트</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form id="detail-form2" role="form" action="detailUpdate" method="post">



	            <div class="modal-body">
	                <div class="card-body">
	                  <div class="form-group">
				        <input id="de_projectNo" type="text" name="projectNo"  value=""/>
			            <input id="de_workspaceNo" type="text" name="workspaceNo"  value=""/>
			            <input id="de_templateNo" type="text" name="templateNo"  value=""/>
			            <input id="de_proNo" type="text" name="proNo"  value=""/>
			          </div>
	                  <div class="form-group">
	                    <label for="exampleInputEmail1">제목</label>
	                    <input id="de_projectName" name="projectName" class="form-control" type="text" placeholder="제목을 입력해주세요" value="">
	                  </div>
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">설명</label>
	                    <input id="de_content" name="content" class="form-control" type="text" placeholder="선택사항">
	                  </div>
                      <!-- radio -->
                      
                      <div class="form-group" id="publicDiv">
                        
                      </div>
                      <div class="form-group">
	                    <label for="exampleInputPassword1">시작일</label>
	                    <input id="startdate" name="startdate" class="form-control" type="date" >
	                  </div>
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">마감일</label>
	                    <input id="deadline" name="deadline" class="form-control" type="date" >
	                  </div>
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">완료일</label>
	                    <input id="enddate" name="enddate" class="form-control" type="date" >
	                  </div>
	                  
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">관리자</label>
	                    <input id="de_managerEmail" name="managerEmail" class="form-control" type="text" value="">
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
                      

	                </div>
	                <!-- /.card-body -->
	            </div>

	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	              <button type="button" class="btn btn-primary" id="saveSubmit2">수정</button>
	            </div>
            </form>
          
  


