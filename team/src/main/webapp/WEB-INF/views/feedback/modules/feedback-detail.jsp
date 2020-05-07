<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page pageEncoding="utf-8"%>

      
      <!-- 피드백 상세보기 모달 -->
      <div id="feedbackDetailModal" class="modal fade">
        <div class="modal-dialog modal-lg">
          <div class="modal-content" style="cursor:pointer">
            <div class="modal-header" style="border:none; padding:10px;">
            </div>
            <div style="text-align:center;padding:30px">
            	<h4 style="display:inline-block; font-weight:bold;">피드백 상세</h4>
            </div>
            <div class="modal-body" style="margin-bottom:20px;padding:0px;">
            	<div class="modal-body-inner">
            		<h6>피드백 보낸 날짜</h6>
            		<div id="detail-modal-writedate">${feedback.writedate}</div>
            	</div>
              <div  class="modal-body-inner">
              	<h6>작성자</h6>
              	<div class="user-block"  style="width: auto;">
					<img class="img-circle img-bordered-sm" src="" alt="user image">
					<span class="username">
						<a href="#" id="detail-modal-sender">${feedback.feedbackSender.email}</a>
						<div style="font-weight: normal;font-size:10pt">${feedback.feedbackSender.name}</div>
					</span> 
				</div>
              </div>
              <br/>
              <div  class="modal-body-inner">
              	<h6 >피드백을 받을 멤버</h6>
				<div id="detail-modal-receivers">
					<c:forEach var="receiver" items="${feedback.receivers}">
						<div class='float_left mem'>
							<c:choose>
								<c:when test="${not empty receiver.member.img}">
									<img class='mem_img' src="/team/resources/img/profile/${receiver.member.img}">
								</c:when>
								<c:otherwise>
									<img class='mem_img' src="/team/resources/img/profile-default.jpg">
								</c:otherwise>
							</c:choose>
							<div class='mem_name'>${receiver.member.name}</div>
						</div>
					</c:forEach>
				</div>
            </div>
            <br/>
             <div class="modal-body-inner">
              	<h6>설명</h6>
              		<div id="detail-modal-content">${feedback.content}</div>
              </div>
            <div class="modal-footer">
              <div id="detail-modal-public">
              	<c:choose>
              		<c:when test="${feedback.opened == true}">
              			<i class='fas fa-lock-open'></i>
						<span>이 피드백은 모든 사람이 볼 수 있습니다.</span>
              		</c:when>
              		<c:otherwise>
              			<i class='fas fa-lock'></i>
						<span>이 피드백은 작성자와 받는 사람만 볼 수 있습니다.</span>
              		</c:otherwise>
              	</c:choose>
              </div>
            </div>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
	