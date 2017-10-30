<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <title>Cozy - Sign Up</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/member/register.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .myForm {
	border: 1px solid #f0f0f0;
	border-radius: 5px;
	padding: 5px;
	margin: auto;
	margin-top: 100px;
	width: 350px;
  }
  </style>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/jsp/header.jsp" />
</header>

<div class="wrap">

<div class="container">

<div class="myForm">
<form id="registerForm">
	<div class="form-group">
 	<label for="nickname">Nickname</label>
    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Pick a username" required>
    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
    <div class="help-block with-errors"></div>
    
    </div>
	<div class="form-group">
 	<label for="email">Email</label>
    <input type="email" class="form-control" id="email" name="email" placeholder="Email" data-error="Bruh, that email address is invalid" required>
    <div class="help-block with-errors"></div>
    <button type="button" class="btn btn-sm" id="send" onClick="sendEmail()">Email 인증</button>
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
    <button type="submit" class="btn btn-primary" onClick="register();return false;">회원가입</button>
</form>
</div>
</div>
</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Email 인증</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form>
					<div>
 					<label for="modalEmail">Email</label>
    				<input type="email" class="form-control" id="modalEmail" readonly>
				    </div>
					<div id="subject">
					<label for="code">Code</label>
					<input type="text" class="form-control" id="code" name="code" required>
					</div>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="close" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onClick="confirm()">인증</button>
				</div>
			</div>
		</div>
	</div>

<input type="hidden" id="emailAuth">

<script src="/javascript/validator.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#registerForm').validator();
});

function sendEmail() {
	console.log('send mail');
	$('#code').val('');
	if($("#email").val() == '') {
		alert("input email");
		return;
	}
	$('#myModal').modal('show');
	$("#modalEmail").val($("#email").val());
	var email = $("#email").val();
	$.ajax({
		type : 'post',
		url : '/member/mail',
		data : "email="+email,
		success : function(code) {
			alert('code : [' + code + ']');
			$('#emailAuth').val(code);
			$("#send").text('인증완료');
			$("#send").addClass("disabled");
		},
		error : function() {
			alert('Invalid Addresses');
			$('#myModal').modal('hide');
		}
	});
}

function confirm() {
	var inputCode = $("#code").val();
	
	if(inputCode == $('#emailAuth').val()) {
		alert("인증성공");
		$('#myModal').modal('hide');
		$('#email').prop('readonly', true);
		return true;
	}
	else {
		alert("인증코드가 올바르지 않습니다.");
		return false;
	}
	
}

function register() {
	if($("#send").text() != '인증완료') {
		alert('email 인증하세요');
		return false;
	}
	console.log($('#registerForm').serialize());
	
	$.ajax({
		type : 'post',
		url : '/member/register',
		data : $('#registerForm').serialize(),
		success : function(data) {
			alert('가입완료');
			window.location = '/member/login';
		},
		error : function() {
			alert('error');
		}
	});
}


</script>

</body>
</html>
