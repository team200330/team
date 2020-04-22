<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>

<div class="col-md-9" style="max-width: 100%; padding-bottom: 50px">
	<div class="card"
		style="margin-left: 50px; margin-right: 50px; border-radius: unset">

		<!-- /.card-header -->
		<div class="card-body" style="padding: 0px">
			<div class="tab-content">
				<div class="active tab-pane" id="activity">
				
				<c:choose>
				<c:when test="${not empty feedbackList}">
				<c:forEach var="feedback" items="${feedbackList}">
				
				<!-- Post -->
					<div class="post" data-value="${feedback}" id="post${feedback.feedbackNo}">
						<div style="display:flex;max-height:70px;">
							<div class="user-block" data-value="${feedback.sender}"style="width:auto">
								<img class="img-circle img-bordered-sm" src="" alt="user image">
								<span class="username"> 
									<a href="#">${feedback.sender}</a> 
								</span> <span class="description">${feedback.writedate}</span>
							</div>
							<i style="padding:10px; padding-top:12px;"class="fas fa-chevron-right"></i>
							<div class="user-block">
								<img style="position:relative;z-index:2" class="img-circle img-bordered-sm" src="" alt="user image">
								<c:if test="${feedback.receivers.size() > 1}">
									<div style="padding: 5px;padding-left: 10px;cursor:pointer" class="img-circle img-bordered-sm user-count-img">+ ${feedback.receivers.size() - 1}</div>
								</c:if>
								<div class="username">
									<a href="#" >${feedback.sender}</a> 
									<c:if test="${feedback.receivers.size() > 1}">
										<span style="cursor:pointer" class="user-count-span">외 ${feedback.receivers.size() - 1} 명</span>
										<div class="hover-user-block display-none">
											<c:forEach var="receiver" items="${feedback.receivers}">
												<span >${receiver.email}<br/></span>
											</c:forEach>
										</div>
									</c:if>
									
								</div>
							</div>
							<div>
						</div>
						<input type="hidden" value="${feedback.feedbackNo}" name="feedbackNo">
						<a href="#" class="float-right btn-tool close-btn"><i class="fas fa-times"></i> </a>
						</div>
						<p  class="feedback-contents">${feedback.content}</p>
						<p>
							<a class="link-black text-sm mr-2" style="font-weight:bold"> <i
								class="fas fa-share mr-1"></i> 관련 업무 제목
							</a> <span class="float-right"> 
								<a style="cursor:pointer" class="link-black text-sm comment-btn"> <i
									class="far fa-comments mr-1"></i> Comments (
									<c:choose>
										<c:when test="${feedback.comments.size() > 0}">${feedback.comments.size()}</c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
									)
							</a>
							</span>
						</p>


						<div class="comments display-none">
							<form class="form-horizontal comment-form">
								<input class="comment-feedbackNo" type="hidden" name="feedbackNo" value="${feedback.feedbackNo}">
								<div class="input-group input-group-sm mb-0">
									<input name="content" class="form-control form-control-sm comment-content" placeholder="작성할 코멘트를 입력하세요 ..." >
									<input type="hidden" class="comment-writer" value="${loginuser.email}" name="writer">
									<div class="input-group-append">
										<a style="color:white" data-value="${feedback.feedbackNo}" class="btn btn-info comment-write-btn">Send</a>
									</div>
								</div>
							</form>
							<div>
								<c:forEach var="comment" items="${feedback.comments}">
									<p>
										<a href="#">${comment.writer}</a>&nbsp;&nbsp; 
										<span>${comment.content}</span> 
										<span class="float-right">${comment.writedate}</span>
									</p>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- end of Post -->
				
				</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div style="text-align:center;padding:50px;padding-bottom:100px">
						<img style="width:65%" src="/team/resources/img/feedback_empty.jpg">
						<div>Your notifications will appear here.</div>
						<div style="font-weight:bold;color:#7d7d7d">피드백을 찾을 수 없습니다.</div>
					</div>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- /.content -->
</div>
