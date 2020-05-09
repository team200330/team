<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>

	<div id="updateWorkspaceManagerModal" class="modal fade">
        <div class="modal-dialog modal-lg">
          <div class="modal-content" style="min-width: 600 !important;">
            <div class="modal-header" style="border:none; padding:10px;">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div style="text-align:center">
            	<h4 style="display:inline-block; font-weight:bold;">소유권 이전하기</h4>
            	
            </div>
            <div class="modal-body" style="margin:40px;margin-bottom:20px;margin-top:20;">
            	<div style="text-align: center;font-size: 11pt; color: #555555;">
            		계정을 삭제하기 전에 회원님의 워크스페이스를 다른 팀원에게 이전해야 합니다. 워크스페이스만 이전되며 회원님이 생성한 프로젝트, 업무는 전부 삭제됩니다. <br>소유권을 이전할 수 있는 팀원이 없다면 계정 삭제가 불가능합니다.
            	</div>
              	<div style="margin-top: 20px;font-size: 9.5pt;color: #9d9b9b;">소유권 이전이 필요한 워크스페이스</div>
              	 <table class="table table-head-fixed text-nowrap" style="border-top: 10px solid #dfdfdf;font-size: 10.5pt;">
              	 	<tbody>
              	 		
              	 		<c:if test="${not empty mypage_workspaces}">
              	 		<c:forEach var="workspace" items="${mypage_workspaces}">
              	 			<tr height="60px" id="${workspace.workspaceNo}">
              	 			<td width="30%">${workspace.workspaceName}</td>
              	 			<td width="50%">
              	 				<c:choose>
									<c:when test="${not empty loginuser.img}">
										<img class="img-circle img-bordered-sm" src="/team/resources/img/profile/${loginuser.img}">
									</c:when>
									<c:otherwise>
										<img class="img-circle img-bordered-sm" src="/team/resources/img/profile-default.jpg">
									</c:otherwise>
								</c:choose>
              	 				<i class="fas fa-chevron-right" style="margin-left: 7px;margin-right: 7px;"></i>
              	 				<img class="img-circle img-bordered-sm change-manager-img" src="/team/resources/img/profile-default.jpg">
              	 				<span class="manager-email">관리자를 선택하세요</span>
              	 				
              	 				
              	 			</td>
              	 			<td width="20%" style="text-align:right">
								<a class="member-add-modal-btn" style="font-size:10pt;color: #17a2b8" id="${workspace.workspaceNo}">소유권 이전</a>
							</td>
              	 		</tr>
              	 		</c:forEach>
              	 		</c:if>
              	 	</tbody>
              	 </table>
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <div id="submit_btn" style="display:inline-block; width: 180;font-weight: bold;" class="btn btn-info">다음 : 계정 삭제하기</div>
            </div>
            
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>

      
       <!-- 멤버 추가 모달 -->
      <div class="modal fade" id="memberAddModal">
        <div class="modal-dialog modal-sm" >
          <div class="modal-content" style="left:187px;top:270;">
            <div class="modal-header">
              <h6 class="modal-title" style="font-weight:bold">멤버</h6>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="padding:10px;">
              <input id="_mem_input" style="width:100%;height:30px;border:1px solid #17a2b8;padding:10px;margin-bottom:10px;"type="text" placeholder="이름 혹은 이메일로 찾기">
            
            	<div id="workspace_mem" style="margin-bottom:20px;">
	            	
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
      
      
      
      
      <div id="deleteUserModal" class="modal fade">
        <div class="modal-dialog modal-lg">
          <div class="modal-content" style="min-width: 600 !important;">
            <div class="modal-header" style="border:none; padding:10px;">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div style="text-align:center">
            	<h4 style="display:inline-block; font-weight:bold;">계정 삭제</h4>
            	
            </div>
            <div class="modal-body" style="margin:40px;margin-bottom:20px;margin-top:20;">
            	<div style="text-align: center;font-size: 11pt; color: #555555;">
            		한번 삭제된 계정은 다시 복구할 수 없으며 영구적으로 삭제됩니다.
            	</div>
            	<div style="text-align:center;font-size:11pt; font-weight:bold; margin-top:25px">
            		이메일 계정 확인<br><br>
            		<input type="text" id="check-email" style="width: 250px;height: 30;border-radius: .20rem; border: 1px solid #b3b3b3; padding-left: 10px;margin-bottom:10px !important"><br>
            		<input type="checkbox" id="check"> <span style="font-weight:normal; font-size:10pt; color:gray">계정 삭제에 동의합니다.</span>
            	</div>
            	
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <button id="delete-action-btn" class="submit-btn" style="background-color:#e95e51; color:white !important; width: 170;font-weight: bold;height: 40; border-radius: .10rem;border: 1px solid #e95e51;">계정 삭제하기</button>
            </div>
            
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
