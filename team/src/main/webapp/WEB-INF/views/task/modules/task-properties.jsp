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
				<span style="font-size:12px;">작성일 <fmt:formatDate value="${ selectedTask.createDate }" pattern="yyyy년 MM월 dd일 HH:mm"/></span>	
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
		<div id="task-menu-properties" style="background-color: #eef7f7; height: 100%;">
			<div id="properties-item1" style="display: flex; padding: 30px;">
				<div style="width:150px; text-align: left;">
					<i class="far fa-calendar-alt"></i> 업무기간
				</div>
				<div>
					<div>
						<i class="far fa-plus-square"></i>
					</div>
					<div>
					</div>
				</div>
			</div>
			<div id="properties-item2" style="display: flex; padding: 30px;">
				<div style="width:150px; text-align: left;">
					<i class="fas fa-user-plus"></i> 배정된 멤버
				</div>
				<div>
					<div>
						<i class="far fa-plus-square"></i>
					</div>
					<div>
					</div>
				</div>
			</div>
			<div id="properties-item3" style="display: flex; padding: 30px;">
				<div style="width:150px; text-align: left; display:flex;">
					<div>
						<i class="far fa-check-square"></i>
					</div>
					<div>
						체크리스트
					</div>
				</div>
				<div>
					<div>
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