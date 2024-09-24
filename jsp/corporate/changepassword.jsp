<%@ include file="../includes/header.jsp"%>
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
<c:set var="pageName" value="changepassword" />
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
							<h2>Change Password</h2>
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
								<input type="hidden" name="myaccount" value="" />
								<tr>
									<td align="left" valign="top"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
									<td align="left" valign="top"><img src="images/spacer.gif" width="40" height="1" border="0" alt=""></td>
									<td align="left" valign="top"><img src="images/spacer.gif" width="200" height="1" border="0" alt=""></td>
								</tr>
								<tr>
									<td align="left" valign="top">
										<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
									</td>
									<td colspan="2">
										<span class="listnote">Leave the password fields blank if you don't want to change your old password.</span>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top"><img src="images/spacer.gif" height="10" border="0" alt=""></td>
								</tr>
								<tr>
									<td align="left" valign="top">
										<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
									</td>
									<td align="left">
										<span class="listusers">Current Password: </span>
									</td>
									<td>
										<span class="listvalue"><input type="password" name="currentpassword"/></span>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top">
										<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
									</td>
									<td align="left">
										<span class="listusers">New Password: </span>
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
										<span class="listusers">Verify New Password: </span>
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
									<td align="left"><input type="submit" value="Change Password"/></td>
								</tr>	
								<tr>
									<td align="left" valign="top" colspan="3"><img src="images/spacer.gif" width="1" height="6" border="0" alt=""></td>
								</tr>
								</form>
							</table>
						</div>
						<%--@ include file="includes/sidenav.jsp"--%>
						<div class="clear"></div>						
						<%@ include file="/jsp/includes/footer.jsp"%>					
					</td>
					<td class="sRight">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>