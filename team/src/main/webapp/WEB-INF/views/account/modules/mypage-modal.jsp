<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>

	<div id="deleteUserModal" class="modal fade">
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
            		계정을 삭제하기 전에 회원님의 워크스페이스를 다른 팀원에게 이전해야 합니다. 워크스페이스만 이전되며 회원님이 생성한 프로젝트, 업무는 전부 삭제됩니다.
            	</div>
              	<div style="margin-top: 20px;font-size: 9.5pt;color: #9d9b9b;">소유권 이전이 필요한 워크스페이스</div>
              	 <table class="table table-head-fixed text-nowrap" style="border-top: 10px solid #dfdfdf;font-size: 10.5pt;">
              	 	<tbody>
              	 		<tr height="60px">
              	 			<td width="30%">워크스페이스 이름</td>
              	 			<td width="50%">
              	 				<img class="img-circle img-bordered-sm" src="/team/resources/img/profile-default.jpg">
              	 				<i class="fas fa-chevron-right" style="margin-left: 7px;margin-right: 7px;"></i>
              	 				<img class="img-circle img-bordered-sm" src="/team/resources/img/profile-default.jpg">
              	 				관리자를 선택하세요
              	 			</td>
              	 			<td width="20%" style="text-align:right">
								<a class="member-add-modal-btn" style="font-size:10pt;color: #17a2b8">소유권 이전</a>
							</td>
              	 		</tr>
              	 		<tr>
              	 			<td>워크스페이스 이름</td>
              	 			<td>관리자 : 관리자이메일</td>
              	 			<td>소유권 이전하기 버튼</td>
              	 		</tr>
              	 		<tr>
              	 			<td>워크스페이스 이름</td>
              	 			<td>관리자 : 관리자이메일</td>
              	 			<td>소유권 이전하기 버튼</td>
              	 		</tr>
              	 	</tbody>
              	 </table>
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <div id="submit_btn" style="display:inline-block;width:150px;" class="btn btn-info">다음 : 계정 삭제하기</div>
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
	            	<c:forEach var="m" items="${ workspaceMembers }">
	            		
	            		<c:if test="${ m.email != loginuser.email }">
	            		<div class="_mem" data-email="${ m.email }" data-name="${ m.name }" data-img="${ m.img }">
	            			<c:choose>
								<c:when test="${not empty m.img}">
									<img class="_mem_img img-circle img-bordered-sm" src="/team/resources/img/profile/${m.img}">
								</c:when>
								<c:otherwise>
									<img class="_mem_img img-circle img-bordered-sm" src="/team/resources/img/profile-default.jpg">
								</c:otherwise>
							</c:choose>
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
