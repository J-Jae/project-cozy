<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


  <title>Report</title>
  <style>
  .container {
  	width:400px;
  	height:400px;
  	border: 1px solid black;
  	padding-top:15px;
  }
  </style>
</head>
<body>
<div class="wrap">
<div class="container">
<form id="reportForm">
	<div class="form-group">
 	<label for="writer">작성자</label>
    <input type="text" class="form-control" id="writer" value="${writer}" readonly>
    </div>
  <div class="form-group">
   <label for="reporter">신고자</label>
    <input type="text" class="form-control" id="repoter" name="nickname" value="${report.nickname}" readonly>
  </div>
  <div class="form-group">
    <label for="reason">신고사유</label>
    <input type="text" class="form-control" id="reason" name="comment" value="" placeholder="신고 사유">
  </div>
  <div class="form-group" style="margin-top:130px;">
    <button type="button" class="btn btn-danger pull-right" style="margin-left:10px;" onClick="report()">신고하기</button>
    <button type="button" class="btn pull-right">취소</button>
  </div>
<input type="hidden" id="url">
<input type="hidden" id="type" name="type" value="${report.type}"> <!-- review or store -->
<input type="hidden" id="id" name="targetId" value="${report.targetId}">
</form>
</div>
</div>


<script>
function report() {
	console.log($('#reportForm').serialize());
	$.ajax({
		type : 'post',
		url : '/report/register',
		data : $('#reportForm').serialize(),
		success : function() {
			alert('신고 성공');
			window.close();
		},
		error : function() {
			alert('error');
		}
	});
}
</script>

</body>
</html>
