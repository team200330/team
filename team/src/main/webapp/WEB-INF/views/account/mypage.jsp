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
#updateWorkspaceManagerModal td{vertical-align: middle;}
#updateWorkspaceManagerModal .img-circle {width: 37;height: 37;margin-right: 5px;}
#updateWorkspaceManagerModal tr td:first-child {font-weight: bold;}

._mem { height:50px;border:1px solid white;border-radius:.20rem;padding:5px; margin-bottom: 15px; }
._mem_img {width:43px;margin-right:10px; float:left;}
._mem_none {font-size: 10pt;padding: 10;}
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
			style="background-color: #ececec; min-height:1100px;">
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
			<section id="mypage-content" class="content" style="height:100%">
				<jsp:include page="modules/mypage-content.jsp"></jsp:include>
			</section>
			<!-- /.content -->
		</div>
	</div>
	
	<!-- 탈퇴 모달 -->
	<div id="modal-container">
		<jsp:include page="modules/mypage-modal.jsp"></jsp:include>
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

	<!-- 다음 API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	$(function() {
		// 다음api 주소
		$(document).on("click", "#addr-btn", function(event) {
			 new daum.Postcode({
		        oncomplete: function(data) {

		        // postcode (우편번호) 2020년 3월부터 받아올수 없음. 도로명 번호 받아오기
				//$("#postcode").val(data.postcode);
				$("#roadAddress").val(data.roadAddress);
				$("#jibunAddress").val(data.jibunAddress);
                   	
		        }
			 }).open();
		});
		
		// 비번 보이기 / 숨기기
		$(document).on("click", ".pw-show-btn", function() {
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

		$(document).on("keyup", ".pw", function() {
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
		$(document).on("keyup", ".new-pw", function() {
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
		$(document).on("keyup", ".pw-check", function() {
			if ($(this).val() != $(".new-pw").val()) {
				$(this).parents("div").children(".check-text").text("비밀번호가 일치하지 않습니다");
				pwCheck = false;
			}
			else {
				$(this).parents("div").children(".check-text").text("");
				pwCheck = true; checkBtnDisabled();
			}
		});
		
		// 비번 변겅
		$(document).on("click", ".password-update .active-submit-btn", function() {
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
		
		// 설정 카드열기 / 닫기
		$(document).on("click", ".card-open-btn", function() {
			var target = $(this).parents(".card").children(".card-body").eq(0);
			if (target.css("display") == "block") target.css("display", "none");
			else target.css("display", "block");
		});
		
		// 프사 변경버튼
		$(document).on("click", "#img-update-btn", function() { $("#img-select").click(); });
		
		// 프사 변경
		$(document).on("change", "#img-select", function() {
			// multipartFile data ajax 로 보내기
			var formData = new FormData($('#img-form')[0]);
			
			$.ajax({
				url : "/team/account/updateImg",
				method : "post",
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				data : formData,
				success : function(data, status, xhr) {
					$("#mypage-content").load("/team/account/mypageContent?email=" + "${loginuser.email}");
					alert("프로필 사진을 변경했습니다.");
				}
			});
		});
		
		// 프로필 정보 변경
		$(document).on("change", "#profile-form input", function() {
			$(".profile-update .submit-btn").removeClass("dlsabled-submit-btn");
			$(".profile-update .submit-btn").addClass("active-submit-btn");
		});
		
		$(document).on("click", ".profile-update .active-submit-btn", function() {
			var form = $("#profile-form").serialize();
			
			$.ajax({
				url : "/team/account/updateProfile",
				method : "post",
				data : form,
				success : function(data, status, xhr) {
					$("#mypage-content").load("/team/account/mypageContent?email=" + "${loginuser.email}");
					alert("회원 정보를 변경했습니다.");
				}
			});
		});
		
		// 계정 삭제
		$(document).on("click", "#delete-user-btn", function() {
			// 소유하고있는 워크스페이스 있으면 소유권이전 모달 띄우기
			if ("${not empty mypage_workspaces}") $("#updateWorkspaceManagerModal").modal(); 
			
			// 없으면 계정삭제 모달 띄우기
			else $("#deleteUserModal").modal();

		});
		
		// 멤버선택 모달 띄우기
		$(".member-add-modal-btn").click(function() {
			// 워크스페이스 번호로 멤버 목록 가져오기
			$.ajax({
				url : "/team/account/getWorkspaceMembers",
				method : "get",
				data : {
					"email" : "${loginuser.email}",
					"workspaceNo" : $(this).attr("id")
				},
				success : function(resp, status, xhr) {
					$("#memberAddModal #workspace_mem").html(resp);
					$("#memberAddModal").modal();
				}
			});
		});
		
		// 소유권이전할 멤버선택
		$(document).on("click", "._mem", function() {
			var target = $("#updateWorkspaceManagerModal").find("#" + $(this).attr("data-workspaceNo"));
			target.find(".change-manager-img").attr("src", $(this).attr("data-img"));
			target.find(".manager-email").text($(this).attr("data-email"));
			
			target.attr("data-email", $(this).attr("data-email"));
		});
		
		// 소우권이전 모달 다음버튼 눌렀을때
		$("#submit_btn").click(function(e) {
			var check = true;
			$("#updateWorkspaceManagerModal tr").each(function() {
				if($(this).attr("data-email") == false || $(this).attr("data-email") == undefined) {
					alert("모든 워크스페이스의 소유권을 이전해야 합니다.");
					e.preventDefault();
					check = false;
					return false; 
				}
			});
			
			if (check) {
				$("#deleteUserModal").modal();
				$("#updateWorkspaceManagerModal").modal("hide"); 
			}
		});
		
		// 계정삭제 버튼 눌렀을때
		$("#delete-action-btn").click(function(e) {
			var target = $("#deleteUserModal");
			
			if (target.find("#check").is(":checked") == false) {
				alert("계정 삭제에 동의해야 합니다.");
				e.preventDefault();
				return false;
			}
			
			if ("${loginuser.email}" != target.find("#check-email").val()) {
				alert("이메일이 일치하지 않습니다.");
				e.preventDefault();
				return false;
			}
			
			if (!confirm("정말 계정을 삭제할까요?")) return;
			
			// 워크스페이스 매니저 변경
			$("#updateWorkspaceManagerModal tr").each(function() {
				$.ajax({
					url : "/team/account/updateWorkspaceMananger",
					method : "post",
					data : {
						"email": "${loginuser.email}",
						"managerEmail" : $(this).attr("data-email"), 
						"workspaceNo" : $(this).attr("id")
					}, 
					success : function() {
						$.ajax({
							url : "/team/account/deleteMember",
							method : "post",
							data : {
								"email" : "${loginuser.email}"
							}
						}); 
					}
				});
			});
			
			// 계정 삭제
			
		})
		
	});
</script>
</body>

</html>
