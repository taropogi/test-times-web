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
							<div style="background-color:rgb(255, 215, 110);text-align:center;padding:5px;font-weight:bold;font-family:Arial;letter-spacing:1px;">
								<c:if test="${searchResult eq null or not searchResult}">
								${itemName} has been added to your shopping cart.
								</c:if>
								<c:if test="${searchResult}">
								Found ${totalItems} item(s)
								</c:if>
							</div>
							</c:if>
							<%--<%@ include file="includes/latest.jsp"%>--%>
							<%--<%@ include file="includes/search.jsp"%>--%>
						</div>
						<div class="mainContentHome">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<c:if test="${searchResult eq null or not searchResult}">
								<tr>
									<td height="43" colspan="3">
									<table width="100%" border="0" cellspacing="0" cellpadding="10">
										<tr>
											<td class="breadcrumb">
												Catalog
												<c:if test="${selectedCategory != null}">
													<span class="breadcrumbseparator">&raquo;</span>
													<a href="catalog.do?action=getTypes&categoryid=<c:out value='${selectedCategory.id}'/>&expandable=${param.expandable}">
														<c:out value="${selectedCategory.name}" />
													</a>
												</c:if>
												<c:if test="${selectedType != null}">
													<span class="breadcrumbseparator">&raquo;</span>
													<a href="catalog.do?action=getGroup&typeid=<c:out value='${selectedType.id}'/>&expandable=${param.expandable}">
														<c:out value="${selectedType.name}" />
													</a>
												</c:if>
												<c:if test="${selectedGroup != null}">
													<span class="breadcrumbseparator">&raquo;</span>
													<strong><a href="#">
														<c:out value="${selectedGroup.name}" />
													</a></strong>
												</c:if>
											</td>
										</tr>
									</table>
									</td>
								</tr>							
								<tr>
								  <td style="border-bottom: 1px solid #d5e0e6; background: #e8eef1;" class="grouptab">
							        <c:forEach items="${groups}" var="group" varStatus="counter">
									  <c:url var="url" value="catalog.do">
									    <c:param name="action" value="showProduct" />
									    <c:param name="groupid" value="${group.id}" />
									  </c:url>
									    <c:choose>
									      <c:when test="${selectedGroup.id eq group.id}">
									      <c:forEach begin="0" end="${fn:length(categories) > 0 ? fn:length(categories)-1 : 0}" var="i" step="1">
									      	<c:if test="${categories[i].id eq group.type.category.id}">
									      	<c:set var="currentUrl" value="${url}&expandable=${i}" />
										    <a href="${currentUrl}" class="active"><c:out value="${group.name}" /></a> |
										    </c:if>
										   </c:forEach>
										  </c:when>
										  <c:otherwise>
										    <c:forEach begin="0" end="${fn:length(categories) > 0 ? fn:length(categories)-1 : 0}" var="i" step="1">
										      <c:if test="${categories[i].id eq group.type.category.id}">
										        <a href="<c:out value='${url}&expandable=${i}'/>"><c:out value="${group.name}" /></a> |
										      </c:if>
										    </c:forEach>
										  </c:otherwise>
										</c:choose>
								    </c:forEach>
								  </td>
								</tr>
								</c:if>
								<tr>
								  <td style="border: 1px solid #d5e0e6; padding: 8px;">
								    <table border="0" id="navmenu4" width="100%" cellpadding="4" cellspacing="0">
								    <c:if test="${searchResult eq null or not searchResult}">
								    <c:set var="begin" value="${page*12}" />
								    <c:set var="end" value="${fn:length(products) > 12 ? 11+(page*12) : fn:length(products) > 0 ? fn:length(products)-1 : 0}" />
								    </c:if>
								    <c:if test="${searchResult}">
								    <c:set var="begin" value="0" />
								    <c:set var="end" value="12" />
								    </c:if>
									  <c:forEach begin="${begin}" end="${end}" var="i" step="2">
									    <c:url var="url" value="catalog.do">
										  <c:param name="action" value="showProductDetail" />
										  <c:param name="productid" value="${products[i].id}" />
										  <c:param name="groupid" value="${products[i].grouping.id}" />
										  <c:param name="expandable" value="${param.expandable}" />
										</c:url>
										
									    <c:url var="url2" value="catalog.do">
										  <c:param name="action" value="showProductDetail" />
										  <c:param name="productid" value="${products[i+1].id}" />
										  <c:param name="groupid" value="${products[i+1].grouping.id}" />
										  <c:param name="expandable" value="${param.expandable}" />
										</c:url>										
										
										<tr>
										  <td valign="top" rowspan="2">
										  <c:if test="${products[i] ne null}">
										    <%-- <img src="featuredproducts.do?action=loadImage&productId=${products[i].id}" border="0" width="110px" height="100px"/> --%>
											    <c:choose>
													<c:when test="${not empty products[i].filePicture and products[i].imageExists}">
														<img src="images/product_orig_image/<c:out value='${products[i].filePicture}'/>" border="0" width="110px" height="100px"/>
													</c:when>
													<c:otherwise>
														<img class="imageborder" border="0" src="images/noimage.jpg" width="110px" height="100px"/>
													</c:otherwise>
												</c:choose>
											</c:if>
										  </td>
										  <td valign="top" style="width: 190px;">
										  <c:if test="${products[i] ne null}">
										      <a href="<c:out value='${url}'/>">
											    <strong><c:out value="${products[i].brand.name}"/></strong>&nbsp;
											    <br />
											    <span style="font-size:11px;text-align:left"><c:out value="${products[i].name}" /></span>&nbsp;&nbsp;
											    <br /><strong style="color: #d10f31;"><c:out value="${products[i].priceFormatted}"/>
											    <br />
											    <c:if test="${empty company.hasNoContractItems || not company.hasNoContractItems}">
											      <c:choose>
												    <c:when test="${products[i].isContracted}"><img src="images/contracted.gif" border="0"/></c:when>
												    <c:otherwise><img src="images/non-contracted.gif" border="0"/></c:otherwise>
												  </c:choose>
											    </c:if>
											  </a>
											</c:if>
										  </td>

										  <td valign="top" rowspan="2">
										  <c:if test="${products[i+1] ne null}">
										  	<%-- <img src="featuredproducts.do?action=loadImage&productId=${products[i+1].id}" border="0" width="110px" height="100px"/> --%>
										  	<c:choose>
												<c:when test="${not empty products[i + 1].filePicture and products[i + 1].imageExists}">
													<img src="images/product_orig_image/<c:out value='${products[i + 1].filePicture}'/>" border="0" width="110px" height="100px"/>
												</c:when>
												<c:otherwise>
													<img class="imageborder" border="0" src="images/noimage.jpg" width="110px" height="100px"/>
												</c:otherwise>
											</c:choose>
										  </c:if>
										  </td>
										  <td valign="top" style="width: 190px;">
										  <c:if test="${products[i+1] ne null}">
										      <a href="<c:out value='${url2}'/>">
											    <strong><c:out value="${products[i+1].brand.name}"/></strong>&nbsp;
											    <br />
											     <span style="font-size:11px;text-align:left"><c:out value="${products[i+1].name}" /></span>&nbsp;&nbsp;
											    <br /><strong style="color: #d10f31;"><c:out value="${products[i+1].priceFormatted}"/>
											    <br />
											    <c:if test="${empty company.hasNoContractItems || not company.hasNoContractItems}">
											      <c:choose>
												    <c:when test="${products[i+1].isContracted}"><img src="images/contracted.gif" border="0"/></c:when>
												    <c:otherwise><img src="images/non-contracted.gif" border="0"/></c:otherwise>
												  </c:choose>
											    </c:if>
											  </a>
											  </c:if>
										  </td>
										</tr>
													
										<c:if test='${(company.allowedToCreateSalesOrder) && (not empty companyuser)}'>
										  <tr>	
										    <c:if test="${products[i] ne null}">									
										      <form method="post" action="catalog.do?action=addProductToSalesOrder" id="so_product_<c:out value='${products[i].id}'/>" onsubmit="return checkSalesOrderForm(this);">
										        <input type="hidden" name="productid" value="<c:out value='${products[i].id}'/>" />
											    <input type="hidden" name="productId" value="<c:out value='${products[i].id}'/>"/>
											    <input type="hidden" name="groupid" value="<c:out value='${products[i].grouping.id}' />" />
											    <c:if test="${param.expandable ne null}">
											    <input type="hidden" name="expandable" value="<c:out value='${param.expandable}' />" />
											    </c:if>

											    <!-- <td align="left"  valign="top">&nbsp;</td> -->
											    <td align="left"  valign="top">
											      <span class="addqtytitle">Qty:</span>
 												  <input type="text" id="quantity*#" name="quantity" class="addqty" style="width: 40px;"><div class="clear"></div><br><input type="image" src="images/btnAdd.gif" height="19" alt="Add to list" title="Add to list" align="absmiddle"/>
										        </td>
										      </form>
										    </c:if>

										    <c:if test="${products[i+1] ne null}">									
										      <form method="post" action="catalog.do?action=addProductToSalesOrder" id="so_product_<c:out value='${products[i+1].id}'/>" onsubmit="return checkSalesOrderForm(this);">
										        <input type="hidden" name="productid" value="<c:out value='${products[i+1].id}'/>" />
											    <input type="hidden" name="productId" value="<c:out value='${products[i+1].id}'/>"/>
											    <input type="hidden" name="groupid" value="<c:out value='${products[i+1].grouping.id}' />" />
											    <c:if test="${param.expandable ne null}">
											    <input type="hidden" name="expandable" value="<c:out value='${param.expandable}' />" />
											    </c:if>

											    <!-- <td align="left"  valign="top">&nbsp;</td> -->
											    <td align="left"  valign="top">
											      <span class="addqtytitle">Qty:</span>
												  <input type="text" id="quantity*#" name="quantity" class="addqty" style="width: 40px;"><div class="clear"></div><br><input type="image" src="images/btnAdd.gif" height="19" alt="Add to list" title="Add to list" align="absmiddle"/>
										        </td>
										      </form>		
										    </c:if>
										    
										  </tr>
										</c:if>
										<c:if test='${not company.allowedToCreateSalesOrder}'>
										<tr>
									    	<td align="left"  valign="top">&nbsp;</td>
										    <td align="right"  valign="top">
										      <span class="addqtytitle"></span>
												  <input type="text" class="addqty" style="visibility:hidden">&nbsp;<input type="image" src="" width="94" height="19" style="visibility:hidden" />
									        </td>
									        <td align="left"  valign="top">&nbsp;</td>
										    <td align="right"  valign="top">
										      <span class="addqtytitle"></span>
												  <input type="text" class="addqty" style="visibility:hidden">&nbsp;<input type="image" src="" width="94" height="19" style="visibility:hidden" />
									        </td>
										</tr>
										</c:if>
										<tr>
										  <td colspan="4" height="20px"><hr noshade color="#f3f3f3"/></td>
										</tr>
									  </c:forEach>								    									  
									</table>
									<c:if test="${searchResult eq null or not searchResult}">
									<fmt:formatNumber var="totalPage" value="${fn:length(products)/12}" maxFractionDigits="0"/>
									</c:if>
									<c:if test="${searchResult}">
									<fmt:formatNumber var="totalPage" value="${totalItems/12}" maxFractionDigits="0"/>
									</c:if>
									<c:if test="${totalPage > 1}">
									<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
										<tr align="center">
											<td class="sodesc" align="center">
												<c:if test="${searchResult}">
												<c:set var="currentUrl" value="catalog.do?action=searchProduct&keyword=${keyword}" />
												</c:if>
												<c:forEach begin="1" end="${page}" step="1" var="i">
												<a href="${currentUrl}&page=${i-1}">${i}</a>&nbsp;
												</c:forEach>
												<span style="color: red;">${page + 1}</span>&nbsp;
												<c:forEach begin="${page + 2}" end="${totalPage}" step="1" var="i">
												<a href="${currentUrl}&page=${i-1}">${i}</a>&nbsp;
												</c:forEach>
											</td>
										</tr>
									</table>
									</c:if>
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