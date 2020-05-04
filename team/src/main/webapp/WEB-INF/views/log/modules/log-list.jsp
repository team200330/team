<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page pageEncoding="utf-8"%>

			<c:choose>
				<c:when test="${not empty logs}">
					<c:forEach var="key" items="${keys}">
						<div class="log-content col-md-9" style="max-width:100%;">
							<div class="card" style="margin-left:50px;margin-right:50px;border-radius:unset">
				              <div class="card-header">
				                <h3 class="card-title">${key}</h3>						
				              </div>
				              <!-- /.card-header -->
				              <div class="card-body table-responsive p-0" style="max-height:500px;">
				                <table class="log-table table table-head-fixed text-nowrap">
				                  <tbody>
				                  	<c:forEach var="log" items="${logs[key]}">
					                      <c:choose>
					                      	<c:when test="${log.receiver.checked == false}"><tr class="unchecked-log log-small" id="${log.logNo}"></c:when>
					                      	<c:otherwise><tr class="checked-log log-small" id="${log.logNo}"></c:otherwise>
					                      </c:choose>
					                      		<td>
						                         <img class="img-circle img-bordered-sm" src="${not empty log.receiver.member.img? log.receiver.member.img : '/team/resources/img/profile-default.jpg'}" alt="user image">
												<span class="username"> 
													<a href="#">${log.email}</a>
												</span>
						                      </td>
						                      <td>님이 
						                      		<span class="log-task-content">
						                      			<c:choose>
						                      			<c:when test="${log.task.content.length() > 15}">${fn:substring(log.task.content, 0, 15)} ... </c:when>
						                      			<c:otherwise>${log.task.content}</c:otherwise>
						                      			</c:choose>
						                
						                      		</span> 
						                      		업무를 <span>${log.state}</span>했습니다</td>
						                      	<td>
												<div data-value="${log.logNo}" data-content="${log.task.content}"><fmt:formatDate value="${log.writedate}" pattern="yyyy-MM-dd hh:mm"/></div>
												<input class="logWriteDate" type="hidden" value="<fmt:formatDate value="${log.writedate}" pattern="yyyy-MM-dd hh:mm"/>">
												</td>
						                    </tr>	
				                    </c:forEach>
				                    
				                  </tbody>
				                </table>
				              </div>
				              <!-- /.card-body -->
				            </div>
		            <!-- /.card -->
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<div class="col-md-9" style="max-width: 100%; padding-bottom: 50px">
				<div class="card" style="margin-left: 50px; margin-right: 50px; border-radius: unset">
				<div class="card-body" style="padding: 0px">
				<div class="tab-content">
				<div class="active tab-pane" id="activity">
					<div style="text-align:center;padding:50px;padding-bottom:100px">
						<img style="width:65%" src="/team/resources/img/feedback_empty.jpg">
						<div>Your notifications will appear here.</div>
						<div style="font-weight:bold;color:#7d7d7d">모든 로그를 확인했습니다.</div>
					</div>
				</div>
				</div>
				</div>
				</div>
				</div>
				</c:otherwise>
			</c:choose>

