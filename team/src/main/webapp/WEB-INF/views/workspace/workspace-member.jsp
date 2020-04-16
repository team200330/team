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
		<div class="content-wrapper" style="background-color:#ececec">
			<!-- Content Header (Page header) -->
			<div style="height: 50px; text-align: center; padding-top: 20px;">
				<a id="active" class="f_link" href="/team/workspace/workspace-member">멤버</a>&nbsp;&nbsp; <a class="f_link"
					href="#">내 프로필</a>
			</div>

			<hr />

			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<i style="float: left;margin:5px;" class="fas fa-bars"></i>
							<h5 style="font-weight:bold;color:#464c59">워크스페이스 멤버</h5>
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

			<section class="content"  style="padding: 0 4% 0 4%;">
    <div class="row">
				  <div class="form-group col-12 col-sm-6 col-md-3">
                        <input class="form-control" type="search" placeholder="이름 또는 직함으로 검색하기" aria-label="Search" style="margin-right: -40px;">                   
                  </div>
				  <div class="form-group col-12 col-sm-6 col-md-3">
                        <select class="form-control">
                          <option>모든 멤버(5)</option>
                          <option>활동 중인 멤버(5)</option>
                          <option>초대 중인 멤버(0)</option>
                          <option>삭제된 팀원(1)</option>
                        </select>
                  </div>
                  <div class="form-group col-12 col-sm-6 col-md-3">
                        <select class="form-control">
                          <option>이름순</option>
                          <option>관리자/멤버</option>
                          <option>온라인/오프라인</option>
                        </select>
                  </div>
                  <div class="form-group col-12 col-sm-6 col-md-3">
                    <a href="invite-workspace" class="form-control btn btn-sm btn-success">
                      <i class="fas fa-user" style="margin-top: 7px;"></i> 멤버 초대하기
                    </a>
                  </div>
                </div>
      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body pb-0">
          <div class="row d-flex align-items-stretch">
            <div class="col-12 col-sm-6 col-md-3 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                  직함 : 땡땡땡
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>김연아</b>
                      <a data-toggle="dropdown"><i class="fas fa-cog ml-3" style="font-size: 18px; color: darkgray;"></i>
                      <div class="dropdown-menu">
                            <button class="dropdown-item" >관리자 권한부여</button>
                        </div>
                      </a>
                      </h2>
                      <p class="text-muted text-sm"><b>부서: </b>마케팅팀</p>
                      <ul class="mb-0 text-muted" style="list-style-type: none; padding:0;">
                        <li class="small">로그인 4월 10일 15:07</li>
                        <li class="small">ABCabc@co.kr</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="/team/resources/dist/img/user1-128x128.jpg" alt="" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">                
                  <div class="text-right">
                                      
                    <a href="#" class="btn btn-sm bg-danger" data-toggle="dropdown" style="padding-top: 7px; height: 30px;">
                    <i class="fas fa-trash-alt"></i>
                    	<div class="dropdown-menu">
                            <button class="dropdown-item" >워크스페이스에서 삭제</button>
                        </div>
                    </a>
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i> 대화
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 업무 배정
                    </a>
                    <a href="#" class="btn btn-sm btn-warning">
                    	피드백을 작성
                    </a>
                    <i class="fas fa-trash-o"></i>                    
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                  직함 : 땡땡땡
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>박지성</b><span class="badge bg-danger ml-3">관리자</span></h2>
                      <p class="text-muted text-sm"><b>부서: </b>영업팀</p>
                      <ul class="mb-0 text-muted" style="list-style-type: none; padding:0;">
                        <li class="small">로그인 4월 10일 15:07</li>
                        <li class="small">ABCabc@co.kr</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="/team/resources/dist/img/user2-160x160.jpg" alt="" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">                
                  <div class="text-right">
                                      
                    <a href="#" class="btn btn-sm bg-danger" data-toggle="dropdown" style="padding-top: 7px; height: 30px;">
                    <i class="fas fa-trash-alt"></i>
                    	<div class="dropdown-menu">
                            <button class="dropdown-item" >워크스페이스에서 삭제</button>
                        </div>
                    </a>
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i> 대화
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 업무 배정
                    </a>
                    <a href="#" class="btn btn-sm btn-warning">
                    	피드백을 작성
                    </a>
                    <i class="fas fa-trash-o"></i>                    
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                  직함 : 땡땡땡
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>박세리</b>
                      <a data-toggle="dropdown"><i class="fas fa-cog ml-3" style="font-size: 18px; color: darkgray;"></i>
                      <div class="dropdown-menu">
                            <button class="dropdown-item" >관리자 권한부여</button>
                        </div>
                      </a>
                      </h2>
                      <p class="text-muted text-sm"><b>부서: </b>개발팀</p>
                      <ul class="mb-0 text-muted" style="list-style-type: none; padding:0;">
                        <li class="small">로그인 4월 10일 15:07</li>
                        <li class="small">ABCabc@co.kr</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="/team/resources/dist/img/user1-128x128.jpg" alt="" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">                
                  <div class="text-right">
                                      
                    <a href="#" class="btn btn-sm bg-danger" data-toggle="dropdown" style="padding-top: 7px; height: 30px;">
                    <i class="fas fa-trash-alt"></i>
                    	<div class="dropdown-menu">
                            <button class="dropdown-item" >워크스페이스에서 삭제</button>
                        </div>
                    </a>
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i> 대화
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 업무 배정
                    </a>
                    <a href="#" class="btn btn-sm btn-warning">
                    	피드백을 작성
                    </a>
                    <i class="fas fa-trash-o"></i>                    
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-sm-6 col-md-3 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                  직함 : 땡땡땡
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>박세리</b>
                      <a data-toggle="dropdown"><i class="fas fa-cog ml-3" style="font-size: 18px; color: darkgray;"></i>
                      <div class="dropdown-menu">
                            <button class="dropdown-item" >관리자 권한부여</button>
                        </div>
                      </a>
                      </h2>
                      <p class="text-muted text-sm"><b>부서: </b>개발팀</p>
                      <ul class="mb-0 text-muted" style="list-style-type: none; padding:0;">
                        <li class="small">로그인 4월 10일 15:07</li>
                        <li class="small">ABCabc@co.kr</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="/team/resources/dist/img/user1-128x128.jpg" alt="" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">                
                  <div class="text-right">
                                      
                    <a href="#" class="btn btn-sm bg-danger" data-toggle="dropdown" style="padding-top: 7px; height: 30px;">
                    <i class="fas fa-trash-alt"></i>
                    	<div class="dropdown-menu">
                            <button class="dropdown-item" >워크스페이스에서 삭제</button>
                        </div>
                    </a>
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i> 대화
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 업무 배정
                    </a>
                    <a href="#" class="btn btn-sm btn-warning">
                    	피드백을 작성
                    </a>
                    <i class="fas fa-trash-o"></i>                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#">6</a></li>
              <li class="page-item"><a class="page-link" href="#">7</a></li>
              <li class="page-item"><a class="page-link" href="#">8</a></li>
            </ul>
          </nav>
        </div>
        <!-- /.card-footer -->
      </div>
      <!-- /.card -->
		</div>
		<!-- /.content-wrapper -->
		<%@include file="/WEB-INF/views/modules/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<%@include file="/WEB-INF/views/modules/common-js.jsp" %>
      
</body>

</html>
