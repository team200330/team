$(document).on("click", ".task-field", function(e) {
	if($(e.target).is("label") || $(e.target).is("input")){
		return;
	} else {
	    //$('#task-side-taskno').text($(this).attr("id"));
	    taskNo = $(this).attr("id").substring(5);
	    console.log(taskNo);
	    $.ajax({
			url : "/team/task/main",
			method : "get",
			success : function(resp, status, xhr) {
				$("#task-properties").load("/team/task/properties?taskNo="+taskNo,function(){
					$("#task-menu, .task-page_cover, .task-close-btn, html").addClass("open");
				    window.location.hash = "#properties";
				});
			},
			error : function(xhr, status, err) {
				console.log(err);
			}
		});
	    /*
	    $.ajax({
			url : "/team/task/loadselectedtask.action",
			method : "post",
			data : {
				"taskNo" : taskNo
			},
			success : function(resp, status, xhr) {
				$("#task-properties").load("loadproperties.action",function(){
					$("#task-menu, .task-page_cover, .task-close-btn, html").addClass("open");
				    window.location.hash = "#properties";
				});
			},
			error : function(xhr, status, err) {
				console.log(err);
			}
		});
		*/
	}
});

window.onhashchange = function() {
	if (location.hash != "#properties") {
		$("#task-menu,.task-page_cover, .task-close-btn, html").removeClass("open");
	}
};
