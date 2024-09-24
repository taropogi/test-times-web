<%@ include file="../includes/header.jsp"%>
<script type='text/javascript' src='dwr/interface/CorporateUser.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>
</head>
<c:set var="pageName" value="salesorder" />
<body>
	<div class="wrapper">
		<div class="container">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td class="sLeft">&nbsp;</td>
					<td class="content">
						<div class="timesTrading">
							<%@ include file="../includes/logo.jsp"%>
							<%@ include file="../includes/menu.jsp"%>
							<%--<%@ include file="includes/latest.jsp"%>--%>
							<%--<%@ include file="includes/search.jsp"%>--%>
						</div>
						<div class="mainContent">
							<h1>Order #${sorder.salesOrderNo}</h1>
							<a style="float:right;margin-left:5px;" href="catalog.do?action=copyOrder&id=${sorder.id}" onclick="return confirm('Do you want to create a new Order from Order No. ${sorder.salesOrderNo}?');"><img src="images/iCopy.gif" alt="Copy" title="Copy This Order" /></a> &nbsp; 
							
							<c:if test="${owneranddraft ne null}">
								<a style="float:right;margin-left:5px;" href="catalog.do?action=loadOrder&id=${sorder.id}">Edit</a>
								<form style="float:right;margin-left:5px;" action="salesorder.do?action=finishSalesOrder" method="post">
									<input type="hidden" name="deptid" value="${sorder.department.id}"/>
									<input type="hidden" name="note" value="${sorder.note}"/>
									<input type="submit" value="Done" onclick="return confirm('Are you sure you are finished with this Sales Order?');"/>
								</form>
							</c:if>
					
							<c:if test='${editable}'>
							<form style="float:right;margin-left:5px;" name="approve" style="display:inline;" method="post" action="salesorder.do?action=approveSalesOrder">
							<input type="hidden" name="id" value="<c:out value='${sorder.id}'/>"/>
							<input type="hidden" name="dept_id" value="${dept_id}"/>
							<img style="cursor:pointer;" src="images/iApprove.gif" alt="Approve" title="Approve" onclick="approve.submit();"/>
							</form>
							
							<form style="float:right;margin-left:5px;" name="reject" style="display:inline;" method="post" action="salesorder.do?action=disapproveSalesOrder">
							<input type="hidden" name="id" value="<c:out value='${sorder.id}'/>"/>
							<input type="hidden" name="dept_id" value="${dept_id}"/>
							<img style="cursor:pointer;" src="images/iReject.gif" alt="Reject" title="Reject" onclick="if(confirm('Are you sure you want to disapprove this sales order?'))reject.submit();"/>
							</form>
							
							</c:if>
							
							
							
							<table border="0" cellpadding="5" cellspacing="0" align="center" width="680" id="notedeptbrder">
								<tr>
									<td width="90" class="sotitle">Department:</td>
									<td width="140" align="left" class="sodesc">${sorder.department.name}</td>
									<td width="10"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
									<td width="50" class="sotitle">Note:</td>
									<td width="350" align="left" class="sodesc">${sorder.note}</td>
								</tr>
																
								<tr>
									<td width="90" class="sotitle">Ordered By:</td>
									<td width="140" align="left" class="sodesc">${sorder.requestingStaff.firstname}&nbsp;${sorder.requestingStaff.lastname}</td>
									<td width="10"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>								
									<td width="90" class="sotitle">Status:</td>
									<td width="140" align="left" class="sodesc">${sorder.status.name}</td>									
								</tr>
							</table>
							<br>
							<div style="height: 2px;"></div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
								<td align="left" valign="top" bgcolor="#7CC0E5"><img src="images/so_leftcurve.gif" width="4" height="4" border="0" alt=""></td>								
								<td align="center" valign="middle" width="12%" height="23" bgcolor="#7CC0E5"><span class="sotitle">Qty</span></td>
								<td align="center" valign="middle" width="13%" height="23" bgcolor="#7CC0E5"><span class="sotitle">Item Code</span></td>
								<td align="center" valign="middle" height="23" bgcolor="#7CC0E5"><span class="sotitle">Item</span></td>
								<td align="center" valign="middle" width="15%" height="23" bgcolor="#7CC0E5"><span class="sotitle">Price</span></td>
								<td align="center" valign="middle" width="15%" height="23" bgcolor="#7CC0E5"><span class="sotitle">Subtotal</span></td>
								<c:if test="${sorder.status.name eq 'New'}">
								<td align="center" valign="middle" width="14%" height="23"  bgcolor="#7CC0E5">&nbsp;</td>
								</c:if>
								<td align="right" valign="top" bgcolor="#7CC0E5"><img src="images/so_rightcurve.gif" width="4" height="4" border="0" alt=""></td>	
								</tr>
								<c:forEach items="${sorder.items}" var="soitem" varStatus="ctr">
								<c:set var="bgcolor" value="" />
								<c:if test="${0 eq ctr.count % 2}">
									<c:set var="bgcolor" value='bgcolor="#EFEFEF"' />
								</c:if>
								<form name="soitem_<c:out value='${soitem.product.id}'/>" id="soitem_${soitem.product.id}">
								<tr id="so_tr_<c:out value='${soitem.product.id}'/>">
									<td ${bgcolor}>&nbsp;</td>
									<td align="center" valign="middle" height="23" ${bgcolor}>
										<span class="sodesc" id="qt_st_${soitem.product.id}">
											<c:out value='${soitem.quantity}'/>
										</span>
										<span class="sodesc" style="display: none;" id="qt_ed_${soitem.product.id}">
											<input type="text" class="addqty" name="qt" id="qt*#" value="<c:out value='${soitem.quantity}'/>"/>
										</span>
									</td>
									<td align="center" valign="middle" height="23" ${bgcolor}>
										<span class="sodesc" id="code_<c:out value='${soitem.product.id}'/>">
											<c:out value='${soitem.code}'/>
										</span>&nbsp;
									</td>
									<td align="center" valign="middle" height="23" ${bgcolor}>
										<span class="sodesc" id="productName_<c:out value='${soitem.product.id}'/>">
											<c:out value='${soitem.productName}'/>
										</span>
									</td>
									<td align="center" valign="middle" height="23" ${bgcolor}>
										<span class="sodesc" id="price_<c:out value='${soitem.product.id}'/>">
											<c:out value='${soitem.priceString}'/>
										</span>
									</td>
									<td align="center" valign="middle" height="23" ${bgcolor}>
										<span class="sodesc" id="subtotal_<c:out value='${soitem.product.id}'/>">
											<c:out value='${soitem.subTotalString}'/>
										</span>
									</td>
									<c:if test="${sorder.status.name eq 'New'}">
										<td align="center" valign="middle" height="23" ${bgcolor}>
											<a class="usersadddel" href="javascript:void(0);" id="edit_${soitem.product.id}" onclick="editExistingSalesOrderItem(${sorder.id}, ${soitem.product.id});">edit</a>&nbsp;&nbsp;&nbsp;
											<a class="usersadddel" href="javascript:void(0);" id="del_${soitem.product.id}" onclick="removeExistingSalesOrderItem(${sorder.id}, ${soitem.product.id});">delete</a>
										</td>
									</c:if>
									<td ${bgcolor}>&nbsp;</td>
								</tr>
								</form>
								</c:forEach>
								<tr>
									<td align="left" valign="top" align="center" colspan="5"><span class="sotitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOTAL</span></td>	
									<td align="center" valign="middle">
										<span class="sotitle" id="salesordertotal">
											<c:choose>
												<c:when test='${not empty sorder}'>
													<c:out value='${sorder.total}'/>
												</c:when>
												<c:otherwise>
													0
												</c:otherwise>
											</c:choose>
										</span>
									</td>
								</tr>	
							</table>
						</div>
						<%-- <%@ include file="../includes/sidenav.jsp"%>--%>
						<div class="clear"></div>
						<%@ include file="/jsp/includes/footer.jsp"%>					
					</td>
					<td class="sRight">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>