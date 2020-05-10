<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>

<!-- 워크스페이스에 멤버초대 모달 -->
 <div id="inviteMemberModal" class="modal fade">
        <div class="modal-dialog modal-lg" style="width: 600px;">
          <div class="modal-content" >
            <div class="modal-header" style="border:none; padding:10px;">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div style="text-align:center">
            	<h4 style="display:inline-block; font-weight:bold;">워크스페이스에 멤버 초대</h4>
            	
            </div>
            <div class="modal-body" style="margin:40px;margin-bottom:20px;margin-top:20;">
            	<div style="text-align: center;font-size: 11pt; color: #555555;">
            		초대할 팀원의 이메일을 입력하세요. 팀원이 발송된 초대 코드를 입력하면 워크스페이스에 참여가 가능합니다.
            	</div>
            	<div style="text-align:center;font-size:11pt; font-weight:bold; margin-top:25px">
            		이메일 입력<br><br>
            		<input type="text" id="invite-email" style="width: 250px;height: 30;border-radius: .20rem; border: 1px solid #b3b3b3; padding-left: 10px;margin-bottom:10px !important"><br>
            		<input type="checkbox" id="check"> <span style="font-weight:normal; font-size:10pt; color:gray">메일 발송에 동의합니다.</span>
            	</div>
            	
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <button id="send-invite-code" class="submit-btn" style="background-color:#17a2b8; color:white !important; width: 170;font-weight: bold;height: 40; border-radius: .10rem;border: 1px solid #17a2b8;">초대코드 발송하기</button>
            </div>
            
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
   <!-- 참여하기 모달 -->
  <div id="joinWorkspaceModal" class="modal fade">
        <div class="modal-dialog modal-lg" style="width: 600px;">
          <div class="modal-content" >
            <div class="modal-header" style="border:none; padding:10px;">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div style="text-align:center">
            	<h4 style="display:inline-block; font-weight:bold;">다른 워크스페이스에 참여</h4>
            	
            </div>
            <div class="modal-body" style="margin:40px;margin-bottom:20px;margin-top:20;">
            	<div style="text-align: center;font-size: 11pt; color: #555555;">
            		워크스페이스 초대코드를 입력하여 다른 워크스페이스에 참여합니다. 초대코드는 다른 팀원이 메일로 발송합니다. 
            	</div>
            	<div style="text-align:center;font-size:11pt; font-weight:bold; margin-top:25px">
            		초대코드 입력<br><br>
            		<form method="post" action="/team/workspace/join" id="workspaceJoinForm">
	            		<input type="hidden" name="workspaceNo" id="form-workspaceNo">
	            		<input type="hidden" value="${loginuser.email}" name="email">
	            		<input type="text" id="join-code" name="code" style="text-align: center;width: 250px;height: 30;border-radius: .20rem; border: 1px solid #b3b3b3; padding-left: 10px;margin-bottom:10px !important"><br>
	            		<span style="font-weight:normal; font-size:10pt; color:gray">초대코드가 일치하면 워크스페이스에 참여됩니다.</span>
            		</form>
            	</div>
            	
            </div>
           
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <button id="workspace-join-btn" class="submit-btn" style="background-color:#17a2b8; color:white !important; width: 170;font-weight: bold;height: 40; border-radius: .10rem;border: 1px solid #17a2b8;">참여하기</button>
            </div>
            
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>