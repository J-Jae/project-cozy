<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - Admin Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/side.css">
	<link rel="stylesheet" href="/css/store/certification/register.css">
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
			<div class="adminForm">
				
				
				<div class="input-group">
					<h3>업체 관리</h3>
					<span class="input-group-btn">
						<button class="btn btn-info" id="storeSearchPopupBtn" type="button">업체 검색!</button>
					</span>
				</div>

				<hr/>
				
				<form id="storeCerficationForm">
					<input type="hidden" id="storeId" name="storeId" required>
					<div class="form-group">
					 	<label for="nickname">작성자</label>
					 	<sec:authorize access="isAuthenticated()">
							<sec:authentication var="loginUserName" property="principal.nickname" />
					   		<input type="text" class="form-control" name="nickname" value="${loginUserName}" required>
					   	</sec:authorize>
				    </div>
				
					<div class="form-group">
					 	<label for="storeName">업체명</label>
					    <input type="text" class="form-control" name="storeName" id="storeName" readonly required>
				    </div>
				    
					<div class="form-group">
					 	<label for="roadAddress">위치</label>
					    <input type="text" class="form-control" name="roadAddress" id="roadAddress" readonly required>
				    </div>
				    
				    <hr/>
				    
				    <div class="form-group">
				    	<input type="button" id="blindBtn" class="btn btn-danger widthBth" value="블라인드">
				    </div>
				</form>
			</div>
			
		</div>
	</div>
</body>

<script>

//업체 검색 팝업창 띄우기
$("#storeSearchPopupBtn").on("click", function() {
	var pop = window.open("/store/certification/storeSearch", "pop", "width=1000,height=800, scrollbars=yes, resizable=yes");
});

//업체정보 검색내용 받기
function takeStoreInfoCallBack(storeId, storeName, roadAddress) {
	$("#storeId").val(storeId);
	$("#storeName").val(storeName);
	$("#roadAddress").val(roadAddress);
}

//회원 블라인드 처리
$("#blindBtn").on("click", function() {
	if(confirm("정말 강퇴하시겠습니까?") == false) {
		return;
	}
	
	var storeId = $("#storeId").val();
	
	$.ajax({
	    url: "/store/remove"
	    , type: "post"
	    , data: {storeId: storeId}
	    , dataType: "json"
	    , success: function(data) {
	    	if(data) {
	    		alert("업체가 강퇴되었습니다.");
	    	}
	    }
	    , error: function(e) {
	    	alert("업체 강퇴에 실패했습니다.");
	    }
	});
	
	location.reload();
});</script>

</html>
