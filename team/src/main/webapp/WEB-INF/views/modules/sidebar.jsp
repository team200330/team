<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/team/" class="brand-link">
      <img src="/team/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
			<c:choose>
			<c:when test="${ empty sessionScope.loginuser }">
				<li><a href="/team/account/login">로그인</a></li>
				<li><a href="/team/account/register">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li style="color:white">${ loginuser.name }님 환영합니다</li>
				<li><a href="/team/account/logout">로그아웃</a></li>
			</c:otherwise>
			</c:choose>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
   
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                	멤버
                <i class="right fas fa-angle-left"></i>
                
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item" id="workspace_member_li">
                <a href="#" class="nav-link">
                  
                  <p>워크스페이스 멤버</p>
                  <script type="text/javascript">
					window.addEventListener('load', function(event) {
						var workspace_member_link = document.querySelector('#workspace_member_li > a');
						workspace_member_link.addEventListener('click', function(event) {
							if (current_workspace_no) {
								location.href = "/team/workspace/workspace-member?email=${ loginuser.email }&workspaceNo=" + current_workspace_no;
							} else {
								location.href = "/team/workspace/workspace-member?email=${ loginuser.email }&workspaceNo=" + ${ workspaceNo };
							}
						});
						
					});
            		</script>
                </a>
              </li>
              <li class="nav-item">
                <a href="/team/account/mypage" class="nav-link">
                  
                  <p>내 프로필</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item">
            <a href="/team/workspace/workspace-member?email=${ loginuser.email }&workspaceNo=${ workspaceNo }" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                        워크스페이스 멤버
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="/team/project/prlist" class="nav-link">
              <i class="nav-icon fas fa-folder-plus"></i>
              <p>
                        프로젝트 관리
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>

          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                	업무
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/team/task/main" class="nav-link">
                  
                  <p>업무 리스트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/team/task/timeline" class="nav-link">
                  
                  <p>타임라인</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/team/task/analyticsmain" class="nav-link">
                  
                  <p>분석</p>
                </a>
              </li>
            </ul>
          </li>
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
             <i class="nav-icon far fa-bell"></i>
              <p> 알림
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/team/log/list" class="nav-link">
                  
                  <p>활동 로그</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/team/feedback/list" class="nav-link">
                  
                  <p>피드백</p>
                </a>
              </li>
              </ul>
              </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  			