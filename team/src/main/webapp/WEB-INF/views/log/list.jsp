<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <fmt:formatDate value="${ logs.get(0).writedate }" pattern="yyyy-MM-dd hh:mm"/> --%>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
<meta charset="utf-8">
<title>활동 로그</title>
<style>
.card-header {color:#464c59}
.log-table tr td:nth-child(1) {width:200px;}
.log-table tr td:nth-child(2), tr td:nth-child(3) {padding-top:20px;}
.log-table tr td:nth-child(3) {text-align:right; width:220px; cursor:default}
.img-circle {width:40px;margin-right:10px;}
.log-table i {margin:5px; cursor:pointer;}
.log-table tr td:nth-child(3) {font-size:10pt;}
.log-table span {font-weight:bold; margin:10px;}
.log-table {font-size:11pt;}
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
                      <a class="dropdown-item" href="#">전체 보기</a>
                      <a class="dropdown-item" href="#">읽지 않은 로그만 보기</a>
                    </div>
                  </div>
                  </div>
				<!-- <h5 style="float:left">업데이트 사항을 모두 확인했습니다.</h5> -->
				<div style="text-align:right">
					<button class="btn btn-secondary btn-flat" style="height:35px;margin-right:10px;">모두 읽음 상태로 표시</button>
					<button class="btn btn-info btn-flat" style="height:35px;">모두 지우기</button>
				</div>
			</div>
			<!-- Main content -->
			
			<section class="content">


				<c:if test="${not empty logs}">
					<c:forEach var="key" items="${keys}">
						<div class="log-content col-md-9" style="max-width:100%;">
							<div class="card" style="margin-left:50px;margin-right:50px;border-radius:unset">
				              <div class="card-header">
				                <h3 class="card-title">${key}</h3>						
				                <div class="card-tools">
				                  <div class="input-group input-group-sm" style="width: 150px;">
				                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
				                    <div class="input-group-append">
				                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
				                    </div>
				                  </div>
				                </div>
				              </div>
				              <!-- /.card-header -->
				              <div class="card-body table-responsive p-0" style="max-height:500px;">
				                <table class="log-table table table-head-fixed text-nowrap">
				                  <tbody>
				                  
				                  	<c:forEach var="log" items="${logs[key]}">
				                  	
				                  	<%-- <c:choose>
				                  		<c:when test="${log.receiver.isRead == false}"> --%>
					                  	<tr>
					                      <td>
					                       
					                      <img class="img-circle img-bordered-sm" src="" alt="user image">
											<span class="username"> 
												<a href="#">${log.email}</a>
											</span>
					                      </td>
					                      <td>님이 (업무이름) 을 <span>${log.state}</span>했습니다</td>
					                      	<td>
											<div><fmt:formatDate value="${log.writedate}" pattern="yyyy-MM-dd hh:mm"/></div>
											<input class="logWriteDate" type="hidden" value="<fmt:formatDate value="${log.writedate}" pattern="yyyy-MM-dd hh:mm"/>">
											</td>
					                    </tr>		
				                  		<%-- </c:when>
				                  		<c:otherwise>
				                  			<tr>
				                  				<td colspan="3">읽음 처리</td>
				                  			</tr>
				                  		</c:otherwise>
				                  	</c:choose> --%>
				                   
				                    </c:forEach>
				                    
				                  </tbody>
				                </table>
				              </div>
				              <!-- /.card-body -->
				            </div>
		            <!-- /.card -->
						</div>
					</c:forEach>
				</c:if>
				
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
	<script type="text/javascript">
	$(function() {
		// CSS
		
		// 상단 로그 / 피드백 메뉴  css
		$(".f_link").click(function() {
			$("#active").removeAttr("id");
			$(this).attr("id", "active");
		});
		$(".f_link").hover(function() {
			$(this).css("color", "#17a2b8");
		}, function() {
			if ($(this).attr("id") != "active")
				$(this).css("color", "#464c59");
		});
		
		// 로그 table css
		$("tr").hover(function() {
			$(this).css("background-color", "#efefef");
			$(this).children(":nth-child(3)").children("div").html(
				'읽은 상태로 표시<i class="far fa-check-square"></i>&nbsp;&nbsp;' +
		        '삭제<i class="fas fa-times"></i>'
			);
		}, function() {
			$(this).css("background-color", "white");
			var date = $(this).children(":nth-child(3)").children("input").val();
			$(this).children(":nth-child(3)").children("div").html(date);
		});
		
		////////////////////////////////////////////////////
		
		// select box
		$(".log .dropdown-item").click(function() {
			$("#dropdown-select").text($(this).text());
		});
		
	})
	</script>
</body>

</html>
