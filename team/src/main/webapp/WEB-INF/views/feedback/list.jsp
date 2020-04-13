<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>feedback</title>
<style>
.f_link {
	padding: 10px;
	color: #5d5d5d;
	font-weight: bold;
}
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
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div style="height: 50px; text-align: center; padding-top: 20px;">
				<a class="f_link" href="#">활동 로그</a>&nbsp;&nbsp; <a class="f_link"
					href="/team/feedback/list">피드백</a>
			</div>

			<hr />

			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6"></div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/team/home">Home</a></li>
								<li class="breadcrumb-item active"><a href="/feedback/list">Feedback
										list</a></li>
							</ol>
						</div>
						<hr />
						<div></div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="col-md-9" style="max-width:100%">
					<div class="card" style="margin:50px;">
						<div class="card-header p-2">
							<ul class="nav nav-pills" style="float:left;">
								<li class="nav-item">
									<a class="nav-link active" href="#" data-toggle="tab">전체 보기</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#" data-toggle="tab">보낸 피드백</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#" data-toggle="tab">받은 피드백</a>
								</li>
									
								
							</ul>
							<div style="text-align:right;">
								<div class="btn btn-block btn-info" data-toggle="modal" data-target="writeFeedbackModal"
									id="writeFeedbackBtn" style="display:inline-block; width:130px;">피드백 작성</div>
							</div>
							
						</div>
						<!-- /.card-header -->
						<div class="card-body">
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
										<p>
											피드백 내용
										</p>
										<p>
											<a href="#" class="link-black text-sm mr-2">
												<i class="fas fa-share mr-1"></i> 관련 업무 제목
											</a>
											<span class="float-right"> 
												<a href="#" class="link-black text-sm"> 
													<i class="far fa-comments mr-1"></i> Comments (0)
												</a>
											</span>
										</p>

										<form class="form-horizontal">
					                        <div class="input-group input-group-sm mb-0">
					                          <input class="form-control form-control-sm" placeholder="Response">
					                          <div class="input-group-append">
					                            <button type="submit" class="btn btn-info">Send</button>
					                          </div>
					                        </div>
					                    </form>
					                    <div>
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
										<p>
											피드백 내용
										</p>
										<p>
											<a href="#" class="link-black text-sm mr-2">
												<i class="fas fa-share mr-1"></i> 관련 업무 제목
											</a>
											<span class="float-right"> 
												<a href="#" class="link-black text-sm"> 
													<i class="far fa-comments mr-1"></i> Comments (0)
												</a>
											</span>
										</p>

										<form class="form-horizontal">
					                        <div class="input-group input-group-sm mb-0">
					                          <input class="form-control form-control-sm" placeholder="Response">
					                          <div class="input-group-append">
					                            <button type="submit" class="btn btn-info">Send</button>
					                          </div>
					                        </div>
					                    </form>
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
	<div id="writeFeedbackModal" class="modal fade" id="modal-lg">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header" style="border:none; padding:10px;">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div style="text-align:center">
            	<h4 style="display:inline-block">피드백 주기</h4>
            </div>
            <div class="modal-body">
              <p>One fine body&hellip;</p>
            </div>
            <div class="modal-footer" style="text-align:center; display:block; border-top:none; margin:15px;">
              <div style="display:inline-block;" class="btn btn-info">작성하기</div>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>

	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>
	<script type="text/javascript">
	$(function() {
		$("#writeFeedbackBtn").click(function() {
			$("#writeFeedbackModal").modal();
		});
	})
	</script>
</body>

</html>
