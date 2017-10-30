<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/store/lightslider.css">
<link rel="stylesheet" href="/css/store/reply.css">
<link rel="stylesheet" href="/css/store/starRating.css">
<link rel="stylesheet" href="/css/review/list.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Detail</title>
<style>
body {
	font-family: arial, sans-serif;
	font-size: 14px;
	line-height: 25px;
}

.title {
	width: 700px;
	margin: auto;
	text-align: center;
}

.title .name {
	margin-right: 10px;
	font-size: 32px;
	font-weight: bold;
	color: #000;
	line-height: 40p
}

.title .category {
	font-size: 16px;
	color: #9a9a9a;
	line-height: 20px;
}

.box {
	padding: 5px;
	border: 1px solid #f0f0f0;
	border-radius: 5px;
	background: #fff;
	box-shadow: 0 0 6px rgba(0, 0, 0, 0.03);
	margin: 10px 10px 40px 10px;
}

.row {
	padding-left: 35px;
	margin-top: 5px;
	margin-bottom: 5px;
	height: 30px;
}

.txt {
	margin-top: 4px;
	margin-left: 8px;
	overflow: hidden;
	color: #424242;
	line-height: 25px;
}

.icon {
	float: left;
	margin-top: 4px;
	margin-right: 12px;
}

.slider {
	border: 1px solid rgb(210, 210, 210);
	border-radius: 5px;
	margin: auto;
	width: 750px;
	padding-bottom: 20px;
}

.slider img {
	width: 740px;
	height: 493px;
}

.slider li {
	height: 83px;
}

.clearfix {
	margin: auto;
}

.info {
	text-align: right;
}

.post {
	height: 120px;
	padding: 5px 10px;
	margin-bottom: 10px;
	background: #FFF;
	border: 1px solid #f0f0f0;
	overflow: hidden;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	border-radius: 5px;
}

.post:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.post img {
	width: 100px;
	height: 100px;
}

.post .post-img {
	float: left;
	display: inline-block;
}

.post .post-content {
	height: 100px;
	overflow: hidden;
	padding: 5px;
}

.bar {
	display: inline-block;
	margin-right: 5px;
	margin-left: 5px;
	width: 1px;
	height: 11px;
	background: #ebeef3;
	vertical-align: -2px;
}

.info {
	vertical-align: text-top;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}
.details h1 {
	font-size: 17px;
	padding-bottm:3px;
}
.info {
	margin-top:5px;
}
.rating {
  width: fit-content;
  width: -moz-fit-content;
  margin: auto;
}

</style>
</head>
<header>
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
</header>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="loginUserName" property="principal.nickname"/>
	</sec:authorize>
	
	<div class="wrap">
		<div class="container" style="width: 1024px;">
			<div class="box">
				<div class="slider">
					<div class="clearfix" style="max-width: 680px;">
						<ul id="image-gallery" class="gallery list-unstyled cS-hidden">
							<c:set var="images" value="${store.coverImagePath}"/>
							<c:forEach items="${fn:split(images, '~') }" var="image"> 
							<li data-thumb="${image}"><img src="${image}" /></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="title">
					<strong class="name">${store.storeName}</strong> <span class="category">${store.category}</span>
				</div>
				<div class="info">
					<button type="button" class="btn" onClick="favorite()">
					  <span class="glyphicon glyphicon-heart glyphicon-heart-empty" aria-hidden="true" id="favorite"></span> Favorite
					</button>
					<button type="button" class="btn btn-default" onclick="footprint()">Footprint</button>
					<a href="/review/register" class="btn btn-primary" role="button">리뷰등록</a>
					<c:choose>
						<c:when test="${isCertification}">
							<c:if test="${store.nickname eq loginUserName}">
								<a href="/store/modify?storeId=${store.storeId}" class="btn btn-info" role="button">수정</a>
							</c:if>
						</c:when>
						<c:otherwise>
							<a href="/store/modify?storeId=${store.storeId}" class="btn btn-info" role="button">수정</a>
						</c:otherwise>
					</c:choose>
					<button class="btn btn-danger" onClick="report('store', '${store.storeId}', '${store.nickname}')">신고</button>
				</div>
				<div class="func">
					<input type="hidden" id="favoriteId">
					<fieldset id="starRating" class="rating">
						<input type="radio" id="star5" name="rating" value="5" />
						<label	class="full" for="star5" title="Awesome - 5 stars"></label> 
						<input type="radio" id="star4" name="rating" value="4" />
						<label class="full" for="star4" title="Pretty good - 4 stars"></label> 
						<input type="radio" id="star3" name="rating" value="3" />
						<label class="full" for="star3" title="Meh - 3 stars"></label> 
						<input type="radio" id="star2" name="rating" value="2" />
						<label class="full" for="star2" title="Kinda bad - 2 stars"></label> 
						<input type="radio" id="star1" name="rating" value="1" />
						<label class="full" for="star1" title="Sucks big time - 1 star"></label>
					</fieldset>
					<input type="hidden" id="nickname" value="<sec:authorize access="hasAuthority('MEMBER')"><sec:authentication property="principal.nickname"/></sec:authorize>"> 
					<input type="hidden" id="storeId" value="${store.storeId}">
					<input type="hidden" id="coordinateX" value="${store.coordinateX}">
					<input type="hidden" id="coordinateY" value="${store.coordinateY}">

				</div>
				</div>
			<div>
				<h3>
					<b>상세정보</b>
				</h3>
			</div>
			<div class="box">	
				<div class="row">
					<span class="icon" aria-label="전화" role="img"><svg
							class="icon" role="presentation" version="1.1" width="17"
							height="19" viewBox="0 0 17 19">
							<path fill="#9E9E9E"
								d="M13.309,16.492l-0.314-0.062C6.572,15.15,1.596,10.172,0.316,3.745L0.254,3.431L3.682,0l5.095,5.09 L6.494,7.371c0.755,1.186,1.763,2.185,2.949,2.925l2.271-2.27l5.033,5.029L13.309,16.492z M1.559,3.822 c1.258,5.694,5.668,10.106,11.358,11.364l2.132-2.132l-3.336-3.332L9.655,11.78l-0.387-0.194c-1.712-0.962-3.098-2.341-4.052-4.01 L4.989,7.179L7.078,5.09L3.682,1.697L1.559,3.822z"></path></svg></span>

					<div class="txt">${store.mainTel}</div>

				</div>

				<div class="row">
					<span class="icon" aria-label="주소" role="img"><svg
							class="icon" role="presentation" version="1.1" width="17"
							height="19" viewBox="0 0 17 19">
							<path fill="#9E9E9E"
								d="M8.501,5.697c0.991,0,1.797,0.808,1.797,1.801c0,0.992-0.806,1.798-1.797,1.798 c-0.991,0-1.797-0.807-1.797-1.798C6.704,6.506,7.51,5.697,8.501,5.697 M8.501,4.498c-1.654,0-2.997,1.343-2.997,3.001 c0,1.655,1.342,2.999,2.997,2.999c1.654,0,2.997-1.343,2.997-2.999C11.498,5.841,10.154,4.498,8.501,4.498L8.501,4.498z M8.501,1.2 c3.473,0.002,6.3,2.832,6.3,6.308c0,1.171-0.326,2.312-0.943,3.306L8.5,17.143l-5.357-6.328C2.525,9.816,2.199,8.675,2.199,7.509 C2.201,4.032,5.028,1.202,8.501,1.2 M8.501,0C4.366,0.002,1.001,3.37,0.999,7.508c0,1.421,0.406,2.811,1.173,4.017L8.5,19 l6.328-7.475c0.769-1.205,1.172-2.591,1.172-4.017C16,3.37,12.636,0.002,8.501,0L8.501,0z"></path></svg></span>
					<div class="txt">${store.roadAddress}</div>
				</div>

				<div class="row">
					<span class="icon" aria-label="홈페이지" role="img"><svg
							class="icon" role="presentation" version="1.1" width="17"
							height="19" viewBox="0 0 17 19">
							<path fill="#9E9E9E"
								d="M15.375,9L15,8.598V15h-1V7.525l-5.5-5.9L3,7.525V15H2V8.598 L1.625,9H0l8.5-9L17,9H15.375z M11,9v6h-1V9H7v6H6V9V8h5V9z"></path></svg></span>
					<div class="txt">
						<a target="_blank" href="${store.storeUrl}">${store.storeUrl}</a>
					</div>
				</div>

				<div class="row">
					<span class="icon" aria-label="태그" role="img"><svg
							class="icon" role="presentation" version="1.1" width="17"
							height="19" viewBox="0 0 17 19">
							<path fill="#9E9E9E"
								d="M13,8V0H0v17h12h1h2c1.104,0,2-0.895,2-2V8H13z M12,8v8H1V1h11V8z M16,14.413c0,0.884-0.716,1.6-1.6,1.6H13 V9h3V14.413z M10,8H3v1h7V8z M7,11H3v1h4V11z M10,5H3v1h7V5z"></path></svg></span>
					<div class="txt">
						<c:set var="tags" value="${store.keywordTag}"/>
						<c:forEach items="${fn:split(tags, ',') }" var="tag"> 
							<a href="">${tag}</a> 
						</c:forEach>
					</div>
				</div>
				<div class="row">
					<span class="icon" aria-label="메뉴" role="img"><svg
							class="icon" role="presentation" version="1.1" width="17"
							height="19" viewBox="0 0 17 19">
							<path fill="#9E9E9E"
								d="M4.5,0C2.567,0,1,1.567,1,3.5v3c0,1.762,1.306,3.205,3,3.45V17h1V9.95C6.694,9.705,8,8.262,8,6.5v-3 C8,1.567,6.433,0,4.5,0z M6.8,6.5c0,1.268-1.032,2.3-2.3,2.3S2.2,7.769,2.2,6.5v-3c0-1.268,1.032-2.3,2.3-2.3s2.3,1.032,2.3,2.3V6.5 z M14.8,0v6.5c0,1.096-0.772,2.012-1.8,2.242V0h-1v8.742c-1.028-0.23-1.8-1.146-1.8-2.242V0H9v6.5c0,1.762,1.306,3.205,3,3.45V17h1 V9.95c1.694-0.245,3-1.688,3-3.45V0H14.8z"></path></svg></span>
					<div class="txt">
						<c:set var="tags" value="${store.menuTag}"/>
						<c:forEach items="${fn:split(tags, ',') }" var="tag"> 
							<a href="">${tag}</a> 
						</c:forEach>
					</div>
				</div>
				<c:if test="${store.menuImagePath ne ''}">
				<div class="row">
					<span class="icon" aria-label="메뉴" role="img"><svg
							class="icon" role="presentation" version="1.1" width="17"
							height="19" viewBox="0 0 17 19">
							<path fill="#9E9E9E"
								d="M4.5,0C2.567,0,1,1.567,1,3.5v3c0,1.762,1.306,3.205,3,3.45V17h1V9.95C6.694,9.705,8,8.262,8,6.5v-3 C8,1.567,6.433,0,4.5,0z M6.8,6.5c0,1.268-1.032,2.3-2.3,2.3S2.2,7.769,2.2,6.5v-3c0-1.268,1.032-2.3,2.3-2.3s2.3,1.032,2.3,2.3V6.5 z M14.8,0v6.5c0,1.096-0.772,2.012-1.8,2.242V0h-1v8.742c-1.028-0.23-1.8-1.146-1.8-2.242V0H9v6.5c0,1.762,1.306,3.205,3,3.45V17h1 V9.95c1.694-0.245,3-1.688,3-3.45V0H14.8z"></path></svg></span>
					<div class="txt">
					<a target="_blank" href="${store.menuImagePath}">메뉴판 이미지로 보기</a>
					</div>
				</div>
				</c:if>
			</div>

			<div>
				<h3>
					<b>지도</b>
				</h3>
			</div>
			<div class="box">
				<div id="map" style="width: 100%; height: 400px;"></div>
			</div>
			<div>
				<h3>
					<b>댓글</b>
				</h3>
			</div>
			<div class="box">
				<span style="float: left;"><button class="btn btn-default"
						type="button" onClick="showReply()">전체보기</button></span>
				<div class="input-group" style="margin: auto;">
					<input type="text" class="form-control" id="reply"
						placeholder="Reply">
					<div class="input-group-btn">
						<button class="btn btn-default" type="button" onClick="addReply()">
							<i class="glyphicon glyphicon-pencil"></i>
						</button>
					</div>
				</div>
				<ul class="reply" id="replyList">
				</ul>
			</div>

			<div>
				<h3>
					<b>후기</b>
				</h3>
			</div>
				<section id="reviewListSection" class="col-xs-12 col-sm-6 col-md-12">
						
				</section>


		<div id="reviewSample" style="display:none;">
			<div class="post">
			<article class="search-result row">
				<div class="col-xs-12 col-sm-12 col-md-3">
					<a href="/review/detail/%reviewId%" title="Lorem ipsum" class="thumbnail"><img id="reviewImg" src="" alt="No Image" style="width:100%;"/></a>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-2">
					<ul class="meta-search">
						<li><i class="glyphicon glyphicon-pencil"></i> <span>%nickname%</span></li>
						<li><i class="glyphicon glyphicon-tags"></i> <span>%keywordTag%</span></li>
						<li><i class="glyphicon glyphicon-time"></i> <span>%modDate%</span></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
					<h3><a href="/review/detail/%reviewId%">%title%</a></h3>
					<p>%content%</p>
				</div>
				<span class="clearfix borda"></span>
			</article>
			</div>
		</div>

		</div>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=XqclUeVzgvyiONATyRwZ&submodules=geocoder"></script>
	<script src="/javascript/store/lightslider.js"></script>

	<script>
		$(document).ready(function() {
			$('#image-gallery').lightSlider({
				gallery : true,
				item : 1,
				thumbItem : 5,
				slideMargin : 0,
				speed : 500,
				auto : true,
				loop : true,
				onSliderLoad : function() {
					$('#image-gallery').removeClass('cS-hidden');
				}
			});

			getFavoriteState();
			getReply();
			getRatingState();
			
			var win = $(window);
			var storeId = $('#storeId').val();
			var pageNo = 1;
			
			printReviewList(storeId, 1);
			
			win.scroll(function() {
				if ($(document).height() - win.height() == win.scrollTop()) {
					printReviewList(storeId, ++pageNo);
				}
			});
		})

		var x = $('#coordinateX').val();
		var y = $('#coordinateY').val();

		var tmCode = new naver.maps.Point(x, y);
		var LatLngCode = naver.maps.TransCoord.fromTM128ToLatLng(tmCode);
		
		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(LatLngCode),
			zoom : 12
		});

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(LatLngCode),
			map : map
		});

		map.setOptions("scrollWheel", false);

		function report(type, id, writer) {
			var nickname = $('#nickname').val();

			var url = '/report/popup?' + 'writer=' + writer + '&nickname=' + nickname
					+ '&type=' + type + '&targetId=' + id;
			window.open(url, "newWindow", "width=400, height=400");
		}

		function getFavoriteState() {
			var nickname = $('#nickname').val();
			var storeId = $('#storeId').val();
			$.ajax({
				type : 'get',
				url : '/favorite/state',
				data : {
					'nickname' : nickname,
					'storeId' : storeId
				},
				success : function(data) {
					if (data.toggle == 'ON') {
						console.log("favorite state == ON");
						$('#favoriteId').val(data.id);
						$('#favorite').toggleClass('glyphicon-heart-empty');
					}
					else if(data.toggle == 'OFF') {
						console.log("favorite state == NULL");
						$('#favoriteId').val(data.id);
					}
				},
				error : function() {
					alert('getFavoriteState error');
				}
			});
		}

		function favorite() {
			var favoriteId = $('#favoriteId').val();
			var nickname = $('#nickname').val();
			var storeId = $('#storeId').val();

			if (favoriteId == '') { //insert
				$.ajax({
					type : 'post',
					url : '/favorite/register',
					data : {
						'nickname' : nickname,
						'storeId' : storeId
					},
					success : function(data) {
						console.log('favorite insert - ');
						getFavoriteState();
					},
					error : function() {
						alert('toggle favorite error');
					}
				});
			} else { //toggle
				$.ajax({
					type : 'post',
					url : '/favorite/' + favoriteId,
					success : function(data) {
						console.log('favorite toggle - ' + data);
						$('#favorite').toggleClass('glyphicon-heart-empty');
					},
					error : function() {
						alert('error');
					}
				});
			}
		}

		function getReply() {
			var storeId = $('#storeId').val();
			$.ajax({
				type : 'get',
				url : '/reply/json/store/' + storeId,
				success : function(datas) {
					console.log("reply load");
					$('#replyList').html('');
					$.each(datas, function(i, data) {
						$('#replyList').append('<div class="item"><div class="image"><div><img src="/img/profile.png" /></div></div><div class="details"><div>' +
								    			'<h1><b>' + data.nickname + '</b></h1><p>' + data.comment +'</p></div></div></div>');
					});
				},
				error : function() {
					alert('reply load fail');
				}
			});
		}
		function addReply() {
			var nickname = $('#nickname').val();
			var storeId = $('#storeId').val();
			var comment = $('#reply').val();

			if ($("#reply").val() == '') {
				alert('내용을 입력하세요.');
				return false;
			}

			$.ajax({
				type : 'post',
				url : '/reply/register',
				data : {
					'storeId' : storeId,
					'nickname' : nickname,
					'comment' : comment
				},
				success : function(data) {
					getReply();
				},
				error : function() {
					alert('error');
				}
			});
		}

		function showReply() {
			var storeId = $('#storeId').val();
			var url = '/reply/all/' + storeId;

			window.open(url, "newWindow", "width=1000, height=550");
		}
		
		
		function getRatingState() {
			var nickname = $('#nickname').val();
			var storeId = $('#storeId').val();
			
			$.ajax({
				type : 'get',
				url : '/mark/state',
				data : {
					'nickname' : nickname,
					'storeId' : storeId
				},
				dataType : 'json',
				success : function(data) {
					if(!$.trim(data)) {
						console.log('point Not Fount');
					}
					else {
						console.log('point : ' + data.point);
						$("input[name=rating][value=" + data.point + "]").prop("checked",true);
						$("input[name=rating]").attr("disabled",true);
					}
				},
				error : function() {
					console.log('Rating state load fail');
				}
			});
		}
		
		
		$("input:radio[name=rating]").change(function () {
			var point = $(":input:radio[name=rating]:checked").val();
			var nickname = $('#nickname').val();
			var storeId = $('#storeId').val();
			
			$.ajax({
				type : 'post',
				url : '/mark/register',
				data : {
					'point' : point,
					'nickname' : nickname,
					'storeId' : storeId
				},
				dataType : 'json',
				success : function(data) {
					switch(data) {
					case true:
						alert('투표완료');
						$("input[name=rating][value=" + data.point + "]").prop("checked",true);
						$("input[name=rating]").attr("disabled",true);
						break;
					default:
						alert('서버오류')
					}
				},
				error : function() {
					alert('로그인한 유저만 가능합니다.');
					$("input[name=rating][value=" + point + "]").prop("checked",false);
				}
			});
		});
		
		function printReviewList(storeId, pageNo) {
			$.ajax({
				type : 'get',
				url : '/review/list/store/json',
				data: {'storeId':storeId, 'pageNo':pageNo},
				dataType : 'json',
				success : function(reviews) {	
					$.each(reviews, function(i,review) {
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
		
		function footprint() {
			var nickname = $('#nickname').val();
			var storeId = $('#storeId').val();
			$.ajax({
				type : 'post',
				url : '/footprint/register',
				data : {
					'nickname' : nickname,
					'storeId' : storeId
				},
				success : function(data) {
					if(data==true) {
						alert('등록완료');
					}
					else {
						alert('로그인한 유저만 가능합니다.');
					}
				},
				error : function() {
					alert('로그인한 유저만 가능합니다.');
				}
			});
		}
	</script>

</body>
</html>
