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
					<div class="post" id="post${feedback.feedbackNo}">
						<div class="user-block">
							<img class="img-circle img-bordered-sm" src="" alt="user image">
							<span class="username"> 
								<a href="#">${feedback.sender}</a> 
								<!-- <form method="post" action="/team/feedback/delete"> -->
									<input type="hidden" value="${feedback.feedbackNo}" name="feedbackNo">
									<a href="#" class="float-right btn-tool close-btn"><i class="fas fa-times"></i> </a>
								<!-- </form> -->
							</span> <span class="description">${feedback.writedate}</span>
						</div>
						<!-- /.user-block -->
						<p class="feedback-contents">${feedback.content}</p>

						<p>
							<a class="link-black text-sm mr-2 receiver-btn" style="font-weight:bold"> 
								<i class="fas fa-user-edit"></i> 받는 사람
							</a>
							<div class="receivers display-none">
								<c:forEach var="receiver" items="${feedback.receivers}">
									<a>${receiver.email}&nbsp;&nbsp;</a>
								</c:forEach>
							</div>
						</p>
						<p>
							<a class="link-black text-sm mr-2" style="font-weight:bold"> <i
								class="fas fa-share mr-1"></i> 관련 업무 제목
							</a> <span class="float-right"> 
								<a class="link-black text-sm comment-btn"> <i
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
								<input type="hidden" name="feedbackNo" value="${feedback.feedbackNo}">
								<div class="input-group input-group-sm mb-0">
									<input name="content" class="form-control form-control-sm comment-content" placeholder="작성할 코멘트를 입력하세요 ..." >
									<input type="hidden" value="${loginuser.email}" name="writer">
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
					<div>작성된 피드백이 없습니다.</div>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- /.content -->
</div>
