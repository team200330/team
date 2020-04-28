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

#content-header div{display:inline-block; margin:10 5 10 5}
#content-header div:last-child{margin-right:15px}
#content-header {text-align:right}
.card-sidebar {
    display: inline-block;
    max-width: 250px;
    min-width: 200px;
}
.card {margin-bottom:0 !important;border-radius:0}
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
				<div class="header-right"
					style="flex-basis: 33%; padding-top: 20px;"></div>
			</section>
			<hr />
			<!-- /.content-body -->
			
			<!-- Main content -->
		    <section class="content">
		      <div class="row">
		        <div class="col-md-3" style="max-width:250px;">
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
		          <div class="card" >
		            <div class="card-header" style="background-color: #dbdbdb;border: 1px solid #c7c7c7;">
		              <div class="card-tools">
		                <div class="input-group input-group-sm">
		            		<div class="filter-btn"><i class="fas fa-ellipsis-v"></i></div>
		            		<div class="dropdown-menu hide-dropdown">
							    <button class="dropdown-item" type="button">dropdown 1</button>
							    <button class="dropdown-item" type="button">dropdown 2</button>
							    <button class="dropdown-item" type="button">dropdown 3</button>
							</div>
								
		                   	<div><i class="fas fa-arrow-left"></i></div>
		                   	<div style="margin-top:5px">현재 날짜로</div>
		                   	<div><i class="fas fa-arrow-right"></i></div>
								
		                </div>
		              </div>
		              <!-- /.card-tools -->
		            </div>
		    	
					<div class="card-body" style="padding:0px;">
						<div class="inner-nav">
							<div class="card">
				            <div class="card-header">
				              <h3 class="card-title">tasklist 1</h3>
				              <div class="card-tools">
				                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
				                </button>
				              </div>
				            </div>
				            <div class="card-body p-0">
				              <ul class="nav nav-pills flex-column">
				                <li class="nav-item active">
				                  <a href="#" class="nav-link">task1</a>
				                </li>
				                <li class="nav-item">
				                  <a href="#" class="nav-link">task2</a>
				                </li>
				                <li class="nav-item">
				                  <a href="#" class="nav-link">task3</a>
				                </li>
				                <li class="nav-item">
				                  <a href="#" class="nav-link">task4</a>
				                </li>
				                <li class="nav-item">
				                  <a href="#" class="nav-link"></a>
				                </li>
				              </ul>
				            </div>
				            <div class="card">
				            <div class="card-header">
				              <h3 class="card-title">tasklist 1</h3>
				              <div class="card-tools">
				                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
				                </button>
				              </div>
				            </div>
				            <div class="card-body p-0">
				              <ul class="nav nav-pills flex-column">
				                <li class="nav-item active">
				                  <a href="#" class="nav-link">task1</a>
				                </li>
				                <li class="nav-item">
				                  <a href="#" class="nav-link">task2</a>
				                </li>
				                <li class="nav-item">
				                  <a href="#" class="nav-link">task3</a>
				                </li>
				                <li class="nav-item">
				                  <a href="#" class="nav-link">task4</a>
				                </li>
				                <li class="nav-item">
				                  <a href="#" class="nav-link"></a>
				                </li>
				              </ul>
				            </div>
		         		 	</div>
				        </div>
				        </div>
				          
				        <div class="card-content" id="body-task">
				            <div id="month">
				          	달
				          	</div>
				          	
				          	<div id="date">
				          	날짜
				          	</div>
				       
				        </div>
					
					
					
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
		////////////////////////가로 횡스크롤 드래그 ///////////////////////////			
		var slider = $("#body-task");
		let isDown = false;
		let startX;
		let scrollLeft;
	
		$(document).on('mousedown',slider,function(e){
			isDown = true;
			slider.addClass('active');
			startX = e.pageX - slider.offset().left;
			scrollLeft = slider.scrollLeft();
		});
	
		$(document).on('mouseleave',slider,function(){
			isDown = false;
			slider.removeClass('active');
		});
	
		$(document).on('mouseup',slider,function(){
			isDown = false;
			slider.removeClass('active');
		});
	
		$(document).on('mousemove',slider,function(e){
			if(!isDown) return;
			e.preventDefault();
			const x = e.pageX - slider.offset().left;
			const walk = (x - startX) * 3; //scroll-fast
			slider.scrollLeft(scrollLeft-walk);
		});
		///////////////////////////////////////////////////////////////
		
		
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
	});
	</script>
</body>

</html>
