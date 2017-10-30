$(document).ready(function() {
	var win = $(window);
	var searchType = $('#searchType').val();
	var nickname = $('#nickname').val();
	var pageNo = 1;
	
	printStoreList(searchType, nickname, 1); //initial view

	win.scroll(function() {
		if ($(document).height() - win.height() == win.scrollTop()) {
			pageNo = $('#pageNo').val();
			
			printStoreList($('#searchType').val(), nickname, ++pageNo);
			
			$('#pageNo').val(pageNo);
		}
	});
});


function initReviewList(searchType) {
	$("#reviewListSection").empty();
	
	$('#pageNo').val(1);
	$('#searchType').val(searchType);
	var nickname = $('#nickname').val();

	printStoreList(searchType, nickname, 1);
}

$('#tagToSearch').keypress(function(e) {
	if (e.which == 13) {
		$('#searchBtnByTag').click();
	}
});

$("#searchBtnByTag").on("click", function() {
	$("#reviewListSection").empty();
	
	$('#pageNo').val(1);
	$('#searchType').val("search");
	
	var searchType = "search"; 
	var favoriteTag = $("#tagToSearch").val();
	
	printStoreList(searchType, favoriteTag, 1);
})


function printStoreList(searchType, target, pageNo) {
	$.ajax({
		type : 'get',
		url : '/review/list/' + searchType + '/json',
		data: {'target':target, 'pageNo':pageNo},
		dataType : 'json',
		success : function(reviews) {
			$.each(reviews, function(i, review) {
				var cardElement = $("#reviewSample");
				var card = cardElement.html();
				
				card = card.replace(/%reviewId%/g,review.reviewId);
				card = card.replace('src=""', 'src="' + review.reviewImagePath + '"');
				card = card.replace('%nickname%',review.nickname);
				card = card.replace('%keywordTag%',review.keywordTag);
				card = card.replace('%modDate%',review.modifiedDate);
				card = card.replace('%storeName%',review.storeName);
				card = card.replace('%title%',review.title);
				card = card.replace('%content%',review.reviewContent);
				
				$('#reviewListSection').append(card);

			});
		},
		error : function() {
			alert('data load fail');
		}
	});
	
}