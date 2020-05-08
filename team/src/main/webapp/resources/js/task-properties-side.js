$(document).on("click", ".task-field", function(e) {
	if($(e.target).is("label") || $(e.target).is("input")){
		return;
	} else {
	    taskNo = $(this).attr("id").substring(5);
	    taskField = $(this);
	    $(".task-field").each(function(){
	    	taskField.addClass("selected");
	    });
	    $.ajax({
			url : "/team/task/main",
			method : "get",
			success : function(resp, status, xhr) {
				$("#task-properties").addClass("open").load("/team/task/properties?taskNo="+taskNo,function(){
					$("#task-close-btn, html").addClass("open");
					window.location.hash = "#properties";
				});
			},
			error : function(xhr, status, err) {
				console.log(err);
			}
		});
	}
});

window.onhashchange = function() {
	if (location.hash != "#properties") {
		$("#task-properties, #task-close-btn, html").removeClass("open");
	} else {
		$("#task-properties, #task-close-btn, html").addClass("open");
		
	}
};
