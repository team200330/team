<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page pageEncoding="utf-8"%>
  <!-- Content Wrapper. Contains page content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <!-- /.card-header -->
              <!-- /.row -->              
              <div class="card-body"> 
                <div class="row">
                  <div class="col-sm-2 col-6">
                    <div class="description-block border-right">                    
                      <span class="description-text">시작일</span><br>               
                      <input type="date" style="width:140px" value="${project.startdate}" readonly="readonly">
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-2 col-6">
                    <div class="description-block border-right">                    
                      <span class="description-text">마감일</span><br> 
                      <input id="project-deadline" type="date" style="width:140px" value="${not empty project.deadline ? project.deadline : '-'}">           
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-2 col-6">
                    <div class="description-block border-right">                    
                      <span class="description-text">완료일</span><br>    
                     <input id="project-enddate" type="date" style="width:140px" value="${not empty project.enddate ? project.enddate : '-'}">       
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-1 col-6">
                    <div class="description-block">                    
                      <span class="description-text">경과시간</span><br>                      
                      <h5 class="description-header" style="display: inline;">
                      	${elapsedTime} 일
                      </h5>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <div class="col-sm-1 col-6">
                    <div class="description-block">                    
                      <span class="description-text">남은시간</span><br>                      
                      <h5 class="description-header" style="display: inline;">
                      	${remainingTime} 일
                      </h5>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-2 col-6">
                    <div class="description-block border-right border-left">                    
                      <span class="description-text">완료됨</span><br>                      
                      <h5 class="description-header" style="display: inline;">${A_completed}개 업무</h5>
                      <span class="description-percentage text-success">
                      	(<fmt:formatNumber value="${A_completed / A_total * 100}" pattern=".0"/>)%
                     </span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-2 col-6">
                    <div class="description-block">                    
                      <span class="description-text">남은 업무</span><br>
                      <h5 class="description-header" style="display: inline;">${A_total - A_completed}개 업무</h5>
                      <span class="description-percentage text-danger">
                      	(<fmt:formatNumber value="${(A_total - A_completed) / A_total * 100}" pattern=".0"/>)%
                      	</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                </div>
                <!-- /.row --> 
               
            </div>
             </div>
          </div>
            
            
           
            <div class="row">
                <div class="col-md-6">   
                	<div class="card" style="margin-left: 7px; width:100%">
                		<div class="card-body" style="padding:3rem; padding-top:30">
                			<h5 style="text-align:center; margin-bottom: 30;">내가 작성한 업무</h5>
           					<canvas id="myDonutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
           				</div>
           			</div>
           		</div>
           		
           		 <div class="col-md-6">   
           			<div class="card" style="margin-right: 7px;width:100%">
                		<div class="card-body" style="padding:3rem; padding-top:30">
                			<h5 style="text-align:center; margin-bottom: 30;">전체 업무</h5>
           					<canvas id="allDonutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
           				</div>
           			</div>
           		</div>
           	</div>
      
            
            
            <!-- /.card -->
            <div class="card" style="margin-left: 7px;margin-right: 7px; width:100%">
              <div class="card-body">              
                <div class="row">
                  <div class="col-md-12">   
                  	<h5 style="text-align:center; margin: 30;">업무 그래프</h5>
	                <div class="chart" style="margin-bottom:30px">
	                  <canvas id="areaChart" style="min-height: 250px; height: 350px; max-height: 350px; max-width: 100%;"></canvas>
	                  <div style="text-align: center; margin-top: 20;font-size: 10.5pt;color: gray;">
	                  	업무 총량과 완료된 업무량을 그래프로 비교합니다. 기간 : 프로젝트 생성일부터
	                  </div>
	                </div>
                   
                  </div>
                </div>                                          
              </div>
      
      		</div>
 		</div>

      </div>
      </section>
      
<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="/team/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/team/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="/team/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/team/resources/dist/js/adminlte.js"></script>
<!-- OPTIONAL SCRIPTS -->
<script src="/team/resources/dist/js/demo.js"></script>
<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="/team/resources/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="/team/resources/plugins/raphael/raphael.min.js"></script>
<script src="/team/resources/plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="/team/resources/plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="/team/resources/plugins/chart.js/Chart.min.js"></script>
<!-- PAGE SCRIPTS -->
<script src="/team/resources/dist/js/pages/dashboard2.js"></script>
<script>
$(function() {
	// 마감일, 완료일 번경
	$(document).on("change", "#project-deadline, #project-enddate", function() {
		var date = new Date($(this).val());
		var dateType = $(this).attr("id") == "project-deadline" ? "deadline" : "enddate";

		$.ajax({
			url : "/team/project/updateProjectDate",
			method : "post",
			data : {
				"date" : date,
				"projectNo" : "${projectByNo.projectNo}",
				"dateType" : dateType
			}
		});
	});
	
	
	// 내가 작성한 업무
	//-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas = $('#myDonutChart').get(0).getContext('2d')
    var donutData        = {
      labels: [
          '완료', 
          '마감일 지남',
          '계획됨', 
          '마감일 없음' 
      ],
      datasets: [
        {
          data: ["${M_completed}", "${M_pastDeadline}", "${M_hasDeadline}", "${M_total - M_hasDeadline}"],
          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
        }
      ]
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    var donutChart = new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions      
    });
	
	///////////////////////////////////////////////////////////////
    var donutChartCanvas2 = $('#allDonutChart').get(0).getContext('2d')
    var donutData2        = {
      labels: [
          '완료', 
          '마감일 지남',
          '계획됨', 
          '마감일 없음' 
      ],
      datasets: [
        {
          data: ["${A_completed}", "${A_pastDeadline}", "${A_hasDeadline}", "${A_total - A_hasDeadline}"],
          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
        }
      ]
    }
    var donutOptions2     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    var donutChart2 = new Chart(donutChartCanvas2, {
      type: 'doughnut',
      data: donutData2,
      options: donutOptions2      
    });
	
	
  	//--------------
    //- AREA CHART -
    //--------------
    // Get context with jQuery - using jQuery's .get() method.
  	var keySet = "<c:out value='${keySet}' />".split("_");
  	var created = "<c:out value='${createdTasks}' />".split("{")[1].split("}")[0].split(",");
  	var completed = "<c:out value='${completedTasks}' />".split("{")[1].split("}")[0].split(",");
  	var createdArr = new Array(), completedArr = new Array();
  	
  	// 키셋 순서로 차트에 넣을 데이터 배열 만들기
  	for (var i = 0; i < created.length; i++){
  		for (var j = 0; j < created.length; j++) 
  			if (created[j].includes(keySet[i])) {
  				createdArr[i] = created[j].split("=")[1] == "0" ? "0" : created[j].split("=")[1]
  				completedArr[i] = completed[j].split("=")[1] == "0" ? "0" : completed[j].split("=")[1]
  				break;
  			}
  	} 
  	
    var areaChartCanvas = $('#areaChart').get(0).getContext('2d')

    var areaChartData = {
      labels  : keySet,
      datasets: [
        {
          label               : '완료된 업무량',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : completedArr
        },
        {
          label               : '전체 업무량',
          backgroundColor     : 'rgba(210, 214, 222, 1)',
          borderColor         : 'rgba(210, 214, 222, 1)',
          pointRadius         : false,
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : createdArr
        },
      ]
    }

    var areaChartOptions = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
        display: true
      },
      scales: {
        xAxes: [{
          gridLines : {
            display : true,
          }
        }],
        yAxes: [{
          gridLines : {
            display : true,
          }
        }]
      }
    }

    // This will get the first returned node in the jQuery collection.
    var areaChart       = new Chart(areaChartCanvas, { 
      type: 'line',
      data: areaChartData, 
      options: areaChartOptions
    })
});
</script>

</body>
</html>
