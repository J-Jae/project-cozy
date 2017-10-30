<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav id="pagingNav">
	<ul class="pagination">
	    <li><a href="javascript:goPage(${paging.firstPageNo});" aria-label="Previous"><span aria-hidden="true">처음</span></a></li>
	    <li><a href="javascript:goPage(${paging.prevPageNo});" aria-label="prev"><span aria-hidden="true">이전</span></a></li>
	    
	    <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
	        <c:choose>
	            <c:when test="${i eq paging.pageNo}">
	            	<li class="active"><a href="javascript:goPage(${i});"><span>${i}</span></a></li>
	            </c:when>
	            <c:otherwise>
	           		<li><a href="javascript:goPage(${i});">${i}</a></li>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>

	    <li><a href="javascript:goPage(${paging.nextPageNo});" aria-label="next"><span aria-hidden="true">다음</span></a></li>
	    <li><a href="javascript:goPage(${paging.finalPageNo});" aria-label="Next"><span aria-hidden="true">마지막</span></a></li>
    </ul>
</nav>


<script>
	function goPage(n){
		var path = window.location.pathname;
		location.href = path + "?pageNo=" + n;
	}
</script>