<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cozy - Member Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/member/profile.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.memberInfo {
	border: 1px solid #f0f0f0;
	border-radius: 5px;
	padding: 5px;
	margin: auto;
	width: 500px;
}
</style>
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
			<div class="memberInfo">
				<form id="modifyForm">
					<div class="form-group">
						<label for="nickname">Nickname</label> <input type="text"
							class="form-control" id="nickname" name="nickname"
							value="${member.nickname}" readonly>
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" name="email"
							value="${member.email}" readonly>
						<div id="emailConfirm"></div>
					</div>
					<div class="form-group">
					    <label for="password">Password</label>
					    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
					    </div>
					    <div class="form-group">
					    <label for="confirmPassword">Confirm Password</label>
					    <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password" data-match="#password" data-match-error="Whoops, these don't match" required>
					    <div class="help-block with-errors"></div>
					    </div>
					<button type="button" class="btn btn-primary"
						onClick="modify();return false;">수정</button>
				</form>
			</div>
		</div>
	</div>
	
	<script src="/javascript/validator.js"></script>
	<script>
		$(document).ready(function() {
			$('#modifyForm').validator();
		});

		function modify() {
			$.ajax({
				type : 'post',
				url : '/member/modify/password',
				data : $('#modifyForm').serialize(),
				success : function(data) {
					if (data == 'success') {
						alert('수정완료');
						window.location = '/review/';
					} else {
						alert('서버오류');
					}
				},
				error : function() {
					alert('error');
				}
			});
		}
	</script>
</body>

</html>
