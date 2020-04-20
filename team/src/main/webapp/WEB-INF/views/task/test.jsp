<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>워크스페이스 멤버</title>
<link rel="stylesheet" href="/team/resources/css/log-feedback.css">
<%@include file="/WEB-INF/views/modules/common-css.jsp"%>

<style>
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<!-- Navbar -->
	<%@include file="/WEB-INF/views/modules/topbar.jsp"%>
	<!-- /.navbar -->

	<div class="wrapper">

		<!-- Main Sidebar Container -->
		<%@include file="/WEB-INF/views/modules/sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="background-color: #ececec">
			<section>
				<div style="height: 50px; text-align: center; padding-top: 20px;">
					<a id="active" class="f_link" href="#">업무</a>&nbsp;&nbsp;
					<a id="active2" class="f_link" href="#">타임라인</a>
				</div>
			</section>
			<hr />
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<i style="float: left; margin: 5px;" class="fas fa-bars"></i>
							<h5 style="font-weight: bold; color: #464c59">업무리스트</h5>
						</div>
						<!-- /.col -->
						<!-- <div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/team/home">Home</a></li>
								<li class="breadcrumb-item active"><a href="/feedback/list">Feedback
										list</a></li>
							</ol>
						</div> -->
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
			<!-- /.content-header -->

			<section class="content" style="padding: 0 4% 0 4%;">
				<!-- Default box -->
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
