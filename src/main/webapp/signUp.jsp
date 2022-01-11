<c:import url="header.jsp"></c:import>
	<div class="container d-flex justify-content-center flex-sm-column">
		<h1 class="align-self-center h3 mb-3 fw-normal">Inscription</h1>
		<form class="align-self-center" action="<%= request.getContextPath() %>/signup" method="post">
        	<div class="row col-sm-4 g-3">

	            <div class="col-12">
	              <label for="lastName" class="form-label">Nom</label>
	              <input type="text" class="form-control" id="lastName" value="" required="true" name="nom">
	              <div class="invalid-feedback">
	                Nom obligatoire.
	              </div>
	            </div>
	            
	            <div class="col-12">
	              <label for="firstName" class="form-label">Prenom</label>
	              <input type="text" class="form-control" id="firstName" value="" required="true" name="prenom">
	              <div class="invalid-feedback">
	                Prenom obligatoire.
	              </div>
	            </div>
	
				<div class="col-12">
	              <label for="email" class="form-label">Email</label>
	              <input type="email" class="form-control" id="email" placeholder="vous@example.com" required="true" name="email">
	              <div id="errorEmail"></div>
	            </div>
	
				<div class="col-12">
	              <label for="password" class="form-label">Mot de passe</label>
	              <input type="password" class="form-control" id="pwd" required="true" name="pwd">
	              <div class="invalid-feedback">
	                Merci de saisir votre mot de passe.
	              </div>
	            </div>
           
          		<hr class="my-4">
        	</div>
	  		<button type="submit" class="btn btn-primary">S'inscrire</button>
		</form>
	
	</div>
<c:import url="footer.jsp"></c:import>