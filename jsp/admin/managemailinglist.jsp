<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/utilities.js'></script>

<script language="JavaScript" type="text/javascript">
<!--
	function deleteAMailingList(id)
	{
		if (confirm('Are you sure you want to delete a mailing list?'))
		{
			AdminManageAction.deleteMailingList(id, {
				callback:function(isDeleted)
				{
					if(isDeleted){
						MyTable.deleteRow($('table'), "tr" + id);
					}
					else{
						alert('Error deleting user!');
					}
				}
			});
		}
	}
//-->
</script>

<body>
<c:set var="menu" value="manage" />
<c:set var="submenu" value="mailinglist" />
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
				<img src="images/admin/email.png" width="16" height="16" border="0"/> WEB USER EMAIL DETAILS
			</th>
		</tr>
		<c:forEach items="${mailinglists}" var="mailinglist" varStatus="counter">
			<tr id="tr<c:out value='${mailinglist.id}'/>" class="bground">
				<td class="itemthumb">
					<span class="itemname">Name: </span>
					<span class="itemdescription"><c:out value='${mailinglist.name}' /></span>
					&nbsp;&nbsp;
					<span class="itemname">Email: </span>
					<span class="itemdescription"><c:out value='${mailinglist.email}' /></span>
					&nbsp;&nbsp;
					<span class="itemname">Company: </span>
					<span class="itemdescription"><c:out value='${mailinglist.company}' /></span>
				</td>
				<td class="itemthumb" align="right">
					<a class="editdel" href="javascript:void(0);" onclick="deleteAMailingList(<c:out value='${mailinglist.id}'/>);">delete</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
		<li>This sections shows all the email accounts that would like to subscribe to the company mailing list.</li>
	</ul>
	</div>
	
	--><br />
	
	<div id="messageadd" style="padding-top: 2px">
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>
