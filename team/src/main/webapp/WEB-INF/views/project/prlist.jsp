<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>team</title>

  <%@include file="/WEB-INF/views/modules/common-css.jsp" %>
 <style>
	.page-item.active .page-link {
		z-index: 1;
		color: #fff;
		background-color: #6c757d;
		border-color: #6c757d;
	}
	.bg-info {
	    background-color: #6c757d!important;
	}
	.btn-primary {
	    color: #fff;
	    background-color: #363b3f;
	    border-color: #363b3f;
	    box-shadow: none;
	    margin: 0rem 0rem 0rem auto;
	}
	.selected{background-color:#2390f1!important} 
	.iconstyle { font-size: 50px; top: 10px;     color: rgba(0,0,0,.15); z-index: 0; }
	.rowstyle { margin: 0; flex: 1 1 auto; padding: 1.25rem;}
	.width-50px {width:50px}
	.margin-right-10px {margin-right: 10px;}


 </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

  <!-- Navbar -->
  <%@include file="/WEB-INF/views/modules/topbar.jsp" %>
  <!-- /.navbar -->

<div class="wrapper">

  <!-- Main Sidebar Container -->
  <%@include file="/WEB-INF/views/modules/sidebar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Project List</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Project</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">

      <!-- 최근 프로젝트  -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">최근 프로젝트</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
<!--             <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button> -->
          </div>
        </div>
		<div class="card-body" style="display: block;">
	      <div class="card-body pb-0">
	          <div class="row d-flex align-items-stretch">
				<div class="row">
		        </div>
	          </div>
	        </div>
        </div>
        <div class="card-footer" style="display: block;">
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
        </div>
      <!-- /.최근 프로젝트 끝 -->

      <!-- 내가 속한 프로젝트 -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">내가 속한 프로젝트</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
<!--             <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button> -->
          </div>
        </div>
		<div class="card-body" style="display: block;">
	      <div class="card-body pb-0">
	          <div class="row d-flex align-items-stretch">

		          <div class="col-md-3 col-sm-6 col-12">
		            <div class="info-box bg-info">
		
		              <div class="info-box-content">
		                <span class="info-box-text">Bookmarks</span>
		                <span class="info-box-number">41,410</span>
		
		                <div class="progress">
		                  <div class="progress-bar" style="width: 70%"></div>
		                </div>
		                <span class="progress-description">
		                  70% Increase in 30 Days
		                </span>
		              </div>
		              <!-- /.info-box-content -->
		            </div>
		            <!-- /.info-box -->
		          </div>
		          <!-- /.col -->
		          <div class="col-md-3 col-sm-6 col-12">
		            <div class="info-box bg-info">
		
		              <div class="info-box-content">
		                <span class="info-box-text">Bookmarks</span>
		                <span class="info-box-number">41,410</span>
		
		                <div class="progress">
		                  <div class="progress-bar" style="width: 70%"></div>
		                </div>
		                <span class="progress-description">
		                  70% Increase in 30 Days
		                </span>
		              </div>
		              <!-- /.info-box-content -->
		            </div>
		            <!-- /.info-box -->
		          </div>
		          <!-- /.col -->
		          <div class="col-md-3 col-sm-6 col-12">
		            <div class="info-box bg-info">
		
		              <div class="info-box-content">
		                <span class="info-box-text">Likes</span>
		                <span class="info-box-number">41,410</span>
		
		                <div class="progress">
		                  <div class="progress-bar" style="width: 70%"></div>
		                </div>
		                <span class="progress-description">
		                  70% Increase in 30 Days
		                </span>
		              </div>
		              <!-- /.info-box-content -->
		            </div>
		            <!-- /.info-box -->
		          </div>
		          <!-- /.col -->
		          <div class="col-md-3 col-sm-6 col-12">
		            <div class="info-box bg-info">
		
		              <div class="info-box-content">
		                <span class="info-box-text">Events</span>
		                <span class="info-box-number">41,410</span>
		
		                <div class="progress">
		                  <div class="progress-bar" style="width: 70%"></div>
		                </div>
		                <span class="progress-description">
		                  70% Increase in 30 Days
		                </span>
		              </div>
		              <!-- /.info-box-content -->
		            </div>
		            <!-- /.info-box -->
		          </div>
		          <!-- /.col -->
		          <div class="col-md-3 col-sm-6 col-12">
		            <div class="info-box bg-info">
		
		              <div class="info-box-content">
		                <span class="info-box-text">Comments</span>
		                <span class="info-box-number">41,410</span>
		
		                <div class="progress">
		                  <div class="progress-bar" style="width: 70%"></div>
		                </div>
		                <span class="progress-description">
		                  70% Increase in 30 Days
		                </span>
		              </div>
		              <!-- /.info-box-content -->
		            </div>
		            <!-- /.info-box -->
		          </div>
		          <!-- /.col -->
            
	          </div>
	        </div>
        </div>
		<button type="button" class="btn btn-block btn-outline-secondary btn-flat" data-toggle="modal" data-target="#modal-lg">
			<i class="fas fa-plus"></i> Add Project
		</button>
		
        <div class="card-footer" style="display: block;">
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
        </div>
      <!-- /.card -->
      
      <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
<%--             <jsp:include page="prwrite.jsp" /> --%>
            <div class="modal-header">
              <h4 class="modal-title">새 프로젝트</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form id="writeform" role="form" action="write.action" method="post">
	            <div class="modal-body">
	                <div class="card-body">
	                  <div class="form-group">
	                    <label for="exampleInputEmail1">제목</label>
	                    <input id="projectName" name="projectName" class="form-control" type="text" placeholder="제목을 입력해주세요">
	                  </div>
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">설명</label>
	                    <input id="content" name="content" class="form-control" type="text" placeholder="선택사항">
	                  </div>
                      <!-- radio -->
                      <div class="form-group">
                        <div class="custom-control custom-radio float-left" style="width:50%;">
                          <input id="publicRadio1" name="public" value="비공개" class="custom-control-input" type="radio" checked>
                          <label for="publicRadio1" class="custom-control-label">비공개
                          <br><p style="font-weight: 400; font-size: 0.9rem;">추가된 멤버만 엑세스 가능</p>
                          </label>
                        </div>
                        <div class="custom-control custom-radio float-left" style="width:50%;">
                          <input id="publicRadio2" name="public" value="공개"  class="custom-control-input" type="radio">
                          <label for="publicRadio2" class="custom-control-label">공개
                          <br><p style="font-weight: 400; font-size: 0.9rem;" >워크스페이스의 모든 멤버 엑세스 가능</p>
                          </label>
                        </div>
                      </div>
                      
                      <div>
                        <label for="exampleInputEmail1">프로젝트 멤버(선택사항)</label>
                      </div>
                      
                      <div>
	                    <label for="exampleInputEmail1">템플릿 선택</label>
                      </div>
	                   <div class="form-group" style="display: none;">
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template1" name="template" value="basics"  class="custom-control-input" type="radio" checked>
		                         <label for="template1" class="custom-control-label">기본</label>
		                      </div>
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template2" name="template" value="weekday"  class="custom-control-input" type="radio">
		                         <label for="template2" class="custom-control-label">평일</label>
		                      </div>
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template3" name="template" value="individual"  class="custom-control-input" type="radio">
		                         <label for="template3" class="custom-control-label">개인</label>
		                      </div>
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template4" name="template" value="department"  class="custom-control-input" type="radio">
		                         <label for="template4" class="custom-control-label">부서</label>
		                      </div>
		                      <div class="custom-control custom-radio float-left" style="width:20%">
		                        <input id="template5" name="template" value="khanban"  class="custom-control-input" type="radio">
		                         <label for="template5" class="custom-control-label">칸반(Kanban)</label>
		                      </div>
			            </div>
					
					  <div class="row">
				 		<label for="template1" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel" class="info-box-icon bg-info elevation-1 width-50px"><i   id="nametemplate" class="fas fa-border-none"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">기본</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
			
				 		<label for="template2" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-calendar-alt"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">평일</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
				 		<label for="template3" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-users"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">개인</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
				 		<label for="template4" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-briefcase"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">부서</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
				 		<label for="template5" class="overflow-hidden display-none margin-right-10px">
			            <div class="info-box">
			              <span id="chklabel" class="info-box-icon bg-info elevation-1 width-50px"><i class="fas fa-chalkboard"></i></span>
			              <div class="info-box-content">
			                <span class="info-box-text">칸반</span>
			              </div>
			              <!-- /.info-box-content -->
			            </div>
			            </label>
			            <!-- /.info-box -->
			
			          </div>
			          
			          
	                </div>
	                <!-- /.card-body -->
	            </div>

	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	              <button type="button" class="btn btn-primary" id="saveSubmit">프로젝트 만들기</button>
	            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->


    </section>
    <!-- /.content -->
    
  </div>
  <!-- /.content-wrapper -->
  
  
  <!-- footer -->
  <%@include file="/WEB-INF/views/modules/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

  <%@include file="/WEB-INF/views/modules/common-js.jsp" %>
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>


<script type="text/javascript">
$(function() {
	// .prop( propertyName ) : 속성값 가져옴
	// .prop( propertyName, value ) : 속성값 추가
	// parent 상위요소

	$('input[name=template]').on('click', function(){ 

		var input_id_check = $(this).attr("id");
		var label_for_check = $("label[for='"+ input_id_check + "']").attr("for");
		//var check_label = $($("label[for='"+ input_id_check + "']")).find( 'span:nth-child()' )
		var check_label = $($("label[for='"+ input_id_check + "']")).find( '#chklabel' )
		
		console.log(input_id_check);
		console.log(label_for_check);  
		console.log($(this).prop('checked'))
		
		if( $(this).prop('checked') ){
			if(  check_label ){
				$(".selected").removeClass("selected");
				check_label.addClass("selected");
			}
		}
	});

	
	$('#saveSubmit').on('click', function(event){
		if ($('#projectName').val() == '') {
			alert('제목을 입력해주세요')
			$('#projectName').focus();
			return;
		};
		
		$('#writeform').submit();

/* 		$.ajax({
			"url":"/team/project/plist/write",
			"method":"post",
			"data":values,
			"success":function(data, status, xhr) {
				// projectlist 뿌려주는 곳 따로 빼서 ajax로 처리할곳 
				$('인크루드할 projectlist div').load("/team/project/prlist")
			},
			"error":fucntion(xhr, status, err){
				alert("게시글 등록을 실패했습니다.");
			}
		}); */
	});
	
});
</script>
</body>

</html>
