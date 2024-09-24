<%@ include file="../includes/header.jsp"%>
<script type='text/javascript' src='dwr/interface/CorporateUser.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>
<script type="text/javascript" src="javascripts/dwr/"></script>
<style type="text/css">@import url(css/calendar-blue.css);</style>
<script type="text/javascript" src="javascripts/calendar.js"></script>
<script type="text/javascript" src="javascripts/calendar-en.js"></script>
<script type="text/javascript" src="javascripts/calendar-setup.js"></script>
<script type="text/javascript">
function init(isUserAdminOrStaff)
{
	if (!isUserAdminOrStaff) {
		return;
	}
	
	Calendar.setup(
		{
				inputField : "from", // ID of the input field
				ifFormat : "%Y-%m-%d", // the date format
				button : "trigger1" // ID of the button
		}
	);
	Calendar.setup(
		{
				inputField : "to", // ID of the input field
				ifFormat : "%Y-%m-%d", // the date format
				button : "trigger2" // ID of the button
		}
	);
}
</script>
</head>
<c:set var="pageName" value="salesorders" />
<body onload="init(${usertype eq 'admin' || usertype eq 'officer'});">
	<div class="wrapper">
		<div class="container">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td class="sLeft">&nbsp;</td>
					<td class="content">
						<div class="timesTrading">
							<%@ include file="../includes/logo.jsp"%>
							<%@ include file="../includes/menu.jsp"%>
						</div>
						<div class="mainContent">
							<h1>Order Status/Listing</h1>
							<c:if test="${hasSecondSalesOrder}">
							<img src="images/spacer.gif" width="200" height="5" border="0" alt="">
							<table class="notesplitorder" border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
								<tr>
									<td>
										<p>You have a combination of contracted and non contracted items in a single order. 
										The system has split these items into two separate orders, one for contracted(#${sales2.salesOrderNo}), and another for non contracted(#${sales1.salesOrderNo}).
										</p>
										<p>
										Non-contracted orders will require the approval of your purchasing department before Times' Trading processing.
										</p>
									</td>
								</tr>
							</table>
							<img src="images/spacer.gif" width="200" height="10" border="0" alt="">
							</c:if>
							<c:if test="${dept_id eq null}">
								<c:set var="dept_id" value="0"/>
							</c:if>
							<c:if test="${usertype eq 'admin' || usertype eq 'officer'}">
							<table width="100%" border="0" cellspacing="0" cellpadding="10" class="salesorder">
								<form method="post" action="salesorder.do?action=searchSalesOrder">
								<tr>
									<td align="left">
										Order No.:
									</td>
									<td align="left">
										<input type="text" name="orderno" value="${orderno}" />
									</td>
									<td align="left">
										Ordered By:
									</td>
									<td align="left">
										<input type="text" name="requestor" value="${requestor}" />
									</td>									
								</tr>
								<tr>
									<td align="left">
											Status:
										</td>
										<td align="left">
											<select name="statusvalue" >
												<option value="">---- All Status ----</option>
												<c:forEach items="${statusList}" var="status">
												<option value="${status.value}" ${status.value eq statusvalue ? "selected='selected'" : ""}>${status.name}</option>
												</c:forEach>
											</select>
									</td>
									<td align="left">
										Date Ordered:
									</td>
									<td colspan="5" align="left">
										<input type="text" class="fldshrt" id="from" name="from" value="${from}" readonly /> 
										<input type="image" id="trigger1" width="20" height="20" valign="bottom" src="images/calendar_icon.gif"/>
										-
										<input type="text" class="fldshrt" id="to" name="to" value="${to}" readonly /> 
										<input type="image" id="trigger2" width="20" height="20" valign="bottom" src="images/calendar_icon.gif"/>  
									</td>
								</tr>
								<tr>
									<td align="left">
										Department:
									</td>
									<td colspan="5" align="left">
										<select name="department" >
											<option value="">---- All Covered Departments ----</option>
											<c:forEach items="${departments.items}" var="dept">
												<option value="${dept.id}" <c:if test='${dept.id eq department}'>selected='selected'</c:if>>${dept.name}</option>											
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="6" align="center"><input type="submit" value="Search" /></td>
								</tr>
								</form>
							</table>
							
							</c:if>
							
							<c:choose>
								<c:when test="${not empty notifications}"><br/>${notifications}<br/><br/></c:when>
								<c:otherwise>
									<p class="legend"><img src="images/copy.gif" alt="Copy" title="Copy" align="absmiddle" /> Copy<c:if test="${companyuser.usertype.value eq 1 or companyuser.usertype.value eq 2}"> &nbsp; <img src="images/approve.gif" alt="Approve" title="Approve" align="absmiddle" /> Approve &nbsp; <img src="images/reject.gif" alt="Reject" title="Reject" align="absmiddle" /> Reject</c:if></p>	
									
									<table width="100%" border="0" cellspacing="1" cellpadding="3" class="orderStatus">
										<tr>
											<th><a style="color:rgb(255,255,255);" 
												href="salesorder.do?action=searchSalesOrder&orderby=1&page=${page eq null or page eq 0 ? '1' : page}
												&department=${department eq null ? '0' : department}												
												<c:if test='${requestor ne null}'>&requestor=${requestor}</c:if>											
												<c:if test='${statusvalue ne null}'>&statusvalue=${statusvalue}</c:if>
												<c:if test='${from ne null}'>&from=${from}</c:if>
												<c:if test='${to ne null}'>&to=${to}</c:if>
												">Order</a></th>
												
											<th><a style="color:rgb(255,255,255);" 
												href="salesorder.do?action=searchSalesOrder&orderby=2&page=${page eq null or page eq 0 ? '1' : page}
												&department=${department eq null ? '0' : department}												
												<c:if test='${requestor ne null}'>&requestor=${requestor}</c:if>											
												<c:if test='${statusvalue ne null}'>&statusvalue=${statusvalue}</c:if>
												<c:if test='${from ne null}'>&from=${from}</c:if>
												<c:if test='${to ne null}'>&to=${to}</c:if>
												">Ordered By</a></th>
												
											<c:if test="${usertype eq 'admin' || usertype eq 'officer'}">
											<th><a style="color:rgb(255,255,255);" 
												href="salesorder.do?action=searchSalesOrder&orderby=3&page=${page eq null or page eq 0 ? '1' : page}
												&department=${department eq null ? '0' : department}												
												<c:if test='${requestor ne null}'>&requestor=${requestor}</c:if>											
												<c:if test='${statusvalue ne null}'>&statusvalue=${statusvalue}</c:if>
												<c:if test='${from ne null}'>&from=${from}</c:if>
												<c:if test='${to ne null}'>&to=${to}</c:if>
												">Dept.</a></th>
												
											</c:if>
											<th><a style="color:rgb(255,255,255);" 
												href="salesorder.do?action=searchSalesOrder&orderby=4&page=${page eq null or page eq 0 ? '1' : page}
												&department=${department eq null ? '0' : department}
												<c:if test='${requestor ne null}'>&requestor=${requestor}</c:if>											
												<c:if test='${statusvalue ne null}'>&statusvalue=${statusvalue}</c:if>
												<c:if test='${from ne null}'>&from=${from}</c:if>
												<c:if test='${to ne null}'>&to=${to}</c:if>
												">Date Ordered</a></th>
											<th><!-- a style="color:rgb(255,255,255);" href="#"-->Items Ordered</a></th>
											<th><!--a style="color:rgb(255,255,255);" href="#"-->Amount</a></th>
											<th><!--a style="color:rgb(255,255,255);" href="#"-->Status</a></th>
											<th>Item Approval</th>
										</tr>
										<c:forEach items="${allso}" var="so" varStatus="ctr">
									  	<tr<c:if test="${0 eq ctr.count % 2}"> class="even"</c:if>>
									  		<c:set var="hasNumber" value="${not empty so.salesOrderNo}" />
									  		<td>
												<c:if test="${usertype eq 'admin' || usertype eq 'officer'}">
								  					<c:url var="url" value="${hasNumber ? 'salesorder.do' : 'catalog.do'}">
								  						<c:param name="action" value="${hasNumber ? 'showSalesOrder' : 'loadOrder'}"/>
								  						<c:param name="id" value="${so.id}"/>
								  						<c:param name="department" value="${department}"/>
							  						</c:url>
									  			</c:if>
												<c:if test="${usertype ne 'admin' || usertype eq 'officer'}">
									  				<c:url var="url" value="${hasNumber ? 'salesorder.do' : 'catalog.do'}">
														<c:param name="action" value="${hasNumber ? 'showSalesOrder' : 'loadOrder'}"/>
														<c:param name="id" value="${so.id}"/>
													</c:url>
									  			</c:if>
								  				<a href="<c:out value='${url}' />" ><c:if test="${so.salesOrderNo ne null}"><c:out value='${so.salesOrderNo}'/></c:if><c:if test="${so.salesOrderNo eq null}">---</c:if></a>
										  	</td>
											<td>
									  			<c:out value='${so.requestingStaff.firstname} ${so.requestingStaff.lastname}'/>
										  	</td>
											<c:if test="${usertype eq 'admin' || usertype eq 'officer'}">	
											<td>
									  			<c:out value='${so.department.name}'/>	
										  	</td>
											</c:if>
											<td>
									  			<fmt:formatDate value="${so.addedOn}" pattern="yy-MM-dd"/>
										  	</td>
										  	<td>
									  			<c:out value='${so.itemQuantity}'/>
										  	</td>
										  	<td style="text-align: right">
									  			<c:out value='${so.total}'/>
										  	</td>
									  		<td>
									  			<c:out value='${so.status.name}'/>
										  	</td>
										  	<td>
										  		<c:if test="${so.status.value eq 8}"> <%-- and (not empty so.requestingStaff && so.requestingStaff.id eq companyuser.id)--%>
										  		<a href="catalog.do?action=loadOrder&id=${so.id}">Edit</a>
										  		<a href="salesorder.do?action=finishSalesOrder&soid=${so.id}">Done</a>
										  		</c:if>
										  		<a href="catalog.do?action=copyOrder&id=${so.id}" onclick="return confirm('Do you want to create a new Order from Order No. ${so.salesOrderNo}?');"><img src="images/iCopy.gif" alt="Copy" title="Copy This Order" /></a> &nbsp; 
										  		<c:if test="${so.status.value eq 1 and (companyuser.usertype.value eq 1 or companyuser.usertype.value eq 2)}">
										  		<a href="salesorder.do?action=approveSalesOrder&id=${so.id}&dept_id=${dept_id}" onclick="return confirm('Are you sure you want to Approve Order No. ${so.salesOrderNo}?');"><img src="images/iApprove.gif" alt="Approve" title="Approve" /></a> &nbsp; 
										  		<a href="salesorder.do?action=disapproveSalesOrder&id=${so.id}&dept_id=${dept_id}" onclick="return confirm('Are you sure you want to Reject Order No. ${so.salesOrderNo}?');"><img src="images/iReject.gif" alt="Reject" title="Reject" /></a>
										  		</c:if>
									  		</td>
									  	</tr>
										</c:forEach>
									</table>	
									
									<br/>
									
									<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
										<tr align="center">
											<td class="sodesc" align="center">
												<c:forEach begin="1" end="${page}" step="1" var="i">
												<c:if test="${usertype eq 'admin' || usertype eq 'officer'}">
												<!-- <a href="salesorder.do?action=showAllSalesOrderByDept& -->
												<a href="salesorder.do?action=searchSalesOrder&
													<c:if test='${not empty orderby}'>orderby=${orderby}&samesort&</c:if>
													page=${i}&department=${department}
													<c:if test='${requestor ne null}'>&requestor=${requestor}</c:if>										
													<c:if test='${statusvalue ne null}'>&statusvalue=${statusvalue}</c:if>
													<c:if test='${from ne null}'>&from=${from}</c:if>
													<c:if test='${to ne null}'>&to=${to}</c:if>
												">${i}</a>&nbsp;
												</c:if>
												<c:if test="${usertype eq 'staff'}">
												<!-- <a href="salesorder.do?action=showAllSalesOrder& -->
												
												<a href="salesorder.do?action=searchSalesOrder&
													<c:if test='${not empty orderby}'>orderby=${orderby}&samesort&</c:if>
													page=${i}<c:if test='${statusFilter ne null}'>&statusFilter=${statusFilter}</c:if>
													<c:if test='${requestor ne null}'>&requestor=${requestor}</c:if>											
													<c:if test='${statusvalue ne null}'>&statusvalue=${statusvalue}</c:if>
													<c:if test='${from ne null}'>&from=${from}</c:if>
													<c:if test='${to ne null}'>&to=${to}</c:if>
												">${i}</a>&nbsp;
												</c:if>				
												</c:forEach>
												<span style="color: red;">${page + 1}</span>&nbsp;
												<c:forEach begin="${page + 2}" end="${totalpages}" step="1" var="i">
												<c:if test="${usertype eq 'admin' || usertype eq 'officer'}">
												<a href="salesorder.do?action=searchSalesOrder&<c:if test='${not empty orderby}'>orderby=${orderby}&samesort&</c:if>
													page=${i}&department=${department}											
													<c:if test='${requestor ne null}'>&requestor=${requestor}</c:if>											
													<c:if test='${statusvalue ne null}'>&statusvalue=${statusvalue}</c:if>
													<c:if test='${from ne null}'>&from=${from}</c:if>
													<c:if test='${to ne null}'>&to=${to}</c:if>
													">${i}</a>&nbsp;
												</c:if>
												<c:if test="${usertype eq 'staff'}">
												<a href="salesorder.do?action=searchSalesOrder&<c:if test='${not empty orderby}'>orderby=${orderby}&samesort&</c:if>
													page=${i}
													<%--<c:if test='${statusFilter ne null}'>&statusFilter=${statusFilter}</c:if>
													<c:if test='${requestor ne null}'>&requestor=${requestor}</c:if>											
													<c:if test='${statusvalue ne null}'>&statusValue=${statusvalue}</c:if>
													<c:if test='${from ne null}'>&from=${from}</c:if>
													<c:if test='${to ne null}'>&to=${to}</c:if>--%>
												">${i}</a>&nbsp;
												</c:if>						
												</c:forEach>
											</td>
										</tr>
									</table>
									<br/>						
								</c:otherwise>
							</c:choose>	
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