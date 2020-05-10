<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>team</title>
  
  <%@include file="/WEB-INF/views/modules/common-css.jsp" %>
  
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="home"><b>TEAM</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body" style="box-shadow: 26px 20px 50px 1px rgba(0, 0, 0, 0.2);">
      <h4 class="login-box-msg">워크스페이스 참여하기</h4>
	  <h6 class="login-box-msg">이메일로 발송받은 초대코드를 입력하여 워크스페이스에 참여할 수 있습니다.</h6>
	  <h5 class="login-box-msg">초대코드</h5>
      <form action="create-workspace" method="post">
      	<input type="hidden" class="form-control" name="email" value="${ loginuser.email }">
        <div class="input-group mb-3">
        	<form method="post" action="/team/workspace/join" id="workspaceJoinForm">
        		<input type="hidden" name="workspaceNo" id="form-workspaceNo" value="">
	            <input type="hidden" value="${loginuser.email}" name="email">
          		<input id="join-code" type="text" class="form-control" name="code" placeholder="여기에 초대코드를 입력하세요">
          </form>
        </div>
        <div class="social-auth-links text-center mb-3">
        	<button id="workspace-join-btn"type="submit" class="btn btn-block btn-info">참여하기</button>
      	</div>
      </form>

      
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="/team/workspace/create-workspace">뒤로</a>
 
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<%@include file="/WEB-INF/views/modules/common-js.jsp" %>
</body>
</html>
