<%@ include file="includes/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
</head>
<c:set var="pageName" value="brands" />
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
							<table width="100%" align="center" cellspacing="0" cellpadding="0" border="0">
								<tr>
									<h2>Advanced Search</h2>
								</tr>
								<tr valign="top">
									<!-- middle -->
									<td width="100%"><!-- the table of actual brand -->
									<form action="<c:url value='search.do'><c:param name='action' value='advancedSearch'/></c:url>" method="post">
									<table width="100%" border="0" cellpadding="03" cellspacing="01">		  
									  <tr>
									    <td>Product Code:</td><td><input type="text" name="productcode" id="productcode"/></td>
									  </tr>
									  <tr>
									    <td>Unique Item Code:</td><td><input type="text" name="uniqueitem" id="uniqueitem"/></td>
									  </tr>
									  <tr>
									    <td>Company Item Code:</td><td><input type="text" name="companyitem" id="companyitem"/></td>
									  </tr>
									  <tr>
									    <td>Unit of Measure:</td><td><input type="text" name="unit" id="unit"/></td>
									  </tr>
									  <tr>
									    <td>Product Name:</td><td><input type="text" name="productname" id="productname"/></td>
									  </tr>
									  <tr>
									    <td>Description:</td><td><input type="text" name="description" id="description"/></td>
									  </tr>
									  <tr><td><input type="submit" value="Advanced "/></td></tr>
									</table>
									</form>
									</td>
								</tr>
							</table>
						</div>
						<%--@ include file="includes/sidenav.jsp"--%>
						<div class="clear"></div>
<%--
<table width="700" align="center" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<!-- top -->
		<td height="43" colspan="3" background="images/bg_breadcrumb.gif">
		<table width="100%" cellpadding="10" cellspacing="0" border="0">
			<tr>
			<td class="breadcrumb"><a href="#">Advanced Search</a></td>
			<td align="right"><%@ include file="includes/miniicons.jsp"%></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr valign="top">
		<!-- middle -->
		<td width="3" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_left.gif" width="3"
			height="265" /></td>
		<td width="693"><!-- the table of actual brand -->
		<form action="<c:url value='search.do'><c:param name='action' value='advancedSearch'/></c:url>" method="post">
		<table width="100%" border="0" cellpadding="03" cellspacing="01">
//comment out 
		  <tr>
		    <td>Brand:</td><td><input type="text" name="brand" id="brand"/></td>
		  </tr>
//end comment out		  
		  <tr>
		    <td>Product Code:</td><td><input type="text" name="productcode" id="productcode"/></td>
		  </tr>
		  <tr>
		    <td>Unique Item Code:</td><td><input type="text" name="uniqueitem" id="uniqueitem"/></td>
		  </tr>
		  <tr>
		    <td>Company Item Code:</td><td><input type="text" name="companyitem" id="companyitem"/></td>
		  </tr>
		  <tr>
		    <td>Unit of Measure:</td><td><input type="text" name="unit" id="unit"/></td>
		  </tr>
		  <tr>
		    <td>Product Name:</td><td><input type="text" name="productname" id="productname"/></td>
		  </tr>
		  <tr>
		    <td>Description:</td><td><input type="text" name="description" id="description"/></td>
		  </tr>
		  <tr><td><input type="submit" value="Advanced "/></td></tr>
		</table>
		</form>
		</td>
		<td width="4" bgcolor="#EFF3F3" valign="top">
			<img src="images/breadcrumb_right.gif" width="4" height="265" />
		</td>
	</tr>
	<tr>
		<!-- buttom -->
		<td height="4" colspan="3"><img src="images/breadcrumb_bottom.gif" width="700" height="4" /></td>
	</tr>
</table>

<c:url var="cancelsalesorderhref" value="brand.do">
<c:param name="action" value="cancelSalesOrder" />
</c:url>
<%@ include file="includes/salesorder.jsp" %>
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