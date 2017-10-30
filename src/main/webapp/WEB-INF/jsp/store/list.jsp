<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>Store List</title>
  <style>
  
  .card {
  	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
	height:350px;
	border: 1px solid #f0f0f0;
	overflow:hidden;
	margin:20px 40px 10px 40px;
	float:left;
  }
  .card:hover {
  	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  }
  .card h4 {
  	margin-bottom:10px;
  	font-size: 14px;
  }
  .card ul {
  	list-style:none;
  	padding:0px;
  }
  .card li {
  	font-size:12px;
  	margin-bottom:4px;
  }
  .card li .icon {
  	margin-right:2px;
  }
  .card img {
  	width:100%;
  	height:200px;
  }
  .card .img {
  	width:100%;
  	height:200px;
  	font-size: 35px;
	text-align: center;
  }
  .card .head {
  	text-align:center;
  	overflow: inherit;
    height: 22px;
  }
  .card .title {
  	font-size:20px;
  	font-weight: bold;
  }
  .card a:hover {
    color:#00A0C6; 
    text-decoration:none; 
    cursor:pointer;  
  }
  </style>
</head>

<header>
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
</header>

<body>
<div class="wrap">
<div class="container" style="width:1024px;">

<input type="hidden" id="type" value="all">
<input type="hidden" id="orderBy" value="Latest">
<input type="hidden" id="pageNo" value="1">
<input type="hidden" id="nickname" value="<sec:authorize access="hasAuthority('MEMBER')"><sec:authentication property="principal.nickname"/></sec:authorize>" >


<div class="container-fluid">
  <ul class="nav nav-tabs">
    <li class="active"><a href="javascript:void(0)" onclick="initStoreList('all', $('#orderBy').val());">All</a></li>
    <li><a href="javascript:void(0)" onclick="initStoreList('favorite', $('#orderBy').val());">즐겨찾기</a></li>
    <li><a href="javascript:void(0)" onclick="initStoreList('tag', $('#orderBy').val());">관심태그</a></li>
    <li><a href="javascript:void(0)" onclick="initStoreList('section', $('#orderBy').val());">내 지역</a></li>
    <li style="float:right;"><a href="/store/register">업체등록</a></li>
    <li class="dropdown" style="float:right; margin-right:30px;">
      <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)" id="order">Latest<span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="javascript:void(0)" onclick="initStoreList($('#type').val(), 'Latest');">Latest</a></li>
        <li><a href="javascript:void(0)" onclick="initStoreList($('#type').val(), 'Rating');">Rating</a></li>
      </ul>
    </li>
  </ul>
</div>
<div id="list">

</div>
</div>
</div>
<div id="card" class="col-sm-3 card" style="display:none;">
<div class="img">
<img src="%imgPath%" alt="No Image"></div>
<div class="info">
<div class="head"><h4><b>%title%</b></h4></div>
	<div class="detail">
		<ul>
		<li><span class="icon" aria-label="전화" role="img"><svg class="icon" role="presentation" version="1.1" width="17" height="19" viewBox="0 0 17 19"><path fill="#9E9E9E" d="M13.309,16.492l-0.314-0.062C6.572,15.15,1.596,10.172,0.316,3.745L0.254,3.431L3.682,0l5.095,5.09 L6.494,7.371c0.755,1.186,1.763,2.185,2.949,2.925l2.271-2.27l5.033,5.029L13.309,16.492z M1.559,3.822 c1.258,5.694,5.668,10.106,11.358,11.364l2.132-2.132l-3.336-3.332L9.655,11.78l-0.387-0.194c-1.712-0.962-3.098-2.341-4.052-4.01 L4.989,7.179L7.078,5.09L3.682,1.697L1.559,3.822z"></path></svg></span>
		%tel%</li> 
		<li><span class="icon" aria-label="주소" role="img"><svg class="icon" role="presentation" version="1.1" width="17" height="19" viewBox="0 0 17 19"><path fill="#9E9E9E" d="M8.501,5.697c0.991,0,1.797,0.808,1.797,1.801c0,0.992-0.806,1.798-1.797,1.798 c-0.991,0-1.797-0.807-1.797-1.798C6.704,6.506,7.51,5.697,8.501,5.697 M8.501,4.498c-1.654,0-2.997,1.343-2.997,3.001 c0,1.655,1.342,2.999,2.997,2.999c1.654,0,2.997-1.343,2.997-2.999C11.498,5.841,10.154,4.498,8.501,4.498L8.501,4.498z M8.501,1.2 c3.473,0.002,6.3,2.832,6.3,6.308c0,1.171-0.326,2.312-0.943,3.306L8.5,17.143l-5.357-6.328C2.525,9.816,2.199,8.675,2.199,7.509 C2.201,4.032,5.028,1.202,8.501,1.2 M8.501,0C4.366,0.002,1.001,3.37,0.999,7.508c0,1.421,0.406,2.811,1.173,4.017L8.5,19 l6.328-7.475c0.769-1.205,1.172-2.591,1.172-4.017C16,3.37,12.636,0.002,8.501,0L8.501,0z"></path></svg></span>
		%address%</li>
		<li><span class="icon" aria-label="태그" role="img"><svg class="icon" role="presentation" version="1.1" width="17" height="19" viewBox="0 0 17 19"><path fill="#9E9E9E" d="M13,8V0H0v17h12h1h2c1.104,0,2-0.895,2-2V8H13z M12,8v8H1V1h11V8z M16,14.413c0,0.884-0.716,1.6-1.6,1.6H13 V9h3V14.413z M10,8H3v1h7V8z M7,11H3v1h4V11z M10,5H3v1h7V5z"></path></svg></span>
		<a href="">%tag%</a></li>
		</ul>
	</div>
</div>
</div>
<script>

$(document).ready(function() {
	var win = $(window);
	
	printStoreList($('#type').val(), $('#nickname').val(), $('#orderBy').val(), 1); //initial view
	
	win.scroll(function() {
		if ($(document).height() - win.height() == win.scrollTop()) {
			var pageNo = $('#pageNo').val();
			printStoreList($('#type').val(), $('#nickname').val(), $('#orderBy').val(), ++pageNo);
			$('#pageNo').val(pageNo);
		}
	});
});

function initStoreList(type, orderBy) {
	$('#type').val(type);
	$('#order').text(orderBy);
	$('#orderBy').val(orderBy);
	$('#pageNo').val(1);
	$('#list').html('');
	
	printStoreList(type, $('#nickname').val(), orderBy, 1);
}

function printStoreList(type, nickname, orderBy, pageNo) {
	var cardElement = '<div class="col-sm-3 card"><a href="/store/detail/%storeId%"><div class="img"><img src="%imgPath%" alt="No Image"/></div></a>'
		+ '<div class="info"><div class="head"><h4><b>%title%</b></h4></div>'
		+ '<div class="detail"><ul><li><span class="icon" aria-label="전화" role="img"><svg class="icon" role="presentation" version="1.1" width="17" height="19" viewBox="0 0 17 19"><path fill="#9E9E9E" d="M13.309,16.492l-0.314-0.062C6.572,15.15,1.596,10.172,0.316,3.745L0.254,3.431L3.682,0l5.095,5.09 L6.494,7.371c0.755,1.186,1.763,2.185,2.949,2.925l2.271-2.27l5.033,5.029L13.309,16.492z M1.559,3.822 c1.258,5.694,5.668,10.106,11.358,11.364l2.132-2.132l-3.336-3.332L9.655,11.78l-0.387-0.194c-1.712-0.962-3.098-2.341-4.052-4.01 L4.989,7.179L7.078,5.09L3.682,1.697L1.559,3.822z"></path></svg></span>'
		+ '%tel%</li> '
		+ '<li><span class="icon" aria-label="주소" role="img"><svg class="icon" role="presentation" version="1.1" width="17" height="19" viewBox="0 0 17 19"><path fill="#9E9E9E" d="M8.501,5.697c0.991,0,1.797,0.808,1.797,1.801c0,0.992-0.806,1.798-1.797,1.798 c-0.991,0-1.797-0.807-1.797-1.798C6.704,6.506,7.51,5.697,8.501,5.697 M8.501,4.498c-1.654,0-2.997,1.343-2.997,3.001 c0,1.655,1.342,2.999,2.997,2.999c1.654,0,2.997-1.343,2.997-2.999C11.498,5.841,10.154,4.498,8.501,4.498L8.501,4.498z M8.501,1.2 c3.473,0.002,6.3,2.832,6.3,6.308c0,1.171-0.326,2.312-0.943,3.306L8.5,17.143l-5.357-6.328C2.525,9.816,2.199,8.675,2.199,7.509 C2.201,4.032,5.028,1.202,8.501,1.2 M8.501,0C4.366,0.002,1.001,3.37,0.999,7.508c0,1.421,0.406,2.811,1.173,4.017L8.5,19 l6.328-7.475c0.769-1.205,1.172-2.591,1.172-4.017C16,3.37,12.636,0.002,8.501,0L8.501,0z" ></path></svg></span>'
		+ '%section%</li>'
		+ '<li><span class="icon" aria-label="태그" role="img"><svg class="icon" role="presentation" version="1.1" width="17" height="19" viewBox="0 0 17 19"><path fill="#9E9E9E" d="M13,8V0H0v17h12h1h2c1.104,0,2-0.895,2-2V8H13z M12,8v8H1V1h11V8z M16,14.413c0,0.884-0.716,1.6-1.6,1.6H13 V9h3V14.413z M10,8H3v1h7V8z M7,11H3v1h4V11z M10,5H3v1h7V5z"></path></svg></span>'
		+ '<a href="">%tag%</a></li>'
		+ '<li><span class="icon" aria-label="태그" role="img"><img src="img/star-rate.svg" style="width:17px; height:19px;"></img></span> %rate%</li></ul></div></div></div>'; 
	console.log("type:"+type+"  nickname:"+nickname+"  order:"+orderBy+"  paghNo:"+pageNo);
	$.ajax({
		type : 'get',
		url : '/store/list/' + type + '/json',
		data: {'nickname':nickname, 'orderBy':orderBy, 'pageNo':pageNo},
		dataType : 'json',
		success : function(datas) {
			$.each(datas, function(i,data) {
				var card = cardElement;
				card = card.replace('%storeId%',data.storeId);
				card = card.replace('%imgPath%',data.coverImagePath.split('~')[0]);
				card = card.replace('%title%',data.storeName);
				if(data.rate!= null) {
					var rate = data.rate.toString();
					card = card.replace('%rate%',rate.substring(0,3));
				}
				else {
					card = card.replace('%rate%','');
				}
				card = card.replace('%tel%',data.mainTel);
				card = card.replace('%section%',data.sectionName);
				card = card.replace('%tag%',data.keywordTag);
				$('#list').append(card);
				});
		},
		error : function() {
			alert('data load fail');
		}
	});
}
</script>

</body>
</html>
