<%@ include file="../includes/header.jsp"%>
<script type='text/javascript' src='dwr/interface/CorporateUser.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>
<script type="text/javascript">
function checkpassword(form)
{
	var pass = form.password.value;
	var vpass = form.vpassword.value;
	var cpass = form.currentpassword.value;
	if (pass.length > 0 || vpass.length > 0)
	{
		if(pass != vpass){
			form.password.value = "";
			form.vpassword.value = "";
			form.password.focus();
			alert("Passwords do not match");
			return false;
		}
		if(cpass.length == 0){
			form.currentpassword.focus();
			alert("Provide your current password");
			return false;
		}
	}
	return true;
}
</script>
</head>
<c:set var="pageName" value="settings" />
<body>
	<div class="wrapper">
		<div class="container">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td class="sLeft">&nbsp;</td>
					<td class="content">
						<div class="timesTrading">
							<%@ include file="../includes/logo.jsp"%>
							<%@ include file="../includes/menu.jsp"%>
						</div>
						<div class="mainContent">
							<h2>Account Settings for <c:out value='${companyuser.firstname}'/> <c:out value='${companyuser.lastname}'/></h2>
							<table width="100%" border="0" cellspacing="2" cellpadding="0" class="asettings">
								<c:if test='${not empty errormessage}'>
								<tr>
									<td colspan="3" class="listusers" style="color:red;">
											<c:out value='${errormessage}'/>
									</td>
								</tr>
								</c:if>
								<form name="edituser" onsubmit="return checkpassword(this);" action="corporateuser.do?action=saveUserSetting" method="post">
								<input type="hidden" name="id" value="<c:out value='${companyuser.id}'/>"/>
								<tr>
									<td align="left" valign="top"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
									<td align="left" valign="top"><img src="images/spacer.gif" width="40" height="1" border="0" alt=""></td>
									<td align="left" valign="top"><img src="images/spacer.gif" width="200" height="1" border="0" alt=""></td>
								</tr>
								<tr>
									<td align="left">
										<span class="listusers">Username: </span>
									</td>
									<td>
										<span class="listvalue"><c:out value='${companyuser.username}'/></span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="listusers">User Type: </span>
									</td>
									<td>
										<span class="listvalue"><c:out value='${companyuser.usertype.name}'/></span>
									</td>
								</tr>
								<!--if this is a company administrator log in we need not show the department-->
								<c:if test='${not companyuser.usertype.name eq "Administrator"}'>
								<tr>									
									<td align="left">
										<span class="listusers">Department: </span>
									</td>
									<td>
										<span class="listvalue"><c:out value='${companyuser.department.name}'/></span>
									</td>
								</tr>
								</c:if>
								<tr>								
									<td align="left">
										<span class="listusers">First Name: </span>
									</td>
									<td>
										<span class="listvalue"><input type="text" class="asettings" name="firstname" value="<c:out value='${companyuser.firstname}'/>"/></span>
									</td>
								</tr>
								<tr>								
									<td align="left">
										<span class="listusers">Last name: </span>
									</td>
									<td>
										<span class="listvalue"><input type="text" class="asettings" name="lastname" value="<c:out value='${companyuser.lastname}'/>"/></span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="listusers">Email: </span>
									</td>
									<td>
										<span class="listvalue"><input type="text" class="asettings" name="email" value="<c:out value='${companyuser.email}'/>"/></span>
									</td>
								</tr>
								<tr>							
									<td>
										<span class="listusers">Sales Orders to show per page: </span>
									</td>
									<td>
										<span class="listvalue">
											<select class="input" name="salesOrderPerPage">
							  				<option value="5" <c:if test='${companyuser.salesOrderPerPage eq 5}'>selected</c:if>>5</option>
												<option value="8" <c:if test='${companyuser.salesOrderPerPage eq 8}'>selected</c:if>>8</option>
												<option value="10" <c:if test='${companyuser.salesOrderPerPage eq 10}'>selected</c:if>>10</option>
												<option value="15" <c:if test='${companyuser.salesOrderPerPage eq 15}'>selected</c:if>>15</option>
												<option value="20" <c:if test='${companyuser.salesOrderPerPage eq 20}'>selected</c:if>>20</option>
												<option value="30" <c:if test='${companyuser.salesOrderPerPage eq 30}'>selected</c:if>>30</option>
												<option value="50" <c:if test='${companyuser.salesOrderPerPage eq 50}'>selected</c:if>>50</option>
						  				</select>
										</span>
									</td>
								</tr>
								</table>
								<hr>
								<table width="100%" border="0" cellspacing="2" cellpadding="0" class="asettings">
								<tr>	
									<td colspan="2">
										<span class="listnote">Leave the password fields blank if you don't want to change your old password. Otherwise input a new password.</span>
									</td>
								</tr>	
								<tr>						
									<td align="left">
										<span class="listusers">Current Password: </span>
									</td>
									<td>
										<span class="listvalue"><input class="asettings" type="password" name="currentpassword"/></span>
									</td>
								</tr>
								<tr>								
									<td align="left">
										<span class="listusers">New Password: </span>
									</td>
									<td>
										<span class="listvalue"><input class="asettings" type="password" name="password"/></span>
									</td>
								</tr>
								<tr>	
									<td align="left">
										<span class="listusers">Verify New Password: </span>
									</td>
									<td>
										<span class="listvalue"><input class="asettings" type="password" name="vpassword"/></span>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top" colspan="3"><img src="images/spacer.gif" width="1" height="8" border="0" alt=""></td>
								</tr>			
								<tr>
									<td align="left" valign="top"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
									<td align="left"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
									<td><input type="submit" value="Update Account Info"/></td>
								</tr>	
								<tr>
									<td align="left" valign="top" colspan="3"><img src="images/spacer.gif" width="1" height="6" border="0" alt=""></td>
								</tr>
								</form>
							</table>
						</div>
						<%-- <%@ include file="../includes/sidenav.jsp"%>--%>
						<div class="clear"></div>
<%--
<table width="700" height="312" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="43" colspan="3" background="images/bg_breadcrumb.gif">
		<table width="100%" border="0" cellspacing="0" cellpadding="10">
			<tr>
				<td class="breadcrumb">
					<img src="images/icon_folder2.gif" width="14" height="11" /> 
					<a href="#">Account Settings for <c:out value='${companyuser.firstname}'/> <c:out value='${companyuser.lastname}'/></a>
				</td>
				<td align="right">
					<%@ include file="../includes/miniicons.jsp"%>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr valign="top">
		<td width="3" height="265" bgcolor="#EFF3F3">
			<img src="images/breadcrumb_left.gif" width="3" height="265" />
		</td>
		<td width="693">
		<table width="100%" border="0" cellspacing="2" cellpadding="0">
			<c:if test='${not empty errormessage}'>
			<tr>
				<td colspan="3" class="listusers" style="color:red;">
						<c:out value='${errormessage}'/>
				</td>
			</tr>
			</c:if>
			<form name="edituser" onsubmit="return checkpassword(this);" action="corporateuser.do?action=saveUserSetting" method="post">
			<input type="hidden" name="id" value="<c:out value='${companyuser.id}'/>"/>
			<tr>
				<td align="left" valign="top"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
				<td align="left" valign="top"><img src="images/spacer.gif" width="40" height="1" border="0" alt=""></td>
				<td align="left" valign="top"><img src="images/spacer.gif" width="200" height="1" border="0" alt=""></td>
			</tr>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td align="left">
					<span class="listusers">Username: </span>
				</td>
				<td>
					<span class="listvalue"><c:out value='${companyuser.username}'/></span>
				</td>
			</tr>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td align="left">
					<span class="listusers">User Type: </span>
				</td>
				<td>
					<span class="listvalue"><c:out value='${companyuser.usertype.name}'/></span>
				</td>
			</tr>
			<!--if this is a company administrator log in we need not show the department-->
			<c:if test='${not companyuser.usertype.name eq "Administrator"}'>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td align="left">
					<span class="listusers">Department: </span>
				</td>
				<td>
					<span class="listvalue"><c:out value='${companyuser.department.name}'/></span>
				</td>
			</tr>
			</c:if>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td align="left">
					<span class="listusers">First Name: </span>
				</td>
				<td>
					<span class="listvalue"><input type="text" name="firstname" value="<c:out value='${companyuser.firstname}'/>"/></span>
				</td>
			</tr>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td align="left">
					<span class="listusers">Last name: </span>
				</td>
				<td>
					<span class="listvalue"><input type="text" name="lastname" value="<c:out value='${companyuser.lastname}'/>"/></span>
				</td>
			</tr>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td align="left">
					<span class="listusers">Email: </span>
				</td>
				<td>
					<span class="listvalue"><input type="text" name="email" value="<c:out value='${companyuser.email}'/>"/></span>
				</td>
			</tr>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td>
					<span class="listusers">Sales Orders to show per page: </span>
				</td>
				<td>
					<span class="listvalue">
						<select class="input" name="salesOrderPerPage">
		  				<option value="5" <c:if test='${companyuser.salesOrderPerPage eq 5}'>selected</c:if>>5</option>
							<option value="8" <c:if test='${companyuser.salesOrderPerPage eq 8}'>selected</c:if>>8</option>
							<option value="10" <c:if test='${companyuser.salesOrderPerPage eq 10}'>selected</c:if>>10</option>
							<option value="15" <c:if test='${companyuser.salesOrderPerPage eq 15}'>selected</c:if>>15</option>
							<option value="20" <c:if test='${companyuser.salesOrderPerPage eq 20}'>selected</c:if>>20</option>
							<option value="30" <c:if test='${companyuser.salesOrderPerPage eq 30}'>selected</c:if>>30</option>
							<option value="50" <c:if test='${companyuser.salesOrderPerPage eq 50}'>selected</c:if>>50</option>
	  				</select>
					</span>
				</td>
			</tr>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td colspan="2">
					<span class="listnote">Leave the password fields blank if you don't want to change your old password. Otherwise input a new password.</span>
				</td>
			</tr>	
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td align="left">
					<span class="listusers">Password: </span>
				</td>
				<td>
					<span class="listvalue"><input type="password" name="password"/></span>
				</td>
			</tr>
			<tr>
				<td align="left" valign="top">
					<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
				</td>
				<td align="left">
					<span class="listusers">Verify Password: </span>
				</td>
				<td>
					<span class="listvalue"><input type="password" name="vpassword"/></span>
				</td>
			</tr>
			<tr>
				<td align="left" valign="top" colspan="3"><img src="images/spacer.gif" width="1" height="8" border="0" alt=""></td>
			</tr>			
			<tr>
				<td align="left" valign="top"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
				<td align="left"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
				<td><input type="submit" value="update account info"/></td>
			</tr>	
			<tr>
				<td align="left" valign="top" colspan="3"><img src="images/spacer.gif" width="1" height="6" border="0" alt=""></td>
			</tr>
			</form>
		</table>
		</td>
		<td width="4" bgcolor="#EFF3F3">
			<img src="images/breadcrumb_right.gif" width="4" height="265" />
		</td>
	</tr>
	<tr>
		<td height="4" colspan="3">
			<img src="images/breadcrumb_bottom.gif" width="700" height="4" />
		</td>
	</tr>
</table>
<%@ include file="../includes/producthighlights.jsp"%>
--%>						
						<%@ include file="/jsp/includes/footer.jsp"%>					
					</td>
					<td class="sRight">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>