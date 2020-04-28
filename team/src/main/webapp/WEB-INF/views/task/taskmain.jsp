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
					<a id="active" class="f_link" href="/team/task/main">업무</a>&nbsp;&nbsp;
					<a id="active2" class="f_link" href="#">타임라인</a>&nbsp;&nbsp;
					<a id="active3" class="f_link" href="/team/task/analyticsmain">분석</a>
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
			////////////////// 횡 드래그 방지하는 것 jquery 로 하려다 실패 ////////////
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
				if(e.which == 1){
					isDown = true;
					//slider.classList.add('active');
					slider.addClass('active');
					//startX = e.pageX - slider.offsetLeft;
					startX = e.pageX - slider.offset().left;
					scrollLeft = slider.scrollLeft();
				}
			});

			$(document).on('mouseleave',slider,function(e){
				if(e.which == 1){
				isDown = false;
				//slider.classList.remove('active');
				slider.removeClass('active');
				}
			});

			$(document).on('mouseup',slider,function(e){
				if(e.which == 1){
				isDown = false;
				//slider.classList.remove('active');
				slider.removeClass('active');
				}
			});

			$(document).on('mousemove',slider,function(e){
				if(e.which == 1){
				if(!isDown) return;
				e.preventDefault();
				//const x = e.pageX - slider.offsetLeft;
				const x = e.pageX - slider.offset().left;
				const walk = (x - startX) * 3; //scroll-fast
				//slider.scrollLeft = scrollLeft - walk;
				slider.scrollLeft(scrollLeft-walk);
				//console.log(walk);
				}
			});
			///////////////////////////////////////////////////////////////
			
			////////////////////////// 업무리스트 추가하는 메뉴 생성 /////////////////////////////
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
			
			// 엔터 submit 시 ajax로 tasklist Add
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
			///////////////////////////////////////////////////////////////////////////
			
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
			///////////////////////////////////////////////////

			//업무 삭제
			$(document).on("click",".task-delete-btn",function(){
				var taskNo = $(this).parents().attr("id");
				$.ajax({
					url : "/team/task/deletetask.action",
					method : "post",
					data : {"taskNo":taskNo},
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
			
			/////
			// 업무 추가 textarea 에 채워진 텍스트 만큼 height 늘어나게
			$('.taskwrap').on('keyup', 'textarea', function(e) {
				$(this).css('height', 'auto');
				$(this).height(this.scrollHeight-12);
			});
			$('.taskwrap').find('textarea').keyup();
			////////////////////////////////////////////////

			/////////////// 업무 추가 관련 event 들 ///////////////
			$(document).on("click",".cancel-task-btn", function(){
				var listNo = $(this).attr("id").substring(12);
				$("#task-add-div-taskList-" + listNo).hide();
			});

			$(document).on("click",".icon-addtask", function(){
				var listNo = $(this).attr("id").substring(22);
				$("#task-add-div-taskList-" + listNo).show();
			});

			$(document).on("click",".create-task-btn", function(){
				var listNo = $(this).attr("id").substring(12);
				var task = {
					"listNo" : listNo,
					"content" : $("#task-content-" + listNo).val(),
					"writer" : "test",
					"startDate" : $.datepicker.formatDate('yy-mm-dd', new Date()),
					"endDate" : $.datepicker.formatDate('yy-mm-dd', new Date()),
					"completedP" : "test"
				};
				$.ajax({
					url : "/team/task/addtask.action",
					method : "post",
					data : task,
					success : function(resp, status, xhr) {
						$("#task-body").load("loadtask.action", function(){
							slider = $('#body-task');
							$('.taskList-task').attr('onmousemove',"event.stopPropagation();");
						});
					},
					error : function(xhr, status, err) {
						console.log(err);
					}
				});
			});
			////////////////////////////////////////////////////////

			//// 업무에 오른쪽 마우스 Event 추가, 브라우져 기본 이벤트 제거
			$(document).on('contextmenu','.task-field', function() {
				return false;
			});
			$(document).on('mousedown','.task-field',function(event){
				//var listNo = $(this).attr("id");
				var taskNo = $(this).attr("id").substring(5);
				//console.log("button type : " + event.which);
			    switch (event.which) {
			        case 1:
			            event.stopPropagation();
			            break;
			        /* 
			        case 2:
			            alert('Middle Mouse button pressed.');
			            break; */
			        case 3:
			            //alert('Right Mouse button pressed.');
				        $("#task-"+taskNo).dropdown("toggle");
			            break;
			        default:
			            return;
			    }
			}); 
		});
	</script>
</body>

</html>
