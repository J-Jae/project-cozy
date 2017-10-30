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
	<link rel="stylesheet" href="/css//member/admin.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				<h3>회원 검색</h3>
				
				<div class="input-group">
					<input type="text" class="form-control" id="email" placeholder="멤버의 이메일을 입력해주세요.">
					<span class="input-group-btn">
						<button class="btn btn-default" id="searchBtn" type="button">Search!</button>
					</span>
				</div>
				
				<hr/>
				
				<form id="registerForm">
					<div class="form-group">
					 	<label for="nickname">Nickname</label>
					    <input type="text" class="form-control" id="nickname" required>
				    </div>
				    
					<div class="form-group">
					 	<label for="searchedEmail">Email</label>
					    <input type="text" class="form-control" id="searchedEmail" required>
				    </div>
				    
				    <div class="form-group">
					    <label for="password">Authority</label>
					    <input type="text" class="form-control" id="authorities" required>
				    </div>
				    
				    <hr/>
				    
				    <div class="form-group">
				    	<input type="button" id="blindBtn" class="btn btn-danger widthBth" value="블라인드">
				    </div>
				    
				    <hr/>
				    
				    <div class="form-group">	
				    	<input type="button" id="addAuthorityBtn" class="btn btn-info widthBth" value="관리자 추가">
				    </div>
				</form>
			</div>
			
		</div>
	</div>
</body>
<script type="text/javascript" src="/javascript/member/admin.js"></script>
</html>
