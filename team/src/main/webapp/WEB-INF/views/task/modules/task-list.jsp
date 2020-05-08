<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page pageEncoding="utf-8"%>
<section class="section-body">
	<div class="body-top">
		<div class="bg-dark">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="width:400px">
			<i class="fas fa-search"></i>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 전체 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">나에게 배정된 업무</a> <a
								class="dropdown-item" href="#">내가 생성한 업무</a> <a
								class="dropdown-item" href="#">팔로우 중</a>
						</div></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="업무 검색" aria-label="Search">
					<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</nav>
		</div>
	</div>
	<div id="body-task" style="height: 79%;
		 display: flex; flex-wrap: nowrap; white-space: nowrap; overflow-x: scroll; padding: 15 0 0 15;">
		<div id="task-container">
			<div style="display: flex; flex-wrap: nowrap; align-items: flex-start">
				<c:forEach items="${ taskLists }" var="taskList">
					<div id="taskList-task-wrapper-${ taskList.listNo }" onmousemove="event.stopPropagation();" class="taskList-task" style="margin-bottom: 5px">
						<div id="taskList-wrapper" class="btn btn-primary active" 
						style="width:300px; margin-right: 5pt; padding: 0 0 0 0; border-radius: 0; background-color:#308eb7; border-color:#308eb7;">
							<div id="taskList-div-${ taskList.listNo }" class="btn btn-primary active" style="display: flex; background-color:#308eb7; border-color:#308eb7;" data-tno="${ taskList.listNo }" data-pno="${ taskList.projectNo }">
								<div id="listname" style="width:80%; text-align: left;">
									<span>${ taskList.listName }</span>
								</div>
								<div id="settings" style="width:20%; display:flex; padding-top: 3pt">
									<div id="icon-addtask-div" style="width:60%;">
										<i id="icon-addtask-taskList-${ taskList.listNo }" style="cursor: pointer" class="fas fa-plus icon-addtask"></i>
									</div>
									<div id="tl-setting-wrap" style="width:40%;">
										<!-- 
										<i id="icon-setting-${ taskList.listNo }" style="cursor: pointer" class="fas fa-ellipsis-v menu-setting" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
										 -->
										<i id="icon-setting-${ taskList.listNo }" style="cursor: pointer" class="fas fa-ellipsis-v menu-setting"></i>
										<!-- 
										<div id="tl-setting-${ taskList.listNo }" class="dropdown-menu tl-setting">
										 -->
										<div class="dropdown">
											<div id="tl-setting-${ taskList.listNo }" class="dropdown-menu tl-settings">
											    <button class="dropdown-item" type="button">Another action</button>
											    <button class="dropdown-item" type="button">Something else here</button>
											    <div class="dropdown-divider"></div>
											    <button class="dropdown-item warning list-delete-btn" style="color:red;" type="button">리스트 삭제</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<section id="task-add-div-taskList-${ taskList.listNo }" style="display: none;"  data-tno="${ taskList.listNo }" data-pno="${ taskList.projectNo }">
								<div class="taskwrap" style="display:table; margin-left:auto; margin-right:auto;">
									<textarea id="task-content-${ taskList.listNo }" class="form-control task-content" placeholder="새 업무 만들기" style="width:290px;min-height:68px;overflow-y:hidden; resize: none; font-size:11pt;"></textarea>
								</div>
								<div style="display:flex; flex-wrap:nowrap; height:30px;  margin-top: 5px;  margin-bottom: 5px;">
									<div style="padding-left:10px; padding-right:10px; width:50%; margin-top: 7px; text-align: left;">
										<i class="fas fa-user-plus" style="padding-right:10px;"></i><i class="far fa-calendar-alt"></i>
									</div>
									<div style="float:right; width:50%; text-align: right; padding-right:5px;">
										<!--
										<button id="cancel-task-${ taskList.listNo }" onclick="hideAddTaskDiv(this)" type="button" class="btn btn-light" style="width:70px; height:30px; padding: 0 0 0 0; font-size:13px; font-weight:bold;">취소</button>
										<button id="create-task-${ taskList.listNo }" onclick="insertTask(this)"type="button" class="btn btn-info" style="width:70px; height:30px; padding: 0 0 0 0; font-size:13px; font-weight:bold;">만들기</button>
										-->
										<button id="cancel-task-${ taskList.listNo }" type="button" class="btn btn-light cancel-task-btn" style="width:70px; height:30px; padding: 0 0 0 0; font-size:13px; font-weight:bold;">취소</button>
										<button id="create-task-${ taskList.listNo }" type="button" class="btn btn-info create-task-btn" style="width:70px; height:30px; padding: 0 0 0 0; font-size:13px; font-weight:bold;">만들기</button>
									</div>
								</div>
							</section>
						</div>
						<div id="taskarea">
							<c:forEach items="${ tasks }" var="task">
								<c:if test="${task.listNo eq taskList.listNo }">
									<div class="dropright">
									<c:choose>
										<c:when test="${ task.completed eq false }">
											<div id="task-${task.taskNo}" class="btn btn-light task-field" 
											style="margin-top:3px; width:300px; min-height:38px;height:auto; border-radius: 0;"
											data-tno="${ task.taskNo }" data-lno="${ taskList.listNo }">
										</c:when>
										<c:otherwise>
											<div id="task-${task.taskNo}" class="btn btn-light task-field completed" 
											style="margin-top:3px; width:300px; min-height:38px;height:auto; border-radius: 0;"
											data-tno="${ task.taskNo }" data-lno="${ taskList.listNo }">
										</c:otherwise>
									</c:choose>
											<div id="cbox-content-wrap" style="display:flex; flex-wrap:nowrap;">
											<div id="checkbox-div">
												<div class="custom-control custom-checkbox">
													<c:choose>
														<c:when test="${ task.completed eq false }">
															<input id="checkbox-${ task.taskNo }" type="checkbox" class="custom-control-input task-chbox">
														</c:when>
														<c:otherwise>
															<input id="checkbox-${ task.taskNo }" type="checkbox" class="custom-control-input task-chbox" checked="checked">
														</c:otherwise>
													</c:choose>
													<label class="custom-control-label" for="checkbox-${ task.taskNo }"></label>
												</div>
											</div>
											<div id="content-div">
												<span style="display:block; text-align:left; white-space: normal; word-break: break-all;">${ task.content }</span>
											</div>
											</div>
											<c:if test="${ task.completed eq true }">
											<div class="dropdown-divider"></div>
											<div style="text-align:left; font-size:8pt">
												<span>
													<fmt:formatDate value="${task.completedDate}" pattern="yyyy-MM-dd E요일  HH:mm"/> 에 완료
												</span>
											</div>
											</c:if>
										</div>
										<!-- 
										<div id="${ task.taskNo }" class="dropdown-menu" aria-labelledby="task-${task.taskNo}">
										    <button class="dropdown-item task-delete-btn" type="button">업무 삭제</button>
										    <button class="dropdown-item" type="button">Another action</button>
										    <button class="dropdown-item" type="button">Something else here</button>
										</div>
										 -->
										<div id="menu-${ task.taskNo }" class="contextmenu dropdown-menu">
										  <button class="dropdown-item">기능1</button>
										  <button class="dropdown-item">기능2</button>
										  <div class="dropdown-divider"></div>
										  <button class="dropdown-item warning task-delete-btn" style="color:red;">업무 삭제</button>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="add-task-div" style="padding-right: 15px;">
			<div id="add-task-btn" class="btn btn-secondary" style="width:300px; height:40px; border-radius: 0; cursor: pointer;">
				<div id="add-task-button-div" style="margin-top: 2px;">
					<span id="add-task-span"> <i class="fas fa-plus"></i> 새 업무리스트만들기</span>
				</div>
				<div id="add-task-textarea-div" style="display: none;">
					<div id="addTaskForm" style="margin: 0pt">
						<input id="add-task-textarea" name="listName" type="text" value=""
							placeholder="업무리스트 이름" style="width: 190pt; height: 18pt;">
						<!-- 임시 프로젝트 번호 -->
						<input id="add-task-projectNo" name="projectNo" type="hidden"
							value="${ projectByNo.projectNo }"> <span id="cancel-add"
							style="padding-left: 5pt; cursor: pointer;"> <i
							class="fas fa-times"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div id="temparea" style="width:600px; display:none;">
			</div>
		</div>
		<div id="task-properties" class="menu-component">
			<jsp:include page="task-properties.jsp"></jsp:include>
		</div>
	</div>
</section>