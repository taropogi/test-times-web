<%@ include file="../includes/header.jsp"%>
<style type="text/css">
.newsimage {
	float:left;
	margin-right:10px;
}
</style>
<body>
<%@ include file="../includes/logo.jsp"%>
<c:set var="pageName" value="corporate" />
<%@ include file="../includes/menu.jsp"%>
<%@ include file="../includes/latest.jsp"%>
<%@ include file="../includes/search.jsp"%>
<table width="700" height="312" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="43" colspan="3" background="images/bg_breadcrumb.gif">
		<table width="100%" border="0" cellspacing="0" cellpadding="10">
			<tr>
				<td class="breadcrumb">
					<img src="images/icon_folder2.gif" width="14" height="11" /> 
					<a href="#">You have successfully logged in.</a>
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
		<table width="100%" border="0" cellspacing="0" cellpadding="10">
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="84%" valign="top">
						<p id="pagetitle">
						Welcome <c:out value='${companyuser.firstname }' /> <c:out value='${companyuser.lastname }'/> of <c:out value='${companyuser.company.name}'/>.
						</p>
						<p id="pagedetail">
						You have successfully logged in.<br/><br/>
						You can now start using the <strong>corporate</strong> section of our website for product catalog browsing and online purchases.
						</p>
					</tr>
				</table>
				</td>
			</tr>
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
<%@ include file="../includes/footer.jsp" %>
</body>
</html>