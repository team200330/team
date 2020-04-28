// CSS

// 상단 로그 / 피드백 메뉴 css
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

// 피드백 멤버이미지 css
$(document).on("click", ".user-count-img, .user-count-span", function(event) {
	var target = $(this).parents(".user-block").children(".username").children(".hover-user-block");
	
	if (target.hasClass("display-none")) {
		target.fadeIn(200);
		target.removeClass("display-none");
	} else {
		target.fadeOut(200);
		target.addClass("display-none");
	}
	event.stopPropagation(); // 상위 이벤트 발생을 막음
});

// 작은모달 멤버추가 css
$("._mem, .task").hover(function() {
	$(this).css({"background-color" : "#dedede", "border" : "1px solid #dedede"});
}, function() {
	$(this).css({"background-color" : "white", "border" : "1px solid white"});
});

$("#addFooter").hover(function() {
	$(this).css("background-color", "#148192");
}, function() {
	$(this).css("background-color", "#17a2b8");
});

// 피드백 post css
$(document).on({
    mouseenter: function () {
    	$(this).css("background-color", "#efefef");
    },
    mouseleave: function () {
    	$(this).css("background-color", "white");
    }
}, ".post"); 

// 모달 show
$("#writeFeedbackBtn").click(function() {
	$("#writeFeedbackModal").modal();
});
$("#add_mem").click(function() {
	$("#memberAddModal").modal();
});
$("#add_task").click(function() {
	$("#taskAddModal").modal();
});



// select box
$(".feedback .dropdown-item").click(function() {
	$("#dropdown-select").text($(this).text());
	$("#dropdown-select").attr("data-value", $(this).attr("data-value"));
});

// 열기 / 닫기 함수
function closeOrOpen(target) {
	if (target.hasClass("display-none")) {
		target.removeClass("display-none");
		target.addClass("display-block");
	}
	else {
		target.addClass("display-none");
		target.removeClass("display-block");
	}
}

// 댓글 열기 / 닫기 버튼
$(document).on("click", ".comment-btn", function() {
	closeOrOpen($(this).parents(".post").children(".comments"));
});