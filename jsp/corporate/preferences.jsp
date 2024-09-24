<%@ include file="../includes/header.jsp"%>
</head>
<c:set var="pageName" value="preferences" />
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
							<h2>Preferences</h2>
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
									<td>
										<span class="listusers">Sales Orders to show per page:</span>
										<span class="listvalue">
										<select name="salesOrderPerPage">
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
									<td align="left" valign="top" colspan="3"><img src="images/spacer.gif" width="1" height="8" border="0" alt=""></td>
								</tr>			
								<tr>
									<td align="left" colspan="2"><input type="submit" value="Update Account Preferences"/></td>
								</tr>	
								<tr>
									<td align="left" valign="top" colspan="3"><img src="images/spacer.gif" width="1" height="6" border="0" alt=""></td>
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