<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Cozy - Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="/css/index.css"> 
	<link rel="stylesheet" href="/css/member/login.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/header.jsp" />
	</header>
	<div class="container">

		<div class="myForm">
			<form id="registerForm" method="post" action="/loginProcessing">
				<sec:csrfInput />
				
				<c:if test="${param.error eq 'yes'}">
					<div class="form-group loginError">
						잘못된 아이디나 암호입니다.
					</div>
				</c:if>
				<div class="form-group">
					<label for="email">Login ID(Email)</label> 
					<input type="text" class="form-control" id="email" name="email" placeholder="Pick a user email" required>
				</div>
				
				<div class="form-group">
					<label for="password">Password</label> 
					<input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
				</div>
							
				<div class="form-group">
					<div class="col-lg-12">
						<input type="submit" class="btn btn-info widthBtn" value="로그인">
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-lg-12">
						<input type="button" id="searchBtn" class="btn btn-info widthBtn" onClick="openModal()" value="회원정보 찾기">
					</div>
				</div>
			</form>
		</div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원정보 찾기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form>
					<div>
 					<label for="modalEmail">Email</label>
    				<input id="userEmail" type="email" class="form-control" id="modalEmail">
				    </div>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="close" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onClick="sendMail()">임시 비밀번호 발송</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>

<script type="text/javascript" src="/javascript/member/login.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function openModal() {
	$('#myModal').modal('show');
}

function sendMail() {
	var email = $("#userEmail").val();
	if(email == '') {
		alert("input email");
		return;
	}
	$.ajax({
		type : 'post',
		url : '/member/find',
		data : "email="+email,
		success : function(password) {
			alert('password : [' + password + ']');
			$('#myModal').modal('hide');
		},
		error : function() {
			alert('Invalid Addresses');
		}
	});
}
</script>

</html>
