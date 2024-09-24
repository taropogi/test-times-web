<%@ include file="includes/header.jsp"%>
</head>
<c:set var="pageName" value="featured" />
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
							<h1>Featured Products</h1>
							<table width="100%" border="0" cellspacing="10" cellpadding="0" class="featuredProducts">
								<c:forEach items="${highlightproducts}" var="product" varStatus="status">
								<c:if test="${status.count-1 % 3 eq 0}">
								<tr>
								</c:if>
									<c:url var="url" value="catalog.do">
										<c:param name="action" value="showProductDetail"/>
										<c:param name="productid" value="${product.id}"/>
										<c:param name="groupid" value="${product.grouping.id}"/>
									</c:url>
									<td><a href="<c:out value='${url}'/>">
											<c:choose>
												<c:when test="${not empty product.filePicture and product.imageExists}">
													<img src="images/product_orig_image/<c:out value='${product.filePicture}'/>" border="0" width="110px" height="100px"/>
												</c:when>
												<c:otherwise>
													<img class="imageborder" border="0" src="images/noimage.jpg" />
												</c:otherwise>
											</c:choose>
											<%-- <img src="featuredproducts.do?action=loadImage&productId=${product.id}" border="0" width="110px" height="100px"/> --%>
											<strong>${product.brand.name}</strong><c:out value="${product.name}"/></strong>
										</a></td>
								<c:if test="${status.count % 3 eq 0}">
								</tr>
								</c:if>
								</c:forEach>
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