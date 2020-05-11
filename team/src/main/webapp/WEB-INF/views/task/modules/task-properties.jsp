<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page pageEncoding="utf-8"%>

<div id="task-menu-wrap">
	<div id="task-menu">
		<div id="task-close-btn" class="menu-component" style="padding-top:18px;">
			<!-- 
			<i onclick="history.back();" style="cursor:pointer;" class="fas fa-times"></i>
			 -->
			<i id="close-properties" style="cursor:pointer;" class="fas fa-times"></i>
		</div>
		<div id="task-menu-top" class="" style="height:53px; width:100%; padding: 10 10 10 10;">
			<div>
				<span id="task-side-content" style="font-size:20px;">${ selectedTask.content }</span>	
			</div>
			<div>
				<span style="font-size:12px;">#${ selectedTask.taskNo }</span>
				<span style="font-size:12px;">작성자 ${ selectedTask.writer }</span>
				<span style="font-size:12px;">작성일 ${ selectedTask.createDate }<fmt:formatDate value="${ selectedTask.createDate }" pattern="yyyy년 MM월 dd일 HH:mm"/></span>
				<c:choose>
					<c:when test="${selectedTask.startDate eq null}">
						<span id="startDate">널입니다</span>	
					</c:when>
					<c:otherwise>
						<span id="startDate"><fmt:formatDate value="${ selectedTask.startDate }" pattern="yyyy-MM-dd HH:mm"/></span>	
					</c:otherwise>
				</c:choose>
				<span id="endDate">${ selectedTask.endDate }</span>	
			</div>
		</div>
		<div class="header-center"
			style="flex-basis: 33%; text-align: center; padding-top: 20px; display: flex;">
			<div style="width:50%; margin: 10px;">
				<a class="f_link properties" id="active" href="#">　　　　　　　속성　　　　　　　</a>&nbsp;&nbsp;
			</div>
			<div style="width:50%; margin: 10px;">
				<a class="f_link properties" id="active2" href="#">　　　　　　　파일　　　　　　　</a>&nbsp;&nbsp;
			</div>
		</div>
		<div id="task-menu-properties" style="background-color: #eef7f7; height: 100%; padding-top: 15px">
			<div id="properties-item1" class="pitem" style="display: flex; padding: 20 30 20 30;">
				<div style="width:150px; text-align: left; display:flex;">
					<div style="width:25px; padding-top:3px;">
						<i class="far fa-calendar-alt"></i>
					</div>
					<div>
						<span>업무기간</span>
					</div>
				</div>
				<div style="display: flex;">
					<div style="display: flex;">
						 <div>
							 <span>시작 일</span>
							 <div id="pickerFrom"></div>
						 </div>
						 <div style="padding-top:30px;">
						 	<span>　~　</span>
						 </div>
						 <div>
							 <span>마감 일</span>
							 <div id="pickerTo"></div>
						 </div>
					</div>
					<div>
					</div>
				</div>
			</div>
			<div id="properties-item2" class="pitem" style="display: flex; padding: 20 30 20 30;">
				<div style="width:150px; text-align: left; display:flex;">
					<div style="width:25px; padding-top:3px;">
						<i class="fas fa-user-plus"></i>
					</div>
					<div>
						<span>배정된 멤버</span>
					</div>
				</div>
				<div>
					<div style="padding-top:5px;">
						<i class="far fa-plus-square"></i>
					</div>
					<div>
					</div>
				</div>
			</div>
			<div id="properties-item3" class="pitem" style="display: flex; padding: 20 30 20 30;">
				<div style="width:150px; text-align: left; display:flex;">
					<div style="width:25px; padding-top:3px;">
						<i class="far fa-check-square"></i>
					</div>
					<div>
						<span>체크리스트</span>
					</div>
				</div>
				<div>
					<div style="padding-top:5px;">
						<i class="far fa-plus-square"></i>
					</div>
					<div>
					</div>
				</div>
			</div>
			<div id="properties-item4" style="display: flex; padding: 30px;">
			</div>
		</div>
	</div>
</div>

<!-- modal -->
<!-- 
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">업무 기간 설정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="text-align:left;">
				<input class="myDatePicker">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
 -->
<script type="text/javascript">
	function chooseDate(){
		var startDate = $("#startDate").text();
		return startDate == null ? "now" : startDate;
	}
	console.log("뭐고?: "+$("#startDate").text());
	$('#pickerFrom').dateTimePicker({
		selectData : $("#startDate").text(),
		positionShift : {
			top : 50,
			left : -250
		},
		title : "시작 시간을 설정하세요",
	});
	$('#pickerTo').dateTimePicker({
		selectData : "now",
		positionShift : {
			top : 50,
			left : -450
		},
		title : "마감 시간을 설정하세요",
	});
</script>