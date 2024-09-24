<%@ include file="includes/header.jsp"%>
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
						
							<h1>Brand Info</h1>
							
							<table width="100%" border="0" cellpadding="03" cellspacing="01">
								<tr>
									<td><h2>${ brand.name }</h2></td>
								</tr>
								<tr>
									<td style="text-align: center;">
										<c:if test='${brand.imageExtension != null}'>
											<img class="imageborder" border="0" src="images/brand_front_image/brand_<c:out value='${brand.id}' /><c:out value='${brand.imageExtension}' />" />
										</c:if> 
										<c:if test='${brand.imageExtension == null}'>
											<img class="imageborder" border="0" src="images/noimage.jpg" />
										</c:if> 
									</td>
								</tr>
								<tr>
									<td><br /></td>
								</tr>
								<tr>
									<td>${ brand.description }</td>
								</tr>
							</table>
						</div>
						<%--@ include file="includes/sidenav.jsp"--%>
						<div class="clear"></div>
						
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