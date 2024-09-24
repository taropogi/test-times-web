<%@ include file="includes/header.jsp"%>
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td class="sLeft">&nbsp;</td>
					<td class="content">
						<div class="timesTrading">
							<%@ include file="includes/logo.jsp"%>
							<%@ include file="includes/menu.jsp"%>
							<%--<%@ include file="includes/latest.jsp"%>--%>
							<%--<%@ include file="includes/search.jsp"%>--%>
						</div>
						<div class="mainContent">
							<!-- <div class="masthead"><img src="images/mastheadHome.jpg" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" /></div>-->
							<h1>Thank you for joining our mailing list.</h1>
							<h3>We will send you updates when there are new company promos.</h3>
						</div>
						<%--@ include file="includes/sidenav.jsp"--%>
						<div class="clear"></div>
<%--
<table width="700" height="312" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="43" colspan="3" background="images/bg_breadcrumb.gif">
		<table width="100%" border="0" cellspacing="0" cellpadding="10">
			<tr>
				<td class="breadcrumb">
					<img src="images/icon_folder2.gif" width="14" height="11" /> 
					<a href="#">Thank you for joining our mailing list.</a>
				</td>
				<td align="right">
					<%@ include file="includes/miniicons.jsp"%>
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
						<p>&nbsp;</p>
						<p id="pagetitle">Thank you for joining our mailing list.</p>
						<p>We will send you updates when there
						are new company promos.</p>
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
<c:if test="${not empty salesorder}">
<br />
<c:url var="cancelsalesorderhref" value="salesorder.do">
<c:param name="action" value="cancelSalesOrder" />
</c:url>
<%@ include file="includes/salesorder.jsp" %>
</c:if>
<%@ include file="includes/producthighlights.jsp"%>
--%>
						<%@ include file="/jsp/includes/footer.jsp"%>
						<%@ include file="includes/analytics.jsp" %>
					</td>
					<td class="sRight">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>