<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown" >
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
         
      		<c:if test="${feedbackCount > 0 || logCount > 0}">
      			<span class="badge badge-warning navbar-badge">
      				${feedbackCount + logCount}
      			</span>
      		</c:if>
          
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">
          	<c:choose>
          		<c:when test="${feedbackCount > 0 || logCount > 0}">
          			${feedbackCount + logCount} Notifications
          		</c:when>
          		<c:otherwise>
          			새로운 알림이 없습니다
          		</c:otherwise>
          	</c:choose>
          	
          	
          </span>
          <div class="dropdown-divider"></div>
          <a href="/team/feedback/list" class="dropdown-item notice-text" style="font-size:10.5pt">
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
          
          <c:if test="${not empty projectByNo}">
          <div class="dropdown-divider"></div>
          
          <a href="/team/log/list" class="dropdown-item notice-text" style="font-size:10.5pt">
            <i class="fas fa-file mr-2"></i>
            	
            	
           		<c:choose>
            		<c:when test="${logCount > 0}">
            			${logCount} 개의 새로운 활동 로그
            			<span class="float-right text-muted text-sm">
            				<fmt:formatDate value="${latestLogDate}" pattern="dd일 HH:mm"/>
            			</span>
            		</c:when>
            		<c:otherwise>
            			활동 로그를 모두 확인했습니다
            		</c:otherwise>
            	</c:choose>
          </a>
          </c:if>
          
          <div class="dropdown-divider"></div>
          <a href="/team/feedback/list" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
    
