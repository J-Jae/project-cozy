<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - Admin Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/side.css">
	<link rel="stylesheet" href="/css/store/certification/register.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/header.jsp" />
	</header>
	
	<div class="wrap">
		<div class="side">
			<jsp:include page="/WEB-INF/jsp/side.jsp" />
		</div>

		<div class="container">
			<div class="adminForm">
				
				
				<div class="input-group">
					<h3>업체 인증 신청</h3>
					<span class="input-group-btn">
						<button class="btn btn-info" id="storeSearchPopupBtn" type="button">업체 검색!</button>
					</span>
				</div>

				<hr/>
				
				<form action="/store/certification/register" method="post" id="storeCerficationForm">
					<input type="hidden" id="storeId" name="storeId" required>
					<div class="form-group">
					 	<label for="nickname">작성자</label>
					 	<sec:authorize access="isAuthenticated()">
							<sec:authentication var="loginUserName" property="principal.nickname" />
					   		<input type="text" class="form-control" name="nickname" value="${loginUserName}" required>
					   	</sec:authorize>
				    </div>
				
					<div class="form-group">
					 	<label for="storeName">업체명</label>
					    <input type="text" class="form-control" name="storeName" id="storeName" readonly required>
				    </div>
				    
					<div class="form-group">
					 	<label for="roadAddress">위치</label>
					    <input type="text" class="form-control" name="roadAddress" id="roadAddress" readonly required>
				    </div>
				    
				    <div class="form-group">
					    <label for="businessNo">사업자번호</label>
					    <input type="text" class="form-control" name="businessNo" id="businessNo" >
				    </div>
				    
				    <hr/>
				    
				    <div class="form-group">
				    	<input type="submit" class="btn btn-info widthBth" value="업체 인증 신청">
				    </div>
				</form>
			</div>
			
		</div>
	</div>
</body>

<script type="text/javascript" src="/javascript/store/certification/register.js"></script>

</html>
