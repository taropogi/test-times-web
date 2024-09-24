<%@ include file="includes/header.jsp"%>
</head>
<c:set var="pageName" value="shoppinglist" />
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
							<c:if test="${empty salesorder.items}">
							<h2>Shopping List Empty</h2>
							</c:if>
							<c:if test='${(company.allowedToCreateSalesOrder) && (not empty companyuser) && (not empty salesorder.items)}'>
							<a name="currentsalesorder"></a>
							<h4>Online Sales Order for <c:out value='${company.name }'/></h4>
							<table width="100%" border="0" cellspacing="1" cellpadding="3" class="orderStatus" id="salesorderitemstable">
								<tr>
									<th>Qty</th>
									<th>Code</th>
									<th>Name</th>
									<th>Price</th>
									<th>Subtotal</th>
								</tr>
							
								<c:forEach items="${salesorder.items}" var="soitem" varStatus="ctr">
								<c:set var="productid" value="${soitem.product.id}" />
								<form name="soitem_<c:out value='${productid}'/>" id="soitem_<c:out value='${productid}'/>">
								<tr id="so_tr_<c:out value='${productid}'/>"<c:if test="${0 eq ctr.count % 2}"> class="even"</c:if>>
									<td>
										<span id="qt_st_<c:out value='${productid}'/>">
											<c:out value='${soitem.quantity}'/>
										</span>
										<span style="display:none;" id="qt_ed_<c:out value='${productid}'/>">
											<input type="text" class="addqty" name="qt" id="qt*#" value="<c:out value='${soitem.quantity}'/>"/>
										</span>
									</td>
									<td>
										<span id="code_<c:out value='${productid}'/>">
											<c:out value='${soitem.code}'/>
										</span>&nbsp;
									</td>
									<td>
										<span id="productName_<c:out value='${productid}'/>">
											<c:out value='${soitem.productName}'/>
										</span>
									</td>
									<td>
										<span id="price_<c:out value='${productid}'/>">
											<c:out value='${soitem.priceString}'/>
										</span>
									</td>
									<td>
										<span id="subtotal_<c:out value='${productid}'/>">
											<c:out value='${soitem.subTotalString}'/>
										</span>
									</td>
									<td style="border-top:1px solid rgb(255,255,255);border-bottom:1px solid rgb(255,255,255);">
										<a href="javascript:void(0);" id="edit_<c:out value='${productid}'/>" onclick="editSalesOrderItem(<c:out value='${productid}'/>);">edit</a> | 
										<a href="javascript:void(0);" id="del_<c:out value='${productid}'/>" onclick="removeSalesOrderItemWithIndex(<c:out value='${productid}'/>, document.getElementById('salesorderitemstable'), ${ctr.count});">delete</a>
									</td>
								</tr>
								</form>
								</c:forEach>
								<tr>
									<td colspan="4">
										TOTAL
									</td>	
									<td>
										<span id="salesordertotal">
											<c:choose>
												<c:when test='${not empty salesorder}'>
													<c:out value='${salesorder.total}'/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</span>
									</td>
									<td></td>
								</tr>	
							</table>
							<br/>
							<script type="text/javascript">
								function submitForm(formAction, strutsAction)
								{
									var form = document.getElementById("cartForm");
									var input = document.createElement("input");
									input.setAttribute("type", "hidden");
									input.setAttribute("name", "action");
									input.setAttribute("value", strutsAction);
									form.appendChild(input);
									form.action = formAction;
									form.submit();
								}
							</script>
							<form id="cartForm" action="salesorder.do?action=finishSalesOrder" method="post">
								<table border="0" cellpadding="2" cellspacing="0" align="center" width="100%" class="notedeptbrder">
									<c:if test="${UserTypes.STAFF eq companyuser.usertype}">
									<tr>
										<td class="sotitle" colspan="5">
											Orders above 
											<fmt:formatNumber value="${company.totalSalesOrderWOutApproval}" currencySymbol="" type="currency" maxFractionDigits="2" minFractionDigits="2"/>
											will be subject to Approving Officer's approval.
										</td>
									</tr>
									</c:if>
									<tr>
										<td width="15%" valign="top"><span class="sotitle">Department</span></td>
										<td width="2%" valign="top"><span class="sotitle">:</span></td>
										<td width="20%"  valign="top">
											<select id="deptid" name="deptid" class="seldept">
												<c:forEach items="${company.departments}" var="dept">
													<option value='${dept.id}' ${salesorder ne null and salesorder.department ne null and salesorder.department.id eq dept.id ? "selected='selected'" : ""}>${dept.name}</option>
												</c:forEach>
											</select>
										</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td valign="top"><span class="sotitle">Note</span></td>
										<td valign="top"><span class="sotitle">:</span></td>
										<td valign="top"><textarea id="note" name="note" class="notedept">${salesorder.note}</textarea></td>
									</tr>
								</table>
								<table border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
									<tr>
										<td width="50%">&nbsp;</td>
										<td width="50%" align="right" valign="middle" height="37">
											<input type="button" value="Save" class="formButton" onclick="if(confirm('Are you sure you want to save this Sales Order?')){submitForm('salesorder.do', 'saveSalesOrder');}else{return false;};" />	
											<input type="button" value="Cancel" class="formButton" onclick="if(confirm('Are you sure you want to cancel this Sales Order?')){submitForm('catalog.do', 'cancelSalesOrder');}else{return false;};" />
											<input type="submit" value="Done" class="formButton" onclick="return confirm('Are you sure you are done with this Sales Order?');" />
										</td>
									</tr>
								</table>
							</form>
							</c:if>
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