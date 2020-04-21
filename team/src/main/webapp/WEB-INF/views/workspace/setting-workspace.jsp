<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>team</title>
  
  <%@include file="/WEB-INF/views/modules/common-css.jsp" %>
  
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <%@include file="/WEB-INF/views/modules/topbar.jsp" %>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <%@include file="/WEB-INF/views/modules/sidebar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>○○○ 워크스페이스</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/home">Home</a></li>
              <li class="breadcrumb-item"><a href="#">workspace</a></li>
              <li class="breadcrumb-item active">setting-workspace</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
                    
          <!-- column -->
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">워크스페이스 설정</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div id="accordion">
                  <!-- we are adding the .class so bootstrap.js collapse plugin detects it -->
                  <div class="card card-primary">
                    <div class="card-header" style="background-color: #17a2b8;">
                      <h4 class="card-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">일반 설정</a>
                      </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse show">
                      <div class="card-body">
                        <p>워크스페이스 이름</p>   
                        <form action="setting-workspace" method="post">     
                        <input type="hidden" name="workspaceNo" value="${ workspace.workspaceNo }">                
                        <div class="input-group input-group-sm mb-3">
		                  <input type="text" name="workspaceName" class="form-control" value="${ workspace.workspaceName }">
		                  <span class="input-group-append">
		                    <button type="submit" class="btn btn-info btn-flat">변경사항 저장</button>
		                  </span>
		                </div>
		                </form>
                      </div>
                    </div>
                  </div>
                  <div class="card card-danger">
                    <div class="card-header" style="background-color: #17a2b8;">
                      <h4 class="card-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">이메일로 업무 작성</a>
                      </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                      <div class="card-body">
                        <p>아래 이메일 주소로 이메일을 보내 본인의 다이렉트 업무에 업무를 자동으로 작성합니다.</p>
                                                
                        <div class="input-group input-group-sm mb-3">
		                  <input type="text" class="form-control">
		                  <span class="input-group-append">
		                    <button type="button" class="btn btn-info btn-flat">이메일로 복사</button>
		                  </span>
		                </div>
                
                	  <ul>
                        <li>이메일 제목은 업무 제목이 됩니다.</li>
                        <li>이메일 내용은 업무 설명이 됩니다.</li>
                        <li>첨부 파일은 업무 파일로 추가됩니다.</li>
                        <li>받는 사람: 수신인은 해당 업무에 배정됩니다.</li>
                        <li>참조: 수신인은 해당 업무 팔로워가 됩니다.</li>
                      </ul>
                
                      </div>
                    </div>
                  </div>
                  <div class="card card-success">
                    <div class="card-header" style="background-color: #17a2b8;">
                      <h4 class="card-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">워크스페이스 삭제</a>
                      </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                      <div class="card-body">
                        <p>워크스페이스를 삭제하면 모든 팀원이 워크스페이스에 접속할 수 없게됩니다. </br>삭제 버튼을 클릭하면, 만약의 경우에 대비하여 워크스페이스를 복원할 수 있도록 14일의 기간이 주어집니다.</p>
                        <form action="delete-workspace" method="post">     
                        <input type="hidden" name="workspaceNo" value="${ workspace.workspaceNo }"> 
                        <button type="submit" class="btn btn-block btn-danger btn-lg">이 워크스페이스 삭제하기</button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
            <!-- /.card -->
     
          </div>
          <!--/.col  -->
          
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
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

<script type="text/javascript">
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>

  <%@include file="/WEB-INF/views/modules/common-js.jsp" %>
</body>
</html>
