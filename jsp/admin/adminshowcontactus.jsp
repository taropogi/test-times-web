<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/utilities.js'></script>

<script language="JavaScript" type="text/javascript">
<!--
//-->
</script>


<body>
<c:set var="menu" value="manage" />
<c:set var="submenu" value="contactus" />
<c:set var="pagemessage" value="Modify the Contact Us page of all Generic companies." />
<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr>
		<td align="left"><%@ include file="../includes/error.jsp"%></td>
	</tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<form method="post" action="admincontactus.do?action=adminUpdateGenericContactUs">  
	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table" class="projfiles">
		<tr>
			<th colspan="2">
				CONTACT US
			</th>
		</tr>
		<tr>
			<td class="itemthumb">
				<FCK:editor instanceName="body_FCK" width="90%" height="350px" value="${contactus ne null ? contactus.body : ''}" basePath="/FCKeditor" toolbarSet="Basic"/>
			</td>
		</tr>
		<tr>
			<td align="center">
			<input type="submit" value="Update Contact Us" />  
			</td>
		</tr>
	</table>
	</form>
	</div>
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
		<li>This section will let you compose or update the About Us detail displayed in the home page.</li>
	</ul>
	</div>
	
	--><br />
	
	<div id="messageadd" style="padding-top: 2px">
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>