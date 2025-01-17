<%@ include file="includes/header.jsp"%>
<script type="text/javascript">
var selectedHeader;
function collapseAllExpandOne(selected){
	selectedHeader = selected;
	ddaccordion.collapseall('expandable');
	setTimeout("delayedExpandOne()",500);
}
function delayedExpandOne(){
	ddaccordion.expandone('expandable', selectedHeader);
}
</script>
</head>
<c:set var="pageName" value="browse" />
<c:if test="${param.expandable eq null}">
  <body onload="ddaccordion.collapseall('expandable')">
</c:if>
<c:if test="${param.expandable ne null}">
  <body onload="collapseAllExpandOne('${param.expandable}')">
</c:if>

	<div class="wrapper">
		<div class="container">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td class="sLeft">&nbsp;</td>
					<td class="content">
						<div class="timesTrading">
							<%@ include file="includes/logo.jsp"%>
							<%@ include file="includes/menu.jsp"%>
							<c:if test="${showNotificationBar}">
							<div style="background-color:rgb(255, 215, 110);text-align:center;padding:5px;font-weight:bold;font-family:Arial;letter-spacing:1px;">Added ${itemQty} "${itemName}"</div>
							</c:if>
							<%--<%@ include file="includes/latest.jsp"%>--%>
							<%--<%@ include file="includes/search.jsp"%>--%>
						</div>
						<div class="mainContentHome">
							<table width="100%" cellspacing="0" cellpadding="0" border="0">
								<tr>
									<!-- top -->
									<td colspan="3">
									<table width="100%" cellpadding="10" cellspacing="0" border="0">
										<tr>
											<td>
												<!-- <img src="images/icon_folder2.gif" width="14" height="11" />--> 
												<c:set var="grouping" value="${product.grouping}" />
												<c:set var="type" value="${grouping.type }" />
												<c:set var="category" value="${type.category }" />
												<c:url var="categoryurl" value="catalog.do">
													<c:param name="action" value="getTypes" />
													<c:param name="categoryid" value="${category.id}" />
												</c:url>
												<c:url var="typeurl" value="catalog.do">
													<c:param name="action" value="getGroup" />
													<c:param name="typeid" value="${type.id}" />
												</c:url>
												<c:url var="groupingurl" value="catalog.do">
													<c:param name="action" value="getProduct" />
													<c:param name="groupid" value="${grouping.id}" />
												</c:url>
												<a href="<c:out value="${categoryurl }"/>"><c:out value="${category.name }"/></a>
												<span class="breadcrumbseparator">&raquo;</span>
												<a href="<c:out value="${typeurl }"/>"><c:out value="${type.name }"/></a>
												<span class="breadcrumbseparator">&raquo;</span> 
												<a href="<c:out value="${groupingurl }"/>"><c:out value="${grouping.name }"/></a>
												<span class="breadcrumbseparator">&raquo;</span> 
												<strong><a href="#"><c:out value="${product.name}" /></a></strong>
											</td>
										</tr>
									</table>
									</td>
								</tr>
								<tr valign="top">
									<!-- middle -->
									<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="10">
										<tr>
											<td>
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td align="center" valign="top" valign="top">
													<div class="strip">
													<table border="0" cellpadding="3" cellspacing="0" width="100%" >
														<tr>
															<td align="center" valign="middle">
																<c:set var="showFrontImage" value="${false}" />
																<c:if test="${not empty product.filePicture}">
																	<c:set var="imgName" value="product_${product.id}" />
																	<c:if test="${fn:containsIgnoreCase(product.filePicture, imgName)}">
																	 	<c:set var="showFrontImage" value="${true}" />
																	</c:if>
																</c:if>
																<c:choose>
																	<c:when test="${showFrontImage}">
																		<img class="imageborder" src="images/product_front_image/<c:out value='${product.filePicture}'/>" />
																	</c:when>
																	<c:otherwise>
																		<c:choose>
																			<c:when test="${not empty product.filePicture and product.imageExists}">
																				<img class="filePicture" src="images/product_orig_image/<c:out value='${product.filePicture}'/>" border="0" />
																			</c:when>
																			<c:otherwise>
																				<img class="imageborder" border="0" src="images/noimage.jpg" width="110px" height="100px"/>
																			</c:otherwise>
																		</c:choose>
																		<%-- <img src="featuredproducts.do?action=loadImage&productId=${product.id}" border="0" width="110px" height="100px"/> --%>
																	</c:otherwise>
																</c:choose>
															<br />
															</td>
														</tr>
														<tr>
															<td align="left" valign="top" width="130">
																<span class="productspecs">Brand</span>
															</td>
															<td align="left" valign="top">
																<span class="productspecs">:</span>
															</td>
															<td>
																<span class="productdata"><strong><c:out value="${product.brand.name}" /></strong></span>
															</td>
														</tr>
														<tr>
															<td align="left" valign="top">
																<span class="productspecs">Product Code</span>
															</td>
															<td align="left" valign="top">
																<span class="productspecs">:</span>
															</td>
															<td>
																<span class="productdata"><strong><c:out value="${product.code}" /></strong></span> 
															</td>
														</tr>
														<tr>
															<td align="left" valign="top">
																<span class="productspecs">Unique Item Code</span>
															</td>
															<td align="left" valign="top">
																<span class="productspecs">:</span>
															</td>
															<td>
																<span class="productdata"><strong><c:out value="${product.uniqueItemCode}" /></strong></span> 
															</td>
														</tr>
														<tr>
															<td align="left" valign="top">
																<span class="productspecs">Company Item Code</span>
															</td>
															<td align="left" valign="top">
																<span class="productspecs">:</span>
															</td>
															<td>
																<span class="productdata"><strong><c:out value="${product.companyItemCode}" /></strong></span> 
															</td>
														</tr>
														<tr>
															<td align="left" valign="top">
																<span class="productspecs">Unit of Measure</span>
															</td>
															<td align="left" valign="top">
																<span class="productspecs">:</span>
															</td>
															<td>
																<span class="productdata"><strong><c:out value="${product.UOFM}" /></strong></span> 
															</td>
														</tr>
														<tr>
															<td align="left" valign="top">
																<span>Product Name</span>
															</td>
															<td align="left" valign="top">
																<span class="productspecs">:</span>
															</td>
															<td>
																<span>
																	<c:if test="${empty company.hasNoContractItems || not company.hasNoContractItems}">
																	<c:choose>
																		<c:when test="${product.isContracted}"><img src="images/contracted.gif" border="0"/></c:when>
																		<c:otherwise><img src="images/non-contracted.gif" border="0"/></c:otherwise>
																	</c:choose>
																	</c:if>
																	<br />
																	<c:out value="${product.name}" />
																</span> 
															</td>
														</tr>
														<tr>
															<td align="left" valign="top" height="8" colspan="3">
																<img src="images/spacer.gif" width="1" height="1" border="0">
															</td>
														</tr>
														<tr>
															<td align="left" valign="top">
																<span class="productspecs">Description</span>&nbsp;
															</td>
															<td align="left" valign="top">
																<span class="productspecs">:</span>
															</td>
															<td align="left" valign="top">
																<span class="productdescription">
																	<c:out value="${product.description}" />
																</span>
															</td>
														</tr>
														<!-- <tr>
															<td align="left" valign="top" colspan="3" bgcolor="#2369AA" height="3" colspan="3"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
														</tr>
														<tr>
															<td align="left" valign="top" colspan="3" height="1"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
														</tr>
														<tr>
															<td align="left" valign="top" colspan="3" bgcolor="#2369AA" height="1"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
														</tr> -->
														<!-- <tr>
															<td align="left" valign="top" colspan="3">
																<span class="productdescription">
																	<c:out value="${product.description}" />
																</span>
															</td>
														</tr>
														<tr>
															<td align="left" valign="top" height="8" colspan="3">
																<img src="images/spacer.gif" width="1" height="1" border="0">
															</td>
														</tr> -->
														<tr>
															<td align="left" valign="top">
																<span class="productspecs">Price</span>
															</td>
															<td align="left" valign="top">
																<span class="productspecs">:</span>
															</td>
															<td>
																<span class="productdata">
																	<%-- <fmt:formatNumber type="currency" currencySymbol="" value="${product.priceFormatted}" maxFractionDigits="2" minFractionDigits="2"/> --%>
																	${product.priceFormatted}
																</span>
															</td>
														</tr>
														<c:if test='${(company.allowedToCreateSalesOrder) && (not empty companyuser)}'>
														<tr>
															<td><strong>Quantity</strong></td>
															<td>:</td>
															<td align="left" colspan="3">
																<form method="post" action="catalog.do" id="so_product_<c:out value='${product.id}'/>" onsubmit="return checkSalesOrderForm(this);">
																<input type="hidden" name="action" value="addProductToSalesOrder"/>
																<input type="hidden" name="subAction" value="showProductDetail"/>
																<input type="hidden" name="productid" value="<c:out value='${product.id}'/>"/>
																<input type="hidden" name="productId" value="<c:out value='${product.id}'/>"/>
																<input type="hidden" name="groupid" value="<c:out value='${product.grouping.id}'/>"/>
																
																<input type="text" id="quantity*#" name="quantity" class="addqty" style="width: 50px;"/>&nbsp;
																<input type="image" src="images/btnAdd.gif" width="94" height="19" alt="Add to list" title="Add to list" align="absmiddle"/>																
																</form>
															</td>
														</tr>
														</c:if>
														<tr>
															<td align="left" valign="top" height="20" colspan="3"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
														</tr>
														<tr>
															<td align="left" valign="top" colspan="3"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
														</tr>
													</table>
													</div>
													</td>
												</tr>
											</table>
											</td>
										</tr>
									</table>
									</td>
								</tr>
							</table>
						</div>
						<%@ include file="includes/sidenav_catalog.jsp"%>
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