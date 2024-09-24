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
<c:set var="submenu" value="aboutus" />
<c:set var="pagemessage" value="Modify the About Us Detail." />

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr>
		<td align="left"><%@ include file="../includes/error.jsp"%></td>
	</tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<form method="post" action="adminaboutus.do?action=adminUpdateAboutUs" enctype="multipart/form-data">  
	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table" class="projfiles">
		<tr>
			<td><p>
				<b><br />Header Image</b>
				<br />
				<c:if test="${ not empty aboutus.imageUrl }">
					<img src="${ fn:replace(aboutus.imageUrl, '\\', '/') }" width="700px" height="350px"/>
					<br />
				</c:if>
				<input type="file" name="file" />
				</p>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<img src="images/admin/email.png" width="16" height="16" border="0"/>ABOUT US DETAIL
			</th>
		</tr>
		<tr>
			<td class="itemthumb">
				<FCK:editor instanceName="body_FCK" width="90%" height="350px" value="${aboutus.details}" basePath="/FCKeditor" toolbarSet="Basic"/>
			</td>
		</tr>
		<tr>
			<td align="center">
			<input type="submit" value="update About Us detail" />  
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