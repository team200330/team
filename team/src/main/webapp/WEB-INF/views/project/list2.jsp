<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<style>
				.iconPublic { float: left; margin: 5px; font-size: 14px; }
				a { color: #343a40;}
				a:hover { color: #527aa2;}
			</style>
			<c:forEach items="${ project2 }" var="project2">
		          <div class="col-md-3 col-sm-6 col-12 projectChk">
		            <div class="info-box bg-info">
					  
		              <div class="info-box-content">
		              	<c:if test="${ project2.proPublic eq 'false'}"><span class="iconPublic"><i class="fas fa-user-lock"></i></span></c:if>
		                <c:if test="${ project2.proPublic eq 'true'}"><span class="iconPublic"><i class="fas fa-globe"></i></span></c:if>
		                <a class="task" href="javascript:" data-projectNo="${ project2.projectNo }" >
		                	<span class="info-box-text" style="font-weight: 500;">${ project2.projectName }</span>
		                </a>
		                <c:if test="${ project2.content == null}"><span class="progress-description">&nbsp;&nbsp;&nbsp;</span></c:if>
		                <c:if test="${ project2.content eq project2.content }"><span class="progress-description" style="height: 23px;">${ project2.content }</span></c:if>
						<span class="info-box-number">
		                	<div style="display:none" id="${project2.projectNo }" class="projectNo">${project2.projectNo }</div>      	
					    </span>
		                <div class="progress">
		                  <div class="progress-bar" style="width: 70%"></div>
		                </div>
		              </div>
		              <!-- /.info-box-content -->
		            </div>
		            <!-- /.info-box -->
		          </div>
		          <!-- /.col -->
			</c:forEach>


