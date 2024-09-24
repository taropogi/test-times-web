<%@ include file="../../includes/adminheader.jsp"%>
<body>

<c:set var="menu" value="reports"/>
<c:set var="submenu" value=""/>
<c:set var="pagemessage" value="You can add, update and delete the company profile here."/>

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
			<table id="table" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
			  <tr>
			  	<td class="itemthumb">
						<c:out value="${path}" escapeXml="false"/>
						<br/>
						<a href="<c:url value="${link}"></c:url>">download PDF file</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="<c:url value="${excellink}"></c:url>">download Excel file</a>
				</td>

			  </tr>
			</table>		
		</td>
		<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
		</tr>
	</table>
	</div>
	
	<div style="clear:both;"></div>
	
<%@ include file="../../includes/adminfooter.jsp"%>
</div>
</body>
</html>