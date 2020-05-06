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
				<span style="font-size:12px;">작성자 ${ selectedTask.writer }</span>
				<span style="font-size:12px;">작성일 <fmt:formatDate value="${ selectedTask.createDate }" pattern="yyyy년 MM월 dd일 HH:mm"/></span>	
			</div>
		</div>
		<div class="header-center"
			style="flex-basis: 33%; text-align: center; padding-top: 20px;">
			<a id="active" class="f_link" href="#">속성</a>&nbsp;&nbsp;
			<a id="active2" class="f_link" href="#">코멘트</a>&nbsp;&nbsp;
		</div>
		<div id="task-menu-properties" style="margin-top: 13%; background-color: #eef7f7; height: 100%;">
			<div>
			</div>
		</div>
	</div>
</div>