<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>TEAMPLAN | Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="../../index2.html"><b>TEAMPLAN</b>회원가입</a>
  </div>
  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Register a new membership</p>

      <form id="register-form" action="register.action" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="name" name="name" placeholder="Full name">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="email" class="form-control" id="email" name="email" placeholder="Email">
          <div class="input-group-append">
            <div class="input-group-text">
            <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div  class="col-auto">
             <button type="button" id="email-check">중복확인</button><p id="email-check-result" style="display: inline; margin-left: 15px;"></p>
        </div><br>
        
        
        <div class="input-group mb-3">
          <input type="password" class="form-control" id="password" name="password" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="password" class="form-control" id="confirm" placeholder="Retype password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone : ex)000-0000-0000">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone-alt"></span>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="department" name="department" placeholder="Department">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-building"></span>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="addressNo" name="addressNo" placeholder="Address">
          <div class="input-group-append">
            <div class="input-group-text">
              <button type="button" id="btn" class="fas fa-home">우편번호 찾기</button>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="roadAddr" name="roadAddr" placeholder="Address">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-home"></span>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="detailAddr" name="detailAddr" placeholder="Address">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-home"></span>
            </div>
          </div>
        </div>
        
        <div>
        	<label for="img">프로필 이미지</label>
        	<input type="file" id="img" name="img" />
        	<div class="select-img"><img src="" /></div>
        </div>
        
        <div class="row">
          <!-- /.col -->
          <div class="col-4">
            <button type="button" id="register" class="btn btn-primary btn-block">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form>


      <a href="login.action" class="text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

	<!-- 다음 주소 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">
	$(function(){

		$("#addressNo, #roadAddr").attr({"readonly": "readonly" });

		$("#btn").on("click", function(event) {
			 new daum.Postcode({
			        oncomplete: function(data) {

						$("#addressNo").val(data.postcode);
						$("#roadAddr").val(data.roadAddress);
	                   	
			        }
			    }).open();
		});


		$("#img").change(function(){
			if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select-img img").attr("src", data.target.result).width(300);
				}
				reader.readAsDataURL(this.files[0]);
				}
			});
		

		$("#register").on("click" , function(event) {
			
			// 1. 유효성 검사
			if($("#name").val() == '' ){
				alert("이름을 입력하세요!");
				$("#name").focus();
				return;
			}
			if($("#email").val() == '' ){
				alert("이메일을 입력하세요!");
				$("#email").focus();
				return;
			}
			if($("#password").val() == '' ){
				alert("패스워드를 입력하세요!");
				$("#password").focus();
				return;
			}
			if($("#confirm").val() == '' ){
				alert("패스워드 확인을 입력하세요!");
				$("#confirm").focus();
				return;
			}
			if($("#phone").val() == '' ){
				alert("핸드폰을 입력하세요!");
				$("#phone").focus();
				return;
			}
			
			// 2. 오류가 없다면 서버로 전송
			$("#register-form").submit();
		});
		
		// email 중복체크
		$("#email-check").on("click", function(event) {
			
			$.ajax({
				"url" : "checkEmail.action",
				"method" : "get",
				"data" : { "email" : $("#email").val() },
				"success" : function(result, status, xhr) {
					if (result == "success") $("#email-check-result").text("사용 가능한 이메일 입니다.");
					else {
						$("#email-check-result").text("중복된 이메일 입니다.");
						$("#email").focus().val("");
					}
				},
				"error" : function(xhr, status, err) { alert("이메일 중복체크 실패"); }
			});

		});

		// 비밀번호 confirm
		$("#confirm").change(function(event) {
			var pw = $("#password").val();
			if ($(this).val() != pw) $("#pw-check-result").text("비밀번호가 일치하지 않습니다.");
			else $("#pw-check-result").text("");
		});
		
		
	});
	</script>

</body>

</html>