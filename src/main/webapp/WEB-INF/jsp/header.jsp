<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/index">Cozy</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="margin-left:50px;">
      <ul class="nav navbar-nav">
        <li><a href="/review">Review</a></li>
        <li><a href="/store">Store</a></li>
      </ul>
      
      <form class="navbar-form navbar-left" id="searchBar">
        <div class="form-group">
          <input type="text" id="tagToSearch" class="form-control" placeholder="Search" style="width:250px;">
        </div>
        <button type="button" id="searchBtnByTag" class="btn btn-default">Submit</button>
      </form>

      <sec:authorize access="isAnonymous()">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="/member/login" style='margin-right:5px;'>Login</a></li>
          <li><a href="/member/register">Sign up</a></li>
        </ul>
	  </sec:authorize>      
      
      <sec:authorize access="hasAuthority('MEMBER')">
        <ul class="nav navbar-nav navbar-right">
          <li><a href=""><sec:authentication property="principal.nickname"/>님</a></li>
          <li><a href="/member/profile">My</a></li>
          <li><a href="/member/logout">Logout</a></li>
        </ul>
      </sec:authorize>
      
    </div>
  </div>
</nav>