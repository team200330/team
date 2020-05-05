$(function() {
	// //////////////////////가로 횡스크롤 드래그 ///////////////////////////
	// var slider = document.querySelector('#body-task');
	var slider = $("#body-task");
	let isDown = false;
	let startX;
	let scrollLeft;
	$(document).on('mousedown', slider, function(e) {
		if ($(e.target).attr("id") != "task-container") {
			return;
		}
		if (e.which == 1) {
			isDown = true;
			// slider.classList.add('active');
			slider.addClass('active');
			// startX = e.pageX - slider.offsetLeft;
			startX = e.pageX - slider.offset().left;
			scrollLeft = slider.scrollLeft();
		}
	});
	$(document).on('mouseleave', slider, function(e) {
		if ($(e.target).attr("id") != "task-container") {
			return;
		}
		if (e.which == 1) {
			isDown = false;
			// slider.classList.remove('active');
			slider.removeClass('active');
		}
	});

	$(document).on('mouseup', slider, function(e) {
		if ($(e.target).attr("id") != "task-container") {
			return;
		}
		if (e.which == 1) {
			isDown = false;
			// slider.classList.remove('active');
			slider.removeClass('active');
		}
	});

	$(document).on('mousemove', slider, function(e) {
		if ($(e.target).attr("id") != "task-container") {
			return;
		}
		if (e.which == 1) {
			if (!isDown)
				return;
			e.preventDefault();
			// const x = e.pageX - slider.offsetLeft;
			const x = e.pageX - slider.offset().left;
			const walk = (x - startX) * 3; // scroll-fast
			// slider.scrollLeft = scrollLeft - walk;
			slider.scrollLeft(scrollLeft - walk);
			// console.log(walk);
		}
	});
	// /////////////////////////////////////////////////////////////

	// //////////////////////// 업무리스트 추가하는 메뉴 생성 /////////////////////////////
	var flag = "false";
	$(document).on("click", "#add-task-btn", function(event) {
		if (flag == "true") {
			flag = "false";
			return;
		} else {
			$("#add-task-span").hide();
			$("#add-task-textarea-div").show();
		}
	});
	$(document).on("click", "#cancel-add", function() {
		flag = "true";
		$("#add-task-textarea-div").hide();
		$("#add-task-span").show();
	});
	// /////////////////////////////////////////////////////////////////////

	// 엔터 submit 시 ajax로 tasklist Add
	$(document).on("keydown", "#add-task-textarea", function(key) {
		if (key.keyCode == 13) {
			var taskList = {
				"listName" : $("#add-task-textarea").val(),
				"projectNo" : $("#add-task-projectNo").attr("value")
			};
			$.ajax({
				url : "/team/task/addlist.action",
				method : "post",
				data : taskList,
				success : function(resp, status, xhr) {
					$("#task-body").load(
							"loadtask.action",
							function() {
								slider = $('#body-task');
								$('.taskList-task').attr('onmousemove',
										"event.stopPropagation();");
							});
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		}
	});
	// /////////////////////////////////////////////////////////////////////////

	// 업무 리스트 삭제
	$(document).on("click", ".list-delete-btn", function() {
		var listNo = $(this).parents().attr("id").substring(11);
		$.ajax({
			url : "/team/task/deletelist.action",
			method : "post",
			data : {
				"listNo" : listNo
			},
			success : function(resp, status, xhr) {
				$("#task-body").load(
						"loadtask.action",
						function() {
							slider = $('#body-task');
							$('.taskList-task').attr('onmousemove',
									"event.stopPropagation();");
						});
			},
			error : function(xhr, status, err) {
				console.log(err);
			}
		});
	});
	// /////////////////////////////////////////////////

	// 업무 삭제
	$(document).on("click",".task-delete-btn",function() {
		var taskNo = $(this).parents().attr("id").substring(5);
		$.ajax({
			url : "/team/task/deletetask.action",
			method : "post",
			data : {
				"taskNo" : taskNo
			},
			success : function(resp, status, xhr) {
				$("#task-body").load(
						"loadtask.action",
						function() {
							slider = $('#body-task');
							$('.taskList-task').attr('onmousemove',
									"event.stopPropagation();");
						});
			},
			error : function(xhr, status, err) {
				console.log(err);
			}
		});
	});

	// ///
	// 업무 추가 textarea 에 채워진 텍스트 만큼 height 늘어나게
	// $('.taskwrap').on('keyup', 'textarea', function(e) {
	$(document).on('keyup', '.taskwrap textarea', function(e) {
		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight - 12);
	});
	// $('.taskwrap').find('textarea').keyup();
	$(document).find('.taskwrap textarea').keyup();
	// //////////////////////////////////////////////

	// ///////////// 업무 추가 관련 event 들 ///////////////
	$(document).on("click", ".cancel-task-btn", function() {
		var listNo = $(this).attr("id").substring(12);
		$("#task-add-div-taskList-" + listNo).hide();
	});

	$(document).on("click", ".icon-addtask", function() {
		var listNo = $(this).attr("id").substring(22);
		$("#task-add-div-taskList-" + listNo).show();
	});

	$(document).on("click",".create-task-btn",function() {
		var listNo = $(this).attr("id").substring(12);
		var task = {
			"listNo" : listNo,
			"content" : $("#task-content-" + listNo).val(),
			"writer" : "test",
			// "startDate" : $.datepicker.formatDate('yy-mm-dd', new
			// Date()),
			// "endDate" : $.datepicker.formatDate('yy-mm-dd', new
			// Date()),
			"completedP" : "test"
		};
		$.ajax({
			url : "/team/task/addtask.action",
			method : "post",
			data : task,
			success : function(resp, status, xhr) {
				$("#task-body").load(
						"loadtask.action",
						function() {
							slider = $('#body-task');
							$('.taskList-task').attr('onmousemove',
									"event.stopPropagation();");
						});
			},
			error : function(xhr, status, err) {
				console.log(err);
			}
		});
	});
	// //////////////////////////////////////////////////////

	// 설정 누르면 contextmenu 사라지는 event
	$(document).on('click', '.menu-setting', function(e) {
		var listNo = $(e.target).attr("id").substring(13);
		target = "#tl-setting-" + listNo;
		if ($(target).hasClass('show')) {
			$(target).removeClass('show');
		} else {
			$(".tl-settings").each(function() {
				$(this).removeClass('show');
			});
			$(target).addClass('show');
		}
		if ($(".contextmenu").css('display') == 'block') {
			$(".contextmenu").hide();
		}
	});
	// ////////////// 업무 오른쪽 마우스 클릭 이벤트
	$(document).on('contextmenu', '.task-field', function(e) {
		$(".contextmenu").hide();
		$(".tl-settings").each(function() {
			$(this).removeClass('show');
		});
		// Get window size:
		var winWidth = $(this).width();
		// console.log("windWidth:"+winWidth);
		var winHeight = $(this).height();
		// console.log("winHeight:"+winHeight);
		// Get pointer position:
		var posX = e.offsetX;
		// console.log("posX:"+posX);
		var posY = e.offsetY;
		// console.log("posY:"+posY);

		// Get contextmenu size:
		// var menuWidth = $(".contextmenu").width();
		// var menuHeight = $(".contextmenu").height();

		// Security margin:
		var secMargin = 10;
		if ($(e.target).is("span")) {
			posLeft = posX + 37 + secMargin + "px";
			posTop = posY + 7 + secMargin + "px";
		} else {
			posLeft = posX + secMargin + "px";
			posTop = posY + secMargin + "px";
		}
		// Display contextmenu:
		var taskNo = $(this).attr("id").substring(5);
		$("#menu-" + taskNo).css({
			"left" : posLeft,
			"top" : posTop
		}).show();
		// Prevent browser default contextmenu.
		return false;
	});

	// Hide contextmenu:
	$(document).on("click", function(e) {
		if ($(e.target).is(".menu-setting") === false) {
			$(".tl-settings").each(function() {
				// console.log(this);
				$(this).removeClass('show');
			});
		}
		$(".contextmenu").hide();
	});

	// 업무 checkbox 변동시 처리
	$(document).on("click",".task-chbox",function(e) {
		if ($(e.target).is(":checked") == true) {
			var taskNo = $(e.target).attr("id").substring(9);
			// var curDate = $.datepicker.formatDate('yy년 mm월 dd일
			// HH시',new Date());
			// var curTime = new Date().getHours()+"시 "+ new
			// Date().getMinutes()+"분";
			var now = new Date();
			$(e.target).addClass("selected");
			console.log(taskNo);
			console.log(now);
			// console.log(curDate+" "+curTime);
			// console.log($(this).attr("id")+"체크됨");
			$.ajax({
				url : "/team/task/chstatus.action",
				method : "post",
				data : {
					"taskNo" : taskNo,
					"completed" : "1",
					"completedDate" : now
				},
				success : function(resp, status, xhr) {
					$("#task-body").load(
							"loadtask.action",
							function() {
								slider = $('#body-task');
								$('.taskList-task').attr('onmousemove',"event.stopPropagation();");
							});
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});

		} else {
			// console.log($(this).attr("id")+"해제됨");
			var taskNo = $(e.target).attr("id").substring(9);
			$(e.target).removeClass("selected");
			$.ajax({
				url : "/team/task/chstatus.action",
				method : "post",
				data : {
					"taskNo" : taskNo,
					"completed" : "0"
				},
				success : function(resp, status, xhr) {
					$("#task-body").load(
							"loadtask.action",
							function() {
								slider = $('#body-task');
								$('.taskList-task').attr('onmousemove',"event.stopPropagation();");
							});
				},
				error : function(xhr, status, err) {
					console.log(err);
				}
			});
		}
	});
});