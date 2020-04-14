<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>feedback</title>
<style>
.post{ padding:35px; margin-bottom:0px !important; border-bottom: 1.7px solid #dedbdb;}
.post:last-of-type{padding-bottom:30px !important;}
.f_link {
	padding: 22px;
	color: #464c59;
	font-weight: bold;
}
.link-black:focus, .link-black:hover { color: #6c757d !important; }
#active { border-bottom: 3px solid #17a2b8; color:#17a2b8; }
.feedback-contents {margin: 70px 0px 30px 0px;}
.comments { display:none; }
.float_left { float: left; margin-right:10px; }
h6 { font-weight:bold !important; }
.mem {
	border: 1px #dedede;
    background-color: #dedede;
    border-radius: 30rem;
    width: 115px; height: 32px;
    text-align: center;
    margin-top: 2px;
}
.mem_img {
	width: 30%; height:32px;
	border-radius: 30rem;
	border: 1px solid;
}
.mem_name {width: 50%;}
.mem_rm {width: 20%;}
.mem *, ._mem *, .t * {display:inline-block;float:left;}
._mem { height:50px;border:1px solid white;border-radius:.20rem;padding:5px; }
._mem_img {width:20%;}
._mem_name {width:60%;}
._mem_icon {width:20%;}
.task {padding:10px;padding-bottom:20px;}
.t_t {font-weight:bold;}
.t {font-size:10pt}
</style>
<%@include file="/WEB-INF/views/modules/common-css.jsp"%>

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
				<a class="f_link" href="#">활동 로그</a>&nbsp;&nbsp; <a id="active" class="f_link"
					href="/team/feedback/list">피드백</a>
			</div>

			<hr />

			<div class="content-header" style="margin:25px 50px 25px 50px">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<i style="float: left;margin:5px;" class="fas fa-bars"></i>
							<h5 style="font-weight:bold;color:#464c59">나의 피드백</h5>
						</div>
						<!-- /.col -->
						<!-- <div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/team/home">Home</a></li>
								<li class="breadcrumb-item active"><a href="/feedback/list">Feedback
										list</a></li>
							</ol>
						</div> -->
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
			<!-- /.content-header -->

			<div class="content" style="margin:0 65px 20px 65px; padding:0px">
				<div style="float:left;">
				<div class="input-group-prepend">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="background-color:white;border-radius:unset;border-color:#cfcfcf">
                      	읽지 않은 피드백만 보기 
                    </button>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="#">전체 보기</a>
                      <a class="dropdown-item" href="#">내가 작성한 피드백</a>
                      <a class="dropdown-item" href="#">보낸 피드백</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">읽지 않은 피드백만 보기</a>
                    </div>
                  </div>
                  </div>
				<div style="text-align:right">
					<input type="text" style="width:300px;height:35px;margin-right:10px;padding-left:12px;border:1px solid #cfcfcf;"placeholder="업무, 멤버, 내용으로 피드백 검색">
					<button id="writeFeedbackBtn" class="btn btn-info btn-flat" style="height:35px;">피드백 주기</button>
				</div>
			</div>
			<!-- Main content -->
			<section class="content">
				<div class="col-md-9" style="max-width:100%; padding-bottom:50px">
					<div class="card" style="margin-left:50px;margin-right:50px;border-radius:unset">
						
						<!-- /.card-header -->
						<div class="card-body" style="padding:0px">
							<div class="tab-content">
								<div class="active tab-pane" id="activity">
									<!-- Post -->
									<div class="post">
										<div class="user-block">
											<img class="img-circle img-bordered-sm" src="" alt="user image">
											<span class="username"> 
												<a href="#">유저 프로필 링크</a> <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i>
												</a>
											</span>
											<span class="description">피드백 보낸 날짜</span>
										</div>
										<!-- /.user-block -->
										<p class="feedback-contents">
											피드백 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~```
										</p>
										
										<p>
											<a href="#" class="link-black text-sm mr-2">
												<i class="fas fa-user-edit"></i> 코멘트 작성자
											</a>
										</p>
										<p>
											<a href="#" class="link-black text-sm mr-2">
												<i class="fas fa-share mr-1"></i> 관련 업무 제목
											</a>
											
											<span class="float-right"> 
												<a href="#" class="link-black text-sm comment-btn"> 
													<i class="far fa-comments mr-1"></i> Comments (0)
												</a>
											</span>
										</p>
										

										<div class="comments">
											<form class="form-horizontal">
						                        <div class="input-group input-group-sm mb-0">
						                          <input class="form-control form-control-sm" placeholder="Response">
						                          <div class="input-group-append">
						                            <button type="submit" class="btn btn-info">Send</button>
						                          </div>
						                        </div>
						                    </form>
						                    <div >
					                    	<p>
					                    		<a href="#">보낸 사람</a>&nbsp;&nbsp;
					                    		<span>내용</span>
					                    		<span class="float-right">코멘트 날짜</span>
					                    	</p>
					                    	<p>
					                    		<a href="#">보낸 사람</a>&nbsp;&nbsp;
					                    		<span>내용</span>
					                    		<span class="float-right">코멘트 날짜</span>
					                    	</p>
					                    	<p>
					                    		<a href="#">보낸 사람</a>&nbsp;&nbsp;
					                    		<span>내용</span>
					                    		<span class="float-right">코멘트 날짜</span>
					                    	</p>
					                    </div>
					                    </div>
									</div>
									<!-- /.post -->
																		<div class="post">
										<div class="user-block">
											<img class="img-circle img-bordered-sm" src="" alt="user image">
											<span class="username"> 
												<a href="#">유저 프로필 링크</a> <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i>
												</a>
											</span>
											<span class="description">피드백 보낸 날짜</span>
										</div>
										<!-- /.user-block -->
										<p class="feedback-contents">
											피드백 내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~```
										</p>
										
										<p>
											<a href="#" class="link-black text-sm mr-2">
												<i class="fas fa-user-edit"></i> 코멘트 작성자
											</a>
										</p>
										<p>
											<a href="#" class="link-black text-sm mr-2">
												<i class="fas fa-share mr-1"></i> 관련 업무 제목
											</a>
											
											<span class="float-right"> 
												<a href="#" class="link-black text-sm comment-btn"> 
													<i class="far fa-comments mr-1"></i> Comments (0)
												</a>
											</span>
										</p>
										

										<div class="comments">
											<form class="form-horizontal">
						                        <div class="input-group input-group-sm mb-0">
						                          <input class="form-control form-control-sm" placeholder="Response">
						                          <div class="input-group-append">
						                            <button type="submit" class="btn btn-info">Send</button>
						                          </div>
						                        </div>
						                    </form>
						                    <div >
					                    	<p>
					                    		<a href="#">보낸 사람</a>&nbsp;&nbsp;
					                    		<span>내용</span>
					                    		<span class="float-right">코멘트 날짜</span>
					                    	</p>
					                    	<p>
					                    		<a href="#">보낸 사람</a>&nbsp;&nbsp;
					                    		<span>내용</span>
					                    		<span class="float-right">코멘트 날짜</span>
					                    	</p>
					                    	<p>
					                    		<a href="#">보낸 사람</a>&nbsp;&nbsp;
					                    		<span>내용</span>
					                    		<span class="float-right">코멘트 날짜</span>
					                    	</p>
					                    </div>
					                    </div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.content -->
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
              <div>
              	<h6>피드백을 받을 멤버</h6>
              	<div id="add_mem" class="btn btn-secondary float_left" style="width:37px;">+</div>
              	<div class="float_left mem">
              		<div class="mem_img">사진</div>
              		<div class="mem_name">멤버1</div>
              		<div class="mem_rm" aria-hidden="true">&times;</div>
              	</div>
              	<div class="float_left mem">
              		<div class="mem_img">사진</div>
              		<div class="mem_name">멤버1</div>
              		<div class="mem_rm" aria-hidden="true">&times;</div>
              	</div>
              	<div class="float_left mem">
              		<div class="mem_img">사진</div>
              		<div class="mem_name">멤버1</div>
              		<div class="mem_rm" aria-hidden="true">&times;</div>
              	</div>
              </div>

              <br/>
              <div>
              	<h6 style="margin-top:50px">관련된 업무</h6>
              	<div id="add_task" class="btn btn-secondary float_left" style="width:37px;">+</div>
              	<div>업무1</div>
              </div>
              <br/><br/>
              <div>
              	<h6>설명</h6>
              	<textarea rows="6" style="width:100%;border:1px solid #cccccc;border-radius:.40rem;padding:10px" placeholder="칭찬 혹은 개선할 사항을 작성해보세요..."></textarea>
              	<div style="margin:10px;">
              	<input type="checkbox" style="margin-right:10px;"> 받는 사람이 피드백을 프로플에 공개할 수 있도록 허용합니다
     			<p style="color:#a0a0a0;padding-left:25px;">설명은 기본적으로 회원님과 받는 사람만 볼 수 있도록 비공개로 설정됩니다.</p>
              	</div>
             </div>
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px; margin-bottom:30px;">
              <div style="display:inline-block;width:150px;" class="btn btn-info">작성하기</div>
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
              <input style="width:100%;height:30px;border:1px solid #17a2b8;border-radius:.20rem;padding:10px;margin-bottom:10px;"type="text" placeholder="이름 혹은 이메일로 찾기">
            
            	<div style="margin-bottom:20px;">
            	<div class="_mem">
            		<div class="_mem_img">사진</div>
            		<div class="_mem_name">멤버이름</div>
            		<div class="_mem_icon">아이콘</div>
            	</div>
            	<div class="_mem">
            		<div class="_mem_img">사진</div>
            		<div class="_mem_name">멤버이름</div>
            		<div class="_mem_icon">아이콘</div>
            	</div>
            	<div class="_mem">
            		<div class="_mem_img">사진</div>
            		<div class="_mem_name">멤버이름</div>
            		<div class="_mem_icon">아이콘</div>
            	</div>
            	</div>
            	
            </div>
            <div id="addFooter" class="modal-footer" style="border:none;color: white;background-color: #17a2b8;font-weight: bold;">
              <img src="/dist/img/add-user-icon.png">
              <div>멤버 초대하기</div>
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
      
      
	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>
	<script type="text/javascript">
	$(function() {
		// 상단 로그 / 피드백 메뉴 
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
		
		// 댓글 열기 / 닫기 버튼
		var clicked = false;
		$(".comment-btn").click(function() {
			if (clicked == false) {
				$(".comments").css("display", "block");
				clicked = true;
			}
			else {
				$(".comments").css("display", "none");
				clicked = false;
			}
		});
		
		// 피드백 hover 색깔 변하기
		$(".post").hover(function() {
			$(this).css("background-color", "#f7f7f7");
		}, function() {
			$(this).css("background-color", "white");
		});
		
		
		$("#writeFeedbackBtn").click(function() {
			$("#writeFeedbackModal").modal();
		});
		
		$("#add_mem").click(function() {
			$("#memberAddModal").modal();
		});
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
		
		$("#add_task").click(function() {
			$("#taskAddModal").modal();
		});
		
	})
	</script>
</body>

</html>
