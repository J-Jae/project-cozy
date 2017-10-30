

// 이미지 파일 등록 폼 추가 이벤트
$(document).on("click",".imageAddBtn", function(){
	var imageLength = $(".imageFileForm").length;
	if(imageLength >= 5) {
		alert("최대 5개의 이미지만 등록할 수 있습니다.");
		return;
	}
	
	var fileForm = '<div class="form-group imageFileForm">'
		+ '<div class="col-lg-2"></div>'
		+ '<div class="col-lg-4">'
		+ '<input type="file" name="imageFiles" id="imageFiles" aria-describedby="sizing-addon1">'
		+ '</div>'
		+ '<div class="col-lg-2">'
		+ '<input type="button" class="btn btn-info btn-sm imageDelBtn widthBtn" value="삭제">'
		+ '</div>';

	$(".imageFileForm").last().after(fileForm);
});


//이미지 파일 등록 폼 삭제 이벤트
$(document).on("click", ".imageDelBtn", function(){
	$(this).parent().parent().remove();
});

