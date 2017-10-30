//업체 검색 팝업창 띄우기
$("#storeSearchPopupBtn").on("click", function() {
	var pop = window.open("/store/certification/storeSearch", "pop", "width=1000,height=800, scrollbars=yes, resizable=yes");
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
	$("#storeCerficationForm").validate({
		rules : {
			businessNo : {
				regx: /^\d{3}\d{2}\d{5}$/
				, required: true
			}
		}
		, messages : {
			businessNo : {
				regx: "올바른 형식이 아닙니다. -을 제외하고 입력해주세요."
				, required: "필수 사항입니다."
			}
		}
	});

});
