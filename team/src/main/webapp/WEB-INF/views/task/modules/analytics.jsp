<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                      <i class="fas fa-plus-square" style="font-size: 20px;"></i>       
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-2 col-6">
                    <div class="description-block border-right">                    
                      <span class="description-text">마감일</span><br> 
                      <i class="fas fa-plus-square" style="font-size: 20px;"></i>            
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-2 col-6">
                    <div class="description-block border-right">                    
                      <span class="description-text">완료일</span><br>    
                      <i class="fas fa-plus-square" style="font-size: 20px;"></i>              
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-1 col-6">
                    <div class="description-block">                    
                      <span class="description-text">경과시간</span><br>                      
                      <h5 class="description-header" style="display: inline;">12시간</h5>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <div class="col-sm-1 col-6">
                    <div class="description-block">                    
                      <span class="description-text">남은시간</span><br>                      
                      <h5 class="description-header" style="display: inline;">12시간</h5>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-2 col-6">
                    <div class="description-block border-right border-left">                    
                      <span class="description-text">완료됨</span><br>                      
                      <h5 class="description-header" style="display: inline;">4개 업무</h5>
                      <span class="description-percentage text-success">(50%)</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-2 col-6">
                    <div class="description-block">                    
                      <span class="description-text">남은 업무</span><br>
                      <h5 class="description-header" style="display: inline;">4개 업무</h5>
                      <span class="description-percentage text-danger">(50%)</span>
                    </div>
                    <!-- /.description-block -->
                  </div>
                </div>
                <!-- /.row --> 
              </div>
            </div>
            <div class="card">
            <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <p class="text-center">
                      <strong style="font-size:20px;">프로젝트 개요</strong>
                    </p>
                    <!-- /.progress-group -->
                    <div class="progress-group text-right mb-3">
                                 완료됨 50%  (4개 업무)     마감일 지남 0%  (0개 업무)     계획됨 0%  (0개 업무)     마감일 없음 50%  (4개 업무)
                      <span class="float-right"></span>
                      <div class="progress progress-sm">
                        <div class="progress-bar bg-warning" style="width: 50%"></div>
                      </div>
                    </div>
                    <!-- /.progress-group -->
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- ./card-body -->
             </div>
            <!-- /.card -->
            <div class="card">
              <div class="card-body">              
                <div class="row">
                  <div class="col-md-12">   
                    <div class="form-group">
	                    <select class="form-control" id="input-select">
	                  	  <option>번 업</option>
	                  	  <option>번 다운</option>
	                    </select>
                    </div>
                    <div class="chart">
                      <!-- Sales Chart Canvas -->
                      <canvas id="salesChart" height="180" style="height: 180px;"></canvas>
                    </div>
                    <p class="text-center" style="font-size:12px;">전체 업무량 완료된 업무량</p>
                    <p class="text-center" style="font-size:12px;">번 업(Burn Up) 차트는 프로젝트의 크기와 완료된 업무 총량를 비교합니다. 두 개의 선이 만날 때, 프로젝트는 완료됩니다. 기간: 프로젝트 생성일부터</p>
                    <!-- /.chart-responsive -->
                  </div>
                </div>                                          
              </div>
            </div> 
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!--/. container-fluid -->
    </section>
    <!-- /.content -->

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
  $(function () {
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */

    //--------------
    //- AREA CHART -
    //--------------

    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $('#areaChart').get(0).getContext('2d')

    var areaChartData = {
      labels  : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [
        {
          label               : 'Digital Goods',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : [28, 48, 40, 19, 86, 27, 90]
        },
        {
          label               : 'Electronics',
          backgroundColor     : 'rgba(210, 214, 222, 1)',
          borderColor         : 'rgba(210, 214, 222, 1)',
          pointRadius         : false,
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : [65, 59, 80, 81, 56, 55, 40]
        },
      ]
    }

    var areaChartOptions = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines : {
            display : false,
          }
        }],
        yAxes: [{
          gridLines : {
            display : false,
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

    //-------------
    //- LINE CHART -
    //--------------
    var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
    var lineChartOptions = jQuery.extend(true, {}, areaChartOptions)
    var lineChartData = jQuery.extend(true, {}, areaChartData)
    lineChartData.datasets[0].fill = false;
    lineChartData.datasets[1].fill = false;
    lineChartOptions.datasetFill = false

    var lineChart = new Chart(lineChartCanvas, { 
      type: 'line',
      data: lineChartData, 
      options: lineChartOptions
    })

    //-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
      labels: [
          'Chrome', 
          'IE',
          'FireFox', 
          'Safari', 
          'Opera', 
          'Navigator', 
      ],
      datasets: [
        {
          data: [700,500,400,600,300,100],
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
    })

    //-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
    var pieData        = donutData;
    var pieOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    var pieChart = new Chart(pieChartCanvas, {
      type: 'pie',
      data: pieData,
      options: pieOptions      
    })

    //-------------
    //- BAR CHART -
    //-------------
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = jQuery.extend(true, {}, areaChartData)
    var temp0 = areaChartData.datasets[0]
    var temp1 = areaChartData.datasets[1]
    barChartData.datasets[0] = temp1
    barChartData.datasets[1] = temp0

    var barChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    var barChart = new Chart(barChartCanvas, {
      type: 'bar', 
      data: barChartData,
      options: barChartOptions
    })

    //---------------------
    //- STACKED BAR CHART -
    //---------------------
    var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')
    var stackedBarChartData = jQuery.extend(true, {}, barChartData)

    var stackedBarChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      scales: {
        xAxes: [{
          stacked: true,
        }],
        yAxes: [{
          stacked: true
        }]
      }
    }

    var stackedBarChart = new Chart(stackedBarChartCanvas, {
      type: 'bar', 
      data: stackedBarChartData,
      options: stackedBarChartOptions
    })
  })
</script>
</body>
</html>
