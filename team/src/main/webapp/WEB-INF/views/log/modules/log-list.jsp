<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page pageEncoding="utf-8"%>

			<c:choose>
				<c:when test="${not empty logs}">
					<c:forEach var="key" items="${keys}">
						<div class="log-content col-md-9" style="max-width:100%;">
							<div class="card" style="margin-left:50px;margin-right:50px;border-radius:unset">
				              <div class="card-header">
				                <h3 class="card-title">${key}</h3>						
				                <div class="card-tools">
				                  <%-- <div class="input-group input-group-sm" style="width: 150px;">
				                    <input data-value="<fmt:formatDate value="${logs[key].get(0).writedate}" pattern="yyyy-MM-dd hh:mm"/>" type="text" name="table_search" class="search-log form-control float-right" placeholder="Search">
				                    <div class="input-group-append">
				                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
				                    </div>
				                  </div> --%>
				                </div>
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
						                         <img class="img-circle img-bordered-sm" src="" alt="user image">
												<span class="username"> 
													<a href="#">${log.email}</a>
												</span>
						                      </td>
						                      <td>님이 (업무이름) 을 <span>${log.state}</span>했습니다</td>
						                      	<td>
												<div data-value="${log.logNo}"><fmt:formatDate value="${log.writedate}" pattern="yyyy-MM-dd hh:mm"/></div>
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

