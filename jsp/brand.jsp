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
							<!--<c:if test="${empty companyuser}">
							<div class="masthead"><img src="images/mastheadHome.jpg" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" /></div>
							</c:if>-->
							<h1>Brands</h1>
							<c:set var="NUMBER_OF_ITEM_PER_ROW" value="4" />
							<c:set var="WIDTH_PER_ITEM_F" value="${100 / NUMBER_OF_ITEM_PER_ROW}" />
							<fmt:parseNumber var="WIDTH_PER_ITEM" value='${WIDTH_PER_ITEM_F}' integerOnly="" />
							<c:set var="column" value="0" />
							<table width="100%" border="0" cellpadding="03" cellspacing="01">
								<tr>
									<td colspan="${NUMBER_OF_ITEM_PER_ROW}" id="newsdetails">Some of the brands that we carry. <a href="mailto:info@times.com.ph?subject=inquiry from the website">Email</a> us for more info.</td>
								</tr>
								<tr align="center" valign="middle">
									<c:forEach items="${brands}" var="brand" varStatus="counter">
										<td width="<c:out value='${WIDTH_PER_ITEM}'/>%">
											<c:if test='${not empty companyuser}'><a class="brandlink" href="<c:url value="brand.do"><c:param name="action" value="showBrandProducts"/><c:param name="brandid" value="${brand.id}"/></c:url>"></c:if>
											<c:if test='${empty companyuser}'><a class="brandlink" href="<c:url value="brand.do"><c:param name="action" value="showBrandInfo"/><c:param name="brandid" value="${brand.id}"/></c:url>"></c:if>
											
											<c:if test='${brand.imageExtension != null}'>
												<img class="imageborder" border="0" src="images/brand_thumb_image/brand_<c:out value='${brand.id}' /><c:out value='${brand.imageExtension}' />" />
											</c:if> 
											<c:if test='${brand.imageExtension == null}'>
												<img class="imageborder" border="0" src="images/noimage.jpg" />
											</c:if> 
											<br /><c:out value='${brand.name}' />
											</a>
										</td>
										<c:if test="${counter.count % NUMBER_OF_ITEM_PER_ROW == 0}">
										</tr>
										<tr align="center" valign="middle">
										</c:if>
										<c:set var="column" value="${counter.count}" />
									</c:forEach>
									<c:if test="${column % NUMBER_OF_ITEM_PER_ROW != 0}">
										<c:forEach begin='${(column + 1) % NUMBER_OF_ITEM_PER_ROW}' end='${NUMBER_OF_ITEM_PER_ROW}'>
										<td width="<c:out value='${WIDTH_PER_ITEM}'/>%">&nbsp;</td>
										</c:forEach>
										</tr>
									</c:if>
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
			<td class="breadcrumb"><img src="images/icon_folder2.gif" width="14" height="11" /> <a href="#">Brands</a></td>
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
		<c:set var="NUMBER_OF_ITEM_PER_ROW" value="4" />
		<c:set var="WIDTH_PER_ITEM_F" value="${100 / NUMBER_OF_ITEM_PER_ROW}" />
		<fmt:parseNumber var="WIDTH_PER_ITEM" value='${WIDTH_PER_ITEM_F}' integerOnly="" /> <c:set var="column" value="0" />
		<table width="100%" border="0" cellpadding="03" cellspacing="01">
			<tr>
				<td colspan="${NUMBER_OF_ITEM_PER_ROW}" id="newsdetails">Some of the brands that we carry. <a href="mailto:info@times.com.ph?subject=inquiry from the website">Email</a> us for more info.</td>
			</tr>
			<tr align="center" valign="middle">
				<c:forEach items="${brands}" var="brand" varStatus="counter">
					<td width="<c:out value='${WIDTH_PER_ITEM}'/>%">
					<c:if test='${not empty companyuser}'><a class="brandlink" href="<c:url value="brand.do"><c:param name="action" value="showBrandProducts"/><c:param name="brandid" value="${brand.id}"/></c:url>"></c:if>
					<c:if test='${brand.imageExtension != null}'>
						<img class="imageborder" border="0" src="images/brand_thumb_image/brand_<c:out value='${brand.id}' /><c:out value='${brand.imageExtension}' />" />
					</c:if> 
					<c:if test='${brand.imageExtension == null}'>
						<c:out value='${brand.name}' />
					</c:if> <c:if test='${not empty companyuser }'></a></c:if></td>
					<c:if test="${counter.count % NUMBER_OF_ITEM_PER_ROW == 0}">
			</tr>
			<tr align="center" valign="middle">
				</c:if>
				<c:set var="column" value="${counter.count}" />
				</c:forEach>
				<c:if test="${column % NUMBER_OF_ITEM_PER_ROW != 0}">
					<c:forEach begin='${(column + 1) % NUMBER_OF_ITEM_PER_ROW}' end='${NUMBER_OF_ITEM_PER_ROW}'>
						<td width="<c:out value='${WIDTH_PER_ITEM}'/>%">&nbsp;</td>
					</c:forEach>
			</tr>
			</c:if>
		</table>
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