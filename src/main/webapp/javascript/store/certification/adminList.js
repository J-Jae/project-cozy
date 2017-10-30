$("#acceptBtn").on("click", function() {
	var isSuccess = false;
	var values = $(this).val().split("/");
	var storeCertificationId = values[0];
	var nickname = values[1];
	console.log(nickname);
	$.ajax({
		url : "/store/certification/accept/admin"
		, type : "post"
		, data : {
			storeCertificationId : storeCertificationId
			, nickname : nickname
			, authorityToAdd : "HOST"
		}
		, success : function(data) {
			if(data == true) {
				location.reload();
			} else {
				alert("인증수락에 실패했습니다.");
			}
		}
		, error : function() {
			alert("인증수락에 실패했습니다.");
		}
	});
	
});

$("#rejectBtn").on("click", function() {
	var isSuccess = false;
	var storeCertificationId = $(this).val();
	
	$.ajax({
		url : "/store/certification/reject/admin",
		type : "post",
		data : {
			storeCertificationId : storeCertificationId
		},
		dataType : "json",
		success : function(data) {
			if(data == true) {
				location.reload();
			} else {
				alert("인증거절에 실패했습니다.");
			}
		}
		, error : function() {
			alert("인증거절에 실패했습니다.");
		}
	});
});
