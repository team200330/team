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
.gmi-time-panel__body__item--spinner__item::marker {
	display: none;
}
.custom-control-input:checked ~.custom-control-label::before {
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

.task-field.selected {
	background-color:#c5ecff !important;
}

.task-field.completed {
	background-color:#e2e2e2;
}

.f_link.properties {
	padding: 10px;
}

.pitem {
	color: #016979;
}

.modal-dialog {
	top: 35%;
	left: 20%;
}
.modal-backdrop {
	position: fixed;
    top: 0;
    left: 0;
    z-index: -5;
    width: 100vw;
    height: 100vh;
    background-color: #000;
}

</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<!-- Navbar -->
	<%@include file="/WEB-INF/views/modules/topbar.jsp"%>
	<!-- /.navbar -->

	<div class="wrapper" style="min-height: auto;">
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

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>
	<script src="/team/resources/js/task-common.js"></script>
	<script src="/team/resources/js/task-properties-side.js"></script>
	<script src="/team/resources/js/i18n/datepicker.en-US.js"></script>
	<script type="text/javascript">
	</script>
</body>

</html>
