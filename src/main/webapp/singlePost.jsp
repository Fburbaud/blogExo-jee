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
	                <h2 class="comment-heading">Comments (3)</h2>
	                <div class="box-content">
	                    <div class="comment">
	                        <div class="comment-inner">
	                            <div class="author-avatar">
	                                <img src="images/blog/avatar1.jpg" alt="">
	                            </div>
	                            <div class="comment-body">
	                                <h4>Terri Belle</h4>
	                                <span>6 November 2084</span>
	                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque ab culpa unde quisquam. Dolorum, sint, nobis quisquam quaerat dicta laudantium at voluptatem eum expedita mollitia quas placeat tenetur possimus eligendi. <a href="#">Reply</a></p>
	                            </div>
	                        </div>
	                        <div class="nested-comment">
	                            <div class="comment">
	                                <div class="comment-inner">
	                                    <div class="author-avatar">
	                                        <img src="images/blog/avatar2.jpg" alt="">
	                                    </div>
	                                    <div class="comment-body">
	                                        <h4>Catherine</h4>
	                                        <span>8 November 2084</span>
	                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque ab culpa unde quisquam. Dolorum, sint, nobis quisquam quaerat dicta laudantium at voluptatem eum expedita mollitia quas placeat tenetur possimus eligendi. <a href="#">Reply</a></p>
	                                    </div>
	                                </div>
	                            </div>  <!-- /.comment -->
	                            <div class="nested-comment">
	                                <div class="comment">
	                                    <div class="comment-inner">
	                                        <div class="author-avatar">
	                                            <img src="images/blog/avatar3.jpg" alt="">
	                                        </div>
	                                        <div class="comment-body">
	                                            <h4>Helen Soft</h4>
	                                            <span>10 November 2084</span>
	                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque ab culpa unde quisquam. Dolorum, sint, nobis quisquam quaerat dicta laudantium at voluptatem eum expedita mollitia quas placeat tenetur possimus eligendi. <a href="#">Reply</a></p>
	                                        </div>
	                                    </div>
	                                </div>  <!-- /.comment -->
	                            </div> <!-- /.nested-comment -->
	                        </div> <!-- /.nested-comment -->
	                    </div> <!-- /.comment -->
	                    <div class="comment last">
	                        <div class="comment-inner">
	                            <div class="author-avatar">
	                                <img src="images/blog/avatar4.jpg" alt="">
	                            </div>
	                            <div class="comment-body">
	                                <h4>Linda Pantra</h4>
	                                <span>12 November 2084</span>
	                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque ab culpa unde quisquam. Dolorum, sint, nobis quisquam quaerat dicta laudantium at voluptatem eum expedita mollitia quas placeat tenetur possimus eligendi. <a href="#">Reply</a></p>
	                            </div>
	                        </div>
	                    </div>  <!-- /.comment -->
	                </div> <!-- /.box-content -->
	            </div> <!-- /.col-md-12 -->
	        </div> <!-- /.row -->
	        <div class="row">
	            <div class="col-md-12 comment-form">
	                <h2 class="comment-heading">Leave a Comment</h2>
	                <div class="box-content">
	                    <p>
	                        <label for="name">Your Name:</label>
	                        <input type="text" name="name" id="name">
	                    </p>
	                    <p>
	                        <label for="email">E-mail:</label>
	                        <input type="text" name="email" id="email">
	                    </p>
	                    <p>
	                        <label for="website">Website:</label>
	                        <input type="text" name="website" id="website">
	                    </p>
	                    <p>
	                        <label for="comment">Your comment:</label>
	                        <textarea name="comment" id="comment"></textarea>  
	                    </p>
	                     <input type="submit" class="mainBtn" id="submit-comment" value="Submit Comment" />
	                </div> <!-- /.box-content -->
	            </div> <!-- /.comment-form -->
	        </div> <!-- /.row -->
	    </div> <!-- /.inner-content -->
	</div> <!-- /.content-wrapper -->
<c:import url="footer.jsp"></c:import>