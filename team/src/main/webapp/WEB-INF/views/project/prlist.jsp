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
	.content-wrapper {background: rgb(236, 236, 236);}
	.page-item.active .page-link {z-index: 1;color: #fff;background-color: #6c757d;border-color: #6c757d;}
 	.bg-info { background-color: #f4f6f9!important; }
 	.bg-info, .bg-info>a { color: #343a40!important; }
 	.info-box .progress .progress-bar { background-color: #527aa2;}
	.info-box .progress { background-color: rgba(0,0,0,.125); height: 6px; border-radius: 10px;}
	.info-box-content{max-width: 100%;}
	.btn-primary {   color: #fff;   background-color: #363b3f;   border-color: #363b3f;   box-shadow: none;   margin: 0rem 0rem 0rem auto;	}
	.btn-default {   background-color: #ffffff;  border-color: #b9b9b9;  color: #343a40;}
	.selected1{background-color:#ffbf00!important}
	.selected2{background-color:#ffbf00!important}  
	.seletProNo { margin: 15px 0 0; padding: .145rem .35rem; width: 100px; font-size: 14px;}
	.iconstyle { font-size: 50px; top: 10px;     color: rgba(0,0,0,.15); z-index: 0; }
	.rowstyle { margin: 0; flex: 1 1 auto; padding: 1.25rem;}
	.width-50px {width:50px}
	.margin-right-10px {margin-right: 10px;}
	.float_left2 { float: left; margin-right:10px; }
	.progress { width:100%}
	.progress-description {display:block; height: 100%;}
	.info-box .progress {margin:10px 0;} 
	
	.mem {	border: 1px #dedede;   background-color: #dedede;   border-radius: 30rem;   width: 115px; height: 32px;    text-align: center;   margin-left: 2px; display: inline-table;}
	.mem_img {	width: 30%; height:32px;	border-radius: 30rem;	border: 1px solid;}
	.mem_name {width: 50%;}
	.mem_rm {width: 50%;height: 100%;}
	.mem *, ._mem *, .t * {display:inline-block;}
	._mem { height:50px;border:1px solid white;border-radius:.20rem;padding:5px; }
	._mem_img {width:20%;}
	._mem_name {width:60%;}
	._mem_icon {width:20%;}
	a { color: #343a40;}
	a:hover { color: #527aa2;}
	._mem_icon_default {display: none;}
	._mem_a_none { pointer-events: none; cursor : default; }

	
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
	          <div class="row d-flex align-items-stretch list-container2">
				
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
      
      <div class="modal fade" id="modal-detail2">
        <div class="modal-dialog modal-lg">
          <div id="projectDetailModal-container" class="modal-content">
             <jsp:include page="prdetail.jsp" />
		  </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
            
<%--       <div class="modal fade" id="modal-detail3">
        <div class="modal-dialog modal-lg">
          <div id="detail-id" class="modal-content">
             <jsp:include page="prdetail2.jsp" />
		  </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal --> --%>


    </section>
    <!-- /.content -->
   <form id="detail-form" action="detail.action" method="get">
  	<input type="hidden" id="projectNo" name="projectNo">
  </form>
<!--   <form id="detail-form2" action="detail2.action" method="get">
  	<input type="hidden" id="projectNo" name="projectNo">
  </form> -->
  <form id="task-form" action="task.action" method="get">
  	<input type="hidden" id="projectNo" name="projectNo">
  </form>
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
	
	///////////////////
		
		// 멤버 추가 작은모달 이벤트
		$(document).on("click", "._mem", function() {
			var name = $(this).attr("data-name");
			var email = $(this).attr("data-email");
			
			if ($(this).children().hasClass("_mem_icon_default")) {
				$(this).children().removeClass("_mem_icon_default");
				
				$("#mem").html($("#mem").html() + 
					'<div class="float_left mem" data-name="' + name +'" data-email="' + email + '">' +
						//'<img class="mem_img"></img>' +
						'<div class="mem_name" >'+ name + '</div>' +
						'<a href="#" class="mem_rm" aria-hidden="true">&times;</a>' +
						'<input type="hidden" name="email" value="' + email + '"/>' + 
					'</div>'	
				);
				
			} else {
				$(this).children("._mem_icon").addClass("_mem_icon_default");
				$("#mem div[data-email='" + email + "']").remove();
			}
		});
		
		// 멤버 추가 츼소 큰모달 이벤트
		$(document).on("click", ".mem_rm", function() {
			var name = $(this).parent().attr("data-name");
			var email = $(this).parent().attr("data-email");
			
			$(this).parent().remove();
			$("#workspace_mem div[data-email='" + email +"']").children("._mem_icon").addClass("_mem_icon_default");
		});
		
		
		// 멤버 검색 작은모달 ajax
		$("#_mem_input").keyup(function() {
			
			var selected = "";
			for (i = 0; i < $(".mem").length; i++) 
				selected += $(".mem:eq("+ i +")").attr("data-email") + ":";
				
			$.ajax({
				url : "/team/project/getProjectMember",
				method : "get",
				data : {"str" : $(this).val(),
						"selected" : selected,
						"email" : "${loginuser.email}"
				},
				success : function(resp, status, xhr) {
					$("#workspace_mem").html("");
					$("#workspace_mem").html(resp);
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		});

		
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

		///////////////////

	// 템플릿 선택
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
	
	if($('input[name=templateNo]').val() == "basics") { $('input[name=templateNo]').val("1") }

	$('input[name=templateNo]').on('click', function(){	
		if( $(this).val() == "basics"){ $(this).val("1") }
		else if($(this).val() == "weekday"){ $(this).val("2") }
		else if($(this).val() == "individual"){ $(this).val("3") }
		else if($(this).val() == "department"){ $(this).val("4") }
		else if($(this).val() == "khanban"){ $(this).val("5") }
		console.log($(this).val())
	});
	// -- 템플릿 선택 끝
					
	// 비공개 공개 선택
	$('input[name=proPublic]').on('click', function(){
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
	// -- 비공개 공개 선택


	// 프로젝트 진행상황 구분 list에서 변경하기
	$(document).on('click', '.seletProNo', function(){
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
	// -- 프로젝트 진행상황 구분 list에서 변경하기 끝

	// write-form-submit 
	$(document).on('click', '#saveSubmit', function(event){
		if ($('#projectName').val() == '') {
			alert('제목을 입력해주세요')
			$('#projectName').focus();
			return;
		};

		var values = $('#writeform').serializeArray();

		//console.log(values); return;
		$.ajax({
			"url":"/team/project/write",
			"method":"post",
			"data":values,
			"success":function(data, status, xhr){
				$('#modal-lg').modal('hide');
				

				// form 초기화
				$('form').each(function() {
				    this.reset();
				});
				var t_input_value_check = $("input[value=basics]");
				var t_check_label = $($("label[for='"+ t_input_value_check + "']")).find( '#chklabel2' );
				if( t_check_label ){
					$(".selected2").removeClass("selected2");
					t_check_label.addClass("selected2");
				}
				var p_input_value_check = $("input[value=proPublic]");
				var p_check_label = $($("label[for='"+ p_input_value_check + "']")).find( '#chklabel2' );
				if( p_check_label ){
					$(".selected1").removeClass("selected1");
					p_check_label.addClass("selected1");
				}
				//$("#mem2").parent().remove();
				$("#mem2").html(
	              		'<div class="float_left mem2" data-name="${loginuser.name }" data-email="${loginuser.email }">'+
						'<div class="mem_name2" >${loginuser.email }</div>'+
						'<input type="hidden" name="email" value="${loginuser.email }"/>'+
						'</div>'
						)
				
				// list
				$('.list-container1').load('/team/project/list');
				$('.list-container2').load('/team/project/list2');
				
			},
			"error" : function(xhr, status, err){
				console.log(err);
			}
		});
	});
	// -- write-form-submit 끝
	
	$(document).on("click", ".task" , function(event) {
		var projectNo = $(this).attr('data-projectNo');
		$('#task-form #projectNo').val(projectNo);
		console.log(projectNo);
		
		$("#task-form").submit();
	});

	
	// detail
 	$(document).on("click", ".to-detail", function() { //$('.to-detail').on('click', function(event) {
 		
 		var projectNo = $(this).attr('data-projectNo');
		$('#detail-form #projectNo').val(projectNo);
		
		console.log(projectNo);
		
		//$('#detail-form #projectNo').val(projectNo);

		//$('#detail-form').submit();

		$.ajax({
			"url":"/team/project/detail",
			"method":"get",
			"async" : true,
			"data" : {	"projectNo" : projectNo },
			"dataType" : "json", // dataType : 응답 컨텐츠의 종류 지정			
			"success" : function(data, status, xhr) {

				var projectName = data.projectName;
				var content = data.content;
				var projectNo = data.projectNo;
				var managerEmail = data.managerEmail;
				var proPublic = data.proPublic;
				//var projectMembers = data.projectMembers;
				var workspaceNo = data.workspaceNo;
				var templateNo = data.templateNo;
				var proNo = data.proNo;

				/////////// 시작 마감 완료
				var startdate_t = data.startdate;
				var startdate_t2 = new Date(startdate_t);
				var deadline_t = data.deadline;
				var deadline_t2 = new Date(deadline_t);
				var enddate_t = data.enddate;
				var enddate_t2 = new Date(enddate_t);
				
				function getFormatDate1(startdate_t2){
				    var year = startdate_t2.getFullYear();              //yyyy
				    var month = (1 + startdate_t2.getMonth());          //M
				   		 month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				    var day = startdate_t2.getDate();                   //d
				    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
				    return  year + '-' + month + '-' + day;
				}
				function getFormatDate2(deadline_t2){
				    var year = deadline_t2.getFullYear();              //yyyy
				    var month = (1 + deadline_t2.getMonth());          //M
				   		 month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				    var day = deadline_t2.getDate();                   //d
				    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
				    return  year + '-' + month + '-' + day;
				}
				function getFormatDate3(enddate_t2){
				    var year = enddate_t2.getFullYear();              //yyyy
				    var month = (1 + enddate_t2.getMonth());          //M
				   		 month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
				    var day = enddate_t2.getDate();                   //d
				    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
				    return  year + '-' + month + '-' + day;
				}
				startdate_t2 = getFormatDate1(startdate_t2);
				deadline_t2 = getFormatDate2(deadline_t2);
				enddate_t2 = getFormatDate3(enddate_t2);

				var startdate = document.querySelector('#startdate');
				var deadline = document.querySelector('#deadline');
				var enddate = document.querySelector('#enddate');
				startdate.value = startdate_t2;
				deadline.value = deadline_t2;
				enddate.value = enddate_t2;



				//console.log(proPublic)
				if (proPublic == "false"){ proPublic.val('0')} else if (proPublic == "true"){ proPublic.val('1')} 
				//console.log(proPublic)
              	if( proPublic == "0"){
					$("#publicDiv").html(
					'<div class="custom-control custom-radio float-left" style="width:50%;">'+
		               '<input id="depublicRadio1" name="proPublic" value="false" class="custom-control-input" type="radio" checked>'+
		                '<label for="depublicRadio1" class="custom-control-label">비공개'+
		                '<br><p style="font-weight: 400; font-size: 0.9rem;">추가된 멤버만 엑세스 가능</p>'+
		                '</label>'+
		              '</div>'+
		              '<div class="custom-control custom-radio float-left" style="width:50%;">'+
		                '<input id="depublicRadio2" name="proPublic" value="true"  class="custom-control-input" type="radio">'+
		                '<label for="depublicRadio2" class="custom-control-label">공개'+
		              '<br><p style="font-weight: 400; font-size: 0.9rem;" >워크스페이스의 모든 멤버 엑세스 가능</p>'+
		                '</label>'+
		              '</div>'
					);
              	} else if( proPublic == "1"){
					$("#publicDiv").html(
					'<div class="custom-control custom-radio float-left" style="width:50%;">'+
		               '<input id="depublicRadio1" name="proPublic" value="false" class="custom-control-input" type="radio">'+
		                '<label for="depublicRadio1" class="custom-control-label">비공개'+
		                '<br><p style="font-weight: 400; font-size: 0.9rem;">추가된 멤버만 엑세스 가능</p>'+
		                '</label>'+
		              '</div>'+
		              '<div class="custom-control custom-radio float-left" style="width:50%;">'+
		                '<input id="depublicRadio2" name="proPublic" value="true"  class="custom-control-input" type="radio" checked>'+
		                '<label for="depublicRadio2" class="custom-control-label">공개'+
		              '<br><p style="font-weight: 400; font-size: 0.9rem;" >워크스페이스의 모든 멤버 엑세스 가능</p>'+
		                '</label>'+
		              '</div>'
					);
              	}
              	if (data.proPublic == "0"){ data.proPublic = "false";} else if (data.proPublic == "1"){ data.proPublic ="true";} 

              	
              	
				//$('#detail-form').submit();
				
				$('#de_projectName').val(projectName);
				$('#de_content').val(content);
				$('#de_projectNo').val(projectNo);
				$('#de_workspaceNo').val(workspaceNo);
				$('#de_templateNo').val(templateNo);
				$('#de_proNo').val(proNo);
				
				
				
				$('#de_managerEmail').val(managerEmail);
				//$('#de_projectMembers').val(projectMembers);
				$('#modal-detail2').modal('show');
				// 비공개 공개 선택
				$('input[name=proPublic]').on('click', function(){
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


				var projectMembers = data.projectMembers;
				var member = data.member;
				//console.log(member[0].name)
				//console.log(projectMembers[0].email, member[0].name)
				//console.log(projectMembers[1].email)
				//console.log(projectMembers[2].email)
				//console.log(projectMembers.length)


				// 처음에 DB에 멤버가 있다면 나타내기
				$("._mem2 > ._mem_icon2").addClass("_mem_icon_default2");
					$("._mem2").css({ 'pointer-events': '', 'cursor' : '' });
					$("#mem2 > div").remove();
				for ( i = 0; i < projectMembers.length; i++){				
					if(member[i].email == managerEmail ){
						$("#mem2").html($("#mem2").html() + 
							'<div class="float_left mem2" data-name="' + member[i].name +'" data-email="' + projectMembers[i].email + '">' +
								'<div class="mem_name2" >'+ member[i].name + '</div>' +
								'<input type="hidden" name="email" value="' + projectMembers[i].email + '"/>' + 
							'</div>'	
						);
						$("._mem2[data-name="+ member[i].name +"]").children().removeClass("_mem_icon_default2")
						$("._mem2[data-name="+ member[i].name +"]").css({ 'pointer-events': 'none', 'cursor' : 'default' })
						
					}else {
						$("#mem2").html($("#mem2").html() + 
							'<div class="float_left mem2" data-name="' + member[i].name +'" data-email="' + projectMembers[i].email + '">' +
								'<div class="mem_name2" >'+ member[i].name + '</div>' +
								'<a href="#" class="mem_rm2" aria-hidden="true">&times;</a>' +
								'<input type="hidden" name="email" value="' + projectMembers[i].email + '"/>' + 
							'</div>'	
						);
						$("._mem2[data-name="+ member[i].name +"]").children().removeClass("_mem_icon_default2")
						$("._mem2[data-name="+ member[i].name +"]").css({ 'pointer-events': 'none', 'cursor' : 'default' })
					}
				}
				
				$("#add_mem2").click(function() {
					$("#memberAddModal2").modal();
				});


				//프로젝트 삭제
				var deleted = data.deleted;
				$('#de_deleted').val(deleted);
				
				$(document).on("click", ".projectDeleted", function(){
					if (confirm(" 프로젝트를 삭제합니다. 삭제하시겠습니까?") == false){ return; } //취소하면 안넘어감
					
					var deleted_val = $("#de_deleted");
					if (deleted_val.val() == "false"){ deleted_val.val('1')} else if (deleted_val.val() == "true"){ deleted_val.val('0')}
					console.log(deleted_val.val())
					deleted = deleted_val.val();
					console.log(deleted);
					
					$.ajax({
						url : "/team/project/deleted",
						method : "post",
						data : {"projectNo" : projectNo,
								"deleted" : deleted },
						success : function(resp, status, xhr) {

							$('.list-container1').load('/team/project/list');
							$('.list-container2').load('/team/project/list2');
							$('#modal-detail2').modal('hide');
							//$('#modal-detail2').modal('show');
						},
						error : function(xhr, status, err) {
							console.log(err);
						}
					});
					
				});

				// 멤버 검색 작은모달 ajax
				$("#_mem_input2").keyup(function() {
					
					var selected = "";
					for (i = 0; i < $(".mem2").length; i++) 
						selected += $(".mem2:eq("+ i +")").attr("data-email") + ":";

						
					$.ajax({
						url : "/team/project/getProjectMember",
						method : "get",
						data : {"str" : $(this).val(),
								"selected" : selected,
								"email" : "${loginuser.email}"
						},
						success : function(resp, status, xhr) {
							//$('#modal-detail2').load('/team/project/detail');
							
							$("#workspace_mem2").html("");
							$("#workspace_mem2").html(resp);
						},
						error : function(xhr, status, err) {
							console.log(err);
						}
					});

					$('#modal-detail2').modal('show');

					$('.list-container1').load('/team/project/list');
					$('.list-container2').load('/team/project/list2');
				});

				$("._mem2, .task2").hover(function() {
					$(this).css({"background-color" : "#dedede", "border" : "1px solid #dedede"});
				}, function() {
					$(this).css({"background-color" : "white", "border" : "1px solid white"});
				});
				
				$("#addFooter2").hover(function() {
					$(this).css("background-color", "#148192");
				}, function() {
					$(this).css("background-color", "#17a2b8");
				});
								
				// 처음에 DB에 멤버가 있다면 나타내기
				$("._mem2 > ._mem_icon2").addClass("_mem_icon_default2");
					$("._mem2").css({ 'pointer-events': '', 'cursor' : '' });
					$("#mem2 > div").remove();
				for ( i = 0; i < projectMembers.length; i++){				
					if(member[i].email == managerEmail ){
						$("#mem2").html($("#mem2").html() + 
							'<div class="float_left mem2" data-name="' + member[i].name +'" data-email="' + projectMembers[i].email + '">' +
								'<div class="mem_name2" >'+ member[i].name + '</div>' +
								'<input type="hidden" name="email" value="' + projectMembers[i].email + '"/>' + 
							'</div>'	
						);
						$("._mem2[data-name="+ member[i].name +"]").children().removeClass("_mem_icon_default2")
						$("._mem2[data-name="+ member[i].name +"]").css({ 'pointer-events': 'none', 'cursor' : 'default' })
						
					}else {
						$("#mem2").html($("#mem2").html() + 
							'<div class="float_left mem2" data-name="' + member[i].name +'" data-email="' + projectMembers[i].email + '">' +
								'<div class="mem_name2" >'+ member[i].name + '</div>' +
								'<a href="#" class="mem_rm2" aria-hidden="true">&times;</a>' +
								'<input type="hidden" name="email" value="' + projectMembers[i].email + '"/>' + 
							'</div>'	
						);
						$("._mem2[data-name="+ member[i].name +"]").children().removeClass("_mem_icon_default2")
						$("._mem2[data-name="+ member[i].name +"]").css({ 'pointer-events': 'none', 'cursor' : 'default' })
					}
				}
				
				// 멤버 추가 작은모달 이벤트
				$(document).on("click", "._mem2", function() {
					var name = $(this).attr("data-name");
					var email = $(this).attr("data-email");
					
					if ($(this).children().hasClass("_mem_icon_default2")) {
						$(this).children().removeClass("_mem_icon_default2");

						
						$("#mem2").html($("#mem2").html() + 
							'<div class="float_left mem2" data-name="' + name +'" data-email="' + email + '">' +
								'<div class="mem_name2" >'+ name + '</div>' +
								'<a href="#" class="mem_rm2" aria-hidden="true">&times;</a>' +
								'<input type="hidden" name="email" value="' + email + '"/>' + 
							'</div>'	
						);
						//$("._mem2 div[data-email='" + email + "']").css({ 'pointer-events': 'none', 'cursor' : 'default' })
						$("._mem2 div[data-email='" + email + "']").addClass("_mem_a_none");
						
					} else {
						$(this).children("._mem_icon2").addClass("_mem_icon_default2");
						
						//$("._mem2 div[data-email='" + email + "']").css({ 'pointer-events': '', 'cursor' : '' })
						$("._mem2 div[data-email='" + email + "']").removeClass("_mem_a_none");
						$("#mem2 div[data-email='" + email + "']").remove();
					}

					console.log(projectNo, email);// return;

					$.ajax({
						"url":"/team/project/addProjectMember",
						"method":"post",
						"data":{"projectNo" : projectNo,
								"email" : email},
						"success":function(data, status, xhr){

						},
						"error" : function(xhr, status, err){
							console.log(err);
						}
					});
					
					$('#modal-detail2').modal('show');
					$('.list-container1').load('/team/project/list');
					$('.list-container2').load('/team/project/list2');
					$("._mem2 div[data-email='" + email + "']").css({ 'pointer-events': 'none', 'cursor' : 'default' })
				
				});


				
				// 멤버 추가 츼소 큰모달 이벤트
				$(document).on("click", ".mem_rm2", function() {
					var name = $(this).parent().attr("data-name");
					var email = $(this).parent().attr("data-email");
					
					$(this).parent().remove();
					$("#workspace_mem2 div[data-email='" + email +"']").children("._mem_icon2").addClass("_mem_icon_default2");
					$("._mem2 div[data-email='" + email + "']").css({ 'pointer-events': '', 'cursor' : '' })

					$.ajax({
						url : "/team/project/projectMemberDeleted",
						method : "post",
						data : {"projectNo" : projectNo,
								"email" : email },
						success : function(resp, status, xhr) {						
								
								$("._mem2 div[data-email='" + email + "']").css({ 'pointer-events': '', 'cursor' : '' })
							
						},
						error : function(xhr, status, err) {
							console.log(err);
						}
					});
					$('#modal-detail2').load('/team/project/detail');
					$('.list-container1').load('/team/project/list');
					$('.list-container2').load('/team/project/list2');
					
				});

				
				$("#projectDetailModal-container").on('hidden.bs.modal', function(e){

					$("._mem2 > ._mem_icon2").addClass("_mem_icon_default2");
					$("._mem2").css({ 'pointer-events': '', 'cursor' : '' });
					$("#mem2 > div").remove();
					$('.list-container1').load('/team/project/list');
					$('.list-container2').load('/team/project/list2');
					$('#modal-detail2').load('/team/project/detail');

					e.stopImmediatePropagation();

				});

				//$('#modal-detail2').load('/team/project/detail');
				$('.list-container1').load('/team/project/list');
				$('.list-container2').load('/team/project/list2');
				

			},
			"error":function(xhr, status, err){
				console.log(err)
			}


		});

		

		$('#saveSubmit2').on('click', function(event){

			var values2 = $('#detail-form2').serializeArray();
			
			$.ajax({
				"url": "/team/project/detailUpdate",
				"method": "post",
				"data": values2, // JSON Object -> JSON String
				//"contentType": "application/json", // put method 처리를 위해 설정				
				"success": function(data, status, xhr) {
					$('#modal-detail2').modal('hide');
					console.log(values2)
					// list
					$('.list-container1').load('/team/project/list');
					$('.list-container2').load('/team/project/list2');
				},
				"error" : function(xhr, status, err){
					console.log(err)
				}
			});
		});

		

	}); 


	
	// 프로젝트 CSV 파일로 내보내기
	var checked = false;
	var download = false;
	$(document).on("click", "#projectDownloadBtn", function() {
		
		console.log($("#de_projectNo").val());
		
		var target = $(this);
		if (checked == false) {
			$.ajax({
				url : "/team/project/download-check",
				data : {"projectNo" : $("#de_projectNo").val()},
				success : function(data, status, xhr) {
					if (data == "success") download = true;
					else download = false;
					checked = true;
					target.click();
				}
			});
		}
		else {
			if (download) $("#download").submit();
			else alert("프로젝트에 업무가 등록되어 있지 않습니다.");
			checked = false;
		}
	});

});
</script>
</body>

</html>

