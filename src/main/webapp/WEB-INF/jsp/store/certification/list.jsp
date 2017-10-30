<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - Store Certification List Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/side.css">
	<link rel="stylesheet" href="/css/store/certification/list.css">
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

			<h3>내 인증 업체 리스트</h3>

			<hr/>
			
			<div class="storeCertificationForm">
				<table id="storeCertificationTable" class="table table-striped">
					<caption>
						<button type="button" class="btn btn-default" id="registerBtn">
						  	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 등록
						</button>
					</caption>
					<colgroup>		
						<col width="10%">
						<col width="15%">
						<col width="45%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>업체명</th>
							<th>위치</th>
							<th>등록일</th>
							<th>처리상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(myStoreCertifications) == 0}">
							<tr><td colspan="5">조회된 결과가 없습니다.</td></tr>
						</c:if>
						<c:if test="${fn:length(myStoreCertifications) > 0}"> 
							<c:forEach varStatus="status" var="certification" items="${myStoreCertifications}">
								<tr>
									<td>${(paging.totalCount - status.index) - ((paging.pageNo - 1) * 10)}</td>
									<td>${certification.storeName}</td>
									<td>${certification.roadAddress}</td>
									<td>${certification.registeredDate}</td>
									
									<c:choose>
										<c:when test="${certification.state == 0}">
											<td>처리중</td>
										</c:when>
										<c:when test="${certification.state == 1}">
											<td>인증완료</td>
										</c:when>
										<c:otherwise>
											<td>인증거절</td>
										</c:otherwise>
									</c:choose>
	
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			
			<div class="pagingNav">
				<jsp:include page="/WEB-INF/jsp/paging.jsp" flush="true" />
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="/javascript/store/certification/list.js"></script>

</html>
