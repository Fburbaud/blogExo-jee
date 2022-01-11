<c:import url="header.jsp"></c:import>
	<div class="container">
	<h1>Bonjour</h1>
	<form method="post" action="<%= request.getContextPath() %>/home">
   		<input type="hidden" name="logOut" value="logOut"/>
		<button class="btn btn-lg btn-primary" type="submit">Se deconnecter</button>
	</form>	
	</div>
</body>
</html>
