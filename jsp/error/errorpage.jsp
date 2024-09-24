<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<html>
  <head>
    <title>Sorry</title>
  </head>
  <body bgcolor="white">
    We're sorry but the request could not be processed. 
  
  	<br/>
    Error in: ${pageContext.errorData.requestURI}<br/>
    Error message: ${pageContext.errorData.throwable.message}<br/>
    Error description: ${pageContext.errorData.throwable}<br/>
    Error stack trace:<br/>
    <c:forEach items='${pageContext.errorData.throwable.stackTrace}' var="stack">
    	${stack}<br/>
    </c:forEach>
  </body>
</html>
