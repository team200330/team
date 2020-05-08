<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="task-menu-wrap">
	<div id="task-menu">
		<div id="task-close-btn" class="menu-component" style="padding-top:18px;">
			<i onclick="history.back();" style="cursor:pointer;" class="fas fa-times"></i>
		</div>
		<div id="task-menu-top" class="" style="height:53px; width:100%">
			<div>
			</div>
			<span id="task-side-content">${ selectedTask.content }</span>	
		</div>
	</div>
</div>