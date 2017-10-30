<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - Store Register</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/store/register.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=XqclUeVzgvyiONATyRwZ&submodules=geocoder"></script>
</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/header.jsp" />
	</header>
	<div class="container">
		<div class="storeRegisterForm">
			<form action="./register" method="post" id="form" class="form-horizontal" enctype="multipart/form-data">
				<div class="form-group">
					<label for="storeSearchValue" class="col-lg-2">*업체 검색</label>
					<div class="col-lg-2">
						<input type="button" id="storeSearchPopupBtn" class="btn btn-info widthBtn" value="찾기">
					</div>
				</div>
				
				<hr/>
			
				<div class="form-group">
					<label for="nickname" class="col-lg-2">*작성자</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="nickname" id="nickname"  value='<sec:authentication property="principal.nickname"/>' aria-describedby="sizing-addon1" readonly />
					</div>
				</div>
				
				<div class="form-group">
					<label for="storeName" class="col-lg-2">*업체명</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="storeName" id="storeName" aria-describedby="sizing-addon1" readonly>
					</div>
					
					<label for="category" class="col-lg-2">*업종</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="category" id="category" aria-describedby="sizing-addon1">
					</div>
				</div>
				
				<div class="form-group">
					<label for="mainTel" class="col-lg-2">*전화번호1</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="mainTel" id="mainTel" 
								placeholder="-를 포함하여 입력해주세요." aria-describedby="sizing-addon1">
					</div>
					
					<label for="subTel" class="col-lg-2">전화번호2</label>
					<div class="col-lg-4">
						<input type="text" class="form-control" name="subTel" id="subTel" 
								placeholder="-를 포함하여 입력해주세요." aria-describedby="sizing-addon1">
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label for="storeUrl" class="col-lg-2">업체 홈페이지</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" name="storeUrl" id="storeUrl" aria-describedby="sizing-addon1">
					</div>
				</div>
				
				<div class="form-group">
					<label for="tagName" class="col-lg-2">입력 태그</label>
					<div class="col-lg-2">
						<select id="tagType" class="form-control">
						  <option value="">선택</option>
						  <option value="keywordTag">키워드</option>
						  <option value="menuTag">메뉴</option>
						</select>
					</div>

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
					<label for="keywordTag" class="col-lg-2">키워드 태그</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" name="keywordTag" id="keywordTag" 
								placeholder="업체를 대표할 키워드 해쉬태그를 입력해주세요." aria-describedby="sizing-addon1" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="menuTag" class="col-lg-2">메뉴 태그</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" name="menuTag" id="menuTag"
								placeholder="소개 할 메뉴 및 서비스 해쉬태그를 입력해주세요." aria-describedby="sizing-addon1" readonly>
					</div>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<table class="table table-striped">
						<tr>
							<td>*도로명주소</td>
							<td><input type="text" class="form-control" id="roadAddress" name="roadAddress" readonly/></td>
						</tr>
						<tr>
							<td>*상권</td>
							<td><input type="text" class="form-control" id="sectionName" name="sectionName"/></td>
						</tr>
					</table>
					<input type="hidden" class="form-control" id="coordinateX" name="coordinateX" readonly/>
					<input type="hidden" class="form-control" id="coordinateY" name="coordinateY" readonly/>
				</div>
				
				<hr/>
				
				<div class="form-group">
					<label for="menuImageFile" class="col-lg-2">메뉴판 업로드</label>
					<div class="col-lg-4">
						<input type="file" name="menuImageFile" id="menuImageFile" aria-describedby="sizing-addon1">
					</div>
				</div>
				
				<div class="form-group">
					<label for="imageFiles" class="col-lg-2">이미지 업로드</label>
					<div class="col-lg-2">
						<input type="button" class="btn btn-info btn-sm imageAddBtn widthBtn" value="추가">
					</div>
				</div>
				
				<div class="form-group imageFileForm">
					<div class="col-lg-2">
					</div>
					<div class="col-lg-4">
						<input type="file" name="imageFiles" class="uploadedImage" id="imageFiles" aria-describedby="sizing-addon1">
					</div>
					<div class="col-lg-2">
						<input type="button" class="btn btn-info btn-sm imageDelBtn widthBtn" value="삭제">
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

<script type="text/javascript" src="/javascript/store/form.js"></script>
<script type="text/javascript" src="/javascript/store/register.js"></script>

</html>
