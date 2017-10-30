<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - Review Register</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/review/register.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/header.jsp" />
	</header>
	<div class="container">
		<div class="reviewRegisterForm">
			<form action="/review/register" method="post" id="form" class="form-horizontal" enctype="multipart/form-data">
				<div class="form-group">
					<label for="storeSearchValue" class="col-lg-2">*업체 선택</label>
					<div class="col-lg-2">
						<input type="button" id="storeSearchPopupBtn" class="btn btn-info widthBtn" value="찾기">
					</div>
				</div>
				
				<div class="form-group">
					<input type="hidden" name="storeId" id="storeId" required>
				</div>
				
				<hr/>
			
				<div class="form-group">
					<label for="nickname" class="col-lg-2">*작성자</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="nickname" id="nickname" value='<sec:authentication property="principal.nickname"/>' aria-describedby="sizing-addon1" required>
					</div>
					
					<label for="storeName" class="col-lg-2">*업체명</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="storeName" id="storeName" aria-describedby="sizing-addon1" readonly required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="roadAddress" class="col-lg-2">*위치</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" name="roadAddress" id="roadAddress" aria-describedby="sizing-addon1" readonly required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="title" class="col-lg-2">*제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" name="title" id="title" aria-describedby="sizing-addon1"required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="reviewContent" class="col-lg-2">*내용</label>
					<div class="col-lg-10">
						<textarea class="form-control" name="reviewContent" id="reviewContent" rows="10" required></textarea>
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label for="tagName" class="col-lg-2">키워드 태그</label>

					<div class="col-lg-4">
						<input type="text" class="form-control" id="newTag" aria-describedby="sizing-addon1">
					</div>
					
					<div class="col-lg-2">
						<input type="button" class="btn btn-info widthBtn" id="tagAddBtn" value="추가">
					</div>
					
					<div class="col-lg-2">
						<input type="button" class="btn btn-info widthBtn" id="tagRemoveBtn" value="삭제">
					</div>
				</div>
				
				<div class="form-group">
					<label for="keywordTag" class="col-lg-2"></label>
					<div class="col-lg-10">
						<input type="text" class="form-control" name="keywordTag" id="keywordTag"
								 aria-describedby="sizing-addon1" readonly>
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label for="imageFiles" class="col-lg-2">이미지 업로드</label>
					
					<div class="col-lg-5">
						<input type="file" name="imageFiles" class="uploadedImage" id="imageFiles" aria-describedby="sizing-addon1">
					</div>
				</div>
				
				<hr/>
				
				<hr />
	
				<div class="form-group">
					<div class="col-lg-3"></div>
					<div class="col-lg-3">
						<input type="submit" class="btn btn-info widthBtn" value="등록하기">
					</div>
					<div class="col-lg-3">
						<input type="button" class="btn btn-info widthBtn" id="backUrlBtn" value="취소하기">
					</div>
					<div class="col-lg-3"></div>
				</div>
				
			</form>
		</div>
	</div>
</body>
<script type="text/javascript" src="/javascript/review/form.js"></script>

</html>
