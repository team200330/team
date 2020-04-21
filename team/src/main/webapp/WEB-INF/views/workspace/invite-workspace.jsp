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
            <h1>멤버 초대하기</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/home">Home</a></li>
              <li class="breadcrumb-item"><a href="#">workspace</a></li>
              <li class="breadcrumb-item active">invite-workspace</li>
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
          <div class="col-md-12" id="invite1">
          
          <!-- Horizontal Form -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">멤버 초대하기</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                <div class="card-body">
                <div class="row">
                    <div class="col-sm-6">
                      <!-- checkbox -->
                      <div class="form-group">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="radio1" checked="1" value="1">
                          <label class="form-check-label">팀원</label>
                        </div>
                      </div>
                    </div> 
                    <div class="col-sm-6">
                      <!-- radio -->
                      <div class="form-group">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="radio1" value="2">
                          <label class="form-check-label">게스트</label>
                        </div>
                      </div>
                    </div>                    
                      <ul id="memberlist" style="width: 100%;">
                      <li class="col-sm-12 mb-3"
                      style="list-style: none; margin-left: -30px; font-size: 15px; letter-spacing: -1px;"
                      >팀원은 워크스페이스의 공개된 모든 정보에 엑세스할 수 있으며, TEAM의 다음 기능을 자유롭게 사용할 수 있습니다.</li>
                        <li>공개/비공개 프로젝트</li>
                        <li>공개/비공개 대화 채널</li>
                        <li>1:1 다이렉트 메시지</li>
                        <li>업무 생성 및 배정</li>
                        <li>알림 피드</li>
                        <li>필터와 리포트</li>
                      </ul>
                      
                      <ul id="guestlist" style="width: 100%; display:none;">
                      <li class="col-sm-12 mb-3"
                      style="list-style: none; margin-left: -30px; font-size: 15px; letter-spacing: -1px;"
                      >게스트는 워크스페이스의 정보에 제한적으로 엑세스가 필요한 외부 협력자 입니다.<br>게스트가 프로젝트 멤버로 추가되면, 다음 기능을 사용할 수 있습니다.</li>
                        <li>업무 팔로워로서 업무 진행 사항 보기</li>
                        <li>업무 코멘트와 파일 공유</li>
                        <li>프로젝트 대화 채널</li>
                      </ul>
                  </div>
                  </div>
                
                <!-- /.card-body -->
                
                
                </div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-info" id="invitebtn1">다음</button>
                  <button onclick="location.href='/team'" type="submit" class="btn btn-default float-right">뒤로</button>
                </div>
                <!-- /.card-footer -->
            </div>
            <!-- /.card -->
            
          	<div class="col-md-12" id="invite2" style="display:none;">
            <!-- Input addon -->            
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">멤버 초대하기</h3>
              </div>
              <div class="card-body">
              
                <p>링크를 공유하여 귀하의 팀을 ○○○○○○에 초대하세요</p>              
                <div class="input-group input-group-sm mb-3">
                  <input type="text" class="form-control" value="/team/workspace/invite-workspace?workspaceNo=3?code=${ workspace.code }">
                  <span class="input-group-append">
                    <button type="button" class="btn btn-info btn-flat">링크 복사</button>
                  </span>
                </div>
                
                <hr>
                
                <p>이메일로 초대하기 : 곧 초대 이메일을 보내드리겠습니다</p>   
                        
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">@</span>
                  </div>
                  <input type="text" class="form-control" placeholder="Username">
                </div>                
                
                <!-- /input-group -->
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1" id="checkaddemail1">이메일 추가하기</label>
                  </div>
              </div>
              	<!-- /.card-body -->              
                <!-- /.card-footer -->
            </div>
            <div class="card-footer">
                  <button type="submit" class="btn btn-info" id="invitebtn2">초대하기</button>
                  <button type="submit" class="btn btn-default float-right cancelbtn">뒤로</button>
                </div>
            <!-- /.card -->  
            </div>          
            
            <div class="col-md-12" id="invite3" style="display:none;">
            <!-- Input addon -->            
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">멤버 초대하기</h3>
              </div>
              <div class="card-body">              
                <p>게스트 멤버가 속해있는 프로젝트</p>                              
                <div class="form-group">
                <label>프로젝트 선택</label>
                  <select class="form-control select2" style="width: 100%;">
                  	<c:forEach var="Project" items="${ Projects }">
                    <option>${ Project.projectName }</option>
                    </c:forEach>
                  </select>
                </div>                
                <hr>
                
                <p>이메일로 초대하기 : 곧 초대 이메일을 보내드리겠습니다</p>   
                        
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">@</span>
                  </div>
                  <input type="text" class="form-control" placeholder="Username">
                </div>                
                
                <!-- /input-group -->
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck2">
                    <label class="form-check-label" for="exampleCheck1" id="checkaddemail2">이메일 추가하기</label>
                  </div>
              </div>
              	<!-- /.card-body -->              
                <!-- /.card-footer -->
            </div>
            <div class="card-footer">
                  <button type="submit" class="btn btn-info">초대하기</button>
                  <button type="submit" class="btn btn-default float-right cancelbtn">뒤로</button>
                </div>
            <!-- /.card -->  
            </div>          
            
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

<script type="text/javascript">

$(document).ready(function(){

    // 라디오버튼 클릭시 이벤트 발생    
    $("input:radio[name=radio1]").click(function(){
 
        if ($("input[name=radio1]:checked").val() == "1"){
        	$('#memberlist').show();
    		$('#guestlist').hide();

    		$("#invitebtn1.btn.btn-info").click(function(){
    		$('#invite1').hide();
    		$('#invite2').show();
        	$('#invite3').hide();
    		
    		});    		
    		
        } else if ($("input[name=radio1]:checked").val() == "2"){
        	$('#guestlist').show();
    		$('#memberlist').hide();

    		$("#invitebtn1.btn.btn-info").click(function(){
        	$('#invite1').hide();
        	$('#invite2').hide();
            $('#invite3').show();
        		
        	});
        }        
        
    });	    
	    $(".cancelbtn").click(function(){    	 
	    	$('#invite1').show();
	    	$('#invite2').hide();
	        $('#invite3').hide();        
	    });	
    
});
</script>

</body>
</html>
