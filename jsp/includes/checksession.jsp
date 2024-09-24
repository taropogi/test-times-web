<!--check if there is a valid user logged in-->
<c:if test="${empty userloggedin.username}">
	<c:url value="/login.do" var="invalidaccess" context="/">	
			<c:param name="action" value="logout"/>
	</c:url>
	<c:set var="errormessage" value="Inactive user session or illegal page access!" scope="request"/>
	<c:redirect url="${invalidaccess}"/>

</c:if>
