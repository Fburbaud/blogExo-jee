<c:import url="header.jsp"></c:import>
<c:url value="/creapost" var="creapost"></c:url>
<c:url value="/signin" var="signin"></c:url>
<c:url value="/signup" var="signup"></c:url>
	<div class="container my-3">
		<c:if test="${listeArticles.size() == 0}">
			<div class="alert alert-danger" role="alert">
	  			Pas d'article pour l'instant. Souhaitez-vous créer le premier? 
	  			<c:if test="${user != null}">
	  			<a class="text-decoration-none" href="${creapost}">
			      	<button class="btn btn-light">
			      		Créer un article
			      	</button>
			    </a>
	  			</c:if>
	  			<c:if test="${user == null}">
	  			<a class="text-decoration-none" href="${signin}">
			      	<button class="btn btn-light">
			      		Connectez-vous
			      	</button>
			    </a>
			     OU 
			    <a class="text-decoration-none" href="${signup}">
			      	<button class="btn btn-light">
			      		Inscrivez-vous
			      	</button>
			    </a>
	  			</c:if>
			</div>
		</c:if>
	</div>
<c:import url="footer.jsp"></c:import>
