<c:import url="header.jsp"></c:import>
	<div class="container">
		<c:if test="${user != null}">
			<h1>Bonjour <c:out value="${user.prenom}"></c:out></h1>
		</c:if>
	</div>
</body>
</html>
