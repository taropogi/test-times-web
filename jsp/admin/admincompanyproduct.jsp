<%@ include file="../includes/adminheader.jsp"%>

<body>
<c:set var="menu" value="products"/>
<c:set var="submenu" value="productitems"/>
<c:set var="pagemessage" value="You can update the information for the individual product items here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr>
		<td align="left"><%@ include file="../includes/error.jsp"%></td>
	</tr>
</table>`

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
 	 <tr>
   <td align="left" valign="top">
   	<table  border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
			<tr>
				<th colspan="2">
					<img src="images/admin/tag_orange.png" width="16" height="16" border="0"/> ORIGINAL PRODUCT DETAILS
				</th>
			</tr>	
			
			<tr class="bground" id="tr<c:out value='${product.id}'/>">
			
				<td class="thumb">
					<c:if test='${not empty baseproduct.imageExtension}'>
					<a href="javascript:popitup('images/product_orig_image/<c:out value='${baseproduct.filePicture}'/>')" >
						<img class="itemimage" src="images/product_thumb_image/<c:out value='${baseproduct.filePicture}'/>"/>
					</a>
					</c:if>
				</td>
				
				<td class="itemthumb" id="edit<c:out value='${baseproduct.id}'/>">
					
					<span class="itemname">Highlight this product: </span>
					<span class="itemdescription" id="highlight_<c:out value='${baseproduct.id}'/>">
						<c:choose>
							<c:when test='${baseproduct.highlight}'>Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</span><br />
					
					<span class="itemname">This product is out of stock: </span>
					<span class="itemdescription" id="isOutOfStock_<c:out value='${baseproduct.id}'/>">
						<c:choose>
							<c:when test='${product.isOutOfStock}'>Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</span><br />
					
					<span class="itemname">This product is shown to added companies only: </span>
					<span class="itemdescription" id="isShownOnlyToAddedCompany_<c:out value='${baseproduct.id}'/>">
						<c:choose>
							<c:when test='${baseproduct.isShownOnlyToAddedCompany}'>Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</span><br />
					
					<span class="itemname">Grouping:</span>
					<span class="itemdescription" id="groupingId_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.grouping.name}' /></span><br />
					
					<span class="itemname">Brand:</span>
					<span class="itemdescription" id="brandId_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.brand.name}' /></span><br />
					
					<span class="itemname">Name:</span>
					<span class="itemdescription" id="name_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.name}' /></span><br />
					
					<span class="itemname">Description:</span>
					<span class="itemdescription" id="description_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.description}' /></span><br />
					
					<span class="itemname">Code: </span>
					<span class="itemdescription" id="code_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.code}' /></span><br />
					
					<span class="itemname">Unique Item Code: </span>
					<span class="itemdescription" id="uniqueItemCode_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.uniqueItemCode}' /></span><br />
					
					<span class="itemname">Company Item Code: </span>
					<span class="itemdescription" id="companyItemCode_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.companyItemCode}' /></span><br />
					
					<span class="itemname">UOFM: </span>
					<span class="itemdescription" id="UOFM_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.UOFM}'/></span><br />
					
					<span class="itemname">Price: </span>
					<span class="itemdescription" id="price_<c:out value='${baseproduct.id}'/>"><c:out value='${baseproduct.price}' /></span><br />

				</td>	   
		  </tr>
   	</table>
   	<br />
		<table id="productTable" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
		  <tr>
		   <th colspan="2">
			<img src="images/admin/tag_orange.png" width="16" height="16" border="0" /> COMPANY SPECIFIC PRODUCT DETAILS
		   </th>
		  </tr>	
			<tr class="bground">
				<td class="itemthumb">
					<form action="adminproduct.do#product${baseproduct.id}" method="post">
					<span id="addinput" class="projfiles">
						<c:if test="${mode == 'edit'}">
							<input type="hidden" name="productid" value="<c:out value='${singleproduct.id}' />"/>
							<input type="hidden" name="action" value="updateCompanyProduct"/>
							<input type="hidden" name="referenceProductID" value="<c:out value='${singleproduct.referenceProduct.id}' />"/>
							<%--<input type="hidden" name="companyID" value="<c:out value='${singleproduct.companyID}' />"/>--%>
						</c:if>
						<c:if test="${mode == 'add'}">
							<input type="hidden" name="action" value="addCompanyProduct"/>
							<input type="hidden" name="referenceProductID" value="<c:out value='${singleproduct.id}' />"/>
						</c:if>
						
						<c:if test='${not empty grpid}'><%-- for paging purpose --%>
							<input type="hidden" name="grpid" value="<c:out value='${grpid}' />"/>
						</c:if>
						<input type="hidden" name="page" value="<c:out value='${page}' />"/>
						<input type="hidden" name="itempage" value="<c:out value='${itempage}' />"/>
						
						<input type="hidden" name="brandId" value="<c:out value='${singleproduct.brand.id}' />"/>
						<input type="hidden" name="groupingId" value="<c:out value='${singleproduct.grouping.id}' />"/>
						<table border="0" cellspacing="1" cellpadding="0" width="100%">
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									<input type="checkbox" name="isContracted" ${(singleproduct.isContracted) ? "checked" : ""}/>
									<span class="itemname">This company product is contracted.</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Company</span>
								</td>
								<td>
									<select name="companyID" class="listings">
									<c:forEach items="${companies}" var="company" varStatus="counter">
										<option value="${company.id}" <c:if test='${company.id eq singleproduct.company.id}'>selected</c:if> >${company.name}</option>
									</c:forEach>
									</select>
								</td>
							</tr>						
							<tr>
								<td>
									<span class="itemname">Grouping</span>
								</td>
								<td>
									<span class="itemdescription"><c:out value='${singleproduct.grouping.name}' /></span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Brand</span>
								</td>
								<td>
									<span class="itemdescription"><c:out value='${singleproduct.brand.name}' /></span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Name<span class="requiredfield">*</span></span>
								</td>
								<td>
									<input type="text" id="name*" name="name" alt="Name" class="item" size="18" value="<c:out value='${singleproduct.name}' />"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Description</span>
								</td>
								<td>
									<input type="text" id="description" name="description" class="item" size="18" value="<c:out value='${singleproduct.description}' />"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Code</span>
								</td>
								<td>
									<input type="text" id="code" name="code" class="item" size="18" value="<c:out value='${singleproduct.code}' />"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Unique Item Code</span>
								</td>
								<td>
									<span class="itemdescription"><c:out value='${singleproduct.uniqueItemCode}' /></span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Company Item Code</span>
								</td>
								<td>
									<input type="text" id="companyItemCode" name="companyItemCode" class="item" size="18" value="<c:out value='${singleproduct.companyItemCode}' />"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">UOFM</span>
								</td>
								<td>
									<input type="text" id="UOFM" name="UOFM" class="item" size="18" value="<c:out value='${singleproduct.UOFM}' />"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Price</span>
								</td>
								<td>
									<input type="text" id="price%" name="price" alt="Price" class="item" size="18" value="<c:out value='${singleproduct.price}' />"/>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
									<c:if test="${mode == 'edit'}">
										<c:set var="btnvalue" value="update this company product"/>
									</c:if>
									<c:if test="${mode == 'add'}">
										<c:set var="btnvalue" value="add this new company product"/>
									</c:if>
									<input type="submit" name="submitb" id="submitb" value="<c:out value='${btnvalue}'/>" class="buttonitem"/>
									<c:if test="${mode == 'edit'}">
										<input type="button" name="deleteb" value="delete" onclick="javascript: 
											if (confirm('Are you sure you want to delete\n this company product?')){
												document.location.href='adminproduct.do?action=deleteCompanyProduct&productid=<c:out value='${singleproduct.id}' /><c:if test='${not empty grpid}'>&grpid=<c:out value='${grpid}'/></c:if>&page=<c:out value='${page}'/>&itempage=<c:out value='${itempage}'/>#product${baseproduct.id}'
											}
											else{
												return false;
											}" 
											class="buttonitem" />
									</c:if>									
									<input type="button" name="resetb" value="reset" onclick="this.form.reset();" class="buttonitem" />
									<input type="button" name="cancelb" value="cancel" onclick="document.location.href='adminproduct.do?action=showAllProducts<c:if test='${not empty grpid}'>&grpid=<c:out value='${grpid}'/></c:if>&page=<c:out value='${page}'/>&itempage=<c:out value='${itempage}'/>#product${baseproduct.id}'" class="buttonitem" />
								</td>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<span class="requiredfieldtext">* Required field(s).</span>
								</td>
							</tr>
						</table>
					</span>					
					</form>
				</td>
			</tr>
		</table>
		</td>
   	<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
  	</tr>
	</table>		
	</div>	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>The properties listed here will only apply to the specific company you have chosen.</li>
	<li>By default, only the company/companies added to this product will see this item in the website.</li>
	</ul>
	</div>
	--><br/>
	
	<div id="messageadd" style="padding-top: 2px">
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>
