<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<section class="section-body">
	<div class="body-top">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
	<div class="body-task" style="height: 73%;
		 display: flex; flex-wrap: nowrap; white-space: nowrap; overflow-x: scroll; padding: 15 0 0 15;">
		<div id="task-container">
			<div style="display: flex; flex-wrap: nowrap;">
			<c:forEach items="${ taskLists }" var="taskList">
				<div class="btn btn-primary active" style="width:300px; margin-right: 5pt; padding: 0 0 0 0;">
					<div id="taskList-${ taskList.listNo }" class="btn btn-primary active" style="display: flex" data-tno="${ taskList.listNo }" data-pno="${ taskList.projectNo }">
						<div id="listname" style="width:80%; text-align: left;">
							<span>${ taskList.listName }</span>
						</div>
						<div id="settings" style="width:20%; display:flex; padding-top: 3pt">
							<div style="width:60%;">
								<i id="add-task" style="cursor: pointer" class="fas fa-plus"></i>
							</div>
							<div style="width:40%;">
								<i id="task-setting" style="cursor: pointer" class="fas fa-ellipsis-v" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
								<div id="${ taskList.listNo }" class="dropdown-menu" aria-labelledby="dropdownMenu2">
								    <button class="dropdown-item list-delete-btn" type="button">리스트 삭제</button>
								    <button class="dropdown-item" type="button">Another action</button>
								    <button class="dropdown-item" type="button">Something else here</button>
								</div>
							</div>
						</div>
					</div>
					<section id="task-add-div" style="display: none;">
						<div class="taskwrap" style="display:table; margin-left:auto; margin-right:auto;">
							<textarea id="task-content" class="form-control" style="width:290px; min-height:77px; overflow-y:hidden; resize: none;"></textarea>
						</div>
						<div style="display:flex; flex-wrap:nowrap; height:30px;  margin-top: 5px;  margin-bottom: 5px;">
							<div style="padding-left:10px; padding-right:10px; width:50%; margin-top: 7px; text-align: left;">
								<i class="fas fa-user-plus" style="padding-right:10px;"></i><i class="far fa-calendar-alt"></i>
							</div>
							<div style="float:right; width:50%; text-align: right; padding-right:5px;">
								<button id="cancel-task" type="button" class="btn btn-light" style="width:70px; height:30px; padding: 0 0 0 0; font-size:13px; font-weight:bold;">취소</button>
								<button id="create-task" type="button" class="btn btn-info" style="width:70px; height:30px; padding: 0 0 0 0; font-size:13px; font-weight:bold;">만들기</button>
							</div>
						</div>
					</section>
				</div>
			</c:forEach>
			</div>
		</div>
		<div id="add-task-div" style="padding-right: 15px;">
			<div class="btn btn-secondary" style="width:300px">
				<div id="add-task-button-div" style="cursor: pointer;">
					<span id="add-task-span"> <i class="fas fa-plus"></i> 새 업무리스트만들기</span>
				</div>
				<div id="add-task-textarea-div" style="display: none;">
					<div id="addTaskForm" style="margin: 0pt">
						<input id="add-task-textarea" name="listName" type="text" value=""
							placeholder="업무리스트 이름" style="width: 190pt; height: 18pt;">
						<!-- 임시 프로젝트 번호 -->
						<input id="add-task-projectNo" name="projectNo" type="hidden"
							value="1"> <span id="cancel-add"
							style="padding-left: 5pt; cursor: pointer;"> <i
							class="fas fa-times"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>