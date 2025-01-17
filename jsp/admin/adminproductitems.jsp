<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminProductAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<script language="JavaScript" type="text/javascript">
<!--
<%@ include file="/javascripts/adminproductajax.js" %>
//-->
</script>

<body<c:if test='${not empty editProductItem}'> onload="editProduct(<c:out value='${editProductItem}'/>)"</c:if>>
<c:set var="menu" value="products"/>
<c:set var="submenu" value="productitems"/>
<c:set var="pagemessage" value="You can add, update and delete the information for the individual product items here."/>

<%@ include file="../includes/adminnav.jsp"%>

<div id="containerdash">
<table border="0" cellpadding="1" cellspacing="1">
	<tr><td>
	<%@ include file="../includes/error.jsp"%>
	<span class="showcategoryselect">
	<form method="post" action="adminproduct.do?action=showAllProductsByCompany">
	Show only products for this company:
	<select name="company_id" class="listings">
		<option value="0">---- All Companies ----</option>
		<c:forEach items="${companies}" var="company" varStatus="counter">
		<option value="${company.id}" ${(company.id eq companyid) ? 'selected' : ''}>${company.name}</option>
		</c:forEach>
	</select>
	<INPUT TYPE=SUBMIT value="Go">
	</form>
	<br />
	<form method="post" action="adminproduct.do?action=showAllProducts">
	Show only products for this group:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="grpid" class="listings">
		<option value="0">---- All Groupings ----</option>
		<c:forEach items="${productgroupings}" var="grouping" varStatus="counter">
		<option value="${grouping.id}" ${(grouping.id eq grpid) ? 'selected' : ''}>${grouping.name}</option>		
		%></c:forEach>
	</select>	
	<INPUT TYPE=SUBMIT value="Go">
	</form>
	</span>
	</td></tr>
</table>
</div>
<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
 	 <tr>
   <td align="left" valign="top">
		<table id="productTable" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
		  <tr>
				<th colspan="2">
				<img src="images/admin/tag_orange.png" width="16" height="16" border="0" /> PRODUCT DETAILS
				</th>
		  </tr>	
			<c:forEach items="${products}" var="product" varStatus="counter">
			<tr class="bground" id="tr<c:out value='${product.id}'/>">
				<a name="product${product.id}"></a>
				<td class="thumb">
				<c:if test="${myaction ne 'findAllByCompany'}">
						<%--<a href="javascript:popitup('images/product_orig_image/<c:out value='${product.filePicture}'/>')" >
							<img class="itemimage" src="images/product_thumb_image/<c:out value='${product.filePicture}'/>"/>
						--%>
					<c:choose>
						<c:when test="${not empty product.filePicture}">
							<img src="images/product_orig_image/<c:out value='${product.filePicture}'/>" border="0" width="110px" height="100px"/>
						</c:when>
						<c:otherwise>
							<img class="imageborder" border="0" src="images/noimage.jpg" />
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${myaction eq 'findAllByCompany'}">
					<a href="javascript:popitup('images/product_orig_image/<c:out value='${product.filePicture}'/>')" >
						<img class="itemimage" src="images/product_thumb_image/<c:out value='${product.filePicture}'/>"/>
					</a>
				</c:if>				
				
				
				 
				</td>
				
				<td class="itemthumb" id="edit<c:out value='${product.id}'/>">
					
					<span id="uploadform_<c:out value='${product.id}'/>" style="display:none"></span>
					
					<form id="product_<c:out value='${product.id}'/>" name="product_<c:out value='${product.id}'/>">
					
					<span class="itemname">Highlight this product: </span>
					<span class="itemdescription" id="highlight_<c:out value='${product.id}'/>">
						<c:choose>
							<c:when test='${product.highlight}'>Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</span><br />
					
					<span style="display:none;">
					<span class="itemname">This product is contracted: </span>
					<span class="itemdescription" id="isContracted_<c:out value='${product.id}'/>">
						<c:choose>
							<c:when test='${product.isContracted}'>Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</span><br />
					</span>
					
					<span class="itemname">This product is shown only to added companies: </span>
					<span class="itemdescription" id="isShownOnlyToAddedCompany_<c:out value='${product.id}'/>">
						<c:choose>
							<c:when test='${product.isShownOnlyToAddedCompany}'>Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</span><br />
					
					<span class="itemname">This product is out of stock: </span>
					<span class="itemdescription" id="isOutOfStock_<c:out value='${product.id}'/>">
						<c:choose>
							<c:when test='${product.isOutOfStock}'>Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</span><br />
					
					<span class="itemname">Grouping:</span>
					<span class="itemdescription" id="groupingId_<c:out value='${product.id}'/>"><c:out value='${product.grouping.name}' /></span><br />
					
					<span class="itemname">Brand:</span>
					<span class="itemdescription" id="brandId_<c:out value='${product.id}'/>"><c:out value='${product.brand.name}' /></span><br />
					
					<span class="itemname">Name:</span>
					<span class="itemdescription" id="name_<c:out value='${product.id}'/>"><c:out value='${product.name}' /></span><br />
					
					<span class="itemname">Description:</span>
					<span class="itemdescription" id="description_<c:out value='${product.id}'/>"><c:out value='${product.description}' /></span><br />
					
					<span class="itemname">Code: </span>
					<span class="itemdescription" id="code_<c:out value='${product.id}'/>"><c:out value='${product.code}' /></span><br />
					
					<span class="itemname">Unique Item Code: </span>
					<span class="itemdescription" id="uniqueItemCode_<c:out value='${product.id}'/>"><c:out value='${product.uniqueItemCode}' /></span><br />
					
					<span class="itemname">Company Item Code: </span>
					<span class="itemdescription" id="companyItemCode_<c:out value='${product.id}'/>"><c:out value='${product.companyItemCode}' /></span><br />
					
					<span class="itemname">UOFM: </span>
					<span class="itemdescription" id="UOFM_<c:out value='${product.id}'/>"><c:out value='${product.UOFM}'/></span><br />
					
					<span class="itemname">Price: </span>
					<span class="itemdescription" id="price_<c:out value='${product.id}'/>"><c:out value='${product.price}' /></span><br />

					<c:if test="${not empty product.companyProducts}">
					<div align="left" valign="bottom">
						<span class="itemname">Unique Product Info for Company: </span>
						<c:set var="prodsize" value="${fn:length(product.companyProducts)}"/>
						<c:forEach items="${product.companyProducts}" var="companyprod" varStatus="counter">
							<a href="adminproduct.do?action=adminCompanyProduct&productid=<c:out value='${companyprod.id}'/><c:if test='${not empty grpid}'>&grpid=<c:out value='${grpid}'/></c:if>&page=<c:out value='${currentpage}'/>&itempage=<c:out value='${itempage}'/>&mode=edit" class="editdel"><c:out value='${companyprod.company.name}' /></a>
							<c:if test="${counter.count != prodsize}">
								<span class="projdetails">|</span>
							</c:if>
						</c:forEach>						
					</div>
					</c:if>

					<div align="right" valign="bottom">
						<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${product.id}'/>" />
						<a href="javascript:void(0)" onclick="editProduct(<c:out value='${product.id}'/>);" class="editdel" id="edit_<c:out value='${product.id}'/>">edit</a>
						<span class="projdetails">|</span>
						<a href="javascript:void(0)" onclick="deleteProduct(<c:out value='${product.id}'/>);" class="editdel" id="del_<c:out value='${product.id}'/>">delete</a>
						<span class="projdetails">|</span>
						<a href="adminproduct.do?action=adminCompanyProduct&productid=<c:out value='${product.id}'/><c:if test='${not empty grpid}'>&grpid=<c:out value='${grpid}'/></c:if>&page=<c:out value='${currentpage}'/>&itempage=<c:out value='${itempage}'/>&mode=add" class="editdel">add company</a>						
					</div>
					
					</form>
					
				</td>	   
		  </tr> 	
	  	</c:forEach>
	  	<tr style="display: none" id="inserthere"><td colspan="2">&nbsp</tr>
		</table>
		</td>
   	<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
  	</tr>
	</table>		
	</div>	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>You can filter the product items shown by selecting from the Product Grouping drop down listing.</li>
	<li>To change the number of product items shown per page, go to "Settings", then change the number of products to show per page".</li>
	</ul>
	</div>
	--><br/>
	
	<div id="messagepaging">
		<table border="0" cellpadding="1" align="center">
		<tr>
			<td align="center" class="page">
				<c:if test='${currentpage != 0}'>
					<c:forEach begin='0' end='${currentpage - 1}' var="ctr">
					<a href="<c:url value="adminproduct.do"><c:param name="action" value="${myaction}"/><c:param name="page" value='${ctr}' /><c:param name="itempage" value='${itempage}'/><c:param name="company_id" value="${companyid}"/><c:param name="grpid" value="${grpid}"/></c:url>"><c:out value='${ctr + 1}' /></a>
					</c:forEach>
				</c:if>
				<span class="pageselected"><c:out value='${currentpage + 1}' /></span>
				<c:if test='${currentpage < totalpage}'>
					<c:forEach begin='${currentpage + 1}' end='${totalpage}' var="ctr">
					<a href="<c:url value="adminproduct.do"><c:param name="action" value="${myaction}"/><c:param name="company_id" value="${companyid}"/><c:if test='${not empty grpid}'><c:param name="grpid" value="${grpid}"/></c:if><c:param name="page" value='${ctr}' /><c:param name="itempage" value='${itempage}'/></c:url>"><c:out value='${ctr + 1}' /></a>
					</c:forEach>
				</c:if>
			</td>
		</tr>
		</table>
	</div>
	
	<div id="messageadd">
	<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%">
		<tr>
            <td height="8"><img src="images/space.gif" width="1" height="8" /></td>
		</tr>
		<tr>
			<td>
			<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
				<tr>
				<th>
					<img src="images/admin/add.png" width="16" height="16" border="0"> Add A New Product Item
				</th>
				</tr>
				<tr class="bground">
				<td class="itemthumb">
					<span id="addinput" class="projfiles">
					<%@ include file="adminproductsform.jsp"%>
					</span>
				</td>
				</tr>
			</table>
			</td>
		</tr>

	</table>
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>