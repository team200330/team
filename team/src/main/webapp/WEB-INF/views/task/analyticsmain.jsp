<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>워크스페이스 멤버</title>
<link rel="stylesheet" href="/team/resources/css/log-feedback.css">
<%@include file="/WEB-INF/views/modules/common-css.jsp"%>
<style>
section.section-header {
	position: relative;
	z-index: 1;
	display: flex;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-items: center;
	height: 50px;
}

input#add-task {
	font-family: "Font Awesome 5 Free";
	font-size: 1.0em;
	font-weight: 900;
}

input::placeholder {
	font-size: 11pt;
	font-style: inherit;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<!-- Navbar -->
	<%@include file="/WEB-INF/views/modules/topbar.jsp"%>
	<!-- /.navbar -->

	<div class="wrapper" style="min-height:auto;">
		<!-- Main Sidebar Container -->
		<%@include file="/WEB-INF/views/modules/sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="background-color: #ececec">
			<section class="section-header" style="">
				<div class="header-left"
					style="flex-basis: 33%; padding-top: 20px; padding-left: 20px; display: flex; flex-wrap: nowrap;">
					<button type="button" class="btn btn-secondary"
						style="height: 30px;">
						<i class="fas fa-arrow-left"></i>
					</button>
					<a href="#" id="project-name" style="padding-left: 20px">프로젝트 명</a>
				</div>
				<div class="header-center"
					style="flex-basis: 33%; text-align: center; padding-top: 20px;">
					<a id="active3" class="f_link" href="/team/task/main">업무</a>&nbsp;&nbsp;
					<a id="active2" class="f_link" href="/team/task/timeline">타임라인</a>&nbsp;&nbsp;
					<a id="active" class="f_link" href="/team/task/analyticsmain">분석</a>
				</div>
				<div class="header-right"
					style="flex-basis: 33%; padding-top: 20px;"></div>
			</section>
			<hr />
			<!-- /.content-body -->
			<div id="task-body">
				<jsp:include page="modules/analytics.jsp"></jsp:include>
			</div>
			<!-- /.card -->
		</div>
		<!-- /.content-wrapper -->
		<%@include file="/WEB-INF/views/modules/footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>
	<script type="text/javascript">
		$(function() {
			var flag = "false";
			$(document).on("click","#add-task-div",function(event) {
				if( flag == "true"){
					flag = "false";
					return;
				}else{
					$("#add-task-span").hide();
					$("#add-task-textarea-div").show();
				}
			});
			$(document).on("click","#cancel-add",function() {
				flag = "true";
				$("#add-task-textarea-div").hide();
				$("#add-task-span").show();
				//$("#add-task-div").css("cursor","pointer");
			});
			//엔터 submit 시 ajax로 task Add
			//$("#add-task-textarea").keydown(function(key) {
			$(document).on("keydown","#add-task-textarea",function(key) {
				if (key.keyCode == 13) {
					//console.log("눌렀다");
					//var taskList = $("#addTaskForm").serializeArray();
					var taskList = {"listName":$("#add-task-textarea").val(),"projectNo":$("#add-task-projectNo").attr("value")};
					$.ajax({
						url : "/team/task/addlist.action",
						method : "post",
						data : taskList,
						success : function(resp, status, xhr) {
							$("#task-body").load("loadtask.action");
						},
						error : function(xhr, status, err) {
							console.log(err);
						}
					});
				}
			});

			//업무 리스트 삭제
			//$(".list-delete-btn").click(function(){
			$(document).on("click",".list-delete-btn",function(){
				var listNo = $(this).parents().attr("id");
				$.ajax({
					url : "/team/task/deletelist.action",
					method : "post",
					data : {"listNo":listNo},
					success : function(resp, status, xhr) {
						$("#task-body").load("loadtask.action");
					},
					error : function(xhr, status, err) {
						console.log(err);
					}
				});
			});
			$('.taskwrap').on('keyup', 'textarea', function(e) {
				$(this).css('height', 'auto');
				$(this).height(this.scrollHeight);
			});
			$('.taskwrap').find('textarea').keyup();
		});
	</script>
</body>

</html>
