<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - MY Favorite</title>
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
				<col width="5%">
				<col width="35%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			  <thead>
			  	<tr>
			  	  <th>ID</th>
			  	  <th>Store</th>
			  	  <th>Section</th>
			  	  <th>Tag</th>
			  	  <th>State</th>	
			  	  <th>Remove</th>	
			  	</tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${favorites}" var="favorite">
			  	<tr>
			  	<td><h5><c:out value="${favorite.id}"/></h5> </td>
			  	<td><h5><a href="/store/detail/${favorite.storeId}"><c:out value="${favorite.storeName}"/></a></h5></td>
			  	<td><h5><c:out value="${favorite.section}"/></h5> </td>
			  	<td><h5>
				<c:set var="tags" value="${favorite.tag}"/>
						<c:forEach items="${fn:split(tags, ',') }" var="tag"> 
							${tag} 
						</c:forEach>
				</h5> </td>
			  	<td><h5><c:out value="${favorite.toggle}"/></h5> </td>
			  	<td><button type="button" class="btn btn-danger btn-sm" onClick="del(${favorite.id})">삭제</button></td>
			  	</tr>
			  </c:forEach>
			  </tbody>
			</table>
		</div>
	</div>
	
	<script>
	function del(id) {
		$.ajax({
			type : 'post',
			url : '/favorite/delete/' + id,
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
