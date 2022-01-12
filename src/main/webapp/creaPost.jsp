<c:import url="header.jsp"></c:import>
<div class="content-wrapper">
	<div class="inner-container container">
	    <div class="row">
	        <div class="section-header col-md-12">
	            <h2>Nouvel Article</h2>
	            <span>Formulaire de création d'un nouvel article pour le blog.</span>
	        </div> <!-- /.section-header -->
	    </div> <!-- /.row -->
	    <c:if test="${user == null}">
	    	<div class="alert alert-danger" role="alert">
	    		Vous devez vous connecter pour créer un nouvel article.
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
			</div>
	  	</c:if>
	    <c:if test="${user != null}">
		    <div class="contact-form">
		        <div class="box-content col-md-12">
		            <div class="row">
		                <div class="col-md-7">
		                    <p>De quoi souhaitez-vous nous parler aujourd'hui?</p>
		                    <h3 class="contact-title">A vous de jouer!</h3>
		                    <div class="contact-form-inner">
		                        <form method="post" action="<%= request.getContextPath() %>/creapost">
		                            <p>
		                                <label for="titre">Titre :</label>
		                                <input name="titre" type="text" id="titre">
		                            </p>
		                            <p>
		                                <label for="resume">Résumé :</label>
		                                <input name="resume" type="text" id="resume"> 
		                            </p>
		                            <p>
		                                <label for="contenu">Contenu :</label>
		                                <textarea name="contenu" id="contenu"></textarea>    
		                            </p>
		                            <input type="submit" class="mainBtn" name="create" value="Creer article" />
		                        </form>
		                    </div> <!-- /.contact-form-inner -->
		                </div> <!-- /.col-md-7 -->
		            </div> <!-- /.row -->
		        </div> <!-- /.box-content -->
		    </div> <!-- /.contact-form -->
	    </c:if>
	</div> <!-- /.inner-content -->
</div> <!-- /.content-wrapper -->
<c:import url="footer.jsp"></c:import>