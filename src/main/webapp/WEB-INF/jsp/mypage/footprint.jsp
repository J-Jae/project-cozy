<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - MY Footprint</title>
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
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>Store</th>
						<th>Tag</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach varStatus="status" var="footprint" items="${footprints}">
						<tr>
							<td><a href="/store/detail/${footprint.storeId}"><c:out value="${footprint.storeName}"/></a></td>
							<c:set var="tags" value="${footprint.storeTag}"/>
							<td>
							<c:forEach items="${fn:split(tags, ',') }" var="tag"> 
								${tag}
							</c:forEach>
							</td>
							<td><fmt:formatDate value="${footprint.date}" pattern="yyyy/MM/dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
			<jsp:include page="../paging.jsp" flush="true" />
			</div>
		</div>
	</div>
</body>

</html>
