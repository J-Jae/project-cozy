<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Reply</title>
<style>
.container {
	padding-top: 15px;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="container">
		<sec:authentication var="loginNickname" property="principal.nickname" />
		<input type="hidden" id="nickname" value="${loginNickname}">
			<table class="table table-striped">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>닉네임</th>
						<th>내용</th>
						<th>작성시간</th>
						<th>신고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach varStatus="status" var="reply" items="${replies}">
						<tr>
							<td>${reply.nickname}</td>
							<td>${reply.comment}</td>
							<td><fmt:formatDate value="${reply.time}" pattern="yyyy/MM/dd HH:mm" /></td>
							<td><button class="btn btn-danger btn-xs" onClick="report('reply', '${reply.id}', '${reply.nickname}')">신고</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
				<jsp:include page="../paging.jsp" flush="true" />
			</div>
		</div>
		 
	</div>
	
	<script>
	function report(type, id, writer) {
		var nickname = $('#nickname').val();
		
		var url = '/report/popup?' + 'writer=' + writer + '&nickname=' + nickname
				+ '&type=' + type + '&targetId=' + id;
		window.open(url, "newWindow", "width=400, height=400");
	}
	</script>
</body>
</html>
