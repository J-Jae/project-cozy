<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - Report List Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/side.css">
	<link rel="stylesheet" href="/css/report/list.css">
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
			<h3>신고 리스트</h3>
			
			<hr/>
			
			<div class="reportFrom">
				<table id="reportTable" class="table table-striped">
					<colgroup>		
						<col width="5%">
						<col width="10%">
						<col width="15%">
						<col width="50%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>신고유형</th>
							<th>신고자</th>
							<th>신고내용</th>
							<th>등록일</th>
							<th>처리상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(reports) == 0}">
							<tr><td colspan="5">조회된 결과가 없습니다.</td></tr>
						</c:if>
						<c:if test="${fn:length(reports) > 0}"> 
							<c:forEach varStatus="status" var="report" items="${reports}">
								<tr>
									<td>${(paging.totalCount - status.index) - ((paging.pageNo - 1) * 10)}</td>
									<td class="reportType">${report.type}</td>
									<td>${report.nickname}</td>
									<td>${report.comment}</td>
									<td class="registeredDate">${report.time}</td>

									<c:choose>
										<c:when test="${report.state}">
											<td>처리완료</td>
										</c:when>
										<c:otherwise>
											<td>미처리</td>
										</c:otherwise>
									</c:choose>
									
									<td>
										<button type="button" class="btn btn-default detailBtn" value="${report.id}/${report.targetId}">
											<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 보기
										</button>
									</td>
									
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

<script type="text/javascript" src="/javascript/report/list.js"></script>

</html>
