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
				<a id="active" class="f_link" href="/team/workspace/workspace-member">멤버</a>&nbsp;&nbsp;
				<a class="f_link" href="/team/account/mypage">내 프로필</a>
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
				  <form action="WorkspaceMemberNameAndDepartmentSearch" method="post">
				  <input type="hidden" name="position" value="3">
                  <input class="form-control" type="search" name="name" placeholder="이름 또는 직함으로 검색하기" aria-label="Search" style="margin-right: -40px;">
                  </form>                   
                  </div>
				  <div class="form-group col-12 col-sm-6 col-md-3">
                          <p class="form-control">모든 멤버(${ ALLCountWorkspaceMember })</p>
                  </div>
                  
                  <form>
	                  <div class="form-group col-12 col-sm-6 col-md-3">
	                        <select class="form-control" id="asc">
	                          <option value="이름순">이름순</option>
	                          <option value="관리자/멤버">관리자/멤버</option>
	                        </select>
	                  </div>
	              </form>
	              
                  <div class="form-group col-12 col-sm-6 col-md-3">
                    <a id="invite_member" href="/team/workspace/invite-workspace?workspaceNo=${ workspaceNo }" class="form-control btn btn-sm btn-success">
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
                  	직함 : ${ member.position }${ workspaceNo }
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>${ member.name }</b><span class="badge bg-danger ml-3">관리자</span></h2>
                      <p class="text-muted text-sm"><b>부서 : </b>${ member.department }</p>
                      <ul class="mb-0 text-muted" style="list-style-type: none; padding:0;">
                      	<li class="small">연락처 : ${ member.phone }</li>
                        <li class="small">가입날짜 : ${ member.regdate }</li>
                        <li class="small">이메일 : ${ member.email }</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="/team/resources/dist/img/user2-160x160.jpg" alt="" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">                
                  <div class="text-right">
                  
                    <c:if test="${ workspacemember ne null }">
                    <a href="#" class="btn btn-sm bg-danger" data-toggle="dropdown" style="padding-top: 7px; height: 30px;">
                    <i class="fas fa-trash-alt"></i>
                    	<div class="dropdown-menu">
                            <button class="dropdown-item" >워크스페이스에서 삭제</button>
                        </div>
                    </a>
                    </c:if>
                    
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i> 대화
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 업무 배정
                    </a>
                    <a href="/team/feedback/list?email=${ member.email }" class="btn btn-sm btn-warning">
                    	피드백을 작성
                    </a>
                    <i class="fas fa-trash-o"></i>                    
                  </div>
                </div>
              </div>
            </div>
          
          <c:forEach var="member" items="${ members }">
            <div class="col-12 col-sm-6 col-md-3 d-flex align-items-stretch">
              <div class="card bg-light">
                <div class="card-header text-muted border-bottom-0">
                  직함 : ${ member.position }
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead">
                      	<b>${ member.name }</b>
                      	<c:if test="${ workspacemember ne null }">
                      		<a data-toggle="dropdown" href="#">
                      		<i class="fas fa-cog ml-3" style="font-size: 18px; color: darkgray;"></i>
                      		<div class="dropdown-menu">
                        	<button class="dropdown-item" id="changeworkspacemembertype" onclick="location.href='/team/workspace/changeworkspacemembertype?email=${ member.email }&workspaceNo=${ workspaceNo }'">관리자 권한부여</button>
                        	</div>
                       	</c:if>                        
                      		</a>
                      </h2>
                      <p class="text-muted text-sm"><b>부서 : </b>${ member.department }</p>
                      <ul class="mb-0 text-muted" style="list-style-type: none; padding:0;">
                      	<li class="small">연락처 : ${ member.phone }</li>
                        <li class="small">가입날짜 : ${ member.regdate }</li>
                        <li class="small">이메일 : ${ member.email }</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="/team/resources/dist/img/user2-160x160.jpg" alt="" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">                
                  <div class="text-right">
                    	<c:if test="${ workspacemember ne null }">
                    	<a href="#" class="btn btn-sm bg-danger" data-toggle="dropdown" style="padding-top: 7px; height: 30px;">
                    	<i class="fas fa-trash-alt"></i>
                    	<div class="dropdown-menu">
                            <button class="dropdown-item" id="deleteworkspacemember" onclick="location.href='/team/workspace/deleteworkspacemember?email=${ member.email }&workspaceNo=${ workspaceNo }'">워크스페이스에서 삭제</button>
                        </div>
                        </c:if>
                    	</a>
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i> 대화
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> 업무 배정
                    </a>
                    <a href="/team/feedback/list?email=${ member.email }" class="btn btn-sm btn-warning">
                    	피드백을 작성
                    </a>
                    <i class="fas fa-trash-o"></i>                    
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>
            
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

<script type="text/javascript">

			var workspaceNo = '${ workspaceNo }';
			
			console.log(workspaceNo);

			$(function() {
				var changeworkspacemembertype = $('#changeworkspacemembertype');
				changeworkspacemembertype.on('click', function(event) {
					if (current_workspace_no) {
						location.href = "/team/workspace/changeworkspacemembertype?email=${ member.email }&workspaceNo=${ workspaceNo }";
					} else {
						event.preventDefault();
						alert('선택된 워크스페이스가 없습니다.');
					}
				});
				
				var deleteworkspacemember = $('#deleteworkspacemember');
				deleteworkspacemember.on('click', function(event) {
					if (current_workspace_no) {
						location.href = "/team/workspace/deleteworkspacemember?email=${ member.email }&workspaceNo=${ workspaceNo }";
					} else {
						event.preventDefault();
						alert('선택된 워크스페이스가 없습니다.');
					}
				});
				
				$(document).on('change', "select#asc", function(event) {
					 
			    var asc = $(this).val();
			    if (asc == "이름순") {
				    	
			    		$.ajax({
							"url": "/team/workspace/asc1",
							"method" : "post",
							"data": { "workspaceNo": workspaceNo },
							"success": function(result, status, xhr) {
								
								if (result == 'success') {
								alert('이름순으로 변경되었습니다.');	
								
								} else {
								alert('유효한 정보가 없습니다.');
								
								}
							},			
											
							"error": function(xhr, status, data) {
							alert('오류가 발생했습니다.');
							
							} 
						});

				    	
				    } else if (asc == "관리자/멤버"){

				    	$.ajax({
							"url": "/team/workspace/asc2",
							"method" : "post",
							"data": { "workspaceNo": workspaceNo },
							"success": function(result, status, xhr) {
								
								if (result == 'success') {
								alert('관리자/멤버순으로 변경되었습니다.');	
								
								} else {
								alert('유효한 정보가 없습니다.');
								
								}
							},			
											
							"error": function(xhr, status, data) {
							alert('오류가 발생했습니다.');
							
							} 
						});

					    
					}
				    		
			    });  
				
			});			
</script>
