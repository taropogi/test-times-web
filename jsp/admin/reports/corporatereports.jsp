<%@ include file="../../includes/adminheader.jsp"%>

<style type="text/css">@import url(css/calendar-blue.css);</style>
<script type="text/javascript" src="javascripts/calendar.js"></script>
<script type="text/javascript" src="javascripts/calendar-en.js"></script>
<script type="text/javascript" src="javascripts/calendar-setup.js"></script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script type='text/javascript' src='javascripts/companyreport.js'></script>

<%-- 
<script language="javascript" type="text/javascript">
<!--

/*var map = 
{
	<c:forEach items="${companies}" var="company" varStatus="ctr">
	${company.id}: new Array(<c:forEach items="${company.departments}" var="department" varStatus="ctr2"><c:if test='${ctr2.index > 0}'>, </c:if>{name:"${department.name}", id:${department.id}}</c:forEach>)<c:if test='${not ctr.last}'>,</c:if>
	</c:forEach>
};

function init()
{
	
	var form7 = document.form7;
	
	populatecompany(form7.companyId.value, form7.department);
}*/

//-->
</script>--%>

<body onload="">

<c:set var="menu" value="reports"/>
<c:set var="submenu" value="reports"/>
<c:set var="pagemessage" value="You can generate reports here."/>

<%@ include file="../../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr><td align="left">
		<%@ include file="../../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
		<td align="left" valign="top">
			<br/>
			<%@include file="reportmenu.jsp" %>
			<br/><br/>
		</td>
		<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
		</tr>
	</table>		
	</div>
	
	<!--<div id="messagenews">
	<%@ include file="../../includes/tips.jsp"%>
	<ul>
	<li>This page is to generate the reports.</li>
	</ul>
	</div>
	--><br>
	
	<div id="messageadd">
	</div>

<%@ include file="../../includes/adminfooter.jsp"%>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
</body>
</html>