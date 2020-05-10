<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8"%>

	<!-- 업무리스트 선택 모달 -->
  <div id="selectTaskListModal" class="modal fade">
        <div class="modal-dialog modal-lg">
          <div class="modal-content" style="max-width: 500px !important; min-width: 500px !important">
            <div class="modal-header" style="border:none; padding:10px;">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div style="text-align:center">
            	<h4 style="display:inline-block; font-weight:bold;">업무 추가하기</h4>
            	
            </div>
            <div class="modal-body" style="margin:40px;margin-bottom:20px;margin-top:20;">
            	<div style="text-align: center;font-size: 11pt; color: #555555;">
            		해당 날짜를 시작일로 업무를 추가합니다. 프로젝트에 생성된 업무 리스트가 없다면 업무를 추가할 수 없습니다. 업무 리스트를 선택하세요.
            	</div>
              	<div style="margin-top: 20px;font-size: 9.5pt;color: #9d9b9b;">업무 리스트 선택</div>
              	
              	<div style="max-height:300px;overflow-y:scroll;border-top: 10px solid #dfdfdf;">
              	 <table class="table table-head-fixed text-nowrap" style="font-size: 10.5pt;">
              	 	<tbody>
              	 		
              	 		<c:if test="${not empty calTaskLists}">
              	 		<c:forEach var="taskList" items="${calTaskLists}">
              	 			<tr height="60px" class="tasklist-tr">
              	 			<td width="80%">
              	 				<i class="fas fa-clipboard-list" style="margin-right:10px"></i>
              	 				${taskList.listName}
              	 			</td>
              	 			
              	 			<td width="20%" style="text-align:right">
								<a class="tasklist-select-btn" style="font-size:10pt;color: #17a2b8;cursor:pointer" id="${taskList.listNo}">선택</a>
							</td>
              	 		</tr>
              	 		</c:forEach>
              	 		</c:if>
              	 	</tbody>
              	 </table>
              	 </div>
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <div id="select-modal-next-btn" style="display:inline-block; width: 180;font-weight: bold;" class="btn btn-info">다음 : 업무 생성하기</div>
            </div>
            
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      
      <!-- 업무생성 모달 -->
      <div id="addTaskModal" class="modal fade">
        <div class="modal-dialog modal-lg">
          <div class="modal-content" style="max-width: 500px !important; min-width: 500px !important">
            <div class="modal-header" style="border:none; padding:10px;">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div style="text-align:center">
            	<h4 style="display:inline-block; font-weight:bold;">업무 추가하기</h4>
            	
            </div>
            <div class="modal-body" style="margin:40px;margin-bottom:20px;margin-top:20;">
            	<div style="text-align: center;font-size: 11pt; color: #555555;">
            	 업무 리스트 <span id="listName" style="font-weight:bold; margin-left:5px; margin-right:5px"></span> 에 해당 날짜를 시작일로 업무를 추가합니다.
            	</div>
             
    			<h6 style="text-align: center; margin-top: 30px;font-weight: bold;">업무 작성</h6>
              	
              	<form method="post" action="/team/task/addtaskSetStartDate">
              		<textarea name="content" rows="6" style="width:100%;border:1px solid #cccccc;border-radius:.40rem;padding:10px" placeholder="업무 내용을 작성하세요..."></textarea>
            		<input type="hidden" name="listNo" id="listNo">
            		<input type="hidden" name="writer" value="${loginuser.email}">
            		<input type="hidden" name="startDate" id="startDate">
            		<input type="hidden" name="endDate" id="endDate">
            	</form>
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <div id="task-add-btn" style="display:inline-block; width: 180;font-weight: bold;" class="btn btn-info">업무 작성하기</div>
            </div>
            
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
 
