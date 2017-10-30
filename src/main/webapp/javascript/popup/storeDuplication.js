function selectStore(index) {
	var storeName = $("#title" + index).text();
	var storeUrl = $("#link" + index).text();
	var mainTel = $("#telephone" + index).text();
	var roadAddress = $("#roadAddress" + index).text();
	var address = $("#address" + index).text();
	var mapX = $("#mapx" + index).text();
	var mapY = $("#mapy" + index).text();
	
	var isDuplication = checkStoreDuplication(storeName, roadAddress);
	
	if(isDuplication){
		alert("이미 등록된 업체입니다.");
	} else {
		opener.takeStoreInfoCallBack(storeName, storeUrl, mainTel, roadAddress, address, mapX, mapY);
		window.close();
	}	
	
}

function checkStoreDuplication(storeName, roadAddress) {
	var checkResult = false;
	
	$.ajax({
	    url: "/store/checkDuplication",
	    type: "get",
	    data: {storeName: storeName, roadAddress: roadAddress},
	    dataType: "json",
	    async: false,
	    success: function(storeId) {
	    	checkResult = storeId;
	    }
	});
	
	return checkResult;
}
