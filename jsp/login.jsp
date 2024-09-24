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
<c:set var="pageName" value="cataloglogin" />
<body>
	<div class="wrapper">
		<div class="container">
			<%--<%@ include file="includes/latest.jsp"%>--%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td class="sLeft">&nbsp;</td>
					<td class="content">
						<div class="timesTrading">
							<%@ include file="includes/logo.jsp"%>
							<%@ include file="includes/menu.jsp"%>
						</div>
						<div class="mainContentHome" style="width:100%;">
							<div class="loginBox" id="main">
								<h1><img src="images/iLogin.gif" alt="Login" title="Login" align="absmiddle" /> Login</h1>
								<table border="0" cellspacing="5" cellpadding="0" align="center">
									<form name="corporatelogin" method="post" action="companylogin.do" onsubmit="return checkFormInput(this);">
									<input type="hidden" name="action" value="login" />
									<c:if test="${not empty errormessage }">
									<tr>
										<td colspan="3" style="color:rgb(200,0,0);">
											<c:out value="${errormessage}"/>
										</td>
									</tr>
									</c:if>
									<tr>
										<td>Username</td>
										<td>:</td>
										<td><input name="username" type="text" class="inputField" id="username*" /></td>
									</tr>
									<tr>
										<td>Password</td>
						               	<td>:</td>
						               	<td><input name="password" type="password" class="inputField" id="password*" /></td>
									</tr>
									<tr></tr>
						            <tr>
						            <br>
						               	<td colspan="3" class="button"><a href="javascript:void(0);" onclick="document.getElementById('forgottd').style.display='';">Forgot password?</a> <input type="image" src="images/btnGo.gif" alt="Login" title="Login" align="absmiddle" /></td>
									</tr>
									</form>
									<tr>
										<td colspan="3" style="display:none;" id="forgottd">
												<hr>
											<span style="display:block;margin-bottom:10px;">We will send your account information and a new password to your registered email address.</span>
											<span>Email:</span>
											<form name="forgotemail" action="companylogin.do" method="post" onsubmit="return checkFormInput(this);">
												<input type="hidden" name="action" value="forgotPassword"/>
												<input type="text" id="email@*" name="email"/>
												<input type="submit" value="send my account info"/>
												<input type="button" value="cancel" onclick="this.form.reset();document.getElementById('forgottd').style.display='none';"/>
											</form>
											<c:if test="${not empty forgotemailmsg}">
											<br/><span class="errormessage">${forgotemailmsg}</span>
											</c:if>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="clear"></div>
						<%@ include file="/jsp/includes/footer.jsp" %>
						<script language="javascript">
						function focus()
						{
							<c:if test='${empty companyuser}'>
							if(document.corporatelogin != null &&
								document.corporatelogin.username != null){
								document.corporatelogin.username.focus();
							}
							</c:if>
						}
						window.onload = focus;
						</script>
						
						<%@ include file="includes/analytics.jsp" %>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
