<c:import url="header.jsp"></c:import>
<%--Lines des boutons--%>
	<div class="container my-3">
		<%--div alerte en cas de liste articles vide --%>
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
		<%--Partie contenant les articles si liste non vide --%>
		<c:if test="${listeArticles.size() != 0}">
			<div class="content-wrapper">
            	<div class="inner-container container">
                	<div class="row">
	                    <div class="section-header col-md-12">
	                        <h2>Notre Blog</h2>
	                    </div> <!-- /.section-header -->
               		</div> <!-- /.row -->
	                <div class="row">
	                    <div class="blog-masonry masonry-true">
		                	<c:forEach items="${listeArticles}" var="article">
	                       		<div class="post-masonry col-md-4 col-sm-6">
		                            <div class="blog-thumb">
		                                <img src="images/blog/blog-1.jpg" alt="">
		                                <div class="overlay-b">
		                                    <div class="overlay-inner">
		                                        <a href="blog-single.html" class="fa fa-link"></a>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="blog-body">
		                                <div class="box-content">
		                                    <h3 class="post-title">${article.getTitre()}</h3>
		                                    <span class="blog-meta">${article.getDate_creation()} par ${article.getUser().getNom()} ${article.getUser().getPrenom()}</span>
		                                    <p>${article.getResume()}</p>
		                                </div>
		                            </div>
	                        	</div> <!-- /.post-masonry -->
	                    	</c:forEach>
	                   </div> <!-- /.blog-masonry -->
	                </div> <!-- /.row -->
	                <div class="row">
	                    <div class="col-md-12">
	                        <div class="pagination text-center">
	                            <ul>
	                                <li><a href="javascript:void(0)">1</a></li>
	                                <li><a href="javascript:void(0)" class="active">2</a></li>
	                                <li><a href="javascript:void(0)">3</a></li>
	                                <li><a href="javascript:void(0)">4</a></li>
	                                <li><a href="javascript:void(0)">...</a></li>
	                                <li><a href="javascript:void(0)">11</a></li>
	                            </ul>
	                        </div> <!-- /.pagination -->
	                    </div> <!-- /.col-md-12 -->
                	</div> <!-- /.row -->
            	</div> <!-- /.inner-content -->
        	</div> <!-- /.content-wrapper -->
		</c:if>
	</div>
<c:import url="footer.jsp"></c:import>
