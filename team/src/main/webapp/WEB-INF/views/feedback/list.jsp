<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>feedback</title>
<style>
.f_link {
	padding: 10px;
	color: #5d5d5d;
	font-weight: bold;
}
</style>
<%@include file="/WEB-INF/views/modules/common-css.jsp"%>

</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<!-- Navbar -->
	<%@include file="/WEB-INF/views/modules/topbar.jsp"%>
	<!-- /.navbar -->

	<div class="wrapper">

		<!-- Main Sidebar Container -->
		<%@include file="/WEB-INF/views/modules/sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div style="height: 50px; text-align: center; padding-top: 20px;">
				<a class="f_link" href="#">활동 로그</a>&nbsp;&nbsp; <a class="f_link"
					href="/team/feedback/list">피드백</a>
			</div>

			<hr />

			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h3 style="margin-left:20px">업데이트 사항을 모두 확인했습니다.</h3>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/team/home">Home</a></li>
								<li class="breadcrumb-item active"><a href="/feedback/list">Feedback list</a></li>
							</ol>
						</div>

						<hr />
						<div class="card" style="width:100%;height:100%;padding:10px;margin:20px;margin-top:40px;">
							<div class="card-header">
								<h3 class="card-title">jsGrid</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<div id="jsGrid1" style="height:100%;width:100%;"></div>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content"></section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2019 <a
				href="http://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.0.3-pre
			</div>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>

</body>

</html>
