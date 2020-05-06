<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <fmt:formatDate value="${ logs.get(0).writedate }" pattern="yyyy-MM-dd hh:mm"/> --%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>활동 로그</title>
<style>
.log-table img {width:43; height:43}
.card-header {color:#464c59}
.log-table tr td:nth-child(1) {width:200px;}
.log-table tr td:nth-child(2), tr td:nth-child(3) {padding-top:20px;}
.log-table tr td:nth-child(3) {text-align:right; width:220px; cursor:default}
.img-circle {width:40px;margin-right:10px;}
.log-table i {margin:5px; cursor:pointer;}
.log-table tr td:nth-child(3) {font-size:10pt;}
.log-table span {font-weight:bold; margin:10px;}
.log-table {font-size:11pt;}
.checked-log {color:gray; background-color:#eeeeee;}
.checked-log a {color:gray !important;}
</style>

<link rel="stylesheet" href="/team/resources/css/log-feedback.css">
<%@include file="/WEB-INF/views/modules/common-css.jsp"%>

</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<!-- Navbar -->
	<%@include file="/WEB-INF/views/modules/topbar.jsp"%>
	<!-- /.navbar -->

	<div class="wrapper">

		<!-- Main Sidebar Container -->
		<%@include file="/WEB-INF/views/modules/sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="background-color:#ececec">
			<!-- Content Header (Page header) -->
			<div style="height: 50px; text-align: center; padding-top: 20px;">
				<a id="active" class="f_link" href="/team/log/list">활동 로그</a>&nbsp;&nbsp; <a class="f_link"
					href="/team/feedback/list">피드백</a>
			</div>

			<hr />

			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<i style="float: left;margin:5px;" class="fas fa-bars"></i>
							<h5 style="font-weight:bold;color:#464c59">업무 로그</h5>
						</div>
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
			<!-- /.content-header -->

			<div class="content" style="margin:0 65px 20px 65px; padding:0px">
				<div style="float:left;">
				<div class="input-group-prepend">
                    <button id="dropdown-select" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="background-color:white;border-radius:unset;border-color:#cfcfcf">
                      	전체 보기
                    </button>
                    <div class="log dropdown-menu">
                      <a class="dropdown-item" data-value="A" href="#">전체 보기</a>
                      <a class="dropdown-item" data-value="C" href="#">읽지 않은 로그만 보기</a>
                    </div>
                  </div>
                  </div>
				<!-- <h5 style="float:left">업데이트 사항을 모두 확인했습니다.</h5> -->
				<div style="text-align:right">
					<input id="search-all" type="text" style="width:300px;height:35px;margin-right:10px;padding-left:12px;border:1px solid #cfcfcf;"placeholder="업무, 멤버, 키워드로 로그 검색">
					<button id="all-check-btn" class="btn btn-secondary btn-flat" style="height:35px;margin-right:10px;">모두 읽음 상태로 표시</button>
					<button id="all-delete-btn" class="btn btn-info btn-flat" style="height:35px;">모두 지우기</button>
				</div>
			</div>
			<!-- Main content -->
			
			<section class="content">

				<div id="log-list-container">
					<jsp:include page="modules/log-list.jsp"></jsp:include>
				</div>
				
			</section>
			<!-- /.content -->
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
	</div>
	<!-- ./wrapper -->
	
	
      
	<%@include file="/WEB-INF/views/modules/common-js.jsp"%>
	
	<!-- css 관련 스크립트 -->
	<script src="/team/resources/js/log-css.js"></script>
	<script type="text/javascript">
	$(function() {		
		// 텍스트 자르고 ... 포함된 문자열 반환하는 함수
		function textSubString(text) {
			return ((text.length > 10) ? text.substring(0, 10) + "..." : text);
		}
		
		// 로그 검색
		$(".log .dropdown-item").click(function() {
			var searchType = $(this).attr("data-value");
			
 			$.ajax({
				url : "list2",
				method : "get",
				success : function(resp, status, xhr) {
					$("#log-list-container").load("/team/log/search?searchType=" + searchType + "&email=${loginuser.email}");
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			}); 
		});
		
		// 로그 검색
		$("#search-all").keyup(function() {
			var key = $(this).val();
			
			$.ajax({
				url : "list",
				method : "get",
				success : function(resp, status, xhr) {
					$("#log-list-container").load("/team/log/search?searchType=K&email=${loginuser.email}&key="+ key);
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		});
		
		// 로그 읽음 처리
		$(document).on("click", ".log-check-btn", function() {
			if (!confirm("로그를 읽음으로 표시할까요?")) return;
			
			var logNo = $(this).parents().attr("data-value");
			var searchType = $("#dropdown-select").attr("data-value");
			var text = $(this).parents().eq(0).attr("data-content");
			
			$.ajax({
				url : "check",
				method : "post", 
				data : {"logNo": logNo},
				success : function(resp, status, xhr) {
					$("#log-list-container").load("/team/log/search?"+ searchType +"searchType=A&email=${loginuser.email}");
					
					var target = $(this).parents(".unchecked-log");
					target.removeClass(".unchecked-log");
					target.addClass(".checked-log");
					
					toastr.info(textSubString(text) +" 업무와 관련된 로그를 확인했습니다");
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		});
		
		// 로그 삭제 
		$(document).on("click", ".log-delete-btn", function() {
			if (!confirm("로그를 삭제할까요?")) return;
			
			var logNo = $(this).parents().attr("data-value");
			var searchType = $("#dropdown-select").attr("data-value") == undefined ? "A" : $("#dropdow-btnn-select").attr("data-value");
			var text = $(this).parents().eq(0).attr("data-content");
	
			$.ajax({
				url : "delete",
				method : "post", 
				data : {"logNo": logNo},
				success : function(resp, status, xhr) {
					$("#log-list-container").load("/team/log/search?searchType="+ searchType +"&email=${loginuser.email}");
				
					toastr.error(textSubString(text) +" 업무와 관련된 로그를 삭제했습니다");
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		});
		
		// 로그 전체 읽음
		$("#all-check-btn").click(function() {
			var searchType = $("#dropdown-select").attr("data-value") == undefined ? "A" : $("#dropdown-select").attr("data-value");
			var target = $("#log-list-container").find(".unchecked-log");
			var logNo = new Array();
			
			if (target.length == 0) { alert("이미 모든 로그를 확인했습니다."); return; } 
			if (!confirm("모든 로그를 읽음 처리할까요?")) return;
			
			for (var i = 0; i < target.length; i++) {
				$.ajax({
					url : "check",
					method : "post", 
					data : {"logNo": target[i].id},
					success : function(resp, status, xhr) {
						$("#log-list-container").load("/team/log/search?"+ searchType +"searchType=A&email=${loginuser.email}");
						
						var target = $(this).parents(".unchecked-log");
						target.removeClass(".unchecked-log");
						target.addClass(".checked-log");
						
					},
					error : function(xhr, status, err) {
						console.log(err);
					}
				});
			}
			
			toastr.info("모든 로그를 확인했습니다");
		});
		
		// 로그 전체 삭제
		$("#all-delete-btn").click(function() {
			var searchType = $("#dropdown-select").attr("data-value") == undefined ? "A" : $("#dropdown-select").attr("data-value");
			var target = $("#log-list-container").find(".log-small");
			var logNo = new Array();
			
			if (target.length == 0) { alert("삭제할 로그가 없습니다."); return; } 
			if (!confirm("모든 로그를 삭제할까요?")) return;
			
			for (var i = 0; i < target.length; i++) {
				$.ajax({
					url : "delete",
					method : "post", 
					data : {"logNo": target[i].id},
					success : function(resp, status, xhr) {
						$("#log-list-container").load("/team/log/search?searchType="+ searchType +"&email=${loginuser.email}");
					},
					error : function(xhr, status, err) {
						console.log(err);
					}
				});
			}
			toastr.error("모든 로그를 삭제했습니다");
		});
		
	})
	</script>
</body>

</html>
