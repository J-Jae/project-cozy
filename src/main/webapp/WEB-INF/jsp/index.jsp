<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		.container {
			width: 1024px;
			margin: 0 auto;
			padding: 20px 10px 0 10px;
			background-color: #f8f8f8;
			both: clear;
		}

  </style>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/header.jsp" />
	</header>

	<div class="container">
		welcome
	</div>

</body>

</html>
