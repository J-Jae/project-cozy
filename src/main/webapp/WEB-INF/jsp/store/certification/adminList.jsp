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
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
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

			<h3>인증 신청한 업체 리스트</h3>

			<hr/>

			<div class="storeCertificationForm">
				<table id="storeCertificationTable" class="table table-striped">
					<colgroup>		
						<col width="5%">
						<col width="20%">
						<col width="45%">
						<col width="10%">
						<col width="10%">
						<col width="5%">
						<col width="5%">
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
						<c:if test="${fn:length(storeCertifications) == 0}">
							<tr><td colspan="7">조회된 결과가 없습니다.</td></tr>
						</c:if>
						<c:if test="${fn:length(storeCertifications) > 0}"> 
							<c:forEach varStatus="status" var="certification" items="${storeCertifications}">
								<tr>
									<td>${(paging.totalCount - status.index) - ((paging.pageNo - 1) * 10)}</td>
									<td>${certification.storeName}</td>
									<td>${certification.roadAddress}</td>
									<td>${certification.registeredDate}</td>
									
									<c:choose>
										<c:when test="${certification.state == 0}">
											<td>처리중</td>
											<td>
												<button type="button" class="btn btn-default" id="acceptBtn" value="${certification.storeCertificationId}/${certification.nickname}">
													<span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 수락
												</button>
											</td>
											<td>
												<button type="button" class="btn btn-default" id="rejectBtn" value="${certification.storeCertificationId}">
													<span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 삭제
												</button>
											</td>
										</c:when>
										<c:when test="${certification.state == 1}">
											<td>인증완료</td>
											<td></td>
											<td></td>
										</c:when>
										<c:otherwise>
											<td>인증거절</td>
											<td></td>
											<td></td>
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

<script type="text/javascript" src="/javascript/store/certification/adminList.js"></script>

</html>
