<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.iconPublic { float: left; margin: 5px; font-size: 14px; }
a { color: #343a40;}
a:hover { color: #527aa2;}
</style>
			<c:choose>
			<c:when test="${not empty projectCount}">
			<c:forEach items="${ projectCount }" var="project">
		          <div class="col-md-3 col-sm-6 col-12 projectChk">
		            <div class="info-box bg-info">
					  
		              <div class="info-box-content">
		              	<c:if test="${ project.proPublic eq 'false'}"><span class="iconPublic"><i class="fas fa-user-lock"></i></span></c:if>
		                <c:if test="${ project.proPublic eq 'true'}"><span class="iconPublic"><i class="fas fa-globe"></i></span></c:if>
		                <a class="task" href="javascript:" data-projectNo="${ project.projectNo }" >
		                	<span class="info-box-text" style="font-weight: 500;">${ project.projectName }</span>
		                </a>
		                <c:if test="${ project.content == null}"><span class="progress-description">&nbsp;&nbsp;&nbsp;</span></c:if>
		                <c:if test="${ project.content eq project.content }"><span class="progress-description" style="height: 23px;">${ project.content }</span></c:if>
						<span class="info-box-number">
		                	<div style="display:none" id="${ project.projectNo }" class="projectNo">${project.projectNo }</div>
		                	<select name="proNo" class="seletProNo btn btn-block btn-default" style="display: inline-block;" >
			                	<c:if test="${project.proNo eq '1' }">
				                	<option value="1" selected="selected">상태없음 </option>
			                		<option value="2">진행중 </option>
			                		<option value="3">완료 </option>
			                		<option value="4">보류 </option>
			                		<option value="5">취소 </option>
			                	</c:if>
				                <c:if test="${project.proNo eq '2' }">
					                <option value="1">상태없음 </option>
			                		<option value="2" selected="selected">진행중 </option>
			                		<option value="3">완료 </option>
			                		<option value="4">보류 </option>
			                		<option value="5">취소 </option>
				                </c:if>
				                <c:if test="${project.proNo eq '3' }">
				                	<option value="1">상태없음 </option>
			                		<option value="2">진행중 </option>
			                		<option value="3" selected="selected">완료 </option>
			                		<option value="4">보류 </option>
			                		<option value="5">취소 </option>
				                </c:if>
				                <c:if test="${project.proNo eq '4' }">
				                	<option value="1">상태없음 </option>
			                		<option value="2">진행중 </option>
			                		<option value="3">완료 </option>
			                		<option value="4" selected="selected">보류 </option>
			                		<option value="5">취소 </option>
				                </c:if>
				                <c:if test="${project.proNo eq '5' }">
				                	<option value="1">상태없음 </option>
			                		<option value="2">진행중 </option>
			                		<option value="3">완료 </option>
			                		<option value="4">보류 </option>
			                		<option value="5" selected="selected">취소 </option>
				                </c:if>
		                	</select>
		                	<a class="to-detail" href="javascript:" data-projectNo="${ project.projectNo }" > 
		                	
		                	<span style="float: right; margin:20px 0 0;"><i class="fas fa-cog"></i></span>
		                	</a>
		                	
		                	<%-- <c:if test="${ project.managerEmail eq project.managerEmail}">
			                	<a class="to-detail" href="javascript:" data-projectNo="${ project.projectNo }" > 
			                	<span style="float: right; margin:20px 0 0;"><i class="fas fa-cog"></i></span>
			                	</a>
		                	</c:if>
		                	<c:if test="${ not project.managerEmail}">
			                	<a class="to-detail2" href="javascript:" data-projectNo="${ project.projectNo }" > 
			                	<span style="float: right; margin:20px 0 0;"><i class="fas fa-cog"></i></span>
			                	</a>
		                	</c:if> --%>
		                	
		                	<%-- <select name="proNo2" class="selectProNo2 btn btn-block btn-default">
		                		<option>
		                			<c:if test="${project.proNo eq '1' }">상태없음</c:if>
		                			<c:if test="${project.proNo eq '2' }">진행중</c:if>
		                			<c:if test="${project.proNo eq '3' }">완료</c:if>
		                			<c:if test="${project.proNo eq '4' }">보류</c:if>
		                			<c:if test="${project.proNo eq '5' }">취소</c:if>
		                		</option>
		                	</select>
 --%>		                	
					    </span>
		                <div class="progress">
		                  <div class="progress-bar" style="width: ${project.probability}%"></div>
		                </div>
		              </div>
		              <!-- /.info-box-content -->
		            </div>
		            <!-- /.info-box -->
		          </div>
		          <!-- /.col -->
			</c:forEach>

			</c:when>
			
			<c:otherwise>
				<div style="text-align:center; margin-top: -80px;">
					<img style="width:75%" src="/team/resources/img/project_null.jpg">
				</div>
			</c:otherwise>
			</c:choose>

