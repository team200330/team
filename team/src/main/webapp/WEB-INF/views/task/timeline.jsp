<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>타임라인</title>
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
    
.card {margin-bottom:0 !important;border-radius:0; box-shadow:none}
.card-header {border-radius:0 !important}
.card-content {display:inline-block}
.card-nav {display:block}
.card-body .card {margin-bottom:0px;}
.input-group div {margin:10px; color:#3f3f3f; cursor:pointer}
.hide-dropdown {display:none;}
.show-dropdown {display:block;}

#timeline-card::-webkit-scrollbar {
    display: none;
}
#month td:not(:first-child) {
    border-left: 2px solid #cecece;
    border-right: 2px solid #cecece;
    border-bottom: 2px solid #cecece;
    background-color: #e3e3e3;
    color: #777777;
    font-weight: bold;
    padding-left:7px;
}
#month td:first-child {border:0}
#date td:not(:first-child) {
	padding: 5 10 5 10;
    min-width: 35px;
    text-align: center;
    color: #a8a8a8;
    font-weight:bold;
    background-color: #f3f3f3;
    border-right: 2px solid #cecece;
    border-bottom: 2px solid #cecece;
}
td:nth-child(1) {
	width:270px; 
	min-width:270px;
	border-right:2px solid #cecece;
	padding:10px;
}
td:not(:first-child) {border-right: 2px solid #e5e5e5;}
.taskList {cursor:pointer;font-weight: bold;color: #4e4e4e;}
.task td:nth-child(1) {padding: 3 45 3;color: gray;cursor:pointer;}
.display-none {display:none !important}
.fa-chevron-down{padding:0 10 0 10}

.today {border-left:3px solid #ffb102 !important;}
#today-label{
	background-color: #ffb102;
    border-bottom-right-radius: .4rem;
    border-top-right-radius: .4rem;
    color: white;
    font-size: 11pt;
    text-align: center;
    font-weight: bold;
}

.startdate {border-top-left-radius:.50rem;border-bottom-left-radius:.50rem}
.enddate {border-top-right-radius:.50rem;border-bottom-right-radius:.50rem}

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
		<div class="content-wrapper" style="background-color: #ececec;">
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
					<a id="active2" class="f_link" href="/team/task/main">업무</a>&nbsp;&nbsp;
					<a id="active" class="f_link" href="/team/task/timeline">타임라인</a>&nbsp;&nbsp;
					<a id="active3" class="f_link" href="/team/task/analyticsmain">분석</a>
				</div>
				<div class="header-right"
					style="flex-basis: 33%; padding-top: 20px;"></div>
			</section>
			<hr />
			<!-- Main content -->
		    <section class="content">
		      <div class="row">
		        <div style="width:100%">
		          <div class="card"  >
		            <div class="card-header" style="background-color: #dbdbdb;border:2px solid #cecece;">
		              <div class="card-tools">
		                <div class="input-group input-group-sm">
		            		<div class="dropdown-btn"><i class="fas fa-ellipsis-v"></i></div>
		            		<div class="dropdown-menu hide-dropdown">
							    <button class="dropdown-item" type="button">dropdown 1</button>
							    <button class="dropdown-item" type="button">dropdown 2</button>
							    <button class="dropdown-item" type="button">dropdown 3</button>
							</div>
								
		                   	<div><i class="left-btn fas fa-arrow-left"></i></div>
		                   	<div class="now-btn" style="margin-top:5px">현재 날짜로</div>
		                   	<div><i class="right-btn fas fa-arrow-right"></i></div>
								
		                </div>
		              </div>
		              <!-- /.card-tools -->
		            </div>
		            </div>
		    		
		    		<div class="card" id="timeline-card" style="overflow-x: scroll;">
					<div class="card-body" style="padding:0px;">
						<c:choose>
							<c:when test="${not empty table}">
								<table id="timeline-table">${table}</table>	
							</c:when>
							<c:otherwise>
								업무없ㄷ음
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
		       
		  
		       </div>
		       </div>


		    </section>
    <!-- /.content -->
			
			
			<!-- /.card -->
		</div>
		</div>
		       

		<!-- /.content-wrapper -->
		<%@include file="/WEB-INF/views/modules/footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->

	<!-- ./wrapper -->

	<!-- jQuery -->
	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>
	<script type="text/javascript">
	$(function() {
		// 오늘 날짜 표시
		var m = new Date().getMonth() + 1;
		var d = new Date().getDate();
		$("td[data-date='date-"+m+"-"+d+"']").addClass("today");
		$(".today").eq(0).attr("id", "today-label");
		$(".today").eq(0).html("오늘");
		
		// 현재 날짜로 버튼
		const tLeft = $("#today-label").offset().left;
		$(".now-btn").click(function() {
			var target = $("#timeline-card").scrollLeft();
			$("#timeline-card").animate({scrollLeft : target + (tLeft - target - 300)}, 500);
		});
		
		// 마지막행 높이설정
		$("tr:last-child").height($(".content-wrapper").height() - $(".content").height() - $(".section-header").height() + $("tr:last-child").height());
		
		// 시작일자와 끝일자 표시하기
		var bgColor = ["#88d2d0", "#259ed2", "#4ab7d3"]; // 배경색은 여기 변경!!!
		var bgColorIdx = 0;
		$(".task").each(function() {
			var taskNo = $(this).attr("class").split("task ")[1].split("list")[0];
			var sdateIdx = null;
			var edateIdx = null;
			
			$("." + taskNo).each(function(i) {
				if ($(this).hasClass("startdate")) sdateIdx = i;
				if ($(this).hasClass("enddate")) edateIdx = i;
			});
			
			if (sdateIdx != null || edateIdx != null) {
				edateIdx = (edateIdx == null) ? sdateIdx : edateIdx;
				for (var i = sdateIdx; i <= edateIdx; i++) {
					$("." + taskNo).eq(i).css({"background-color" : bgColor[bgColorIdx], "border-right" : "0", "cursor" : "pointer"});
					$("." + taskNo).eq(i).addClass("term");
				}
			}
			bgColorIdx++;
			if (bgColorIdx > bgColor.length - 1) bgColorIdx = 0;
		});
		
		// 업무리스트 열고 닫기
		$(document).on("click", ".taskList", function() {
			var height = 0;
			for (var i = 0; i < $("." + $(this).attr("id") + "-task").length; i++) 
				height += 26; // task 행 높이
				
			var target = $("." + $(this).attr("id"));
			
			if (target.hasClass("display-none")) {
				$("tr:last-child").height($("tr:last-child").height() - height); // 마지막행높이 설정
				target.removeClass("display-none");
			}
			else {
				$("tr:last-child").height($("tr:last-child").height() + height); // 마지막행높이 설정
				target.addClass("display-none");
			}
		});
		
		// 드롭다운 보이기 / 숨기기
		$(".dropdown-btn").click(function(e) {
			var target = $(this).next();
			if (target.hasClass("hide-dropdown")) {
				target.removeClass("hide-dropdown"); target.addClass("show-dropdown");
			}
			else {
				target.addClass("hide-dropdown"); target.removeClass("show-dropdown");
			}
			e.stopPropagation();
		});
		$(document).on("click",function(e) {
			var target = $(".dropdown-btn").next();
			target.removeClass("show-dropdown"); target.addClass("hide-dropdown"); 
		});
		
		// 횡스크롤 마우스휠 
		$("#timeline-card").on('mousewheel',function(e){
			var wheelDelta = e.originalEvent.wheelDelta;

			if(wheelDelta > 0) $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
			else $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

			e.preventDefault();
			e.stopPropagation();
		}); 
		
		// 버튼클릭시 옆으로 스크롤
		$(".right-btn").click(function() {
			$("#timeline-card").animate({scrollLeft : $("#timeline-card").scrollLeft() + 500}, 500);
		});
		$(".left-btn").click(function() {
			$("#timeline-card").animate({scrollLeft : $("#timeline-card").scrollLeft() - 500}, 500);
		});
		
		// 업무이름 클릭시 시작일자로 이동
		$(document).on("click", ".task td:first-child", function() {
			var taskNo = $(this).next().attr("class").split("task-")[1].split(" list")[0];
			
			$(".task-" + taskNo).each(function(i) {
				if ($(this).hasClass("startdate")) {
					$("#timeline-card").animate({scrollLeft : $(this).offset().left - 200}, 500);
					return;
				}
			});
		});
		
		
		
		
		
		
		
		
		
		
		
		
		// 여기 고치기 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		// 마우스 드래그앤 드롭
		var dragTarget = null;
		
		// 마우스 누르고 있을때
		$(document).on("mousedown", ".enddate", function(e) { 
			console.log($(this).attr("class"))
			dragTarget = "task-" + $(this).attr("class").split("task-")[1].split("list")[0];
			console.log(dragTarget);
		});
		
		// 마우스 뗐을때
		$(document).on("mouseup", "td", function(e) {	 
			if (dragTarget == null) return;
			console.log("mouseup");
			dragTarget = null;
		});
		
		// 마우스 움직일때
		$(document).on("mousemove", "td", function(e) { 	 
			if (dragTarget == null) return;
			console.log($(this).attr("class"));
			console.log("dragtarget : "+ dragTarget);
			console.log($(this).hasClass(dragTarget));
			
			if ($(this).hasClass(dragTarget)) console.log("move");
		});
		
		
		
		
		
		
	});
	</script>
</body>

</html>
