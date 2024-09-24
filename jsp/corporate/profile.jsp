<%@ include file="../includes/header.jsp"%>
</head>
<c:set var="pageName" value="profile" />
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
							<h2>Profile</h2>
							<table border="0" cellspacing="0" cellpadding="3">
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
										<span class="listusers">Username</span>
									</td>
									<td width="5px">:</td>
									<td align="left">
										<span class="listvalue"><c:out value='${companyuser.username}'/></span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="listusers">User Type</span>
									</td>
									<td>:</td>
									<td align="left">
										<span class="listvalue"><c:out value='${companyuser.usertype.name}'/></span>
									</td>
								</tr>
								<!--if this is a company administrator log in we need not show the department-->
								<c:if test='${not companyuser.usertype.name eq "Administrator"}'>
								<tr>
									<td align="left">
										<span class="listusers">Department</span>
									</td>
									<td>:</td>
									<td align="left">
										<span class="listvalue"><c:out value='${companyuser.department.name}'/></span>
									</td>
								</tr>
								</c:if>
								<tr>
									<td align="left">
										<span class="listusers">First Name</span>										
									</td>
									<td>:</td>
									<td align="left">
										<span class="listvalue"><input type="text" name="firstname" value="<c:out value='${companyuser.firstname}'/>"/></span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="listusers">Last name</span>
									</td>
									<td>:</td>
									<td align="left">
										<span class="listvalue"><input type="text" name="lastname" value="<c:out value='${companyuser.lastname}'/>"/></span>
									</td>
								</tr>
								<tr>
									<td align="left">
										<span class="listusers">Email</span>
									</td>
									<td>:</td>
									<td align="left">
										<span class="listvalue"><input type="text" name="email" value="<c:out value='${companyuser.email}'/>"/></span>
									</td>
								</tr>		
								<tr>
									<td></td>		
									<td></td>																
									<td align="left"><br /><input type="submit" value="Update Account Profile" class="formButton"/></td>
								</tr>
								</form>
							</table>
						</div>
						<%-- <%@ include file="../includes/sidenav.jsp"%>--%>
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