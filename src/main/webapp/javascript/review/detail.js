$("#backBtn").on("click", function() {
	location.href = "/review";
});

$("#deleteBtn").on("click", function() {
	var isSuccess = false;
	var reviewId = $("#reviewId").val();

	$.ajax({
		url : "/review/remove",
		type : "post",
		data : {
			reviewId : reviewId
		},
		async : false,
		dataType : "json",
		success : function(data) {
			isSuccess = data;
		}
	});
	
	if (isSuccess) {
		location.href = "/review";
	} else {
		alert("이미 삭제된 리뷰입니다. 다시 확인해주세요.");
	}

});