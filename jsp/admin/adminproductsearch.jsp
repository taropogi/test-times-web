<%@ include file="../includes/adminheader.jsp"%>

<script language="javascript">
<!--
<%@ include file="/javascripts/adminforms.js" %>


function TrimString(sInString) {
 		sInString = sInString.replace( /^\s+/g, "" );// strip leading
			return sInString.replace( /\s+$/g, "" );// strip trailing
		}



function isEmpty(inputStr) {
		if (inputStr == null || inputStr == "" || TrimString(inputStr)=="") {
			alert('Please provide something to search for.');
			return false;
		}
		if (TrimString(inputStr).length==1) 
			{
			alert('Please provide 2 or more characters in the search field.');
			return false;
			}
		return true;
	}
-->
</script>


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

<c:set var="menu" value="products"/>
<c:set var="submenu" value="search"/>
<c:set var="pagemessage" value="You can search for a product, code or description here."/>
<%@ include file="../includes/adminnav.jsp"%>

<body>



<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>



<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles" >
		<tr>
			<th colspan="2">Search</th>
		</tr>
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles" >
					<tr class="bground">
						<td class="itemthumb">
							<form method="post" action="adminsearch.do?action=adminSearchNow"  onsubmit="return isEmpty(this.searchstring.value);" >
							<input type="hidden" name="page" >
							<table cellspacing="0" cellpadding="3" border="0">
									<%@ include file="../includes/error.jsp"%>
										<tr class="bground">
												<td>Choose Company</td>
												<td>:</td>
												<td>
													<select name="companyId">
														<option value="">&nbsp;</option>
														<c:forEach items="${companies}" var="company" varStatus="ctr">
																<option value="${company.id}" ${(param.companyId eq company.id)? 'selected' : ''}>${company.name}</option>
														</c:forEach>
													</select>
												</td>
										</tr>
										<tr>
											<td>Search String<font color="#FF0000"> *&nbsp;&nbsp;</font></td>
											<td>:</td>
											<td><input size="30" name="searchstring" value="${param.searchstring}" id="searchstring"></input></td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td align="left">
												<input type="submit" name="submit" id="submit" value="search"  class="buttonitem"/>
												<input type="reset"  name="cancel" value="reset" onclick="this.form.reset();" class="buttonitem"/>
											</td>			
										</tr>
										<tr>
											<td colspan="3">
											<br />
												<font color="#FF0000">* Required</font>
											</td>
										</tr>	
							</table>
							</form>
						</td>
				</table>
			</td>
		</tr>
	</table>
	
	<br/>
	
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
				<tr class="${(not empty product.company) ? 'bground2' : 'bground'}">
				<a name="product${product.id}"></a>
		
				<td class="thumb">
					<c:if test='${not empty product.imageExtension}'>
					<a href="javascript:popitup('images/product_orig_image/<c:out value='${product.filePicture}'/>')" >
						<img class="itemimage" src="images/product_thumb_image/<c:out value='${product.filePicture}'/>"/>
					</a>
					</c:if>
				</td>
					<td class="itemthumb" id="edit<c:out value='${product.id}'/>" ${(not empty product.company) ? 'style="padding-left: 60px;"' : ''}>	
					<span id="uploadform_<c:out value='${product.id}'/>" style="display:none"></span>
					<form id="product_<c:out value='${product.id}'/>" name="product_<c:out value='${product.id}'/>">
					
				
					<c:choose>
						<c:when test='${not empty product.company}'>
									Company: <B><U><c:out value='${product.company.name}'/><br/></U></B>
						</c:when>
					</c:choose>	
								
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
							<a href="adminproduct.do?action=adminCompanyProduct&productid=<c:out value='${companyprod.id}'/>&grpid=<c:out value='${product.grouping.id}'/>&mode=edit" class="editdel"><c:out value='${companyprod.company.name}' /></a>
							<c:if test="${counter.count != prodsize}">
								<span class="projdetails">|</span>
							</c:if>
						</c:forEach>
					</div>
					</c:if>
					
					<div align="right" valign="bottom">
					<c:choose>
						<c:when test='${not empty product.company}'>
						<a href="adminproduct.do?action=adminCompanyProduct&productid=<c:out value='${product.id}'/>&grpid=<c:out value='${product.grouping.id}'/>&mode=edit" class="editdel">edit</a>
						</c:when>
						<c:otherwise>
						<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${product.id}'/>" />
						<a href="javascript:void(0)" onclick="editProduct(<c:out value='${product.id}'/>);" class="editdel" id="edit_<c:out value='${product.id}'/>">edit</a>
						<span class="projdetails">|</span>
						<a href="javascript:void(0)" onclick="deleteProduct(<c:out value='${product.id}'/>);" class="editdel" id="del_<c:out value='${product.id}'/>">delete</a>
						<span class="projdetails">|</span>
						<a href="adminproduct.do?action=adminCompanyProduct&productid=<c:out value='${product.id}'/>&grpid=<c:out value='${product.grouping.id}'/>&mode=add" class="editdel">add company</a>
						</c:otherwise>
					</c:choose>
					</div>
						
					
					</form>
					
				</td>
			</tr>
			</c:forEach>
			<tr style="display: none" id="inserthere"><td colspan="2">&nbsp;</tr>
		</table>
		</td>
		<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
		</tr>
	</table>
	
	</div>

	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>You can search for a product name, code or description here.</li>
	<li>This will search for the product name, description, product code, unique item code, and company item code.</li>
	</ul>
	</div>
	--><br>
	
	</div>
	
	<div style="clear: both;"></div>
	<%@ include file="../includes/adminfooter.jsp"%>
	
	<div style="display:none">
		<span id="addinput" class="projfiles">
			<%@ include file="adminproductsform.jsp"%>
		</span>
	</div>
</body>
