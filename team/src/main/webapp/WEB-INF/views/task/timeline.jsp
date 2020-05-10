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
    
.t-dropdown-item {
	white-space: nowrap;
    background-color: transparent;
    font-weight: 400;
    color: #212529;
    padding: .25rem 1rem;
}


.card {margin-bottom:0 !important;border-radius:0; box-shadow:none}
.card-header {border-radius:0 !important; color:#4e4e4e}
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
#task-label {
	position: absolute; 
	background: #000;
	width:auto; padding:15;
	opacity: 0.6; 
	border-radius:.30rem;
	color:white;
}

.startdate {border-top-left-radius:.50rem;border-bottom-left-radius:.50rem; cursor:col-resize}
.enddate {border-top-right-radius:.50rem;border-bottom-right-radius:.50rem; cursor:col-resize}
.term {border-right:0 !important;}


.modal-body-inner {
    margin: 35px 80px 35px 80px;
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
					style="flex-basis: 20%; padding-top: 20px; padding-left: 20px; display: flex; flex-wrap: nowrap;">
					<button type="button" class="btn btn-secondary" onclick="location.href='/team/project/prlist';"
						style="height: 30px;">
						<i class="fas fa-arrow-left"></i>
					</button>
					<a href="#" id="project-name" style="padding-left: 20px; font-size: 20px; font-weight: bold;">${projectByNo.projectName }</a>
				</div>
				<div class="header-center"
					style="flex-basis: 60%; text-align: center; padding-top: 20px;">
					<a id="active2" class="f_link" href="/team/task/main">업무</a>&nbsp;&nbsp;
					<a id="active" class="f_link" href="/team/task/timeline">타임라인</a>&nbsp;&nbsp;
					<a id="active4" class="f_link" href="/team/task/calendar">캘린더</a>&nbsp;&nbsp;
					<a id="active3" class="f_link" href="/team/task/analyticsmain">분석</a>
				</div>
				<div class="header-right"
					style="flex-basis: 20%; padding-top: 20px;"></div>
			</section>
			<hr />
			
			<!-- /.card -->
		
			<!-- Main content -->
		    <section class="content">
		      <div class="row">
		        <div style="width:100%">
		          <div class="card"  >
		            <div class="card-header" style="background-color: #dbdbdb;border:2px solid #cecece;">
		            	<span id="timeline-info" style="font-weight:bold; cursor:pointer">
		            		<i class="fas fa-question-circle" style="margin:10px"></i>타임라인에 대해서
		            	</span>
		              <div class="card-tools">
		                <div class="input-group input-group-sm">
		            		<div class="dropdown-btn"><i class="fas fa-ellipsis-v"></i></div>
		            		<div class="search-task dropdown-menu hide-dropdown" style="width:200px">
							    <div class="t-dropdown-item">
							    	<input class="checkbox" type="checkbox" value="M">
							    	내가 등록한 업무
							    </div>
							    <div class="t-dropdown-item">
							    	<input class="checkbox" type="checkbox" value="C">
							   		 완료되지 않은 업무
							    </div>
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
					
						<jsp:include page="modules/timeline-table.jsp"></jsp:include>
						
					</div>
		       	
			       	<!-- 마우스 따라다니는 라벨 -->
					<div id="task-label"> </div>

		       </div>
		       </div>


		    </section>
    <!-- /.content -->
			
			
			<!-- /.card -->
		</div>
		</div>
		
		
		 <!-- 타임라인 설명 모달 -->
      <div id="timelineInfoModal" class="modal fade">
        <div class="modal-dialog modal-lg">
          <div class="modal-content" style="cursor:default">
            <div class="modal-header" style="border:none; padding:10px;">
            </div>
            <div style="text-align:center;padding:30px">
            	<h4 style="display:inline-block; font-weight:bold;">타임라인에 대해서</h4>
            </div>
            <div class="modal-body" style="margin-bottom:60px;padding:0px;">
            	<div class="modal-body-inner">
            		타임라인은 프로젝트의 진행 상황을 시각화할 수있는 완벽한 도구이며 문제가 발생하기 전에 문제를 예측할 수 있습니다.
            		더 궁금한 사항이 있다면 문의해주세요.
            	</div>
            	<div class="modal-body-inner">
            		<h6 style="text-align:center;margin-bottom:20px">타임라인 사용법</h6>
            		<div>
            			<img src="/team/resources/img/timeline.PNG" style="max-width:350;border: 1.5px solid #cccccc;margin-right: 20px;margin-bottom:20px;float: left;">
            			<div style="font-size:11pt">
            				<span style="font-weight:bold">색깔 바</span> : 해당 업무의 시작일과 마감일이 지정된 경우에 표시됩니다. <br>
            				색깔 바의 양 끝을 드래그하여 업무의 시작일과 마감일을 수정할 수 있습니다. <br><br>
            				<i class="fas fa-ellipsis-v" style="margin-right:7px"></i> 버튼을 클릭하여 업무를 필터링할 수 있습니다.
            			</div>
            		</div>
            	</div>
             
             </div>
            </div>
          </div>
        </div>
        <!-- /.modal-dialog -->
    
		       

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
		// 페이지 로드되면 테이블 설정
		function setupTable() {
			// 오늘 날짜 표시
			var m = new Date().getMonth() + 1;
			var d = new Date().getDate();
			$("td[data-date='date-"+m+"-"+d+"']").addClass("today");
			$(".today").eq(0).attr("id", "today-label");
			$(".today").eq(0).html("오늘");
			
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
						$("." + taskNo).eq(i).css({"background-color" : bgColor[bgColorIdx]});
						$("." + taskNo).eq(i).addClass("term");
					}
				}
				bgColorIdx++;
				if (bgColorIdx > bgColor.length - 1) bgColorIdx = 0;
			});
		} setupTable();
		
		
		// 업무 필터 적용
		var searchType = "";
		function getSearchType() {
			$(".search-task").find("input[checked='checked']").each(function() {
				searchType += $(this).attr("value");
			});
		}
		
		$(".t-dropdown-item").click(function(e) {
			e.stopPropagation(); // 드롭다운 닫히는거 막기
			
			var t = $(this).find("input");
			if (t.attr("checked") == "checked") t.removeAttr("checked");
			else t.attr("checked", "checked");
			
			getSearchType();
			
			$.ajax({
				url : "/team/task/timeline2", 
				success : function(data, status, xhr) {
					$("#timeline-card").load("/team/task/timeline/getTable?searchType=" + searchType, function() { 
						setupTable(); 
						$("#timeline-card").animate({scrollLeft : 0}, 300);
						searchType = "";
					});
				}
			});
		})
		
		
		
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
		
		// 현재 날짜로 버튼
		const tLeft = $("#today-label").offset().left;
		$(".now-btn").click(function() {
			var target = $("#timeline-card").scrollLeft();
			$("#timeline-card").animate({scrollLeft : target + (tLeft - target - 300)}, 500);
		});
		
		// 버튼클릭시 옆으로 스크롤
		$(".right-btn").click(function() {
			$("#timeline-card").animate({scrollLeft : $("#timeline-card").scrollLeft() + 1150}, 300);
		});
		$(".left-btn").click(function() {
			$("#timeline-card").animate({scrollLeft : $("#timeline-card").scrollLeft() - 1150}, 300);
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
		
		
		
		// 마우스 따라다니는 업무 이름
		$(document).on("mousemove", "#timeline-table td", function(e) { 
			var className = $(this).attr("class");
			if (className == null || !className.includes("task-")) { $("#task-label").hide(); return; }
			
			var row = ".task-" + className.split("task-")[1].split(" list")[0];
			
		    $("#task-label").show(); 
		    $("#task-label").css("left", e.pageX + "px"); 
		    $("#task-label").css("top", (e.pageY - 30) +"px"); 
		    $("#task-label").text($(row).parents("tr").children("td").eq(0).text());
    	}); 
		
		
		
		// 타임라인 설명
		$("#timeline-info").click(function() {
			$("#timelineInfoModal").modal();
		});
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 시작일 / 마감일 설정 관련
		
		// 날짜 변경 마우스 드래그앤 드롭
		var row, pageX, startOrEnd, bgColor = null;
		
		// 마우스 처음 눌를때
		$(document).on("mousedown", ".startdate, .enddate", function(e) {
			row = "task-" + $(this).attr("class").split("task-")[1].split(" list")[0]; // 행마다 부여되는 taskNo 클래스
			pageX = e.pageX;
			bgColor = $(this).css("background-color");
			
			if ($(this).hasClass("startdate")) { $(this).removeClass("startdate"); startOrEnd = "start"; } 
			else { $(this).removeClass("enddate"); startOrEnd = "end"; }
		});
		
		// 마우스 움직일때
		$(document).on("mousemove", "#timeline-table td", function(e) {
			if (row == null) return;
		
			var target = $(this);
			if (!$(this).hasClass(row)) target = $("." + row).eq($(this).index()); // 마우스 뗀곳이 마우스 누른 행이 아닐때
			
			if (startOrEnd == "start") { // 시작날짜 조정
				if (e.pageX < pageX) { target.addClass("term"); target.css("background-color", bgColor); } 	// 왼쪽으로
				else { target.removeClass("term"); target.css("background-color", "white"); }				// 오른쪽으로
			
				$("." + row).parents("tr").children(".startdate").removeClass("startdate");
				$(this).addClass("startdate");
			} 
			else { 						 // 끝날짜 조정
				if (e.pageX < pageX) { target.removeClass("term"); target.css("background-color", "white"); }// 왼쪽으로
				else { target.addClass("term"); target.css("background-color", bgColor); }				  	 // 오른쪽으로
			
				$("." + row).parents("tr").children(".enddate").removeClass("enddate");
				$(this).addClass("enddate");
			}
			
			pageX = e.pageX;
		});
		
		// 마우스 뗐을때
		$(document).on("mouseup", "#timeline-table td", function(e) {	 
			if (row == null) return;
			
			var target = $(this);
			if (!$(this).hasClass(row)) {
				$(this).removeClass("startdate"); $(this).removeClass("enddate"); 
				target = $("." + row).eq($(this).index()); // 마우스 뗀곳이 마우스 누른 행이 아닐때
			}
			$.ajax({
				url : "/team/task/timeline/dateUpdate",
				method : "post",
				data : {
					"taskNo" : row.split("task-")[1],
					"dateType" : startOrEnd == "start" ? "start" : "end",
					"date" : target.attr("data-date")
				},
				success : function(data, status, xhr) {
					var taskContent = $("." + row).parents("tr").children("td").eq(0).text();
					toastr.info("업무  " + taskContent + " 의 " + ((startOrEnd == "start") ? "시작일자" : "마감일자") +" 를 변경했습니다");
					
					getSearchType();
					// ajax load 후 css 먹히게할려면 뒤에 인자로 함수 주면 가능함.
					$("#timeline-card").load("/team/task/timeline/getTable?searchType=" + searchType, function() { 
						setupTable();  
					});
						
					row = null; pageX = null;
				}, 
				error : function(xhr, status, err) { console.log(err); }
			});	
			
		});
		
		// 시작일 없는 업무에 시작일 등록
		$(document).on("click", "#timeline-table td", function(e) {
			var className = $(this).attr("class");
			if (className == null || !className.includes("task-")) return;
			
			var row = ".task-" + className.split("task-")[1].split(" list")[0];
			if (!$(row).parents("tr").children(".startdate").length == 0) return;
			if (!confirm("시작일이 없는 업무입니다. \n해당 날짜를 시작일로 지정할까요?")) return;
			
			var target = $(this);
			target.addClass("startdate"); target.addClass("term");
			target.next().addClass("enddate");
			setupTable();
			
			$.ajax({
				url : "/team/task/timeline/dateUpdate", // 시작일 등록
				method : "post",
				data : {
					"taskNo" : row.split("task-")[1],
					"dateType" : "start",
					"date" : target.attr("data-date")
				}, 
				success : function(data, status, xhr) {	 // 마감일 등록
					$.ajax({
						url : "/team/task/timeline/dateUpdate",
						method : "post",
						data : {
							"taskNo" : row.split("task-")[1],
							"dateType" : "end",
							"date" : target.next().attr("data-date")
						}, 
						success : function(data, status, xhr) {
							var taskContent = $(row).parents("tr").children("td").eq(0).text();
							toastr.info("업무  " + taskContent + " 의 시작일자와 마감일자 를 지정했습니다");
						}
					});
				}
			});
		});
		
	});
	</script>
</body>
</html>
