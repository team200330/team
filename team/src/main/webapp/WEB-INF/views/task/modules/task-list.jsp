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
				<div class="btn btn-primary" style="width: 300px; margin-right: 5pt; display: flex">
					<div id="listname" style="width:80%; text-align: left;">
						<span>${ taskList.listName }</span>
					</div>
					<div id="settings" style="width:20%; display:flex; padding-top: 3pt">
						<div style="width:50%;">
							<i class="fas fa-plus"></i>
						</div>
						<div style="width:50%">
							<i class="fas fa-ellipsis-v"></i>
						</div>
					</div>
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
					<form id="addTaskForm" style="margin: 0pt">
						<input id="add-task-textarea" name="listName" type="text"
							style="width: 170pt; height: 18pt;">
						<!-- 임시 프로젝트 번호 -->
						<input id="add-task-projectId" name="projectNo" type="hidden"
							value="1"> <span id="cancel-add"
							style="padding-left: 5pt; cursor: pointer;"> <i
							class="fas fa-times"></i>
						</span>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>