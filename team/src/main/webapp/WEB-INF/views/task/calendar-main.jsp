<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8"%>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>team</title>

  <%@include file="/WEB-INF/views/modules/common-css.jsp" %>
	<!-- fullCalendar -->
	  <link rel="stylesheet" href="/team/resources/plugins/fullcalendar/main.min.css">
	  <link rel="stylesheet" href="/team/resources/plugins/fullcalendar-daygrid/main.min.css">
	  <link rel="stylesheet" href="/team/resources/plugins/fullcalendar-timegrid/main.min.css">
	  <link rel="stylesheet" href="/team/resources/plugins/fullcalendar-bootstrap/main.min.css">
	  
<style>
.fc-content{margin:1px;}
.fc-day-top{cursor:pointer}
section.section-header {
	position: relative;
	z-index: 1;
	display: flex;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-items: center;
	height: 50px;
}

.f_link {
	padding: 22px;
	color: #464c59;
	font-weight: bold;
}
#active { border-bottom: 3px solid #17a2b8; color:#17a2b8; }
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

  <!-- Navbar -->
  <%@include file="/WEB-INF/views/modules/topbar.jsp" %>
  <!-- /.navbar -->

<div class="wrapper">

  <!-- Main Sidebar Container -->
  <%@include file="/WEB-INF/views/modules/sidebar.jsp" %>

  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   <section class="section-header" style="">
		<div class="header-left"
			style="flex-basis: 20%; padding-top: 20px; padding-left: 20px; display: flex; flex-wrap: nowrap;">
			<button type="button" class="btn btn-secondary" onclick="location.href='/team/project/prlist';"
				style="height: 30px;">
				<i class="fas fa-arrow-left"></i>
			</button>
			<a href="#" id="project-name" style="padding-left: 20px; font-size: 20px; font-weight: bold;">${projectByNo.projectName }</a>
		</div>
		<div class="header-center"
			style="flex-basis: 60%; text-align: center; padding-top: 20px;">
			<a id="active2" class="f_link" href="/team/task/main">업무</a>&nbsp;&nbsp;
			<a id="active4" class="f_link" href="/team/task/timeline">타임라인</a>&nbsp;&nbsp;
			<a id="active" class="f_link" href="/team/task/calendar">캘린더</a>&nbsp;&nbsp;
			<a id="active3" class="f_link" href="/team/task/analyticsmain">분석</a>
		</div>
		<div class="header-right"
			style="flex-basis: 20%; padding-top: 20px;"></div>
	</section>
	<hr />

    <!-- Main content -->
    <section class="content" id="calendar-container">
     	<jsp:include page="modules/calendar.jsp" />
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<div id="modal-container">
	<jsp:include page="modules/calendar-modals.jsp"/>
</div>
 
 <%@include file="/WEB-INF/views/modules/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- fullCalendar 2.2.5 -->
	<script src="/team/resources/plugins/moment/moment.min.js"></script>
	<script src="/team/resources/plugins/fullcalendar/main.min.js"></script>
	<script src="/team/resources/plugins/fullcalendar-daygrid/main.min.js"></script>
	<script src="/team/resources/plugins/fullcalendar-timegrid/main.min.js"></script>
	<script src="/team/resources/plugins/fullcalendar-interaction/main.min.js"></script>
	<script src="/team/resources/plugins/fullcalendar-bootstrap/main.min.js"></script>


  <%@include file="/WEB-INF/views/modules/common-js.jsp" %>

<script type="text/javascript">
$(function() {
    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    ini_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendarInteraction.Draggable;

    var containerEl = document.getElementById('external-events');
    var checkbox = document.getElementById('drop-remove');
    var calendarEl = document.getElementById('calendar');

    
    
    
    /////////////////////////////////////////////
    
    var tasks = ${tasks};
    var colorArr = ['#f56954','#f39c12','#0073b7','#00c0ef','#3c8dbc','#007bff'];
    var colorIdx = 0;
    
    // ì»¨í¸ë¡¤ë¬ìì ë°ì json ê°ì²´ë¥¼ ìºë¦°ë ì´ë²¤í¸ íìì ë§ê² ì¡°ì 
    var taskEvents = new Array();
    for (var i = 0; i < tasks.length; i++) {
    	var event = new Object();
    	if (tasks[i].startDate != null && tasks[i].endDate != null) {
    		var s = tasks[i].s_startDate.split("-");
    		var e = tasks[i].s_endDate.split("-");
    		
    		event.title = tasks[i].content;
        	event.start = new Date(s[0], s[1] - 1, s[2]);
        	event.end = new Date(e[0], e[1] - 1, e[2]);
        	event.backgroundColor = colorArr[colorIdx]; 
            event.borderColor = colorArr[colorIdx++]; 
            event.allDay = true;
    	}
    	
    	if(colorIdx >= colorArr.length) colorIdx = 0;
    	
    	taskEvents.push(event);
    } 
    
    
    
    
    
    
    ////////////////////////////////////////////////
    // initialize the external events
    // -----------------------------------------------------------------

    /* new Draggable(containerEl, {
      itemSelector: '.external-event',
      eventData: function(eventEl) {
        console.log(eventEl);
        return {
          title: eventEl.innerText,
          backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
        };
      }
    }); */

    var calendar = new Calendar(calendarEl, {
      plugins: [ 'bootstrap', 'interaction', 'dayGrid', 'timeGrid' ],
      header    : {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      'themeSystem': 'bootstrap',
      events : taskEvents,
      editable  : false,
      droppable : false, // this allows things to be dropped onto the calendar !!!
      drop      : function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      }    
    });

    calendar.render();
    // $('#calendar').fullCalendar()

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    //Color chooser button
    var colorChooser = $('#color-chooser-btn')
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      //Save color
      currColor = $(this).css('color')
      //Add color effect to button
      $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
      })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      //Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      //Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.html(val)
      $('#external-events').prepend(event)

      //Add draggable funtionality
      ini_events(event)

      //Remove event from text input
      $('#new-event').val('')
    })
    
    
    
   
    //////////////////////////////////////////////////////////////////
    var newStartdate;
    var selectedListNo;
    var selectedListName;
    
    // 날짜 빈칸클릭시
    $(document).on("click", ".fc-day-top", function() {
    	newStartdate = $(this).attr("data-date");
    	// 프로젝트 번호로 업무리스트 가져오고 모달에 데이터 채우기
    	$.ajax({
    		url : "/team/task/getTaskLists",
    		success : function() {
    			$("#modal-container").load("/team/task/loadCalendarModal", function() {
    				$("#selectTaskListModal").modal();	
    			});
    		}
    	});
    });
    
    // 업무리스트 선택
    $(document).on("click", ".tasklist-select-btn", function() {
    	var my = $(this);
    	
    	$(".tasklist-tr").each(function() {
    		var target = $(this).find(".tasklist-select-btn");
    		if (target.html().includes("<i")) {
    			target.removeClass("selected-task-list");
    			target.html("선택");
    		}
    	})
    	
    	my.html("<i class='fas fa-check' style='margin-right:10px'></i>" + my.html());
   		my.addClass("selected-task-list");
   		selectedListNo = my.attr("id");
   		selectedListName = my.parents("tr").children("td:first-child").text();
   		
   		console.log(selectedListName);
    });
    
    // 업무리스트 선택 완료하고 업무작성 모달 띄우기
    $(document).on("click", "#select-modal-next-btn", function(e) {
    	if (selectedListNo == undefined || selectedListNo == null) {
    		alert("업무리스트가 선택되지 않았습니다.");
    		e.preventDefault();
    		return false;
    	}
    	
    	$("#listName").text(selectedListName);
    	$("#addTaskModal").modal();
    	$("#selectTaskListModal").modal("hide");	
    });
    
    // 업무 작성
    $(document).on("click", "#task-add-btn", function(e) {
    	if ($("#addTaskModal textarea").val().length == 0) {
    		alert("업무 내용을 작성해 주세요.");
    		e.preventDefault();
    		return false;
    	}

    	$("#addTaskModal #listNo").val(selectedListNo);
    	$("#addTaskModal #startDate").val(new Date(newStartdate));
    	$("#addTaskModal #endDate").val(new Date(newStartdate));
    	
    	alert("업무 작성이 완료되었습니다.");
    	
    	$("#addTaskModal form").submit();
    
    });
});
</script>

</body>

</html>
