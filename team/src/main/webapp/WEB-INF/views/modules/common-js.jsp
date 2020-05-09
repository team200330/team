<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>

<!-- jQuery -->
<script src="/team/resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/team/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Bootstrap 4 -->
<script src="/team/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>   
<!-- ChartJS -->
<script src="/team/resources/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="/team/resources/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="/team/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/team/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/team/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/team/resources/plugins/moment/moment.min.js"></script>
<script src="/team/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/team/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/team/resources/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/team/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/team/resources/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/team/resources/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/team/resources/dist/js/demo.js"></script>
<!-- SweetAlert2 -->
<script src="/team/resources/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="/team/resources/plugins/toastr/toastr.min.js"></script>
<!-- Task Properties side -->
<!--<script src="/team/resources/js/task-properties-side.js"></script> -->
<!-- Task Common side -->
<!-- <script src="/team/resources/js/task-common.js"></script> -->
<!-- pace -->
<script src="/team/resources/js/pace.js"></script>
<!-- toast -->
<script src="/team/resources/js/toast.js"></script>
<!-- datepicker -->
<script src="/team/resources/js/jquery-datepicker.js"></script>




<!-- 이메일 코드전송 관련 -->
<jsp:include page="/WEB-INF/views/workspace/modals.jsp"></jsp:include>

<script type="text/javascript">
$(function() {
	// 탑바리로드
	$(function() {
		$("#topbar-notifications").load("/team/feedback/getNotifications");
	});
	
	// 멤버초대모달
	$(document).on("click","#inviteModal",function() {
		$("#inviteMemberModal").modal();
	});
	
	$(document).on("click", "#send-invite-code", function() {
		$.ajax({
			url : "/team/workspace/invite",
			data : {
				"email" : $("#invite-email").val(),
				"workspaceNo" : "${workspaceNo}"
			},
			success : function() {
				alert("초대코드 발송이 완료되었습니다.");
				$("#inviteMemberModal").modal("hide");
			}
		});
	});
	
	// 초대코드입력모달
	$(document).on("click", "#joinModal", function() {
		$("#joinWorkspaceModal").modal();
	});
	
	$(document).on("click", "#workspace-join-btn", function(e) {
		var code = $("#join-code").val();
		var workspaceNo = $("#form-workspaceNo");
		
		$.ajax({
			url : "/team/workspace/checkJoin",
			data : {
				"code": code
			},
			success : function(data, status, xhr) {
				if (data < 0) {
					alert("초대코드가 일치하지 않습니다.");
					e.preventDefault();
					return false;
				} else {
					alert("워크스페이스에 멤버로 참여되었습니다.");
					// 멤버 추가하고 프로젝트 리스트로 리다이렉트
					$("#workspaceJoinForm #form-workspaceNo").val(data);
					$("#workspaceJoinForm").submit();

				}
			}
		});
	});
})

</script>


