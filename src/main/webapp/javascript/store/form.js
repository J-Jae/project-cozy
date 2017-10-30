// 업체 검색 팝업창 띄우기
$("#storeSearchPopupBtn").on("click", function() {
	var pop = window.open("/store/storeSearch", "pop", "width=1000,height=800, scrollbars=yes, resizable=yes");
});

//업체정보 검색내용 받기
function takeStoreInfoCallBack(storeName, storeUrl, mainTel, roadAddress, address, mapX, mapY) {
	$("#storeName").val(storeName);
	$("#storeUrl").val(storeUrl);
	$("#mainTel").val(mainTel);
	$("#roadAddress").val(roadAddress);
	$("#address").val(address);
	$("#coordinateX").val(mapX);
	$("#coordinateY").val(mapY);
}

// 등록 폼 정규식 검사
$.validator.addMethod("regx", function(value, element, regexpr) {
		return regexpr.test(value);
	}, "형식이 올바르지 않습니다.");
	
$(document).ready(function() {
	$("#form").validate({
		rules : {
			storeName : {required : true}
			, category : {required : true}
			, roadAddress : {required : true}
			, sectionName : {required : true}
			, mainTel : {
				required : true
				, regx : /^\d{2,3}-\d{3,4}-\d{4}$/
			}
			, subTel : {
				regx : /^\d{2,3}-\d{3,4}-\d{4}$/
			}
			
		},
		messages : {
			storeName : {required : "필수항목입니다."}
			, category : {required : "필수항목입니다."}
			, roadAddress : {required : "필수항목입니다."}
			, sectionName : {required : "필수항목입니다."}
			, mainTel : {
				required : "필수항목입니다."
				, regx : "형식이 올바르지 않습니다."
			}
			, subTel : {
				regx : "형식이 올바르지 않습니다."
			}
		}
	});

});


//태그 저장 및 삭제 이벤트
$("#tagAddBtn").on("click", function() {
	var newTag = $("#newTag").val();

	if(newTag === "") {
		return;
	}
	
	var tagTypeSelector = "#" + $("#tagType").val();
	var currentTags = $(tagTypeSelector).val();
	
	if(currentTags.split("#").length > 5) {
		alert("최대 5개 이상 입력하실 수 없습니다.");
		return;
	}
	
	var updatedTags = "";
	
	if(currentTags === "") {
		updatedTags = "#" + newTag;
		
	} else {
		updatedTags = currentTags + ",#" + newTag;
		
	}
	
	$(tagTypeSelector).val(updatedTags);
	$("#newTag").val("");
	
});

$("#tagRemoveBtn").on("click", function() {
	var tagTypeSelector = "#" + $("#tagType").val();
	var currentTags = $(tagTypeSelector).val();
	var tagTotalCount = currentTags.split(",").length;

	if(tagTotalCount <= 1) {
		$(tagTypeSelector).val("");
		
	} else {
		var updatedTags = currentTags.substring(0, currentTags.lastIndexOf(","));
		$(tagTypeSelector).val(updatedTags);
		
	}
	
});
