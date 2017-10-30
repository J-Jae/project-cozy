//업체 검색 팝업창 띄우기
$("#storeSearchPopupBtn").on("click", function() {
	var pop = window.open("/review/storeSearch", "pop", "width=1000,height=800, scrollbars=yes, resizable=yes");
});

//업체정보 검색내용 받기
function takeStoreInfoCallBack(storeId, storeName, roadAddress) {
	$("#storeId").val(storeId);
	$("#storeName").val(storeName);
	$("#roadAddress").val(roadAddress);
}

// 등록 폼 정규식 검사
$.validator.addMethod("regx", function(value, element, regexpr) {
		return regexpr.test(value);
	}, "형식이 올바르지 않습니다.");
	
$(document).ready(function() {
	$("#form").validate({
		rules : {
			title : {
				maxlength : 20
			}
			, reviewContent : {
				maxlength : 140
			}
			, subTel : {
				regx : /^\d{2,3}-\d{3,4}-\d{4}$/
			}
		},
		messages : {
			title : {
				maxlength : "최대 20자까지 입력하실 수 있습니다."
			}
			, reviewContent : {
				maxlength : "최대 140자까지 입력하실 수 있습니다."
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
	
	var currentTags = $("#keywordTag").val();

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
	
	$("#keywordTag").val(updatedTags);
	$("#newTag").val("");
	
});

$("#tagRemoveBtn").on("click", function() {
	var currentTags = $("#keywordTag").val();
	var tagTotalCount = currentTags.split(",").length;

	if(tagTotalCount <= 1) {
		$("#keywordTag").val("");
		
	} else {
		var updatedTags = currentTags.substring(0, currentTags.lastIndexOf(","));
		$("#keywordTag").val(updatedTags);
		
	}
	
});
