<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2" style="margin-right:4px"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 
            	<c:choose>
            		<c:when test="${feedbackCount > 0}">
            			${feedbackCount} 개의 새로운 피드백
            			<span class="float-right text-muted text-sm">
            				<fmt:formatDate value="${latestFeedbackDate}" pattern="dd일 HH:mm"/>
            			</span>
            		</c:when>
            		<c:otherwise>
            			피드백을 모두 확인했습니다
            		</c:otherwise>
            	</c:choose>
            
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new task logs
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="/team/feedback/list" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
    
