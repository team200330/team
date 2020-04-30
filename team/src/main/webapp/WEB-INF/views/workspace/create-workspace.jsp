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
      <h4 class="login-box-msg">워크스페이스 만들기</h4>
	  <h6 class="login-box-msg">워크스페이스는 회사, 부서, 팀, <br>혹은 개인이 될 수 있습니다.</h6>
	  <h5 class="login-box-msg">워크스페이스 이름</h5>
      <form action="create-workspace" method="post">
      	<input type="hidden" class="form-control" name="email" value="${ loginuser.email }">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="workspaceName" placeholder="예) 가나다 주식회사, 마케팅 팀...">
        </div>
        <div class="social-auth-links text-center mb-3">
        	<button type="submit" class="btn btn-block btn-danger">만들기</button>
      	</div>
      </form>

      
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="/team">뒤로</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<%@include file="/WEB-INF/views/modules/common-js.jsp" %>
</body>
</html>
