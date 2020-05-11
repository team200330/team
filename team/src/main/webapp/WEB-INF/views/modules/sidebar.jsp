<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/team/" class="brand-link">
      <img src="/team/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8; margin-top: 5px;">
      <span class="brand-text" style="font-weight: 800;font-size: 30px;">TEAM PLAN <span style="color: #00cc2c;"><b>.</b></span></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info">
			<c:choose>
			<c:when test="${ empty sessionScope.loginuser }">
				<li style="list-style: none;margin-left: 20px;"><a href="/team/account/login">로그인</a></li>
				<li style="list-style: none;margin-left: 20px;"><a href="/team/account/register">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li style="color:white; list-style: none;margin-left: 20px;">${ loginuser.name }님 환영합니다</li>
				<li style="list-style: none;margin-left: 20px;"><a href="/team/account/logout">로그아웃</a></li>
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
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                	워크스페이스
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="/team/workspace/workspace-member?email=${ loginuser.email }&workspaceNo=${ workspaceNo }" class="nav-link">
                  
                  <p>워크스페이스 멤버</p>
                </a>
             </li>
              <li class="nav-item" >
                <a style="cursor:pointer" class="nav-link" id="inviteModal">
                  <p>이메일로 팀원 초대</p>
                </a>
              </li>
              
              <li class="nav-item" >
                <a style="cursor:pointer" class="nav-link" id="joinModal">
                  <p>다른 워크스페이스 참여하기</p>
                </a>
              </li>
            </ul>
          </li>
          
          
          
            <li class="nav-item">
            <a href="/team/account/mypage" class="nav-link">
              <i class="fas fa-user-circle" style="font-size: 15pt; margin: 4;margin-right: 7;"></i>
              <p>
                   	내 프로필
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


		  <c:if test="${not empty projectByNo}">
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
                  
                  <p>캘린더</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="/team/task/calendar" class="nav-link">
                  
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
              
            </c:if>
          
          
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  			