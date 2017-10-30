<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Cozy - Report Reply</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.container {
			padding: 30px;
		}
		
		#blindBtnBox{
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<div class="container">

			<form>
				<div class="form-group">
				 	<label for="nickname">작성자</label>
				    <input type="text" class="form-control" id="nickname" value="${reply.nickname}" readonly>
				</div>
				   
				<div class="form-group">
					<label for="password">등록날짜</label>
				    <input type="text" class="form-control" value="<fmt:formatDate value='${reply.time}' pattern='yyyy/MM/dd HH:mm' />" readonly>
				</div>
				   				   
				<div class="form-group">
				 	<label for="searchedEmail">댓글내용</label>
				    <textarea class="form-control" readonly>${reply.comment}</textarea>
				</div>

				<hr/>
				   
				<div class="form-group">
				   	<input type="button" id="removeBtn" class="btn btn-danger widthBth" value="신고처리">
				</div>
				
			</form>
			
		</div>
	</div>
</body>

<script>
	$("#removeBtn").on("click", function() {
		
		$.ajax({
			type : 'post'
			, url : '/report/remove/${reportId}'
			, success : function(data) {
				if(data == true) {
					alert('삭제완료');
					opener.location.reload();
					window.close();
				}
			}
			, error : function() {
				alert('error');
			}
		});
	});
</script>
</html>
