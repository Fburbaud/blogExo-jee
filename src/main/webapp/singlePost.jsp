<c:import url="header.jsp"></c:import>
	<div class="content-wrapper">
	    <div class="inner-container container">
	        <div class="row">
	            <div class="blog-image col-md-12">
	                <img src="images/blog/blog-single.jpg" alt="Blog 1">
	            </div> <!-- /.blog-image -->
	            <div class="blog-info col-md-12">
	                <div class="box-content">
	                    <h2 class="blog-title">${article.getTitre()}</h2>
	                    <span class="blog-meta">${article.getDate_creation()} par ${article.getUser().getNom()} ${article.getUser().getPrenom()} with 3 comments</span>
	                    <p>${article.getContenu()}</p>
	                    <c:if test="${user.getId_user() == article.getUser().getId_user()}">
		                 	<div class="d-flex justify-content-end">
			                 	<button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#idArt-<c:out value="${article.getId_article()}" />">
						      		<i class="bi bi-trash"></i>
						      	</button>
					      	</div>
					      	<!-- Modal -->
							<div class="modal fade" id="idArt-<c:out value="${article.getId_article()}" />" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel">Suppression</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							      		Voulez vous vraiment supprimer cet article ?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Non</button>
							        <form method="post" action="<%= request.getContextPath() %>/singlepost">
							      		<input type="hidden" name="purpose" value="D"/>
							      		<input type="hidden" name="idArticleToDelete" value="${article.getId_article()}"/>
						        		<button type="submit" class="btn btn-primary">Oui, je confirme</button>
						        	</form>
							      </div>
							    </div>
							  </div>
							</div>
				      	</c:if>
	                </div>
	            </div> <!-- /.blog-info -->

	        </div> <!-- /.row -->
	        <div class="row">
	            <div class="col-md-12">
	                <h2 class="comment-heading">${listComments.size()} commentaire(s)</h2>
	                <div class="box-content">
	                    <div class="comment">
	                    	<c:forEach items="${listComments}" var="commentaire">
		                        <div class="comment-inner">
		                            <div class="comment-body">
		                                <h4>${commentaire.getUser().getNom()} ${commentaire.getUser().getPrenom()}</h4>
		                                <span>${commentaire.getCreated_at()}</span>
		                                <p>${commentaire.getContent()}</p>
		                                <c:if test="${user.getId_user() == commentaire.getUser().getId_user()}">
						                 	<div class="d-flex justify-content-end">
							                 	<button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#idComment-<c:out value="${commentaire.getId_comment()}" />">
										      		<i class="bi bi-trash"></i>
										      	</button>
									      	</div>
									      	<!-- Modal -->
											<div class="modal fade" id="idComment-<c:out value="${commentaire.getId_comment()}" />" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="staticBackdropLabel">Suppression</h5>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											      		Voulez vous vraiment supprimer ce commentaire ?
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Non</button>
											        <form method="post" action="<%= request.getContextPath() %>/singlepost?idArticle=<c:out value="${article.getId_article()}" />">
											      		<input type="hidden" name="purpose" value="S"/>
											      		<input type="hidden" name="idCommentToDelete" value="${commentaire.getId_comment()}"/>
										        		<button type="submit" class="btn btn-primary">Oui, je confirme</button>
										        	</form>
											      </div>
											    </div>
											  </div>
											</div>
								      	</c:if>
		                            </div>
		                        </div>
	                        </c:forEach>
	                    </div> <!-- /.comment -->
	                </div> <!-- /.box-content -->
	            </div> <!-- /.col-md-12 -->
	        </div> <!-- /.row -->
	        <div class="row">
	            <div class="col-md-12 comment-form">
	            	<c:if test="${user != null}">
	            		<form method="post" action="<%= request.getContextPath() %>/singlepost?idArticle=<c:out value="${article.getId_article()}" />">
			                <input type="hidden" name="purpose" value="C"/>
			                <h2 class="comment-heading">Laisser un commentaire</h2>
			                <div class="box-content">
			                    <p>
			                        <label for="name">${user.nom} ${user.prenom}</label>
			                    </p>
			                    <p>
			                        <label for="contenu">Votre commentaire :</label>
			                        <textarea name="contenu" id="contenu"></textarea>  
			                    </p>
			                    <input type="hidden" name="idArticleToComment" value="${article.getId_article()}"/>
			                    <input type="submit" class="mainBtn" name="submitCommentaire" value="Soumettre commentaire" />
			                </div> <!-- /.box-content -->
			        	</form>
		        	</c:if>
	            </div> <!-- /.comment-form -->
	        </div> <!-- /.row -->
	    </div> <!-- /.inner-content -->
	</div> <!-- /.content-wrapper -->
<c:import url="footer.jsp"></c:import>