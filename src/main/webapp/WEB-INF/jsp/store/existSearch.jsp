<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cozy - StoreSearch</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/review/storeExistSearch.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=XqclUeVzgvyiONATyRwZ&submodules=geocoder"></script>
</head>

<body>
	<div class="container">
		
		<div class="row">
			<div class="col-lg-6">
				<label for="storeSearchValue">업체 검색</label>
				<div class="input-group">
					<input type="text" name="storeSearchValue" id="storeSearchValue" class="form-control" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-default" id="searchBtn" type="button">검색</button>
					</span>
				</div>
			</div>
		</div>
		
		<hr/>
		
		<table id="storeSearchResult" class="table table-striped">
		</table>
		<div class="form-group">
			<div id="map" style="height:400px;display:none;"></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="/javascript/popup/StoreSearchPopup.js"></script>
<script type="text/javascript" src="/javascript/popup/storeExist.js"></script>
<script>

</script>
</html>
