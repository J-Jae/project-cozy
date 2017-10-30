<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Cozy - Review List</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/review/list.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

	<header>
		<jsp:include page="/WEB-INF/jsp/header.jsp" />
	</header>
	
	<div class="wrap">
		<div class="container" style="width:1024px;">
		
			<input type="hidden" id="searchType" value="all">
			<input type="hidden" id="pageNo" value="1">
			
			<sec:authorize access="isAuthenticated()">
				<sec:authentication var="loginUserName" property="principal.nickname" />
					<input type="hidden" id="nickname" value="${loginUserName}">
			</sec:authorize>
			
				<div class="container-fluid">
					<ul class="nav nav-tabs">
				    	<li class="active"><a href="javascript:void(0)" onclick="initReviewList('all');">All</a></li>
				    	
					<sec:authorize access="isAuthenticated()">    	
				    	<li><a href="javascript:void(0)" onclick="initReviewList('favorite');">즐겨찾기</a></li>
				    	
					    <li><a href="javascript:void(0)"  onclick="initReviewList('tag');">관심태그</a></li>
					    
					    <li><a href="javascript:void(0)"  onclick="initReviewList('section');">내 지역</a></li>
					    
					    <li><a href="javascript:void(0)"  onclick="initReviewList('my');">내 리뷰</a></li>
					    
					    <li style="float:right;"><a href="/review/register">리뷰등록</a></li>
					</sec:authorize>
					</ul>
				</div>

				<section id="reviewListSection" class="col-xs-12 col-sm-6 col-md-12">
						
				</section>
			
		</div>
	</div>
	
	<div id="reviewSample" style="display:none;">
		<article class="search-result row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<a href="/review/detail/%reviewId%" title="Lorem ipsum" class="thumbnail"><img id="reviewImg" src="" alt="No Image"/></a>
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
</body>

<script type="text/javascript" src="/javascript/review/list.js"></script>

</html>
