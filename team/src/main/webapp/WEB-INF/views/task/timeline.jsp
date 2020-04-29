<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>타임라인</title>
<link rel="stylesheet" href="/team/resources/css/log-feedback.css">
<%@include file="/WEB-INF/views/modules/common-css.jsp"%>
<style>
.col-md-3 {
	min-width: 200px;
    max-width: 20%;
    height: 705px;
    background-color: white;
    padding: 0px;
}
.col-md-9 {
	max-width: 80%;
    background-color: white;
    padding: 0px;
}
#content-header div{display:inline-block; margin:10 5 10 5}
#content-header div:last-child{margin-right:15px}
#content-header {text-align:right}
.card-sidebar {
    display: inline-block;
    max-width: 250px;
    min-width: 200px;
}
.card {margin-bottom:0 !important;border-radius:0; box-shadow:none}
.card-header {border-radius:0 !important}
.card-content {display:inline-block}
.card-nav {display:block}
.card-body .card {margin-bottom:0px;}
.inner-nav {
    max-width: 250px; min-width:250px; height: 680px;
    margin: 0px; padding: 0px;
    display: inline-block;
    border-right: 1px solid #cdcdcd;
}
.inner-nav .card {box-shadow:none;}
.inner-nav .card-header:first-child{border-top: 0px !important;}
.inner-nav .card-header {border-top: 1px solid #cdcdcd;}
.input-group div {margin:10px; color:#3f3f3f; cursor:pointer}
.hide-dropdown {display:none;}
.show-dropdown {display:block;}

#timeline-card::-webkit-scrollbar {
    display: none;
}
tr:last-child {border:1px solid}
#month td {border:1.5px solid gray;padding-left:5px}
#month td:first-child {border:0}

#date td {
	border-right:1px solid;
	padding:5 10 5 10;
    min-width: 35px;
    text-align: center;
}
td:nth-child(1) {
	width:250px; 
	min-width:250px;
	border-right:1px solid; 
	padding:10px;
}
.taskList { background-color:#cccccc; cursor:pointer;}
.task td:nth-child(1) {padding:5 !important}
.taskList td, .task td {border-right: 1px solid gray;}
.startdate { background-color:red}
.endDate {background-color:blue}
.display-none {display:none !important}

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
					<a class="f_link" href="/team/task/main">업무</a>&nbsp;&nbsp;
					<a id="active" class="f_link" href="/team/task/timeline">타임라인</a>&nbsp;&nbsp;
					<a  class="f_link" href="/team/task/analyticsmain">분석</a>
				</div>
				<div class="header-right" style="flex-basis: 33%; padding-top: 24px;"></div>
			</section>
			<!-- /.content-body -->
			
			<!-- Main content -->
		    <section class="content">
		      <div class="row">
		        <div class="col-md-3">
		          <div class="card">
		           
		            <div class="card-body p-0">
		              <ul class="nav nav-pills flex-column">
		                <li class="nav-item active">
		                  <a href="#" class="nav-link">
		                    Inbox
		                  </a>
		                </li>
		                <li class="nav-item">
		                  <a href="#" class="nav-link">
		                    Sent
		                  </a>
		                </li>
		                <li class="nav-item">
		                  <a href="#" class="nav-link">
		                    Drafts
		                  </a>
		                </li>
		                <li class="nav-item">
		                  <a href="#" class="nav-link">
		                   Junk
		                  </a>
		                </li>
		                <li class="nav-item">
		                  <a href="#" class="nav-link">
		                    Trash
		                  </a>
		                </li>
		              </ul>
		            </div>
		            <!-- /.card-body -->
		          </div>
		          <!-- /.card -->
		          <div class="card">
		            <div class="card-header">
		              <h3 class="card-title">빠른 필터</h3>
		
		              <div class="card-tools">
		                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
		                </button>
		              </div>
		            </div>
		            <div class="card-body p-0">
		              <ul class="nav nav-pills flex-column">
		                <li class="nav-item">
		                  <a href="#" class="nav-link">
		                    Important
		                  </a>
		                </li>
		                <li class="nav-item">
		                  <a href="#" class="nav-link">
		                  Promotions
		                  </a>
		                </li>
		                <li class="nav-item">
		                  <a href="#" class="nav-link">
		                    Social
		                  </a>
		                </li>
		              </ul>
		            </div>
		            <!-- /.card-body -->
		          </div>
		          <!-- /.card -->
		        </div>
		        <!-- /.col -->
		        <div class="col-md-9">
		          <div class="card"  >
		            <div class="card-header" style="background-color: #dbdbdb;border: 1px solid #c7c7c7;">
		              <div class="card-tools">
		                <div class="input-group input-group-sm">
		            		<div class="filter-btn"><i class="fas fa-ellipsis-v"></i></div>
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

		//$("#timeline-table tr:last-child").height(705 - $("#timeline-table").height() - $("#timeline-table tr:last-child").height() - 15);

		
		
		$(".filter-btn").click(function() {
			var target = $(this).next();
	
			if (target.hasClass("hide-dropdown")) {
				target.removeClass("hide-dropdown");
				target.addClass("show-dropdown");
			} else {
				target.removeClass("show-dropdown");
				target.addClass("hide-dropdown");	
			}
		});
		
		$(document).on("click", ".taskList", function() {
			var target = $("." + $(this).attr("id"));
			
			if (target.hasClass("display-none")) target.removeClass("display-none");
			else target.addClass("display-none");
		});
		
		
		// 횡스크롤 마우스휠 
		$("#timeline-card").on('mousewheel',function(e){
			var wheelDelta = e.originalEvent.wheelDelta;

			if(wheelDelta > 0) $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
			else $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
		});
		
		// 버튼클릭시 옆으로 스코롤
		$(".right-btn").click(function() {
			$("#timeline-card").animate({scrollLeft : $("#timeline-card").scrollLeft() + 500}, 500);
		});
		$(".left-btn").click(function() {
			$("#timeline-card").animate({scrollLeft : $("#timeline-card").scrollLeft() - 500}, 500);
		});
		
		
	

	});
	</script>
</body>

</html>
