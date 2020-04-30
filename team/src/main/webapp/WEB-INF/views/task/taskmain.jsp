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

.dropdown-item.warning:hover {
	background-color: #e95e51;
	color: #fff !important;
}

.dropdown-menu {
	display: none;
}

/* 
.contextmenu {
  display: none;
  position: absolute;
  width: 200px;
  margin: 0;
  padding: 0;
  background: #FFFFFF;
  border-radius: 5px;
  list-style: none;
  box-shadow:
    0 15px 35px rgba(50,50,90,0.1),
    0 5px 15px rgba(0,0,0,0.07);
  overflow: hidden;
  z-index: 999999;
}

.contextmenu li {
  border-left: 3px solid transparent;
  transition: ease .2s;
}

.contextmenu li a {
  display: block;
  padding: 10px;
  color: #B0BEC5;
  text-decoration: none;
  transition: ease .2s;
}

.contextmenu li:hover {
  background: #CE93D8;
  border-left: 3px solid #9C27B0;
}

.contextmenu li:hover a {
  color: #FFFFFF;
} */
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
					<a id="active2" class="f_link" href="/team/task/timeline">타임라인</a>&nbsp;&nbsp;
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
				var listNo = $(this).parents().attr("id").substring(11);
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
				var taskNo = $(this).parents().attr("id").substring(5);
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
			//$('.taskwrap').on('keyup', 'textarea', function(e) {
			$(document).on('keyup', '.taskwrap textarea', function(e) {
				$(this).css('height', 'auto');
				$(this).height(this.scrollHeight-12);
			});
			//$('.taskwrap').find('textarea').keyup();
			$(document).find('.taskwrap textarea').keyup();
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

 			// 설정 누르면 contextmenu 사라지는 event
 			$(document).on('click','.menu-setting', function(e){
 				var listNo = $(e.target).attr("id").substring(13);
 				target = "#tl-setting-"+listNo;
				if($(target).hasClass('show')){
					$(target).removeClass('show');
				} else {
					$(".tl-settings").each(function(){
						$(this).removeClass('show');
					});
					$(target).addClass('show');
				}
 	 			if($(".contextmenu").css('display')=='block'){
 	 				$(".contextmenu").hide();
 	 	 		}
 	 		});
			//////////////// 업무 오른쪽 마우스 클릭 이벤트
			$(document).on('contextmenu','.task-field', function(e) {
				$(".contextmenu").hide();
				$(".tl-settings").each(function(){
					$(this).removeClass('show');
				});
				//Get window size:
				var winWidth = $(this).width();
				//console.log("windWidth:"+winWidth);
				var winHeight = $(this).height();
				//console.log("winHeight:"+winHeight);
				//Get pointer position:
				var posX = e.offsetX;
				//console.log("posX:"+posX);
				var posY = e.offsetY;
				//console.log("posY:"+posY);

				//Get contextmenu size:
				//var menuWidth = $(".contextmenu").width();
				//var menuHeight = $(".contextmenu").height();
				
				//Security margin:
				var secMargin = 10;
				if($(e.target).is("span")){
					posLeft = posX + 37 + secMargin + "px";
					posTop = posY + 7 + secMargin + "px";
				} else {
					posLeft = posX + secMargin + "px";
					posTop = posY + secMargin + "px";
				}
				//Prevent page overflow:
				/*
				if (posX + menuWidth + secMargin >= winWidth
						&& posY + menuHeight + secMargin >= winHeight) {
					//Case 1: right-bottom overflow:
					posLeft = posX - menuWidth - secMargin + "px";
					posTop = posY - menuHeight - secMargin + "px";
				} else if (posX + menuWidth + secMargin >= winWidth) {
					//Case 2: right overflow:
					posLeft = posX - menuWidth - secMargin + "px";
					posTop = posY + secMargin + "px";
				} else if (posY + menuHeight + secMargin >= winHeight) {
					//Case 3: bottom overflow:
					posLeft = posX + secMargin + "px";
					posTop = posY - menuHeight - secMargin + "px";
				} else {
					//Case 4: default values:
					posLeft = posX + secMargin + "px";
					posTop = posY + secMargin + "px";
				};
				*/
				//Display contextmenu:
				var taskNo = $(this).attr("id").substring(5);
				$("#menu-"+taskNo).css({
					"left" : posLeft,
					"top" : posTop
				}).show();
				//Prevent browser default contextmenu.
				return false;
			});

 			//Hide contextmenu:
			$(document).on("click",function(e) {
				if($(e.target).is(".menu-setting") === false){
					$(".tl-settings").each(function(){
						//console.log(this);
						$(this).removeClass('show');
					});
				}
				$(".contextmenu").hide();
			});
		});
	</script>
</body>

</html>
