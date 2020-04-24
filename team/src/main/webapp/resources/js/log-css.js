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

// 로그 마우스올렸을때 CSS
$(document).on({
    mouseenter: function () {
    	$(this).css("background-color", "#efefef");
		$(this).children(":nth-child(3)").children("div").html(
			'읽은 상태로 표시<i class="far fa-check-square log-check-btn"></i>&nbsp;&nbsp;' +
	        '삭제<i class="fas fa-times log-delete-btn"></i>'
		);
    },
    mouseleave: function () {
    	$(this).css("background-color", "white");
		var date = $(this).children(":nth-child(3)").children("input").val();
		$(this).children(":nth-child(3)").children("div").html(date);
    }
}, ".unchecked-log"); 
$(document).on({
    mouseenter: function () {
		$(this).children(":nth-child(3)").children("div").html(
	        '삭제<i class="fas fa-times log-delete-btn"></i>'
		);
    },
    mouseleave: function () {
		var date = $(this).children(":nth-child(3)").children("input").val();
		$(this).children(":nth-child(3)").children("div").html(date);
    }
}, ".checked-log");


// select box
$(".log .dropdown-item").click(function() {
	$("#dropdown-select").text($(this).text());
	$("#dropdown-select").attr("data-value", $(this).attr("data-value"));
});