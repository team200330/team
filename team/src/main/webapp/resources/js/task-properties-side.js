var taskField;
var taskNo;
$(document).on("click", ".task-field", function(e) {
	if($(e.target).is("label") || $(e.target).is("input")){
		return;
	} else {
	    taskNo = $(this).attr("id").substring(5);
	    taskField = $(this);
	    /*$(".task-field").each(function(){
	    	taskField.addClass("selected");
	    });*/
	    //taskField.removeClass("selected");
	    $.ajax({
			url : "/team/task/main",
			method : "get",
			success : function(resp, status, xhr) {
				$("#task-properties").addClass("open").load("/team/task/properties?taskNo="+taskNo,function(){
					$("#task-close-btn, html").addClass("open");
					//window.location.hash = "#properties";
					window.location.hash = taskNo;
					//taskField.addClass("selected");
					//$("#body-task").css("width",$("#body-task").width()+$("#task-properties").width());
					$("#temparea").css("display","block");
					
				});
			},
			error : function(xhr, status, err) {
				console.log(err);
			}
		});
	}
});

$(document).on("click","#close-properties",function(){
	$("#task-properties, #task-close-btn, html").removeClass("open");
	$("#temparea").css("display","none");
	window.location.hash = "";
});

window.onhashchange = function() {
	$(".task-field").removeClass("selected");
	if($("#task-properties, #task-close-btn, html").hasClass("open")){
		taskField.addClass("selected");
	}
	//if (location.hash != "#properties") {
	/*
	if (location.hash != taskNo) {
		$("#task-properties, #task-close-btn, html").removeClass("open");
		$(".task-field").each(function(){
	    	taskField.removeClass("selected");
	    });
	} 
	*/
	/*
	else {
		$("#task-properties, #task-close-btn, html").addClass("open");
		
	}
	*/
};



