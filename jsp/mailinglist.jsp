<%@ include file="includes/header.jsp"%>
<script language="JavaScript" type="text/javascript">
function checkFormInput(form)
{
	if (!MyForm.validate(form))
	{
		return false;
	}
	return true;
}
</script>
</head>
<c:set var="pageName" value="productsmail" />
<body>
<div class="wrapper">
<div class="container">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr valign="top">
		<td class="sLeft">&nbsp;</td>
		<td class="content">
		<div class="timesTrading"><%@ include file="includes/logo.jsp"%>
		<%@ include file="includes/menu.jsp"%> <%--<%@ include file="includes/latest.jsp"%>--%>
		<%--<%@ include file="includes/search.jsp"%>--%></div>
		<div class="mainContent">
		<div class="newsBox" id="main">
		<h1><img
			src="images/iMail.gif" alt="Join Our Mailing List"
			title="Join Our Mailing List" align="absmiddle" /> Join Our Mailing
		List</h1>
		<form name="joinmail" method="post"
			onsubmit="return checkFormInput(this);"
			action="mailing.do?action=addEmail">
		<table border="0" cellspacing="5" cellpadding="0" align="center">
			<tr>
				<td align="right">Name:</td>
				<td><input type="text" name="name" id="name*"
					class="inputField" /></td>
			</tr>
			<tr>
				<td align="right">Company:</td>
				<td><input type="text" name="company" id="company*"
					class="inputField" /></td>
			</tr>
			<tr>
				<td align="right">Email:</td>
				<td><input name="email" type="text" class="inputField"
					id="email*@" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><img src="images/btnJoin.gif"
					alt="Join" title="Join"
					onclick="if(checkFormInput(joinmail))joinmail.submit();" /></td>
			</tr>
		</table>
		</form>
		</div>
		</div>
		<%--@ include file="includes/sidenav.jsp"--%>
		<div class="clear"></div>
		<%@ include file="/jsp/includes/footer.jsp"%>
		<%@ include file="includes/analytics.jsp"%></td>
		<td class="sRight">&nbsp;</td>
	</tr>
</table>
</div>
</div>
</body>
</html>