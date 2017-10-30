<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cozy - Member Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/member/profile.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.memberInfo {
	border: 1px solid #f0f0f0;
	border-radius: 5px;
	padding: 5px;
	margin: auto;
	width: 500px;
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
			<div class="memberInfo">
				<form id="modifyForm">
					<div class="form-group">
						<label for="nickname">Nickname</label> <input type="text"
							class="form-control" id="nickname" name="nickname"
							value="${member.nickname}" readonly>
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" name="email"
							value="${member.email}" readonly>
						<div id="emailConfirm"></div>
					</div>

					<div class="form-group">
						<label for="tagName">태그</label> <input type="text" id="newTag"
							style="width: 330px;"> <input type="button"
							class="btn btn-info widthBtn" id="tagAddBtn" value="추가">
						<input type="button" class="btn btn-info widthBtn"
							id="tagRemoveBtn" value="삭제">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" name="tag"
							id="keywordTag" value="${member.tag}" readonly>
					</div>

					<div class="form-group">
						<label for="email">지역</label> <input type="email"
							class="form-control" id="email" name="sectionName" placeholder="ex)서현동"
							value="${member.sectionName}">
						<div id="emailConfirm"></div>
					</div>
					<button type="button" class="btn btn-primary"
						onClick="modify();return false;">수정</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		$('#newTag').keypress(function(e) {
			if (e.which == 13) {
				$('#tagAddBtn').click();
			}
		});

		$("#tagAddBtn").on("click", function() {
			var newTag = $("#newTag").val();

			if (newTag === "") {
				return;
			}

			var currentTags = $('#keywordTag').val();

			if (currentTags.split("#").length > 5) {
				alert("최대 5개 이상 입력하실 수 없습니다.");
				return;
			}

			var updatedTags = "";

			if (currentTags === "") {
				updatedTags = "#" + newTag;

			} else {
				updatedTags = currentTags + ",#" + newTag;
			}

			$('#keywordTag').val(updatedTags);
			$("#newTag").val("");

		});

		$("#tagRemoveBtn").on("click", function() {
			var currentTags = $('#keywordTag').val();
			var tagTotalCount = currentTags.split(",").length;
			if (tagTotalCount <= 1) {
				$('#keywordTag').val("");
			} else {
				var updatedTags = currentTags.substring(0, currentTags.lastIndexOf(","));
				$('#keywordTag').val(updatedTags);
			}
		});
		
		function modify() {
			$.ajax({
				type : 'post',
				url : '/member/modify',
				data : $('#modifyForm').serialize(),
				success : function(data) {
					if(data=='success') {
						alert('수정완료');
						window.location = '/review/';
					}
					else {
						alert('서버오류');
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
