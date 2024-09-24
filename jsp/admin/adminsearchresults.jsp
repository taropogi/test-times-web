
<%@ include file="../admin/adminstartsearch.jsp"%>

<body>
<div id="containerdash">
	<div id="messagearea">
<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%" class="projfiles">
	<tr class="bground"><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<table width="100" align="center" cellspacing="0" cellpadding="0" border="0" >
	<tr><!-- top -->
     	<table width="100%" cellpadding="0" cellspacing="0" border="0" class="projfiles" >
			<tr>
	    			<td>
	    				<th colspan="2"> Search results for: <c:out value='${find}'/></th>
					</td>
			</tr>
    	</table>
  </tr>
  <tr valign="top"> <!-- middle -->

  	<td width="693">
  		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="projfiles">
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
					<tr class="bground">
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
					<c:if test='${(company.allowedToCreateSalesOrder) && (not empty companyuser)}'>
					<c:url value="search.do" var="url">
						<c:param name="action" value="addProductToSalesOrder"/>
						<c:param name="searchstring" value='${find}' />
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

			<tr class="bground">
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
							  <tr class="bground">
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
  		<table width="100%" class="projfiles">
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
						<c:url value="adminsearch.do" var="url">
							<c:param name="action" value="adminSearchNow"/>
							<c:param name="searchstring" value='${find}' />
							<c:param name="page" value='${ctr}'/>
							<c:param name="companyId" value='${param.companyId}'/>
						</c:url>
						<a href="<c:out value='${url}' />"><c:out value='${ctr}' /></a>
						</c:forEach>
					</c:if>
				</td>
				</tr>
			</table>
  	</td>

  </tr>
	<tr><!-- bottom -->

  </tr>
</table>
<%@ include file="../includes/adminfooter.jsp"%>
</div>
</div>
</body>
