<!--check if there is an error message in session-->
<c:if test="${not empty errormessage}">
	Error:&nbsp;<c:out value="${errormessage}"/>
</c:if>
