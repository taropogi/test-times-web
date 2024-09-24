<%@ include file="includes/header.jsp"%>
<script type="text/javascript" src="javascripts/adminforms.js"></script>
</head>
<c:set var="pageName" value="search" />
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
							<h2>Search results for: <a href="#"><c:out value='${find}'/></h2>
							<table width="100%" align="center" cellspacing="0" cellpadding="0" border="0">
							  <tr valign="top"> <!-- middle -->
							  	<td width="100%">
							  		<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  			<tr>
											<th align="left"><span class="searchtitle">Product Search Results: <c:out value='${productsresults}'/> item(s) found. </span></th>
							  			</tr>
							  			<tr>
										<td valign="top">
							  			<c:forEach items='${products}' var='product'>
							  			<c:url var="url" value="catalog.do"><c:param name="action" value="showProductDetail"/><c:param name="productid" value="${product.id}"/></c:url>
							  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
											  <tr>
												<td><img src="images/spacer.gif" width="1" height="3" /></td>
											  </tr>
												<tr>
												<td width="110">
													<c:choose>
														<c:when test="${not empty product.filePicture}">
															<img class="pictureborder" src="images/product_thumb_image/<c:out value='${product.filePicture}'/>"/>
														</c:when>
														<c:otherwise>
															&nbsp;
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${product.brand.name}'/> <c:out value='${product.name}' escapeXml="false"/></a><c:if test='${not empty product.code}'>, <em class="smalltext"><c:out value='${product.code}' escapeXml="false"/></em></c:if><c:if test='${not empty product.description}'>, &nbsp;<em class="smalltext"><c:out value='${product.description}' escapeXml="false"/></em></c:if>
													<br/>
													<img src="images/space.gif" height="5"/><br/>
													<c:choose>
														<c:when test="${product.isContracted}"><img src="images/contracted.gif" border="0"/></c:when>
														<c:otherwise><img src="images/non-contracted.gif" border="0"/></c:otherwise>
													</c:choose><br/>
													<img src="images/space.gif" height="5"/><br/>
													<c:if test='${(company.allowedToCreateSalesOrder) && (not empty companyuser)}'>
														<c:url value="search.do" var="url">
															<c:param name="action" value="addProductToSalesOrder"/>
															<c:param name="find" value='${find}' />
															<c:param name="page" value='${currentpage}'/>
														</c:url>
														<form method="post" action="<c:out value='${url}'/>" id="so_product_<c:out value='${product.id}'/>" onsubmit="return checkSalesOrderForm(this);">
															<input type="hidden" name="productId" value="<c:out value='${product.id}'/>"/>
															<input style="width:40px;" type="text" id="quantity*#" name="quantity"  class="addqty"/>
															<input type="image" src="images/btnAdd.gif" width="94" height="19" alt="Add to list" title="Add to list" />
														</form>
													</c:if>
												</td>
												</tr>
											  <tr>
											  <td></td>
												<td bgcolor="#CCCCCC"><img src="images/spacer.gif" width="1" height="1" /></td>
											  </tr>
							  				</table>
							  			</c:forEach>
							  			</td>
										</tr>
							
										<tr>
											<td><img src="images/space.gif" width="1" height="10" /></td>
										</tr>
							
							  			<c:if test='${hasothers}'>
							  			<tr>
							  				<th align="left"><span class="searchtitle">Other Results:</span></th>
							  			</tr>
							  			<tr>
							  				<td>
							  					<c:forEach items='${brands}' var='brand'>
									  			<c:url value="brand.do" var="url"><c:param name="action" value="showBrandProducts"/><c:param name="brandid" value="${brand.id}"/></c:url>
									  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
														  <tr>
																<td><img src="images/space.gif" width="1" height="3" /></td>
														  </tr>
										  				<tr>
										  				<td>
											  				<span class="otherresulttype">Brand: </span>
											  				<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${brand.name}' escapeXml="false"/></a><c:if test='${not empty brand.description }'><em class="smalltext">, <c:out value='${brand.description}' escapeXml="false"/></em></c:if>
										  				</td>
										  				</tr>
														  <tr>
																<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
														  </tr>
									  				</table>
									  			</c:forEach>
							  				</td>
							  			</tr>
							  			<tr>
							  				<td>
							  					<c:forEach items='${categories}' var='category'>
									  			<c:url var="url" value="catalog.do"><c:param name="action" value="getTypes"/><c:param name="categoryid" value="${category.id}"/></c:url>
									  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
										  				<tr>
																<td><img src="images/space.gif" width="1" height="3" /></td>
														  </tr>
										  				<tr>
										  				<td>
											  				<span class="otherresulttype">Product Category: </span>
											  				<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${category.name}' escapeXml="false"/></a><c:if test='${not empty category.description}'><em class="smalltext">, <c:out value='${category.description}' escapeXml="false"/></em></c:if>
										  				</td>
										  				</tr>
														  <tr>
															<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
														  </tr>
									  				</table>
									  			</c:forEach>
							  				</td>
							  			</tr>
							  			<tr>
							  				<td>
							  					<c:forEach items='${types}' var='type'>
									  			<c:url var="url" value="catalog.do"><c:param name="action" value="getGroup"/><c:param name="typeid" value="${type.id}"/></c:url>
									  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
										  				<tr>
																<td><img src="images/space.gif" width="1" height="3" /></td>
														  </tr>
														  <tr>
										  					<td>
												  				<span class="otherresulttype">Product Type: </span>
												  				<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${type.name}' escapeXml="false"/></a><c:if test='${not empty type.description}'><em class="smalltext">, <c:out value='${type.description}' escapeXml="false"/></em></c:if>
											  				</td>
										  				</tr>
												     <tr>
																<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
														  </tr>
									  				</table>
									  			</c:forEach>
							  				</td>
							  			</tr>
							  			<tr>
							  				<td>
							  					<c:forEach items='${groupings}' var='grouping'>
									  			<c:url var="url" value="catalog.do"><c:param name="action" value="getProduct"/><c:param name="groupid" value="${grouping.id}"/></c:url>
									  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
										  			  <tr>
																<td><img src="images/space.gif" width="1" height="3" /></td>
														  </tr>
														  <tr>
										  			  <td>
											  				<span class="otherresulttype">Product Grouping: </span>
											  				<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${grouping.name}' escapeXml="false"/></a><c:if test='${not empty grouping.description}'><em class="smalltext">, <c:out value='${grouping.description}' escapeXml="false"/></em></c:if>
											  			</td>
										  			  </tr>
														  <tr>
															<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
														  </tr>
									  				</table>
									  			</c:forEach>
							  				</td>
							  			</tr>
							  			</c:if>
							  		</table>
							  		<table width="100%">
								  		<tr>
											<td align="center" id="pagelink">
												<c:if test='${currentpage != 1}'>
													
													<c:forEach begin='1' end='${currentpage -1}' var="ctr">
													<c:url value="search.do" var="url">
														<c:param name="action" value="${action}"/>
														<c:param name="productcode" value='${brand}' />
														<c:param name="productcode" value='${productcode}' />
														<c:param name="uniqueitem" value='${uniqueitem}' />
														<c:param name="companyitem" value='${companyitem}' />
														<c:param name="unit" value='${unit}' />
														<c:param name="productname" value='${productname}' />
														<c:param name="description" value='${description}' />
														<c:param name="find" value='${find}' />
														<c:param name="page" value='${ctr}'/>
													</c:url>
													
													<a href="<c:out value='${url}'/>"><c:out value='${ctr}' /></a>
													</c:forEach>
												</c:if>
												
												<span class="current"><c:out value='${currentpage}' /></span>
												
												<c:if test='${currentpage < totalpage}'>
													<c:forEach begin='${currentpage + 1}' end='${totalpage}' var="ctr">
													<c:url value="search.do" var="url">
														<c:param name="action" value="${action}"/>
														<c:param name="productcode" value='${brand}' />
														<c:param name="productcode" value='${productcode}' />
														<c:param name="uniqueitem" value='${uniqueitem}' />
														<c:param name="companyitem" value='${companyitem}' />
														<c:param name="unit" value='${unit}' />
														<c:param name="productname" value='${productname}' />
														<c:param name="description" value='${description}' />
														<c:param name="find" value='${find}' />
														<c:param name="page" value='${ctr}'/>
													</c:url>
													<a href="<c:out value='${url}' />"><c:out value='${ctr}' /></a>
													</c:forEach>
												</c:if>
											</td>
											</tr>
										</table>
							  	</td>
							  </tr>
							</table>
						</div>
						<%--@ include file="includes/sidenav.jsp"--%>
						<div class="clear"></div>
<%--
<table width="700" align="center" cellspacing="0" cellpadding="0" border="0">
	<tr><!-- top -->
    <td height="43" colspan="3" background="images/bg_breadcrumb.gif">
    	<table width="100%" cellpadding="10" cellspacing="0" border="0">
			<tr>
	    		<td class="breadcrumb">
					<img src="images/icon_folder2.gif" width="14" height="11" />
	    			Search results for: <a href="#"><c:out value='${find}'/></a>	
	    		</td>
	    		<td align="right">
					<%@ include file="includes/miniicons.jsp"%>
				</td>
			</tr>
    	</table>
    </td>
  </tr>
  <tr valign="top"> <!-- middle -->
  	<td width="3" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_left.gif" width="3" height="265" /></td>
  	<td width="693">
  		<table width="100%" border="0" cellspacing="0" cellpadding="0">
  			<tr>
				<th align="left"><span class="searchtitle">Product Search Results: <c:out value='${productsresults}'/> item(s) found. </span>
				</th>
  			</tr>
  			<tr>
			<td valign="top">
  			<c:forEach items='${products}' var='product'>
  			<c:url var="url" value="catalog.do"><c:param name="action" value="showProductDetail"/><c:param name="productid" value="${product.id}"/></c:url>
  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
				  <tr>
					<td><img src="images/spacer.gif" width="1" height="3" /></td>
				  </tr>
					<tr>
					<td width="110">
						<c:choose>
							<c:when test="${not empty product.filePicture}">
								<img class="pictureborder" src="images/product_thumb_image/<c:out value='${product.filePicture}'/>"/>
							</c:when>
							<c:otherwise>
								&nbsp;
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${product.brand.name}'/> <c:out value='${product.name}' escapeXml="false"/></a><c:if test='${not empty product.code}'>, <em class="smalltext"><c:out value='${product.code}' escapeXml="false"/></em></c:if><c:if test='${not empty product.description}'>, &nbsp;<em class="smalltext"><c:out value='${product.description}' escapeXml="false"/></em></c:if>
						<br/>
						<img src="images/space.gif" height="5"/><br/>
						<c:choose>
							<c:when test="${product.isContracted}"><img src="images/contracted.gif" border="0"/></c:when>
							<c:otherwise><img src="images/non-contracted.gif" border="0"/></c:otherwise>
						</c:choose><br/>
						<img src="images/space.gif" height="5"/><br/>
						<c:if test='${(company.allowedToCreateSalesOrder) && (not empty companyuser)}'>
							<c:url value="search.do" var="url">
								<c:param name="action" value="addProductToSalesOrder"/>
								<c:param name="find" value='${find}' />
								<c:param name="page" value='${currentpage}'/>
							</c:url>
							<form method="post" action="<c:out value='${url}'/>" id="so_product_<c:out value='${product.id}'/>" onsubmit="return checkSalesOrderForm(this);">
								<input type="hidden" name="productId" value="<c:out value='${product.id}'/>"/>
								<input style="width:20px;" type="text" id="quantity*#" name="quantity"  class="addqty"/>
								<input type="image" src="images/add_singleprod.gif" width="118" height="16" border="0" alt="" />
							</form>
						</c:if>
					</td>
					</tr>
				  <tr>
				  <td></td>
					<td bgcolor="#CCCCCC"><img src="images/spacer.gif" width="1" height="1" /></td>
				  </tr>
  				</table>
  			</c:forEach>
  			</td>
			</tr>

			<tr>
				<td><img src="images/space.gif" width="1" height="10" /></td>
			</tr>

  			<c:if test='${hasothers}'>
  			<tr>
  				<th align="left"><span class="searchtitle">Other Results:</span></th>
  			</tr>
  			<tr>
  				<td>
  					<c:forEach items='${brands}' var='brand'>
		  			<c:url value="brand.do" var="url"><c:param name="action" value="showBrandProducts"/><c:param name="brandid" value="${brand.id}"/></c:url>
		  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
							  <tr>
									<td><img src="images/space.gif" width="1" height="3" /></td>
							  </tr>
			  				<tr>
			  				<td>
				  				<span class="otherresulttype">Brand: </span>
				  				<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${brand.name}' escapeXml="false"/></a><c:if test='${not empty brand.description }'><em class="smalltext">, <c:out value='${brand.description}' escapeXml="false"/></em></c:if>
			  				</td>
			  				</tr>
							  <tr>
									<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
							  </tr>
		  				</table>
		  			</c:forEach>
  				</td>
  			</tr>
  			<tr>
  				<td>
  					<c:forEach items='${categories}' var='category'>
		  			<c:url var="url" value="catalog.do"><c:param name="action" value="getTypes"/><c:param name="categoryid" value="${category.id}"/></c:url>
		  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
			  				<tr>
									<td><img src="images/space.gif" width="1" height="3" /></td>
							  </tr>
			  				<tr>
			  				<td>
				  				<span class="otherresulttype">Product Category: </span>
				  				<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${category.name}' escapeXml="false"/></a><c:if test='${not empty category.description}'><em class="smalltext">, <c:out value='${category.description}' escapeXml="false"/></em></c:if>
			  				</td>
			  				</tr>
							  <tr>
								<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
							  </tr>
		  				</table>
		  			</c:forEach>
  				</td>
  			</tr>
  			<tr>
  				<td>
  					<c:forEach items='${types}' var='type'>
		  			<c:url var="url" value="catalog.do"><c:param name="action" value="getGroup"/><c:param name="typeid" value="${type.id}"/></c:url>
		  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
			  				<tr>
									<td><img src="images/space.gif" width="1" height="3" /></td>
							  </tr>
							  <tr>
			  					<td>
					  				<span class="otherresulttype">Product Type: </span>
					  				<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${type.name}' escapeXml="false"/></a><c:if test='${not empty type.description}'><em class="smalltext">, <c:out value='${type.description}' escapeXml="false"/></em></c:if>
				  				</td>
			  				</tr>
					     <tr>
									<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
							  </tr>
		  				</table>
		  			</c:forEach>
  				</td>
  			</tr>
  			<tr>
  				<td>
  					<c:forEach items='${groupings}' var='grouping'>
		  			<c:url var="url" value="catalog.do"><c:param name="action" value="getProduct"/><c:param name="groupid" value="${grouping.id}"/></c:url>
		  				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;padding-left:20px;">
			  			  <tr>
									<td><img src="images/space.gif" width="1" height="3" /></td>
							  </tr>
							  <tr>
			  			  <td>
				  				<span class="otherresulttype">Product Grouping: </span>
				  				<a class="brandlink" href="<c:out value='${url}'/>"><c:out value='${grouping.name}' escapeXml="false"/></a><c:if test='${not empty grouping.description}'><em class="smalltext">, <c:out value='${grouping.description}' escapeXml="false"/></em></c:if>
				  			</td>
			  			  </tr>
							  <tr>
								<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
							  </tr>
		  				</table>
		  			</c:forEach>
  				</td>
  			</tr>
  			</c:if>
  		</table>
  		<table width="100%">
	  		<tr>
				<td align="center" id="pagelink">
					<c:if test='${currentpage != 1}'>
						
						<c:forEach begin='1' end='${currentpage -1}' var="ctr">
						<c:url value="search.do" var="url">
							<c:param name="action" value="search"/>
							<c:param name="find" value='${find}' />
							<c:param name="page" value='${ctr}'/>
						</c:url>
						
						<a href="<c:out value='${url}'/>"><c:out value='${ctr}' /></a>
						</c:forEach>
					</c:if>
					
					<span class="current"><c:out value='${currentpage}' /></span>
					
					<c:if test='${currentpage < totalpage}'>
						<c:forEach begin='${currentpage + 1}' end='${totalpage}' var="ctr">
						<c:url value="search.do" var="url">
							<c:param name="action" value="search"/>
							<c:param name="find" value='${find}' />
							<c:param name="page" value='${ctr}'/>
						</c:url>
						<a href="<c:out value='${url}' />"><c:out value='${ctr}' /></a>
						</c:forEach>
					</c:if>
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
<c:url var="cancelsalesorderhref" value="search.do">
<c:param name="action" value="cancelSalesOrder" />
<c:param name="find" value='${find}' />
<c:param name="page" value='${currentpage}'/>
</c:url>
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