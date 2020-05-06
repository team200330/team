<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="/team" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
<!-- 틀안맞아서 form 뺌
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form> 
    -->
      
      <div class="input-group input-group-sm" style="width: 70%;">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/team/resources/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/team/resources/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="/team/resources/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      
      
      
      <!-- Notifications Dropdown Menu -->
      <c:if test="${ not empty loginuser }">
      <div id="topbar-notifications">
      	<jsp:include page="/WEB-INF/views/modules/topbar-notifications.jsp"/>
      </div>
      </c:if>




		<!-- WorkspaceList Dropdown Menu -->
		<c:if test="${ not empty loginuser }">
			<li class="nav-item dropdown" id="workspace_list_li">
			
				<a class="nav-link" data-toggle="dropdown" href="#"> 
					<i class="far fa-bell"></i>
					<span class="badge badge-warning navbar-badge">w</span>
				</a>
				
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
					<c:if test="${ not empty sessionScope.workspaces }">
					<span class="dropdown-item dropdown-header">워크스페이스 목록</span>
					<div class="dropdown-divider"></div>
					<c:forEach var="workspace" items="${ workspaces }">
					<a href="#" class="dropdown-item workspace_in_dropdown" data-workspaceNo="${ workspace.workspaceNo }">
						<span class="text-sm">${ workspace.workspaceName }</span>
					</a>
					<div class="dropdown-divider"></div>
					</c:forEach>
					</c:if>
					<c:if test="${ empty workspaces }">
					<span class="dropdown-item dropdown-header">워크스페이스 목록</span>
					<div class="dropdown-divider">워크스페이스 없음</div>					
					</c:if>
					<a href="/team/workspace/create-workspace" class="dropdown-item dropdown-footer">워크스페이스 등록</a>
				</div>
			</li>
		</c:if>
		<!-- WorkspaceList Dropdown Menu -->

		<!-- 필요한사람이 살리세요  -->
      <!-- 
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
      -->
    </ul>
  </nav>

<script type="text/javascript">

	/* console.log('say hello1');
	var workspacename = document.querySelector("#workspacename");
	
	workspacename.addEventListener('click', function (event) {
		console.log('say hello2');
    }); */

    var current_workspace_no = null;
    var workspace_items = document.querySelectorAll(".workspace_in_dropdown")
    for (var idx = 0; idx < workspace_items.length; idx++) {
        workspace_items[idx].addEventListener('click', function(event) {
            
            event.preventDefault();

            var item = event.target;
            //alert(item.attributes[2].value);
            current_workspace_no = item.attributes[2].value;
        });
    }

	/* var workspace_list_li = document.querySelector('#workspace_list_li > a');
	workspace_list_li.addEventListener('click', function(event) {
		if (current_workspace_no) {
			location.href = "/team/workspace/workspace-member?email=${ loginuser.email }&workspaceNo=" + current_workspace_no;
		} else {
			event.preventDefault();
			alert('선택된 워크스페이스가 없습니다.');
		}
	}); */
		
	
</script>