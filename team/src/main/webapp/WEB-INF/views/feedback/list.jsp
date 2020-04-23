<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>feedback</title>
<link rel="stylesheet" href="/team/resources/css/log-feedback.css">
<%@include file="/WEB-INF/views/modules/common-css.jsp"%>

<style>
.dropdown-item:active {background-color:white;}
.modal-body-inner {margin:35px 50px 35px 50px;}
#feedbackDetailModal .modal-footer {
	text-align:center; 
	display:block;
	margin-top:60px;padding-top:30px;
	border-top: 1.3px solid #dcdcdc;
	font-size:11pt;
}

#feedbackDetailModal .mem {width:auto;}
#feedbackDetailModal .mem_name {
	margin: 2px 10px 0px 6px; 
}
#feedbackDetailModal .mem_img {width:33px}
#detail-modal-public i {color:gray;}
#detail-modal-public span {margin-left: 10px;color: gray;}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<!-- Navbar -->
	<%@include file="/WEB-INF/views/modules/topbar.jsp"%>
	<!-- /.navbar -->

	<div class="wrapper">

		<!-- Main Sidebar Container -->
		<%@include file="/WEB-INF/views/modules/sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="background-color:#ececec">
			<!-- Content Header (Page header) -->
			<div style="height: 50px; text-align: center; padding-top: 20px;">
				<a class="f_link" href="/team/log/list">활동 로그</a>&nbsp;&nbsp; <a id="active" class="f_link"
					href="/team/feedback/list">피드백</a>
			</div>

			<hr />

			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<i style="float: left;margin:5px;" class="fas fa-bars"></i>
							<h5 style="font-weight:bold;color:#464c59">나의 피드백</h5>
						</div>
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
			<!-- /.content-header -->
			<div class="content" style="margin:0 65px 20px 65px; padding:0px">
				<div style="float:left;">
				<div class="input-group-prepend">
                    <button id="dropdown-select" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="background-color:white;border-radius:unset;border-color:#cfcfcf">
                      	나와 관련된 피드백
                    </button>
                    <div class="feedback dropdown-menu">
                      <a class="dropdown-item" data-value="M" >나와 관련된 피드백</a>
                      <a class="dropdown-item" data-value="S" >내가 작성한 피드백</a>
                      <a class="dropdown-item" data-value="R" >받은 피드백</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" data-value="A" >공개된 모든 피드백 보기</a>
                    </div>
                  </div>
                  </div>
				<div style="text-align:right">
					<input id="search-all" type="text" style="width:300px;height:35px;margin-right:10px;padding-left:12px;border:1px solid #cfcfcf;"placeholder="업무, 멤버, 내용으로 피드백 검색">
					<button id="writeFeedbackBtn" class="btn btn-info btn-flat" style="height:35px;">피드백 주기</button>
				</div>
			</div>
			<!-- Main content -->
			<section class="content">
			
				<div id="feedback-list-container">
				<!-- feedback list -->
				<jsp:include page="modules/feedback-list.jsp"></jsp:include>
				
				</div>
				
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2019 <a
				href="http://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.0.3-pre
			</div>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	
	
	<!-- modal -->
	<div id="writeFeedbackModal" class="modal fade">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header" style="border:none; padding:10px;">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div style="text-align:center">
            	<h4 style="display:inline-block; font-weight:bold;">피드백 주기</h4>
            </div>
            <div class="modal-body" style="margin:40px;margin-bottom:20px;">
            <form id="feedback_write_form" method="post" action="/team/feedback/write">
            	<input type="hidden" name="sender" value="${ loginuser.email }"/>
              <div >
              	<h6>피드백을 받을 멤버</h6>
              	<div id="add_mem" class="btn btn-secondary float_left" style="width:37px;">+</div>
              	<div id="mem"></div>
              </div>
              <br/>
              <div>
              	<h6 style="margin-top:50px">관련된 업무</h6>
              	<div id="add_task" class="btn btn-secondary float_left" style="width:37px;">+</div>
              	<div>업무1</div>
              </div>
              <br/><br/>
              <div id="textarea">
              	<h6>설명</h6>
              	<textarea name="content" rows="6" style="width:100%;border:1px solid #cccccc;border-radius:.40rem;padding:10px" placeholder="칭찬 혹은 개선할 사항을 작성해보세요..."></textarea>
              	<div style="margin:10px;">
              	<input id="isPublic" type="hidden" name="isPublic" value="true"/>
              	<input id="checkbox" type="checkbox" checked style="margin-right:10px;"> 받는 사람이 피드백을 프로필에 공개할 수 있도록 허용합니다
     			<p style="color:#a0a0a0;padding-left:25px;">설명은 기본적으로 회원님과 받는 사람만 볼 수 있도록 비공개로 설정됩니다.</p>
              	</div>
             </div>
             </form>
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <div id="submit_btn" style="display:inline-block;width:150px;" class="btn btn-info">작성하기</div>
            </div>
            
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      <!-- 멤버 추가 모달 -->
      <div class="modal fade" id="memberAddModal">
        <div class="modal-dialog modal-sm" style="top:210;left:-195">
          <div class="modal-content">
            <div class="modal-header">
              <h6 class="modal-title" style="font-weight:bold">멤버</h6>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="padding:10px;">
              <input id="_mem_input" style="width:100%;height:30px;border:1px solid #17a2b8;padding:10px;margin-bottom:10px;"type="text" placeholder="이름 혹은 이메일로 찾기">
            
            	<div id="workspace_mem" style="margin-bottom:20px;">
	            	<c:forEach var="m" items="${ workspaceMembers }">
	            		<c:if test="${ m.email != loginuser.email }">
	            		<div class="_mem" data-email="${ m.email }" data-name="${ m.name }">
		            		<img class="_mem_img img-circle img-bordered-sm" src="" alt="user image">
		            		<div class="_mem_name">${ m.email }<br/>${ m.name }</div>
		            		<div class="_mem_icon _mem_icon_default" style="text-align:right" >
		            			<i class="fas fa-check"></i>
		            		</div>
		            	</div>
		            	</c:if>
	            	</c:forEach>
            	</div>
            	
            </div>
            <div id="addFooter" class="modal-footer" style="border:none;color: white;background-color: #17a2b8;font-weight: bold;">
              <i class="fas fa-user-plus"></i>
              <a href="/team/workspace/invite-workspace" style="color:white">멤버 초대하기</a>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
       <!-- 업무 선택  모달 -->
      <div class="modal fade" id="taskAddModal">
        <div class="modal-dialog modal-sm" style="top:310;left:-195">
          <div class="modal-content">
            <div class="modal-header">
              <h6 class="modal-title" style="font-weight:bold">업무 선택하기</h6>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="padding:10px;">
              <input style="width:100%;height:30px;border:1px solid #17a2b8;border-radius:.20rem;padding:10px;margin-bottom:10px;"type="text" placeholder="업무 검색">
            
            	<div style="margin-bottom:20px;">
            	<div class="task">
            		<div class="t_t">업무명</div>
            		<div class="t">
            			<div>프로젝트 이름&nbsp;</div> 
            			<div>> 업무 작성자 이름</div>
            		</div>
            	</div>
            	<div class="task">
            		<div class="t_t">업무명</div>
            		<div class="t">
            			<div>프로젝트 이름&nbsp;</div> 
            			<div>> 업무 작성자 이름</div>
            		</div>
            	</div>
            	<div class="task">
            		<div class="t_t">업무명</div>
            		<div class="t">
            			<div>프로젝트 이름&nbsp;</div> 
            			<div>> 업무 작성자 이름</div>
            		</div>
            	</div>
            	</div>
            	
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
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
            		<div id="detail-modal-writedate"></div>
            	</div>
              <div  class="modal-body-inner">
              	<h6>작성자</h6>
              	<div class="user-block"  style="width: auto;">
					<img class="img-circle img-bordered-sm" src="" alt="user image">
					<span class="username">
						<a href="#" id="detail-modal-sender">보낸사람 이메일</a>
						<div style="font-weight: normal;font-size:10pt">보낸사람 이름</div>
					</span> 
				</div>
              </div>
              <br/>
              <div  class="modal-body-inner">
              	<h6 >피드백을 받을 멤버</h6>
				<div id="detail-modal-receivers">
					
				</div>
            </div>
            <br/>
             <div class="modal-body-inner">
              	<h6>설명</h6>
              		<div id="detail-modal-content">피드백 설명 표시될 자리</div>
              </div>
            <div class="modal-footer">
              <div id="detail-modal-public"></div>
            </div>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>
	<script type="text/javascript">
	$(function() {
		// Toast 모달
		const Toast = Swal.mixin({
			toast: true,
			position: 'top-end',
			showConfirmButton: false,
			timer: 3000
		});
		$('.toastrDefaultSuccess').click(function() { // 기본 success
		      toastr.success('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
		});
		$('.toastrDefaultInfo').click(function() {
		      toastr.info('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
		});
		$('.toastsDefaultInfo').click(function() {
		      $(document).Toasts('create', {
		        class: 'bg-info', 
		        title: 'Toast Title',
		        subtitle: 'Subtitle',
		        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
		      });
		});
		
		// CSS
		
		// 상단 로그 / 피드백 메뉴 css
		$(".f_link").click(function() {
			$("#active").removeAttr("id");
			$(this).attr("id", "active");
		});
		$(".f_link").hover(function() {
			$(this).css("color", "#17a2b8");
		}, function() {
			if ($(this).attr("id") != "active")
				$(this).css("color", "#464c59");
		});

		// 피드백 멤버이미지 css
		$(document).on("click", ".user-count-img, .user-count-span", function(event) {
			var target = $(this).parents(".user-block").children(".username").children(".hover-user-block");
			
			if (target.hasClass("display-none")) {
				target.fadeIn(200);
				target.removeClass("display-none");
			} else {
				target.fadeOut(200);
				target.addClass("display-none");
			}
			event.stopPropagation(); // 상위 이벤트 발생을 막음
		});
		
		// 작은모달 멤버추가 css
		$("._mem, .task").hover(function() {
			$(this).css({"background-color" : "#dedede", "border" : "1px solid #dedede"});
		}, function() {
			$(this).css({"background-color" : "white", "border" : "1px solid white"});
		});
		
		$("#addFooter").hover(function() {
			$(this).css("background-color", "#148192");
		}, function() {
			$(this).css("background-color", "#17a2b8");
		});
		
		// 피드백 post css
		$(document).on({
		    mouseenter: function () {
		    	$(this).css("background-color", "#efefef");
		    },
		    mouseleave: function () {
		    	$(this).css("background-color", "white");
		    }
		}, ".post"); 
		
		// 모달 show
		$("#writeFeedbackBtn").click(function() {
			$("#writeFeedbackModal").modal();
		});
		$("#add_mem").click(function() {
			$("#memberAddModal").modal();
		});
		$("#add_task").click(function() {
			$("#taskAddModal").modal();
		});
		
		// 피드백 상세보기 모달
		$(document).on("click", ".feedback-contents", function() {
			$("#feedbackDetailModal").modal();
			
			var data = $(this).parents(".post").attr("data-value");
			var isPublic = data.split("isPublic=")[1].split(",")[0];
			var r = data.split("Receiver");
			
			$("#detail-modal-content").text(data.split("content=")[1].split(",")[0]);
			$("#detail-modal-writedate").text(data.split("writedate=")[1].split(",")[0]);
			$("#detail-modal-sender").text(data.split("sender=")[1].split(",")[0]);
			
			if (isPublic == "true") {
				$("#detail-modal-public").html(
					"<i class='fas fa-lock-open'></i>" +
					"<span>이 피드백은 모든 사람이 볼 수 있습니다.</span"
				);
			} else {
				$("#detail-modal-public").html(
					"<i class='fas fa-lock'></i>" +
					"<span>이 피드백은 작성자와 받는 사람만 볼 수 있습니다.</span>"		
				);
			}

			for (var i = 1; i < r.length; i++) {
				$("#detail-modal-receivers").html($("#detail-modal-receivers").html() +
					"<div class='float_left mem'>" +
						"<img class='mem_img'></img>" +
						"<div class='mem_name'>" + r[i].split("email=")[1].split(",")[0] + "</div>" +
					"</div>"
				);
			}
		});
		$("#feedbackDetailModal").click(function() {
			$("#feedbackDetailModal").modal("hide");
			$("#detail-modal-receivers").html("");
			$("#detail-modal-public").html("");
		})
		

		// select box
		$(".feedback .dropdown-item").click(function() {
			$("#dropdown-select").text($(this).text());
			$("#dropdown-select").attr("data-value", $(this).attr("data-value"));
		});
		
		// 열기 / 닫기 함수
		function closeOrOpen(target) {
			if (target.hasClass("display-none")) {
				target.removeClass("display-none");
				target.addClass("display-block");
			}
			else {
				target.addClass("display-none");
				target.removeClass("display-block");
			}
		}
		
		// 댓글 열기 / 닫기 버튼
		$(document).on("click", ".comment-btn", function() {
			closeOrOpen($(this).parents(".post").children(".comments"));
		});
		

		
		////////////////////////////////////////////////////////////////////////////////////////
		
		// 텍스트 자르고 ... 포함된 문자열 반환하는 함수
		function textSubString(text) {
			return ((text.length > 10) ? text.substring(0, 10) + "..." : text);
		}
		
		// 멤버 추가 작은모달 이벤트
		$(document).on("click", "._mem", function() {
			var name = $(this).attr("data-name");
			var email = $(this).attr("data-email");
			
			if ($(this).children().hasClass("_mem_icon_default")) {
				$(this).children().removeClass("_mem_icon_default");
				
				$("#mem").html($("#mem").html() + 
					'<div class="float_left mem" data-name="' + name +'" data-email="' + email + '">' +
						'<img class="mem_img"></img>' +
						'<div class="mem_name" >'+ name + '</div>' +
						'<a href="#" class="mem_rm" aria-hidden="true">&times;</a>' +
						'<input type="hidden" name="email" value="' + email + '"/>' + 
					'</div>'	
				);
				
			} else {
				$(this).children("._mem_icon").addClass("_mem_icon_default");
				$("#mem div[data-email='" + email + "']").remove();
			}
		});
		
		// 멤버 추가 츼소 큰모달 이벤트
		$(document).on("click", ".mem_rm", function() {
			var name = $(this).parent().attr("data-name");
			var email = $(this).parent().attr("data-email");
			
			$(this).parent().remove();
			$("#workspace_mem div[data-email='" + email +"']").children("._mem_icon").addClass("_mem_icon_default");
		});
		
		
		// 멤버 추가 작은모달 ajax
		$("#_mem_input").keyup(function() {
			
			var selected = "";
			for (i = 0; i < $(".mem").length; i++) 
				selected += $(".mem:eq("+ i +")").attr("data-email") + ":";
				
			$.ajax({
				url : "/team/feedback/getWorkspaceMembers",
				method : "get",
				data : {"str" : $(this).val(),
						"selected" : selected},
				success : function(resp, status, xhr) {
					$("#workspace_mem").html("");
					$("#workspace_mem").html(resp);
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		});
		
	
		// 피드백 폼 전송
		$("#checkbox").click(function() {
			if ($(this).attr("checked")) { 
				$(this).removeAttr("checked"); $("#isPublic").val("false");
			} else { 
				$(this).attr("checked", ""); $("#isPublic").val("true"); 
			}
		});
		$("#submit_btn").click(function() {
			if (!confirm("피드백을 작성할까요?")) return;
			
			var searchType = $("#dropdown-select").attr("data-value");
			var feedback = $("#feedback_write_form").serializeArray();
			var content = $("#feedback_write_form").children("#textarea").children("textarea").val();
			
			$.ajax({
				url : "/team/feedback/write",
				method : "post",
				data : feedback,
				success : function(resp, status, xhr) {
					$("#writeFeedbackModal").modal("hide");
					$("#feedback-list-container").load("/team/feedback/search?searchType=" + searchType + "&email=${loginuser.email}");

					toastr.success("피드백&nbsp;&nbsp; " + textSubString(content) + " 을 작성했습니다");
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			}); 
		});
		
		// 피드백 검색
		$(".feedback .dropdown-item").click(function() {
			var searchType = $(this).attr("data-value");
			
 			$.ajax({
				url : "list2",
				method : "get",
				success : function(resp, status, xhr) {
					$("#feedback-list-container").load("/team/feedback/search?searchType=" + searchType + "&email=${loginuser.email}");
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			}); 
		});
		
		// 피드백 삭제
		$(document).on("click", ".close-btn", function() {
			if (!confirm("해당 피드백을 삭제할까요?")) return;
			
			var searchType = $("#dropdown-select").attr("data-value");
			var content = $(this).parents(".post").children(".feedback-contents").text();

			$.ajax({
				url : "/team/feedback/delete",
				method : "post",
				data : {"feedbackNo": $(this).prev().val()},
				success : function(resp, status, xhr) {
					$("#feedback-list-container").load("/team/feedback/search?searchType=" + searchType + "&email=${loginuser.email}");
					toastr.error("피드백 &nbsp;&nbsp;" + textSubString(content) + " 을 삭제했습니다");
				}, 
				error : function(xhr, status, err) {
					console.log(err);
				}
			}); 
		});
		
		
		// 코멘트 작성
		$(document).on("click", ".comment-write-btn", function(event) {
			if (!confirm("코멘트를 작성할까요?")) return;
			
			var content = $(this).closest("div").prev().prev().val();
			if (content.length <= 0) {
				alert("코멘트 내용을 입력하세요."); return;
			}
			
			var comment = $(this).parents(".comment-form").serializeArray();
			var searchType = $("#dropdown-select").attr("data-value");
			$.ajax({
				url : "/team/feedback/comment/write",
				method : "post",
				data : comment,
				success : function(resp, status, xhr) {
					$("#feedback-list-container").load("/team/feedback/search?searchType=" + searchType + "&email=${loginuser.email}");
					toastr.info("코멘트&nbsp;&nbsp; " + textSubString(content) + " 을 작성했습니다");
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		}); 
		
		
		// 피드백 전체 검색 
		$("#search-all").keyup(function() {
			var key = $(this).val();
			
			$.ajax({
				url : "list2",
				method : "get",
				success : function(resp, status, xhr) {
					$("#feedback-list-container").load("/team/feedback/search?searchType=I&email=${loginuser.email}&key="+ key);
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		});
		
		
	});
	</script>
</body>



</html>
