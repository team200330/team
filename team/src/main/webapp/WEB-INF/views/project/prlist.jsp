<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>team</title>

  <%@include file="/WEB-INF/views/modules/common-css.jsp" %>
 <style>
	.page-item.active .page-link {z-index: 1;color: #fff;background-color: #6c757d;border-color: #6c757d;}
	.bg-info {  background-color: #6c757d!important;}
	.btn-primary {   color: #fff;   background-color: #363b3f;   border-color: #363b3f;   box-shadow: none;   margin: 0rem 0rem 0rem auto;	}
	.selected1{background-color:#2390f1!important}
	.selected2{background-color:#2390f1!important}  
	.info-box-content{max-width: 100%;}
	.iconstyle { font-size: 50px; top: 10px;     color: rgba(0,0,0,.15); z-index: 0; }
	.rowstyle { margin: 0; flex: 1 1 auto; padding: 1.25rem;}
	.width-50px {width:50px}
	.margin-right-10px {margin-right: 10px;}
	.float_left2 { float: left; margin-right:10px; }
	.mem {	border: 1px #dedede;   background-color: #dedede;   border-radius: 30rem;   width: 115px; height: 32px;    text-align: center;   margin-top: 2px;}
	.mem_img {	width: 30%; height:32px;	border-radius: 30rem;	border: 1px solid;}
	.mem_name {width: 50%;}
	.mem_rm {width: 20%;}
	.mem *, ._mem *, .t * {display:inline-block;float:left;}
	._mem { height:50px;border:1px solid white;border-radius:.20rem;padding:5px; }
	._mem_img {width:20%;}
	._mem_name {width:60%;}
	._mem_icon {width:20%;}

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

			<c:forEach items="${ project }" var="project">
		          <div class="col-md-3 col-sm-6 col-12">
		            <div class="info-box bg-info">
		
		              <div class="info-box-content">
		                <span class="info-box-text">${ project.projectName }</span>
		                <c:if test="${ project.content == null}"><span class="progress-description">&nbsp;&nbsp;&nbsp;</span></c:if>
		                <c:if test="${ project.content eq project.content }"><span class="progress-description">${ project.content }</span></c:if>
		                <span class="info-box-number">
		                	<select name="proNo">
		                		<option>
				                	<c:if test="${project.proNo eq '1' }">상태없음</c:if>
					                <c:if test="${project.proNo eq '2' }">진행중</c:if>
					                <c:if test="${project.proNo eq '3' }">완료</c:if>
					                <c:if test="${project.proNo eq '4' }">보류</c:if>
					                <c:if test="${project.proNo eq '5' }">취소</c:if>
				                </option>
		                		<option value="1">상태없음 </option>
		                		<option value="2">진행중 </option>
		                		<option value="3">완료 </option>
		                		<option value="4">보류 </option>
		                		<option value="5">취소 </option>
		                	</select>
					    </span>
		                <div class="progress">
		                  <div class="progress-bar" style="width: 70%"></div>
		                </div>
		              </div>
		              <!-- /.info-box-content -->
		            </div>
		            <!-- /.info-box -->
		          </div>
		          <!-- /.col -->
			</c:forEach>
			
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
             <jsp:include page="prwrite.jsp" />
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
	
	$("#add_mem").click(function() {
		$("#memberAddModal").modal();
	});
	$("._mem, .task").hover(function() {
		$(this).css({"background-color" : "#dedede", "border" : "1px solid #dedede"});
	}, function() {
		$(this).css({"background-color" : "white", "border" : "1px solid white"});
	});
	
	$("#addFooter").hover(function() {
		$(this).css("background-color", "#148192");
	}, function() {
		$(this).css("background-color", "#17a2b8");
	});
	$('input[name=templateNo]').on('click', function(){ 

		var input_id_check = $(this).attr("id");
		var label_for_check = $("label[for='"+ input_id_check + "']").attr("for");
		var check_label = $($("label[for='"+ input_id_check + "']")).find( '#chklabel1' )
		
/* 		console.log(input_id_check);
		console.log(label_for_check);  
		console.log($(this).prop('checked')) */
		
		if( $(this).prop('checked') ){
			if(  check_label ){
				$(".selected1").removeClass("selected1");
				check_label.addClass("selected1");
			}
		}
	});

	$('input[name=isPublic]').on('click', function(){
		var input_id_check =  $(this).attr("id")
		var label_for_check = $("label[for='"+ input_id_check+"']").attr("for")
		var check_label = $($("label[for='"+ input_id_check + "']")).find( '#chklabel2' )

		if( $(this).prop('checked') ){
			if( check_label ){
				$(".selected2").removeClass("selected2");
				check_label.addClass("selected2");
			}
		}
		
	});

	$('input[name=templateNo]').on('click', function(){
		
		if( $(this).val() == "basics"){ $(this).val("1") }
		else if($(this).val() == "weekday"){ $(this).val("2") }
		else if($(this).val() == "individual"){ $(this).val("3") }
		else if($(this).val() == "department"){ $(this).val("4") }
		else if($(this).val() == "khanban"){ $(this).val("5") }
		console.log($(this).val())
	});
	
	
	$('#saveSubmit').on('click', function(event){

		console.log()
		if ($('#projectName').val() == '') {
			alert('제목을 입력해주세요')
			$('#projectName').focus();
			return;
		};
		
		$('#writeform').submit();

	});

/* 	$.ajax({
		"url" : "/project-list",
		"dataType":"json",
		"data":"param",
		"success":function(data){
			if (data.result.length > 0) {
				$('select[name=proNo]').find('option').remove()
				for( var _idx = 0 ; _idx < data.result.length ; _idx++ ) {
					$('select[name=proNo]').append("<option value'"+data.result[_idx].CNT+"'>" + data.result[_idx].CNT_NM + '</option>');
				}
			} else {
				$('select[name=proNo]').find('option').remove()
				$( 'select[name=proNo]' ).append ( "<option value=''>선택</option>" );
			}
		}
	});
	
	$.ajax({
		"url":"/project-proNo",
		"method":"put",
		"data": JSON.stringify(data),
		"contentType" : "application/json"
		"success":function(result, status, xhr) {
			// projectlist 뿌려주는 곳 따로 빼서 ajax로 처리할곳 
			// $('인크루드할 projectlist div').load("/team/project/prlist")
			$('input[name=proNo]').val(project.proNo);
		},
		"error":fucntion(xhr, status, err){
			alert(err);
		}
	});  */
	
});
</script>
</body>

</html>
