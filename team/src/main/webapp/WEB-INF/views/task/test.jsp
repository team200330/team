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
					<a id="active" class="f_link" href="#">업무</a>&nbsp;&nbsp; <a
						id="active2" class="f_link" href="#">타임라인</a>
				</div>
				<div class="header-right"
					style="flex-basis: 33%; padding-top: 20px;"></div>
			</section>
			<hr />
			<!-- /.content-body -->
			<section class="section-body">
				<div class="body-top">
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
					<i class="fas fa-search"></i>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
	
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> 전체 </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#">나에게 배정된 업무</a> <a
										class="dropdown-item" href="#">내가 생성한 업무</a> <a
										class="dropdown-item" href="#">팔로우 중</a>
								</div></li>
						</ul>
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="search"
								placeholder="업무 검색" aria-label="Search">
							<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
						</form>
					</div>
				</nav>
				</div>
				<section class="body-task" style="padding-top: 15pt; padding-left:15pt; width:300px; height: 100%;">
					<div id="add-task-div" class="btn btn-secondary" style="cursor: pointer; width: 100%">
						<span id="add-task-span">
							<i class="fas fa-plus"></i> 새 업무리스트 만들기
						</span>
						<div id="add-task-textarea-div" style="display: none;">
							<input id="add-task-textarea" type="text" style="width:170pt; height: 18pt;">
							<span id="cancel-add" style="padding-left:5pt; cursor: pointer;" >
								<i class="fas fa-times"></i>
							</span>
						</div>
					</div>
				</section>
			</section>
			
			
			<section class="content" style="padding: 0 4% 0 4%;"></section>
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
	<script type="text/javascript">
		$(function() {
			var flag = "false";
			$("#add-task-div").click(function(event) {
				if( flag == "true"){
					flag = "false";
					return;
				}else{
					$("#add-task-div").css("cursor","default");
					$("#add-task-span").hide();
					$("#add-task-textarea-div").show();
				}
			});
			$("#cancel-add").click(function() {
				flag = "true";
				$("#add-task-textarea-div").hide();
				$("#add-task-span").show();
				$("#add-task-div").css("cursor","pointer");
			});
		});
	</script>
</body>

</html>
