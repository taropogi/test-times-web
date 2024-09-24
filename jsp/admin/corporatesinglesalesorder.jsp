<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminCompany.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<body>

<c:set var="menu" value="corporate"/>
<c:set var="submenu" value="salesorder"/>
<c:if test="${soindv.status eq SalesOrderStatus.PAID || soindv.status eq SalesOrderStatus.REJECTED}">
	<c:set var="submenu" value="archivesalesorder"/>
</c:if>
<c:set var="pagemessage" value="You can view the details for the Sales Order here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
 	 <tr>
   <td align="left" valign="top">
		<table id="table" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
		  <tr>
		   <th colspan="2">SALES ORDER DETAILS</th>
		  </tr>
		  <tr class="bground">
				<td class="itemthumb">
					<span class="itemname">Number: </span><span class="itemdescription">#<c:out value='${soindv.salesOrderNo}'/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="itemname">Date Created: </span><span class="itemdescription"><fmt:formatDate value="${soindv.addedOn}" pattern="MMM dd, yyyy"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="itemname">Created By: </span><span class="itemdescription"><c:out value='${soindv.requestingStaff.firstname}'/> <c:out value='${soindv.requestingStaff.lastname}'/></span><br />
					<span class="itemname">Company: </span><span class="itemdescription"><c:out value='${soindv.company.name}'/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="itemname">Total Amount: </span><span class="itemdescription"><c:out value='${soindv.total}'/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="itemname">Status: </span><span class="itemdescription"><c:out value='${soindv.status.name}'/></span><br />
					<span class="itemname">Note: </span><span class="itemdescription"><c:out value='${soindv.note}'/></span><br />
					<br />
					
					<form name="updateSalesOrderItems" method="post" action="admincorporate.do">
					<input type="hidden" name="action" value="updateShippedToSalesOrder" />
					<input type="hidden" name="salesOrderId" value="${soindv.id}"/>
					<table class="projfiles" cellpadding="0" cellspacing="0" width="90%">
						<!--
						<tr>
							<th colspan="4">Sales Order Items</th>
						</tr> -->
						<tr style="text-align: center;">
							<th>Ordered</th>
							<th>Shipped</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Subtotal</th>
						</tr>
						<c:forEach items="${soindv.items}" var="soitem" varStatus="counter">
						<tr class="bground" style="text-align: center;">
							<td class="itemthumb">${soitem.quantity}</td>
							<td class="itemthumb"><input style="width: 30px;" type="text" name="item_${counter.index}" value="${soitem.shipped}"/></td>
							<td class="itemthumb">${soitem.productName}</td>
							<td class="itemthumb">${soitem.priceString}</td>
							<td class="itemthumb">${soitem.subTotalString}</td>
						</tr>
						</c:forEach>
					</table>
					<br/>
					<input type="submit" value="Update shipped items." />
					</form>
					
					<br />
					<form name="changestatus" action="admincorporate.do?action=updateSalesOrderStatus" method="post">
					<input type="hidden" name="id" value="<c:out value='${soindv.id}'/>"/>
					<span class="itemname">Change the status for this Sales Order to: </span>
						<select name="status">
							<c:forEach items="${salesordertype}" var="status" varStatus="ctr">
								<option value="<c:out value='${status.value}'/>" <c:if test='${soindv.status eq status}'>selected="selected"</c:if>><c:out value='${status.name}'/></option>
							</c:forEach>
						</select>
						<input type="submit" value="Update Status"/>
					</form>
					<br/>
					View this sales order in PDF format (
					<a href="adminreports.do?action=generateSalesOrderReportPDF&id=${soindv.id}"> Full Page </a> | 
					<a href="adminreports.do?action=generateSalesOrderReportPDFHalf&id=${soindv.id}"> Half Page </a>					
					)
					<br />
					<c:url value="admincorporate.do" var="backurl">
						<c:param name="action" value="showAllSalesOrder" />
						<c:param name="page" value="${param.page}" />
						<c:param name="companyId" value="${param.companyId}" />
						<c:param name="departmentId" value="${param.departmentId}" />
						<c:param name="contracted" value="${param.contracted}" />
						<c:param name="status" value="${param.status}" />
						<c:param name="showArchive" value="${param.showArchive}" />
					</c:url>
					<a href="${backurl}">Back to the list of sales orders</a>
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
	<li>This is the details of the sales order.</li>
	</ul>
	</div>
	--><br>
	
	<div id="messageadd"><br /></div>
	
<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>