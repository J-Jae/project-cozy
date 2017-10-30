function selectStore(index) {
	
	var storeName = $("#title" + index).text();
	var roadAddress = $("#roadAddress" + index).text();
	
	var storeId = checkStoreExist(storeName, roadAddress);
	
	if(storeId > 0){
		if(confirm("정말로 선택하시겠습니까?")){
			opener.takeStoreInfoCallBack(storeId, storeName, roadAddress);
			window.close();
		}
	} else {
		if(confirm("등록된 업체 정보가 없습니다. 업체등록 페이지로 가시겠습니까?")) {
			opener.location.href = "/store/register";
			window.close();
		}
	}	
	
}

function checkStoreExist(storeName, roadAddress) {
	var checkResult = 0;
	
	$.ajax({
	    url: "/store/checkExist",
	    type: "get",
	    data: {storeName: storeName, roadAddress: roadAddress},
	    dataType: "json",
	    async: false,
	    success: function(data) {
	    	checkResult = data;
	    }
	});
	
	return checkResult;
}
