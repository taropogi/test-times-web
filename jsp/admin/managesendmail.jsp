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
<c:set var="submenu" value="sendmailinglist" />
<c:set var="pagemessage" value="You can see the list of all person or company that added thier email in the mailing list." />

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr>
		<td align="left"><%@ include file="../includes/error.jsp"%></td>
	</tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table" class="projfiles">
		<tr>
			<th colspan="2">
				<img src="images/admin/email.png" width="16" height="16" border="0"/>CREATE EMAIL FOR OUR MAILING LIST
			</th>
		</tr>
		<tr>
			<td class="itemthumb">
				<form method="post" action="adminmanage.do?action=sendEmailToMailingList">
					<span class="itemname">Total enrolled email accounts: </span>
					<span class="itemdescription"><c:out value='${fn:length(mailinglists)}'/></span><br/>
					<span class="itemname">Subject: </span>
					<input type="text" name="title" class="item" />
					<br />
					<span class="itemname">Body:</span><br/>
					<FCK:editor instanceName="body_FCK" width="90%" height="350px" value="" basePath="/FCKeditor" toolbarSet="Basic"/>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="send to mailing list" />
				</form>
			</td>
		</tr>
	</table>
	</div>
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
		<li>This section will let you compose a message and send it to all those who are subscribed to our mailing list.</li>
	</ul>
	</div>
	
	--><br />
	
	<div id="messageadd" style="padding-top: 2px">
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>