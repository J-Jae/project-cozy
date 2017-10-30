$(document).on("click", ".reviewImageDelBtn", function(){
	AddImageToDelete($(this));
	$(this).parent().parent().find("a").parent().remove();
});

$(document).on("change", ".uploadedImage", function() {
	AddImageToDelete($(this));
});

function AddImageToDelete(element) {
	var imageToDelete = element.parent().parent().find("a").attr("href");
	element.parent().parent().find("a").parent().remove();
	if(imageToDelete === undefined) {
		return;
	}
	
	var fileForm = '<input type="hidden" name="imageToDelete" value="' + imageToDelete + '">';
	$("#imagesToDelete").append(fileForm);
}
