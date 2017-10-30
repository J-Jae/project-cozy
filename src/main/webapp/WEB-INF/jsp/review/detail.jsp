<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - Review Info</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/review/detail.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=gUgdBp5pZaoSL9VlayqH&submodules=geocoder"></script>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/header.jsp" />
	</header>
	
	<div class="container">
		<div class="reviewRegisterForm">
			<form action="/review/modify" method="post" class="form-horizontal">
				<div class="form-group">
					<input type="hidden" name="reviewId" id="reviewId" value="${review.reviewId}">
				</div>
		
				<div class="form-group">
					<div class="col-lg-12">
						<img src="${review.reviewImagePath}" id="reviewImage" class="img-responsive" alt="No Image"/>
					</div>
				</div>
				
				<hr/>

				<div class="form-group">
					<label for="nickname" class="col-lg-2">작성자</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" id="nickname" value="${review.nickname}" aria-describedby="sizing-addon1" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="tagName" class="col-lg-2">키워드 태그</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"id="keywordTag"  value="${review.keywordTag}" aria-describedby="sizing-addon1" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="title" class="col-lg-2">제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="title" value="${review.title}" aria-describedby="sizing-addon1" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="reviewContent" class="col-lg-2">*내용</label>
					<div class="col-lg-10">
						<textarea class="form-control" id="reviewContent" rows="10" readonly required>${review.reviewContent}</textarea>
					</div>
				</div>
				
				<br/>
				
				<div class="form-group">
					<label for="storeName" class="col-lg-2">위치</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="storeName" value="${review.roadAddress}, ${review.storeName}" aria-describedby="sizing-addon1" readonly>
					</div>
				</div>
				
				<hr/>
				
				<sec:authorize access="isAuthenticated()">
					<sec:authentication var="loginUserName" property="principal.nickname" />

					<c:if test="${loginUserName eq review.nickname}">
						<div class="form-group">
							<div class="col-lg-3"></div>
							<div class="col-lg-3">
								<input type="button" class="btn btn-info widthBtn" id="backBtn" value="목록으로">
							</div>
							<div class="col-lg-3">
								<input type="submit" class="btn btn-info widthBtn" value="수정하기">
							</div>
							<div class="col-lg-3">
								<input type="button" class="btn btn-danger widthBtn" id="deleteBtn" value="삭제하기">
							</div>
						</div>
					</c:if>
				</sec:authorize>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript" src="/javascript/review/detail.js"></script>

</html>
