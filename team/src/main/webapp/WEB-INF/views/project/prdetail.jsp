<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.mem2 {	border: 1px #dedede;   background-color: #dedede;   border-radius: 30rem;   width: 115px; height: 32px;    text-align: center;   margin-left: 2px; display: inline-table;}
	.mem_img2 {	width: 30%; height:32px;	border-radius: 30rem;	border: 1px solid;}
	.mem_name2 {width: 50%;}
	.mem_rm2 {width: 50%;height: 100%;}
	.mem2 *, ._mem2 *, .t2 * {display:inline-block;float:left;}
	._mem2 { height:50px;border:1px solid white;border-radius:.20rem;padding:5px; }
	/*._mem_img {width:20%;}*/
	._mem_name2 {width:90%;}
	/*._mem_icon {width:20%;}*/
</style>
            <div class="modal-header">
              <h4 class="modal-title">새 프로젝트</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>


	            <div class="modal-body">
	                <div class="card-body">
	                 <form id="detail-form2" role="form" action="detailUpdate" method="post">
	                  <div class="form-group" style="display:none">
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
                      <div class="form-group"  style="width: 32%; display: block; float: left;" >
	                    <label for="exampleInputPassword1">시작일</label>
	                    <input id="startdate" name="startdate" class="form-control" type="date" >
	                  </div>
	                  <div class="form-group" style="width: 32%; display: block; float: left; margin-left: 5px;">
	                    <label for="exampleInputPassword1">마감일</label>
	                    <input id="deadline" name="deadline" class="form-control" type="date" >
	                  </div>
	                  <div class="form-group" style="width: 32%; display: block; float: left; margin-left: 5px;">
	                    <label for="exampleInputPassword1">완료일</label>
	                    <input id="enddate" name="enddate" class="form-control" type="date" >
	                  </div>
	                  <br>
	                  <div class="form-group" style="display: inline-block;">
	                    <label for="exampleInputPassword1">관리자</label>
	                    <input id="de_managerEmail" name="managerEmail" class="form-control" type="text" value="">
	                  </div>
            		</form>

                     <div class="form-group">
                     <form id="feedback_write_form2" method="post" action="/team/addProjectMember">
                       <label for="exampleInputEmail1">프로젝트 멤버(선택사항)</label> <span style="color:#a0a0a0;">&nbsp;&nbsp;같은 워크스페이스에 있는 사람을 프로젝트에 초대하세요.</span>
		            
		            	<input type="hidden" name="sender" value="${ loginuser.email }"/>
		              	<!-- <div id="add_mem" class="btn btn-secondary float_left" style="width:37px;">+</div> -->
		              	
			            <div class="modal-body" style="padding:10px;">
			              <input id="_mem_input2" style="width:100%;height:30px;border:1px solid #17a2b8;padding:10px;margin-bottom:10px;"type="text" placeholder="이름 혹은 이메일로 찾기">
			            	<div id="mem2"></div>
			            	<div id="workspace_mem2" style="margin-bottom:20px; overflow: auto;  height: 130px;">
				            	<c:forEach var="m" items="${ workspaceMembers }">
				            		<c:if test="${ m.email != loginuser.email }">
				            		<div class="_mem2" data-email="${ m.email }" data-name="${ m.name }">
					            		<div class="_mem_name2">${ m.email }<br/>${ m.name }</div>
					            		<div class="_mem_icon2 _mem_icon_default2" style="text-align:right" >
					            			<i class="fas fa-check"></i>
					            		</div>
					            	</div>
					            	</c:if>
				            	</c:forEach>
			            	</div>
			            </div>
			            <div id="addFooter2" class="modal-footer" style="border:none;color: white;background-color: #17a2b8;font-weight: bold;">
			              <i class="fas fa-user-plus"></i>
			              <button type="button" class="btn btn-primary" id="saveSubmit4">프로젝트에 멤버 추가하기</button>
			            </div>
			            
			            
			            
		              <br/>
		             </form>
		             </div>
		             
		             
		             
		             
		             <!-- 수정한 부분 -->
		              <div class="form-group">
		              	<label>CSV 파일로 내보내기</label> <br>
		              	<form id="download" method="get" action="/team/project/download"></form>
		              	<a id="projectDownloadBtn" class="btn btn-default" style="cursor:pointer">프로젝트 CSV 파일로 내보내기</a>
		              </div>
		           </div>
					<!-- -------- -->



		            <div class="modal-footer justify-content-between">
		              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		              <button type="button" class="btn btn-primary" id="saveSubmit2">수정</button>
		            </div>
	                </div>
	                <!-- /.card-body -->

