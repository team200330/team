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
			style="flex-basis: 20%; padding-top: 20px; padding-left: 20px; display: flex; flex-wrap: nowrap;">
			<button type="button" class="btn btn-secondary"
				style="height: 30px;">
				<i class="fas fa-arrow-left"></i>
			</button>
			<a href="#" id="project-name" style="padding-left: 20px; font-size: 20px; font-weight: bold;">${projectByNo.projectName }</a>
		</div>
		<div class="header-center"
			style="flex-basis: 60%; text-align: center; padding-top: 20px;">
			<a id="active2" class="f_link" href="/team/task/main">업무</a>&nbsp;&nbsp;
			<a id="active4" class="f_link" href="/team/task/timeline">타임라인</a>&nbsp;&nbsp;
			<a id="active3" class="f_link" href="/team/task/calendar">캘린더</a>&nbsp;&nbsp;
			<a id="active" class="f_link" href="/team/task/analyticsmain">분석</a>
		</div>
		<div class="header-right"
			style="flex-basis: 20%; padding-top: 20px;"></div>
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

</body>

</html>
