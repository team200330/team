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

.custom-control-input:checked~.custom-control-label::before {
    color: #fff;
    border-color: #4c5d6f;
    background-color: #4c5d6f;
    box-shadow: none;
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
					<a id="active" class="f_link" href="#">업무</a>&nbsp;&nbsp; <a
						id="active2" class="f_link" href="#">타임라인</a>
				</div>
				<div class="header-right"
					style="flex-basis: 33%; padding-top: 20px;"></div>
			</section>
			<hr />
			<!-- /.content-body -->
			<div id="task-body">
				<jsp:include page="modules/task-list.jsp"></jsp:include>
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
			var listNo = $(".taskList-task").id;
			console.log(listNo);
			////////여기 변경하기
			/* 
			$(document).on('mousemove',$('#taskList-task-wrapper-45'),function(event){
				event.stopPropagation();
			}); 
			*/
			////////////////////////가로 횡스크롤 드래그 ///////////////////////////			
			//var slider = document.querySelector('#body-task');
			var slider = $("#body-task");
			let isDown = false;
			let startX;
			let scrollLeft;

			$(document).on('mousedown',slider,function(e){
				isDown = true;
				//slider.classList.add('active');
				slider.addClass('active');
				//startX = e.pageX - slider.offsetLeft;
				startX = e.pageX - slider.offset().left;
				scrollLeft = slider.scrollLeft();
			});

			$(document).on('mouseleave',slider,function(){
				isDown = false;
				//slider.classList.remove('active');
				slider.removeClass('active');
			});

			$(document).on('mouseup',slider,function(){
				isDown = false;
				//slider.classList.remove('active');
				slider.removeClass('active');
			});

			$(document).on('mousemove',slider,function(e){
				if(!isDown) return;
				e.preventDefault();
				//const x = e.pageX - slider.offsetLeft;
				const x = e.pageX - slider.offset().left;
				const walk = (x - startX) * 3; //scroll-fast
				//slider.scrollLeft = scrollLeft - walk;
				slider.scrollLeft(scrollLeft-walk);
				//console.log(walk);
			});
			///////////////////////////////////////////////////////////////
			
			////////////////////////// 업무리스트 추가하기 /////////////////////////////
			var flag = "false";
			$(document).on("click","#add-task-btn",function(event) {
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
			});
			///////////////////////////////////////////////////////////////////////
			
			///////////////  엔터 submit 시 ajax로 task Add
			$(document).on("keydown","#add-task-textarea",function(key) {
				if (key.keyCode == 13) {
					var taskList = {"listName":$("#add-task-textarea").val(),"projectNo":$("#add-task-projectNo").attr("value")};
					$.ajax({
						url : "/team/task/addlist.action",
						method : "post",
						data : taskList,
						success : function(resp, status, xhr) {
							$("#task-body").load("loadtask.action", function() { 
								slider = $('#body-task');
								$('.taskList-task').attr('onmousemove',"event.stopPropagation();");
							});
						},
						error : function(xhr, status, err) {
							console.log(err);
						}
					});
				}
			});

			//업무 리스트 삭제
			$(document).on("click",".list-delete-btn",function(){
				var listNo = $(this).parents().attr("id");
				$.ajax({
					url : "/team/task/deletelist.action",
					method : "post",
					data : {"listNo":listNo},
					success : function(resp, status, xhr) {
						$("#task-body").load("loadtask.action", function() { 
							slider = $('#body-task');
							$('.taskList-task').attr('onmousemove',"event.stopPropagation();"); 
						});
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
			////////////////////////////////////////////////

			
		});
	</script>
</body>

</html>
