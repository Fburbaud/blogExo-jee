<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
	<%--Liens du menu --%>
	<c:url value="/home" var="home"></c:url>
	<c:url value="/signin" var="signin"></c:url>
	<c:url value="/signup" var="signup"></c:url>
	<div class="container">
	    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
	      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
	        <li><a href="${home}" class="nav-link px-2 link-secondary">Home</a></li>
	        <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
	        <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
	        <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
	        <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
	      </ul>
	
	      <div class="col-md-3 text-end">
	      	<c:if test="${user != null }">
		      	<form method="post" action="<%= request.getContextPath() %>/home">
			   		<input type="hidden" name="logOut" value="logOut"/>
					<button class="btn btn-primary" type="submit">Logout</button>
				</form>	
	      	</c:if>
	      	<c:if test="${user == null }">
		        <a href="${signin}"><button type="button" class="btn btn-outline-primary me-2">Sign-in</button></a>
		        <a href="${signup}"><button type="button" class="btn btn-primary">Sign-up</button></a>
	      	</c:if>
	      </div>
	    </header>
	 </div>