<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix='c'   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
	.seletProNo { margin: 15px 0 0; padding: .175rem .55rem; width: 120px; }
	.progress { width:100%}
	.progress-description {display:block; height: 100%;}
	.btn-default { background-color: #f3f3f3; border-color: #6c757d; color: #333;}
	.info-box .progress {margin:10px 0;} 
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

      <!-- 최근 프로젝트 -->
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
				
				<jsp:include page="list2.jsp" />

	          </div>
	        </div>
        </div>
		
        </div>
      <!-- /최근프로젝트 -->

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
	          <div class="row d-flex align-items-stretch list-container1">
				
				<jsp:include page="list.jsp" />

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
      <!-- /.내가속한프로젝트 -->
      
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

	/*$('.selectProNo2').on('click', function(){
		//var selectProNoName = ['상태없음', '진행중', '완료', '보류', '취소'];
		
		var projectNo = $(this).prev('.projectNo').attr('id');
		var proNo = $(this).val();
		console.log(projectNo); // 12345
		console.log(proNo)		// 상태없음, 진행중, 완료, 보류, 취소

		var option1 = $("<option value='"+projectNo+"'>"+ proNo+"</option>" )
		console.log(option1)
		$('.selectProNo2').append(option1);
		//처음에 추가
		$('.selectProNo2').prepend(option1);
 		$('.selectProNo2 option:first').remove();
		$('.selectProNo2').append('<option value="'+ projectNo +'">'+ proNo +'</option>');
		if ($('.selectProNo2').val() == '1'){ 
			for(var count = 0; count < proNo.size(); count++){
				var option2 = $("<option value='"+projectNo[count]+"'>"+ proNo+"</option>" )
				console.log(optopn2)
				$('.selectProNo2').append(option2);
			}
			$("<option value='"+projectNo+"'>"+ proNo+"</option>" ).css({'display':'none'});
			
		} 
		
 		for(var count = 0; count < changeItem.size(); count++){                
		                var option = $("<option>"+changeItem[count]+"</option>");
		                $('#select2').append(option);
		} 
		
	})*/

	$('.seletProNo').on('click', function(){
		var projectNo = $(this).prev('.projectNo').attr('id');
		console.log(projectNo)
		var proNo = $(this).val();
		console.log(proNo);

		$.ajax({
			"url":"/team/project/projectByproNo",
			"method":"post",
			"async":true,
			"data":{"projectNo" : projectNo,
				    "proNo":proNo },
			"success":function(resp, status, xhr){

			},
			"error" : function(xhr, status, err){
				console.log(err);
			}
		});
		
	});

	
/* 	$('#saveSubmit').on('click', function(event){

		console.log()
		if ($('#projectName').val() == '') {
			alert('제목을 입력해주세요')
			$('#projectName').focus();
			return;
		};
		
		$('#writeform').submit();

	}); */

	$('#saveSubmit').on('click', function(event){

		if ($('#projectName').val() == '') {
			alert('제목을 입력해주세요')
			$('#projectName').focus();
			return;
		};
		
		//$('#writeform').submit();

		var values = $('#writeform').serializeArray();
		//console.log(values); return;
		
		$.ajax({
			"url":"/team/project/write",
			"method":"post",
			"data":values,
			"success":function(data, status, xhr){
				$('#modal-lg').modal('hide');
				//$('.list-container1').load("/team/project/prlist");
				//$('.content').html("");
			},
			"error" : function(xhr, status, err){
				console.log(err)
			}
		});
	});


	
	
});
</script>
</body>

</html>

