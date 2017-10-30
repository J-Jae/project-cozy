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

	$(".imageFileBox").append(fileForm);
});

$(document).on("click", ".imageDelBtn", function(){
	AddImageToDelete($(this));
	$(this).parent().parent().remove();
});

$(document).on("click", ".menuImageDelBtn", function() {
	AddImageToDelete($(this))
	$(this).parent().parent().find("a").remove();
});

$(document).on("change", ".uploadedImage", function() {
	AddImageToDelete($(this));
	$(this).parent().parent().find("a").parent().remove();
});

function AddImageToDelete(element) {
	var imageToRemove = element.parent().parent().find("a").attr("href");
	
	if(imageToRemove === undefined) {
		return;
	}
	
	var fileForm = '<input type="hidden" name="imagePathsToRemove" value="' + imageToRemove + '">';
	$("#imagesToRemove").append(fileForm);
}


$("#backUrlBtn").on("click", function() {
	history.back();	
});
