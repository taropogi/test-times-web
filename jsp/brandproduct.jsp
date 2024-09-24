<%@ include file="includes/header.jsp"%>
<body>
<%@ include file="includes/logo.jsp"%>
<%@ include file="includes/menu.jsp"%>
<%@ include file="includes/latest.jsp"%>
<%@ include file="includes/search.jsp"%>

<table width="700" align="center" cellspacing="0" cellpadding="0" border="0">
	<tr><!-- top -->
    <td height="43" colspan="3" background="images/bg_breadcrumb.gif">
    	<table width="100%" cellpadding="10" cellspacing="0" border="0">
    		<tr>
	    	<td class="breadcrumb"><img src="images/icon_folder2.gif" width="14" height="11" />
	    	<a href="brand.do?action=showBrands">Brands</a>
	    	<span class="breadcrumbseparator">&gt;&gt;</span>
	    	<a href="#"> <c:out value="${brand.name}"/></a></td>
	    	<td align="right">
				<%@ include file="includes/miniicons.jsp"%>		
				</td>
				</tr>
    	</table>
    </td>
  </tr>
  <tr valign="top"> <!-- middle -->
  	<td width="3" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_left.gif" width="3" height="265" /></td>
		<td width="603">
			<table width="100%" border="0" cellspacing="0" cellpadding="10">
      <tr>
      <td>
			<c:forEach items="${products}" var="product" varStatus="counter">
			<c:url var="url" value="catalog.do">
				<c:param name="action" value="showProductDetail"/>
				<c:param name="productid" value="${product.id}"/>
			</c:url>
			<table width="100%" border="0" cellspacing="2" cellpadding="0">
			<tr>
				<td width="16%" valign="top">
					<c:if test='${not (empty product.filePicture)}'>
					<img class="imageborder" src="images/product_thumb_image/<c:out value='${product.filePicture}' />"/>
					</c:if>
				</td>
				<td width="84%" valign="top">
					<c:if test="${empty company.hasNoContractItems || not company.hasNoContractItems}">
					<c:choose>
						<c:when test="${product.isContracted}"><img src="images/contracted.gif" border="0"/></c:when>
						<c:otherwise><img src="images/non-contracted.gif" border="0"/></c:otherwise>
					</c:choose>
					</c:if>
					<span id="newstitle"><c:out value='${product.name}' /><br />
					<c:if test='${not empty product.price}'>
						<em class="smalltext">Price: <c:out value='${product.priceFormatted}' /></em>
					</c:if>
					</span>
					<c:if test='${not empty product.description}'>
						<p id="newsdetails"><c:out value='${product.description}' escapeXml='false' /> ...
						<a href="<c:out value='${url}'/>" id="newsdetails">see details</a></p>
					</c:if>
					<c:if test='${(company.allowedToCreateSalesOrder) && (not empty companyuser)}'>
						<form method="post" action="brand.do?action=addProductToSalesOrder" id="so_product_<c:out value='${product.id}'/>" onsubmit="return checkSalesOrderForm(this);">
							<input type="hidden" name="productId" value="<c:out value='${product.id}'/>"/>
							<input type="hidden" name="brandid" value="<c:out value='${brand.id}'/>"/>
							<div align="right">
							<input style="width:20px;" type="text" id="quantity*#" name="quantity" class="addqty" />
							<input type="image" src="images/add_singleprod.gif" width="118" height="16" border="0" alt=""/>
							</div>
						</form>
					</c:if>
				</td>
			</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><img src="images/space.gif" width="1" height="5" /></td>
			</tr>
			<tr>
				<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td><img src="images/space.gif" width="1" height="5" /></td>
			</tr>			
			</table>
				</c:forEach>
			</td>
			</tr>
			</table>
  	</td>
  	<td width="4" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_right.gif" width="4" height="265" /></td>
  </tr>
	<tr><!-- buttom -->
    <td height="4" colspan="3"><img src="images/breadcrumb_bottom.gif" width="700" height="4" /></td>
  </tr>
</table>
<c:url var="cancelsalesorderhref" value="brand.do">
<c:param name="action" value="cancelSalesOrder" />
<c:param name="brandid" value="${brand.id}"/>
</c:url>
<%--
<%@ include file="includes/salesorder.jsp" %>
<%@ include file="includes/producthighlights.jsp" %>
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