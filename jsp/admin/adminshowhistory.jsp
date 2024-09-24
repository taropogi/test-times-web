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
<c:set var="submenu" value="history" />
<c:set var="pagemessage" value="Modify the History Detail." />

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr>
		<td align="left"><%@ include file="../includes/error.jsp"%></td>
	</tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<form method="post" action="adminhistory.do?action=adminUpdateHistory" enctype="multipart/form-data">  
	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="table" class="projfiles">
		<tr>
			<td><p>
				<b><br />Header Image </b>
				<br />
				<c:if test="${not empty history.imageUrl}">
					<img src="${ fn:replace(history.imageUrl, '\\', '/') }" width="700px" height="350px"/>
					<br />
				</c:if>
				</p>
			</td>
		</tr>
		<tr>
			<td><p>
				<b><br />Other Images</b>
				<br />
				
				<c:forEach items="${history.images}" var="hi">
					<c:if test="${not fn:contains(history.imageUrl, hi)}">
						<div>
						<img src="${ fn:replace(hi, '\\', '/') }" width="700px" height="350px"/>
						<br />
						<p>${url}/${fn:replace(hi, '\\', '/')} | 
						
						<%-- use this for windows based OS: ${fn:split(hi, '\\')[2]} --%>
						<a href="adminhistory.do?action=deleteHistoryImage&imageName=${fn:split(hi, '/')[2]}" onclick="return confirm('Delete this image?')">[Delete Image]</a>
						
						</p>
						</div>
					</c:if>
				</c:forEach>
				<input type="file" name="file" />
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<img src="images/admin/email.png" width="16" height="16" border="0"/>HISTORY DETAIL
			</th>
		</tr>
		<tr>
			<td class="itemthumb">
				<FCK:editor instanceName="body_FCK" width="90%" height="350px" value="${history.details}" basePath="/FCKeditor" toolbarSet="Basic"/>
			</td>
		</tr>
		<tr>
			<td align="center">
			<input type="submit" value="update History detail" />  
			</td>
		</tr>
	</table>
	</form>
	</div>
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
		<li>This section will let you compose or update the History detail displayed in the home page.</li>
	</ul>
	</div>
	
	--><br />
	
	<div id="messageadd" style="padding-top: 2px">
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>