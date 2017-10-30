//업체 정보 검색 이벤트
$("#searchBtn").on("click", function() {
	var searchValue = $("#storeSearchValue").val();
	$("#map").css("display", "block");

	$.ajax({
	    url: "/store/search/api",
	    type: "get",
	    data: {storeInfo: searchValue},
	    dataType: "json",
	    success: function(data) {
	    	$("#storeSearchResult").empty();
	    	
		    if(data.items.length === 0) {
		    	$("#storeSearchResult").append('<tr>'
		    			+ '<td colspan="4">조회된 결과가 없습니다.</td>'
		    			+ '</tr>');
			
		    } else {
		    	initMap(data.items[0].mapx, data.items[0].mapy);
		    	
				$.each(data.items, function(index, store) {
					$("#storeSearchResult").append('<tr>'
						+ '<td id="title' + index + '" class="col-lg-4">' + store.title + '</td>'
			    		+ '<td id="link' + index + '" class="noneShowTd">' + store.link + '</td>'
			    		+ '<td id="telephone' + index + '" class="noneShowTd">' + store.telephone + '</td>'
			    		+ '<td id="address' + index + '" class="noneShowTd">' + store.address + '</td>'
			    		+ '<td id="roadAddress' + index + '" class="col-lg-6">' + store.roadAddress + '</td>'
			    		+ '<td id="mapx' + index + '" class="noneShowTd">' + store.mapx + '</td>'
			    		+ '<td id="mapy' + index + '" class="noneShowTd">' + store.mapy + '</td>'
			    		+ '<td class="col-lg-1"><input type="button" class="btn btn-info" onClick="showStore(' + index + ')" value="보기"></td>'
			    		+ '<td class="col-lg-1"><input type="button" class="btn btn-info" onClick="selectStore(' + index + ')" value="선택"></td>'
			    		+ '</tr>');
			    });
		    }
		},
	    error: function(e) {
	    	$("#storeSearchResult").append('<tr>'
	    			+ '<td colspan="4">조회에 실패하였습니다.</td>'
	    			+ '</tr>');
	    }
	});
});


//네이버 지도 그리기
function initMap(x, y) {
	var map = null;
	var marker = null;
	
	var tmCode = new naver.maps.Point(x, y);
	var LatLngCode = naver.maps.TransCoord.fromTM128ToLatLng(tmCode);
 
	map = new naver.maps.Map('map', {
		center: new naver.maps.LatLng(LatLngCode)
		, zoom: 11
		, zoomControlOptions: {
		position: naver.maps.Position.TOP_RIGHT
     }
 });
 
 marker = new naver.maps.Marker({
     position: new naver.maps.LatLng(LatLngCode)
     , map: map
 });

}

function showStore(index) {
	
	var mapx = $("#mapx" + index).text();
	var mapy = $("#mapy" + index).text();
	
	initMap(mapx, mapy);
}
