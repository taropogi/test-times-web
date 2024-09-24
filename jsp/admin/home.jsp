<%@ include file="../includes/adminheader.jsp"%>

<body>
<c:set var="menu" value="dashboard"/>

<c:set var="pagemessage" value="Website content management system developed by Ivant Technologies."/>
<%@ include file="../includes/adminnav.jsp"%>

	<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
		<tr><td align="left">
			<%@ include file="../includes/error.jsp"%>
		</td></tr>
	</table>

	<div id="containerdash">
		<div id="messagearea">
		<br/>
		<c:out value='${message}'/>
		<br/>
		Please select the sections from the tabs above.
		</div>
	
		<!--<div id="messagenews">
			<%--@ include file="../includes/tips.jsp"--%>
			<ul>
				<li>This is the home section for the Content Management System.</li>
				<li>Select the items from the tabs in the menu.</li>
			</ul>
		</div>
		--><br/>
	
		<%@ include file="../includes/adminfooter.jsp"%>

	</div>
</body>
</html>
