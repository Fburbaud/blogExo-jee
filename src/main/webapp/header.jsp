<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Blog</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300,100">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,400italic,300italic,300,500,500italic,700,900">
	<!--
	      Artcore Template
	http://www.templatemo.com/preview/templatemo_423_artcore
	      -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/templatemo-misc.css">
	<link rel="stylesheet" href="css/templatemo-style.css">
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
</head>
	<%--Liens du menu --%>
	<c:url value="/home" var="home"></c:url>
	<c:url value="/signin" var="signin" scope="request"></c:url>
	<c:url value="/signup" var="signup" scope="request"></c:url>
	<c:url value="/singlepost" var="singlepost" scope="request"></c:url>
	<c:url value="/creapost" var="creapost" scope="request"></c:url>
	<%--header avec nav et bouttons --%>
	<div class="container">
	    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
	      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
	        <li><a href="${home}" class="nav-link px-2 link-secondary">Home</a></li>
	        <li><a href="${creapost}" class="nav-link px-2 link-dark">Nouvel article</a></li>
	      </ul>
	
	      <div class="d-flex justify-content-evenly col-md-3 text-end">
	      	<c:if test="${user != null }">
	      		<p>Bonjour <c:out value="${user.prenom}"></c:out></p>
		      	<form method="post" action="<%= request.getContextPath() %>/home">
			   		<input type="hidden" name="logOut" value="logOut"/>
					<button class="btn btn-primary" type="submit">Logout</button>
				</form>	
	      	</c:if>
	      	<c:if test="${user == null }">
		        <a href="${signin}"><button type="button" class="btn btn-outline-primary me-2">Connection</button></a>
		        <a href="${signup}"><button type="button" class="btn btn-primary">Inscription</button></a>
	      	</c:if>
	      </div>
	    </header>
	 </div>