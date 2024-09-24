<%@ include file="../includes/adminheader.jsp"%>

<script type="text/javascript" src="FCKeditor/fckeditor.js"></script>

<script language="javascript">
<%@ include file="/javascripts/adminforms.js" %>
</script>

<c:set var="menu" value="corporate"/>
<c:set var="submenu" value="contactus"/>
<c:set var="pagemessage" value="You can add, update and delete \"Contact Us\" pages here."/>
<%@ include file="../includes/adminnav.jsp"%>

<body>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>


<div id="containerdash">
	<div id="messagearea">
	
	<form action="admincontactus.do" onsubmit="return validate(this);" method="post">
		<input type="hidden" name="action" value="adminUpdateContactUs"/>
		<input type="hidden" name="id" value='<c:out value='${singlecontactus.id}'/>'/>
	
	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles" >
		<tr>
			<th colspan="2">Edit Contact Us</th>
		</tr>
		
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles" >
					<tr class="bground">
						<td class="itemthumb">
							<%@ include file="../includes/error.jsp"%>
							<table border="0" cellspacing="01" cellpadding="01" width="100%">
								<tr>
									<td>
										<span class="itemname">Title:<span class="requiredfield">*</span></span>
									</td>
									<td>
										<input type="text" id="title*" name="title*" value="${singlecontactus.title}" class="item"/>
									</td>
								</tr>
								<tr>
									<td>
										<span class="itemname">Subtitle:</span>
									</td>
									<td>
										<input type="text" name="subtitle" value="${singlecontactus.subtitle}" class="item"/>
									</td>
								</tr>
								<tr>
									<td>
										<span class="itemname">Company:</span>
									</td>
									<td>
										<span class="item">${singlecontactus.company.name}</span>
									</td>
								</tr>
								<tr valign="top">
									<td>
										<span class="itemname">Body:</span>
									</td>
									<td colspan="3">
									<FCK:editor instanceName="body_FCK" width="95%" height="350px" value="${singlecontactus.body}" basePath="/FCKeditor" toolbarSet="Basic"/>
									</td>
								</tr>
								<tr>
									<td align="center" colspan="4">
										<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
										<input type="submit" class="buttonitem" name="submitb" value="Update" />
										<input type="button" class="buttonitem" name="cancelb" value="reset" onclick="this.form.reset();" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
			</table>
		</td>
	</tr>
	</form>
	</table>
	</div>
   
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>You can add, edit and delete "Contact Us" pages here.</li>
	<li>Another Tip.</li>
	</ul>
	</div>
	--><br>

	<%@ include file="../includes/adminfooter.jsp"%>
	</div>
</div>
</body>
</html>
