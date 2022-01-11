<c:import url="header.jsp"></c:import>
	<div class="container d-flex justify-content-center text-center flex-sm-column align-items-center">
	<c:if test="${error}">
		<div class="alert alert-danger" role="alert">
	  		Erreur, email ou mot de passe incorrect.
		</div>
	</c:if>
	  <form class="row col-sm-4" action="<%= request.getContextPath() %>/signin" method="post">
	    <h1 class="h3 mb-3 fw-normal">Connection</h1>
	
	    <div class="form-floating">
	      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
	      <label for="floatingInput">Email</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="pwd">
	      <label for="floatingPassword">Mot de passe</label>
	    </div>
	
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Se connecter</button>
	  </form>
	</div>
<c:import url="footer.jsp"></c:import>