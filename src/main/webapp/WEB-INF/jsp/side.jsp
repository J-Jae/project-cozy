<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<div class="vertical-menu">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="loginUserName" property="principal.nickname" />
		<sec:authentication var="loginUserEmail" property="principal.email" />
		
		<sec:authorize access="hasAuthority('MEMBER')">
			<sec:authentication var="loginUserName" property="principal.nickname" />
			<a class="active">My Page</a>
			<a></a>
			<a class="bar">MEMBER</a>
			<a href="/member/modify?email=${loginUserEmail}">내 정보 보기</a>
			<a href="/member/modify/password?email=${loginUserEmail}">비밀번호 변경</a>
			<a href="javascript:void(0)" onclick="unregister()">회원탈퇴</a>
			
			<a href="/favorite/my/${loginUserName}">내 즐겨찾기</a>
			<a href="/reply/my/${loginUserName}">내 댓글</a>
			<a href="/footprint/my/${loginUserName}">내 풋프린트</a>
			<a href="/store/certification/list/${loginUserName}">내 인증 업체</a>
			<a></a>
		</sec:authorize>
		
		<sec:authorize access="hasAuthority('ADMIN')">
			<a class="bar">ADMIN</a>
			<a href="/store/certification/list/admin">업체 인증 관리</a>
			<a href="/report/list/admin">신고 관리</a>
			<a href="/member/admin">회원 관리</a>
			<a href="/store/admin">업체 관리</a>
			<a></a>
		</sec:authorize>
		
		<a class=bar></a>
	</sec:authorize>
</div> 
<script>
function unregister() {
	var answer = confirm('정말 탈퇴하시겠습니까????');
	
	if(answer) {
		var nickname = "${loginUserName}";
		$.ajax({
			type : 'post'
			, url : '/member/unregister'
			, data: {nickname: nickname}
			, success : function(data) {
				if(data == true) {
					alert('탈퇴성공');
					window.location = '/index';
				}
			}
			,error : function() {
				alert('Server Error');
			}
		});
	}
}
</script>
