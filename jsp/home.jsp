<%@ include file="includes/header.jsp"%>
</head>
<c:set var="pageName" value="home"/>
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
						</div>
						
						<div>
						<%@ include file="includes/sidenav.jsp"%>
						<div class="mainContentHome">
							<div class="masthead">
								<div style="margin:30px auto;max-width:625px;">
								    <div id="amazingslider-1" style="display:block;position:relative;margin:16px auto 32px;">
								        <ul class="amazingslider-slides" style="display:none;">
								        	<c:forEach items="${sliderImageList}" var="si">
								        		<li><img src="images/slider/${si.imageUrl}"  /></li>
								        	</c:forEach>
								        </ul>		       
							</div><!--//masthead-->
							<c:if test="${company eq null or company.generic}">
							
							</c:if>
							<c:if test="${company ne null and not company.generic and company.home ne null}">
							<h1>${company.home.title}</h1>
							<h4>${company.home.subtitle}</h4>
							</c:if>
							<%--
							<c:if test="${not empty companyuser}">
							<img src="images/user.jpg" alt="User" title="User" class="imageLeft" />
							</c:if>
							--%>
							<c:if test="${company ne null and not company.generic and company.home ne null}">
							<span>${company.home.body}</span> <!-- <a href="aboutus.do">read more &raquo;</a> -->
							</c:if>
							<c:if test="${(company eq null or company.generic) and genericHome ne null}">
							<span>${genericHome.body}</span>
							</c:if>
							<c:if test="${(company eq null or company.generic) and genericHome eq null}">
							<p><strong>Times Trading Co., Inc.</strong> is one of the Philippines' premier distributors of school and office products, representing some of the most well known brands in the country.</p>
							<p>${ aboutus.shorterDetails }... <a href="aboutus.do">read more &raquo;</a></p>
							</c:if>
							<div class="clear"></div>
							<h2>FEATURED PRODUCTS</h2>
							<table width="100%" border="0" cellspacing="5" cellpadding="0" class="featuredProducts">
								<tr>
									<c:forEach items="${highlightproducts}" var="product" varStatus="Counter" begin="0" end="3" step="1">
									<c:url var="url" value="catalog.do">
										<c:param name="action" value="showProductDetail"/>
										<c:param name="productid" value="${product.id}"/>
										<c:param name="groupid" value="${product.grouping.id}"/>
									</c:url>
									<td valign="top" width="33%"><a href="<c:out value='${url}'/>">
										<%-- <img src="featuredproducts.do?action=loadImage&productId=${product.id}" border="0" width="110px" height="100px"/> --%>
										<c:choose>
											<c:when test="${not empty product.filePicture and product.imageExists}">
												<img src="images/product_orig_image/<c:out value='${product.filePicture}'/>" border="0" width="110px" height="100px"/>
											</c:when>
											<c:otherwise>
												<img class="imageborder" border="0" src="images/noimage.jpg" width="110px" height="100px"/>
											</c:otherwise>
										</c:choose>
										<strong>${product.brandName}</strong><c:out value="${product.name}"/></strong>
										<c:if test="${not empty companyuser}">
										<br /><br /><a href="catalog.do?action=addProductToSalesOrder&productId=${product.id}&quantity=${1}&groupid=${product.grouping.id}">
										<img src="images/btnAdd.gif" width="94" height="19" alt="Add to list" title="Add to list" class="btnAdd" /></a></c:if>
										</a>
									</td>
									</c:forEach>
								</tr>
								
								<c:if test="${ productListSize gt 3 }">
									<tr>
										<td colspan="3" style="text-align: right;">
											<a href="featuredproducts.do?action=showProducts">more&raquo;</a>
										</td>
									</tr>
								</c:if>
							</table>
						</div>

						<div class="clear"></div>
							
						<script language="javascript">
						function focus()
						{
							<c:if test='${empty companyuser}'>
							if(document.corporatelogin != null &&
								document.corporatelogin.username != null){
								document.corporatelogin.username.focus();
							}
							</c:if>
						}
						window.onload = focus;
						</script>
						
						<%@ include file="includes/analytics.jsp" %>
						</div>
						</div>
					</div>
					<div class="clear"></div><br>
						<%@ include file="/jsp/includes/footer.jsp" %>
					</td>
					<td class="sRight">&nbsp;</td>
				</tr>
			</table>
								
			
		</div>
	</div>
</body>
</html>
