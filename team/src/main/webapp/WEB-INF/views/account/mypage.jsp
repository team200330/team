<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>my page</title>

<%@include file="/WEB-INF/views/modules/common-css.jsp"%>
<style>

.content-header {
    margin: 25px 50px 25px 50px;
    padding: 15px .5rem;
}
.f_link {
	padding: 22px;
	color: #464c59;
	font-weight: bold;
}
a {cursor:pointer}
#active {
	border-bottom: 3px solid #17a2b8;
	color: #17a2b8;
}

.nav-item {
	margin-right: 10
}

button {
	color: gray !important
}
.card-title {
    font-weight: bold;
    font-size: 12pt;
}
.card-header .active {
	background-color:#f5f5f5 !important;
    border-bottom: 1px solid #f5f5f5!important;
}
.tab-content .card-header {border-bottom:0}
.tab-content .card-header, .tab-content .card-body{ padding: 30px; }
.tab-content .card-body {padding-top: 10px}
.tab-content .card-body h6 {
	font-size: 10.5pt;
    font-weight: bold;
    margin-top: 20px;
}

.content .card-body h6:first-child {margin-top:0px;}
.content .card-body input:focus {outline:1px solid #17a2b8;}
.content .card-body .submit-btn {
	padding: 7 15 7 15;	
	font-weight :bold;
	border: none;
	box-shadow: none;
	border-radius: .10rem;
}
.disabled-submit-btn {
    background-color: #ececed;
    color: #b5b4b4 !important;
}
.active-submit-btn {
	background-color: #17a2b8;
    color: white !important;
    cursor:pointer;
}
.content .card-body input {
    padding: 5 15 5 15;
    width: 250;
    font-size: 11pt;
    border-radius: .20rem;
    border: 1px solid #cecece;
}
.pw-show-btn {
 	font-size: 10pt;
    padding: 10;
    color: #17a2b8 !important;
}
.check-text {
	font-size: 10pt;
    color: gray;
}
.password-update div, .profile-update div {margin-bottom: 20;}
#img-update-btn {
	color: white;
    background-color: #1b1b1ba8;
    width: 119px;
    position: absolute;
    top: 140px;
    padding: 5;
    font-size: 9pt;
    text-align: center;
    border-bottom: 1px solid #656565;
    cursor:default;
}

</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<!-- Navbar -->
	<%@include file="/WEB-INF/views/modules/topbar.jsp"%>
	<!-- /.navbar -->
	<!-- Main Sidebar Container -->
	<%@include file="/WEB-INF/views/modules/sidebar.jsp"%>

	<!-- Content Wrapper. Contains page content -->
	<div class="wrapper">

		<!-- Main Sidebar Container -->
		<%@include file="/WEB-INF/views/modules/sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper"
			style="background-color: #ececec; min-height: inherit;">
			<!-- Content Header (Page header) -->
			
				<div style="height: 50px; text-align: center; padding-top: 20px;">
					<a class="f_link" href="/team/workspace/workspace-member">멤버</a>&nbsp;&nbsp;
					<a id="active" class="f_link" href="/team/account/mypage">내 프로필</a>
				</div>

				<hr />

				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<i style="float: left; margin: 5px;" class="fas fa-bars"></i>
								<h5 style="font-weight: bold; color: #464c59">내 프로필</h5>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.container-fluid -->
					</div>
				</div>
		
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content" style="height:100%">
				<!-- Default box -->
				<div class="card" style="margin: 30px 70px 10px 70px;">

					<!-- ./row -->

					<div class="card card-secondary card-tabs" style="margin-bottom: 0;background-color: #f5f5f5">
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-home-tab" data-toggle="pill"
									href="#custom-tabs-one-home" role="tab"
									aria-controls="custom-tabs-one-home" aria-selected="true">내 프로필</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="custom-tabs-one-profile-tab" data-toggle="pill"
									href="#custom-tabs-one-profile" role="tab"
									aria-controls="custom-tabs-one-profile" aria-selected="false">
										설정</a></li>
								

							</ul>
						</div>
						<div class="card-body">
						
							<!-- 내 프로필 -->
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade show active" id="custom-tabs-one-home"
									role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">

									<div class="card">
										<div class="card-body" style="padding:50px; display:flex">
											<div>
												<c:choose>
													<c:when test="${not empty loginuser.img}">
														<img id="profileImg" src="/team/resources/img/profile/${loginuser.img}" style="padding:2px;border:1px solid #adb5bd; width:120px; height:120px;">
												
													</c:when>
													<c:otherwise>
														<img id="profileImg" src="/team/resources/img/profile-default.jpg" style="padding:2px;border:1px solid #adb5bd; width:120px; height:120px;">
												
													</c:otherwise>
												</c:choose>
												<div id="img-update-btn">
													<i class="fas fa-camera"></i>
													사진 업데이트
												</div>
												<form id="img-form" action="/team/account/updateImg" method="post" enctype="multipart/form-data">
													<input type="file" name="img" id="img-select" style="display:none">
													<input type="hidden" name="email" value="${loginuser.email }">
												</form>
												
											</div>
											<div style="padding-left: 40px;" class="profile-update">
												<form id="profile-form" method="post" action="/team/account/updateProfile">
													<div>
													<h6>이름</h6>
													<input type="text" name="name" value="${loginuser.name}"><br>
													<span class="check-text">팀원들이 본인을 알아볼 수 있도록 도와주세요.</span>
													</div>
													
													<div>
													<h6>부서</h6>
													<input type="text" name="department" value="${loginuser.department}"><br>
													<span class="check-text">부서명으로 본인을 찾을 수 있도록 도와주세요. 예) 디자인팀</span>
													</div>
													
													<div>
													<h6>직함</h6>
													<input type="text" name="position" value="${loginuser.position}"><br>
													<span class="check-text">자신이 무엇을 하는지 팀원들에게 알려주세요. 예) 웹디자이너</span>
													</div>
													
													<div>
													<h6>전화번호</h6>
													<input type="text" name="phone" value="${loginuser.phone}"><br>
													<span class="check-text">팀원들이 본인에게 연락할 수 있도록 도와주세요</span>
													</div>
													
													<div>
													<h6>주소</h6>
													<input type="text"><br>
													<span class="check-text">팀원들이 본인을 지도에서 찾을 수 있도록 도와주세요!</span>
													</div>
													
													<button class="submit-btn active-submit-btn">변경사항 저장</button>
												</form>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
								
								</div>
								
								<!-- 설정 -->
								<div class="tab-pane fade" id="custom-tabs-one-profile"
									role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

									<!-- Default box -->
									<div class="card">
										<div class="card-header">
											<h5 class="card-title">비밀번호 변경</h5>

											<div class="card-tools">
												<button type="button" class="btn btn-tool card-open-btn">
													<i class="fas fa-minus"></i>
												</button>
											</div>
										</div>
										<div class="card-body" style="display:none">
											<div class="password-update">
												<div>
												<h6>현재 비밀번호</h6>
												<input type="password" class="pw"> <a class="pw-show-btn">보이기</a><br>
												<span class="check-text"></span>
												</div>
												
												<div>
												<h6>새 비밀번호</h6>
												<input type="password" class="new-pw"> <a class="pw-show-btn">보이기</a><br>
												<span class="check-text"></span>
												</div>
												
												<div>
												<h6>새 비밀번호 확인</h6>
												<input type="password" class="pw-check"> <a class="pw-show-btn">보이기</a><br>
												<span class="check-text"></span>
												</div>

												<button class="submit-btn disabled-submit-btn" disabled="disabled">비밀번호 업데이트</button>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
								
								<!-- Default box -->
									<div class="card">
										<div class="card-header">
											<h5 class="card-title">계정 삭제</h5>

											<div class="card-tools">
												<button type="button" class="btn btn-tool card-open-btn">
													<i class="fas fa-minus"></i>
												</button>
											</div>
										</div>
										<div class="card-body" style="display:none">
											<div style="font-size:10.5pt; margin-bottom:15px;">
											한 번 삭제된 계정은 다시 복구할 수 없습니다. 계정이 삭제되면 현재 계정에서 생성된 모든 데이터에 더이상 엑세스할 수 없습니다. 
											삭제 후 Taskworld를 다시 이용하고자 한다면, 새로 가입해주셔야 합니다.
											</div>
											<button class="submit-btn" style="background-color:#e95e51; color:white !important; width: 170;">계정 삭제하기</button>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->

								</div>
								
							
							</div>
						</div>
						<!-- /.card -->
					</div>

				</div>



			</section>
			<!-- /.content -->
		</div>
	</div>

	<!-- /.content-wrapper -->
	<footer class="main-footer">
		<strong>Copyright &copy; 2014-2019 <a
			href="http://adminlte.io">AdminLTE.io</a>.
		</strong> All rights reserved.
		<div class="float-right d-none d-sm-inline-block">
			<b>Version</b> 3.0.3-pre
		</div>
	</footer>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->

	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>

	<script type="text/javascript">
	$(function() {
		// 비번 보이기 / 숨기기
		$(".pw-show-btn").click(function() {
			if ($(this).text() == "보이기") {
				$(this).prev().attr("type", "text");
				$(this).text("숨기기");
			}
			else {
				$(this).prev().attr("type", "password");
				$(this).text("보이기");
			}
			
		});
		
		// 비번변경 유효성검사
		var pw = false;
		var newPw = false;
		var pwCheck = false;
		function checkBtnDisabled() {
			if (pw == true && newPw == true && pwCheck == true) {
				var target = $(".password-update .submit-btn");
				target.removeClass("disabled-submit-btn");
				target.removeAttr("disabled");
				target.addClass("active-submit-btn");
			}
		}

		$(".pw").keyup(function() {
			var target = $(this);
			
			$.ajax({
				url : "/team/account/checkPw",
				data : {
					"email" : "${loginuser.email}",
					"password" : target.val()
				},
				success : function(data, status, xhr) {
					if (data == "success") {
						target.parents("div").children(".check-text").text("");
						pw = true; checkBtnDisabled();
					}
					else { 
						target.parents("div").children(".check-text").text("비밀번호가 일치하지 않습니다"); 
						pw = false;
					}
				}
			});
		});
		$(".new-pw").keyup(function() {
			// 숫자, 문자 포함한 6 ~ 12자리의 비밀번호
			var pwRule = /^[A-Za-z0-9]{6,12}$/;
			if (pwRule.test($(this).val())) {
				$(this).parents("div").children(".check-text").text("");
				newPw = true; checkBtnDisabled();
			}
			else {
				$(this).parents("div").children(".check-text").text("비밀번호는 숫자 또는 문자를 포함한 6 ~ 12자리여야 합니다");
				newPw = false;
			}
		});
		$(".pw-check").keyup(function() {
			if ($(this).val() != $(".new-pw").val()) {
				$(this).parents("div").children(".check-text").text("비밀번호가 일치하지 않습니다");
				pwCheck = false;
			}
			else {
				$(this).parents("div").children(".check-text").text("");
				pwCheck = true; checkBtnDisabled();
			}
		});
		
		$(document).on("click", ".active-submit-btn", function() {
			$.ajax({
				url : "/team/account/updatePw",
				method : "post",
				data : {
					"email" : "${loginuser.email}",
					"password" : $(".new-pw").val()
				},
				success : function(data, status, xhr) {
					$(".password-update input").each(function() {
						$(this).val(""); 
						$(this).attr("type", "password"); $(this).next().text("보이기");
					});
					$(".password-update button").removeClass("active-submit-btn");
					$(".password-update button").addClass("disabled-submit-btn");
					
					alert("비밀번호를 변경했습니다.");
				}
			});
		});	
		
		
		$(".card-open-btn").click(function() {
			var target = $(this).parents(".card").children(".card-body").eq(0);
			if (target.css("display") == "block") target.css("display", "none");
			else target.css("display", "block");
		});
		
		$("#img-update-btn").click(function() {
			$("#img-select").click();
		});
		
		// >>>>>>>>>>>>>>>>>>>>>> 여기 비동기로 바꾸기
		$("#img-select").change(function() {
			console.log($(this).val())
			
			$("#img-form").submit();
			alert("이미지 변경완료");
			
			
		});
		
	});
	</script>


</body>

</html>
