<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>타임라인</title>
<link rel="stylesheet" href="/team/resources/css/log-feedback.css">
<%@include file="/WEB-INF/views/modules/common-css.jsp"%>
<style>
section div {border:1px solid;}
.section-nav {
	float: left;
    height: 100%;
    width: 30%;
}
.section-content {
    height: 100%;
    float: right;
    width: 70%;
}
.inner-topbar {height:50px;}
.inner-nav {    
	height: 100%;
    width: 250px;
    float: left;
}
.inner-main-content {
    border: 3px solid red;
    height: 100%;
    float: right;
    width: auto;
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
					<a class="f_link" href="/team/task/main">업무</a>&nbsp;&nbsp;
					<a id="active" class="f_link" href="/team/task/timeline">타임라인</a>&nbsp;&nbsp;
					<a  class="f_link" href="/team/task/analyticsmain">분석</a>
				</div>
				<div class="header-right"
					style="flex-basis: 33%; padding-top: 20px;"></div>
			</section>
			<hr />
			<!-- /.content-body -->
			
			
			<section class="section-body">
				<div class="section-nav"></div>
				
				<div class="section-content">
					<div class="inner-topbar">
					
					</div>
					
					<div class="inner-content">
						<div class="inner-nav">
						
						</div>
						
						<div class="inner-main-content">
						
						</div>
					</div>
				</div>
			</section>
					
					
					
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
		// dropdown list
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
