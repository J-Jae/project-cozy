$(".detailBtn").on("click", function() {
	var url = "";
	var size = "";
	var index = $(".detailBtn").index(this);
	
	var reportId = $(this).val().split("/")[0];
	var replyId = $(this).val().split("/")[1];
	var type = $(".reportType").eq(index).text();
	var date = $(".registeredDate").eq(index).text();

	if(type === 'reply') {
		url = "/report/detail/reply/" + reportId + "/" + replyId; 
		size = "width=800px,height=400px, scrollbars=yes, resizable=yes";
	} else {
		url = "/report/detail/store/" + reportId  + "/" + replyId + "/" + date;
		size = "width=1024px,height=960px, scrollbars=yes, resizable=yes";
	}
	
	window.open(url, "pop", size);
});