<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - MY Reply</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/member/profile.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>

	.container {
	  background-color: #fff;
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
			<table class="table table-striped">
				<colgroup>
					<col width="30%">
					<col width="45%">
					<col width="20%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th>Store</th>
						<th>Content</th>
						<th>Date</th>
						<th>Remove</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach varStatus="status" var="reply" items="${replies}">
						<tr>
							<td><a href="/store/detail/${reply.storeId}"><c:out value="${reply.storeName}"/></a></td>
							<td>${reply.comment}</td>
							<td><fmt:formatDate value="${reply.time}" pattern="yyyy/MM/dd HH:mm" /></td>
							<td><button type="button" class="btn btn-danger btn-sm" onClick="del(${reply.id})">삭제</button></td>
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
	function del(id) {
		$.ajax({
			type : 'post',
			url : '/reply/delete/' + id,
			success : function(data) {
				if(data == true) {
					alert('삭제완료');
					location.reload();
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
