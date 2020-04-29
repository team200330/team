<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <div class="modal-header">
              <h4 class="modal-title">새 프로젝트</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form id="detail-form2" role="form" action="detail.action" method="post">
            <input type="hidden" id="projectNo" />
	            <div class="modal-body">
	                <div class="card-body">
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
          
  
      <!-- 멤버 추가 모달 -->
      <div class="modal fade" id="memberAddModal">
        <div class="modal-dialog modal-sm" style="top:210;left:-195">
          <div class="modal-content">
            <div class="modal-header">
              <h6 class="modal-title" style="font-weight:bold">멤버</h6>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="padding:10px;">
              <input id="_mem_input" style="width:100%;height:30px;border:1px solid #17a2b8;padding:10px;margin-bottom:10px;"type="text" placeholder="이름 혹은 이메일로 찾기">
            
            	<div id="workspace_mem" style="margin-bottom:20px;">
	            	<c:forEach var="m" items="${ workspaceMembers }">
	            		<c:if test="${ m.email != loginuser.email }">
	            		<div class="_mem" data-email="${ m.email }" data-name="${ m.name }">
		            		<img class="_mem_img img-circle img-bordered-sm" src="" alt="user image">
		            		<div class="_mem_name">${ m.email }<br/>${ m.name }</div>
		            		<div class="_mem_icon _mem_icon_default" style="text-align:right" >
		            			<i class="fas fa-check"></i>
		            		</div>
		            	</div>
		            	</c:if>
	            	</c:forEach>
            	</div>
            	
            </div>
            <div id="addFooter" class="modal-footer" style="border:none;color: white;background-color: #17a2b8;font-weight: bold;">
              <i class="fas fa-user-plus"></i>
              <a href="/team/workspace/invite-workspace" style="color:white">멤버 초대하기</a>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      


