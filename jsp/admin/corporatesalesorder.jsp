<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminCompany.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>
<script type="text/javascript">
<!--

	function editSalesOrderStatus(id)
	{
		var select = $("status_" + id);
		var static = $("status_static_" + id);
		var cancel = $("status_cancel_" + id);
		var edit = $("status_edit_" + id);
		static.style.display = 'none';
		select.style.display = '';
		cancel.style.display = '';
		edit.innerHTML = "save";
		
		edit.onclick = function() {saveSalesOrderStatus(select, static, cancel, edit, id);};
		cancel.onclick = function() {cancelEdit(select, static, cancel, edit, id);};
	}
	
	function cancelEdit(select, static, cancel, edit, id)
	{
		select.style.display = 'none';
		cancel.style.display = 'none';
		
		static.style.display = '';
		
		edit.innerHTML = "edit";
		edit.onclick = function() {editSalesOrderStatus(id);};
	}
	
	function saveSalesOrderStatus(select, static, cancel, edit, id)
	{
		AdminCompany.changeSalesOrderStatus(id, select.value, 
		{
			callback:function(nstatus)
			{
				static.innerHTML = nstatus.name;
				cancelEdit(select, static, cancel, edit, id);
			}
		});
	}
	
	function view(form)
	{
		var str = "";
		for (var i = 0; i < form.elements.length; i++)
		{
			str += form.elements[i].name + " - " + form.elements[i].type + "\n";
		}
		alert(str);
	}
	
	function populateDepartment(form)
	{
		var select = form.departmentId;
		var value = form.companyId.value;
		var options = select.options;
		options.length = 1;
		
		if (value != null && value != "")
		{
			$("depindicator").style.display = "";
			AdminCompany.getDepartments(value,
			{
				callback: function (departments)
				{
					for (var i = 0; i < departments.length; i++)
					{
						var dept = departments[i];
						var dopt = new Option(dept.name, dept.id);
						options[options.length] = dopt;
					}
					$("depindicator").style.display = "none";
				}
			});
		}
	}

//-->
</script>

<body>

<c:set var="showArchive" value="${param.showArchive eq true}"/>
<c:set var="menu" value="corporate"/>
<c:set var="submenu" value="salesorder"/>
<c:if test="${showArchive}">
	<c:set var="submenu" value="archivesalesorder"/>
</c:if>
<c:set var="pagemessage" value="You can view, update the Sales Order info here."/>

<%@ include file="../includes/adminnav.jsp"%>

<div id="containerdash">
	<table border="0" cellpadding="1" cellspacing="1">
		<tr>
			<td>
			<%@ include file="../includes/error.jsp"%>
			<form name="showby" action="admincorporate.do?action=showAllSalesOrder" method="post">
			<input type="hidden" name="showArchive" value="${param.showArchive}"/>
			<span class="showcategoryselect">
			Show only Sales Orders for:<br/><br/>
			Company: &nbsp;
			<select name="companyId" class="listings" onchange="populateDepartment(this.form);">
				<option value="" <c:if test='${empty selectedCompany}'>selected="selected"</c:if>>---- All Companies ----</option>
				<c:forEach items="${companies}" var="company" varStatus="ctr">
					<option value="<c:out value='${company.id}'/>" <c:if test='${(not empty selectedCompany.id) && (company.id == selectedCompany.id)}'>selected="selected"</c:if>><c:out value='${company.name}'/></option>
				</c:forEach>
			</select>
			
			&nbsp;
			Department: &nbsp;
			<select name="departmentId" class="listings">
				<option value="">--Please Select A Company--</option>
				<c:forEach items="${departments}" var="dept" varStatus="ctr">
					<option value="<c:out value='${dept.id}'/>" <c:if test='${(not empty param.departmentId) && (dept.id == param.departmentId)}'>selected="selected"</c:if>><c:out value='${dept.name}'/></option>
				</c:forEach>
			</select>
			<img id="depindicator" style="display: none;" src="images/indicator.gif" />
			
			<br/>
			Contracted: &nbsp;
			<select name="contracted" class="listings">
				<option value="" ${(empty param.contracted) ? "selected" : ""}>---- mixed ----</option>
				<option value="true" ${(not empty param.contracted && param.contracted eq "true") ? "selected" : ""}>Contracted</option>
				<option value="false" ${(not empty param.contracted && param.contracted eq "false") ? "selected" : ""}>Non Contracted</option>
			</select>
			&nbsp;
			Status: &nbsp;
			<select name="status" class="listings">
				<option value="" ${(empty param.status) ? "selected" : ""}>---- all status ----</option>
				<c:forEach items="${statusList}" var="sostatus">
				<option value="${sostatus.value}" ${(param.status eq sostatus.value) ? "selected" : ""}>${sostatus.name}</option>
				</c:forEach>
			</select>
			<input type="submit" value="go"/>
			</span>
			</form>
			</td>
		</tr>
	</table>

	<div id="messagearea">
	<c:url value="admincorporate.do" var="formurl">
		<c:param name="action" value="generateMultipleSalesOrderPDF"/>
		<c:param name="page" value="${page + 1}"/>
		<c:param name="contracted" value="${param.contracted}" />
		<c:param name="status" value="${param.status}" />
		<c:param name="showArchive" value="${param.showArchive}" />
	</c:url>
	<form id="salesorderform" name="salesorderform" method="post" action="${formurl}">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
 	 <tr>
   <td align="left" valign="top">
		<table id="table" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
 			<tr>
 				<th align="center">&nbsp;</th>
 				<th align="center" style="width:70px;">Sales Order #</th>
 				<th align="center">Contracted</th>
 				<th align="center">Date Created</th>
 				<th align="center">Company</th>
 				<th align="center">Total Amount</th>
 				<th align="center">Status</th>
 				<th width="85px">&nbsp;</th>
 			</tr>
 			<c:forEach items="${allsalesorder}" var="so" varStatus="counter">
 			<c:url var="url" value="admincorporate.do">
				<c:param name="action" value="showSalesOrder"/>
				<c:param name="id" value="${so.id}"/>
				<c:param name="page" value="${page + 1}" />
				<c:param name="companyId" value="${param.companyId}" />
				<c:param name="departmentId" value="${param.departmentId}" />
				<c:param name="contracted" value="${param.contracted}" />
				<c:param name="status" value="${param.status}" />
				<c:param name="showArchive" value="${param.showArchive}" />
			</c:url>
			<tr class="bground">
				<td class="item" align="center">
					<input type="checkbox" name="salesorder_${so.id}"/>
				</td>
				<td class="item" align="center">
					<a class="editdel" href="${url}"><c:out value='${so.salesOrderNo}'/></a>
				</td>
				<td class="item" align="center">
					${(so.contracted) ? "Yes" : "No"}
				</td>
				<td class="item" align="center">
					<fmt:formatDate value="${so.addedOn}" pattern="MMM dd, yyyy"/>
				</td>
				<td class="item" align="center">
					${so.company.name}
				</td>
				<td class="item" align="center">
					<c:out value='${so.total}'/>
				</td>
				<td class="item" align="center">
					<span id="status_static_${so.id}">
						<c:out value='${so.status.name}'/>
					</span>
					<%--<form id="status_${so.id}" name="status_${so.id}" style="display:inline;">--%>
						<select style="display:none;" id="status_${so.id}" name="status_${so.id}">
							<c:forEach items="${statusList}" var="sostatus">
							<option value="${sostatus.value}" ${(so.status.value eq sostatus.value) ? "selected" : ""}>${sostatus.name}</option>
							</c:forEach>
						</select>
					<%--</form>--%>
				</td>
				<td class="item" align="center">
					<a id="status_edit_${so.id}" class="editdel" href="javascript:void(0);" onclick="editSalesOrderStatus(${so.id});">edit</a>
					&nbsp;
					<a id="status_cancel_${so.id}" class="editdel" style="display:none" href="javascript:void(0);" onclick="">cancel</a>
				</td>
		  </tr> 	
	  	</c:forEach>
 		</table>
 	
		
		</td>
   	<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"/></td>
  	</tr>
	</table>	

	<!--<input type="submit" value="test"/>-->
	<a href="javascript:document.getElementById('${'salesorderform'}').submit();">Generate PDF of all checked Sales Order</a>
	</form>

	<br/>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr align="center">
			<td>
				<c:forEach begin="1" end="${page}" step="1" var="i">
					<c:url value="admincorporate.do" var="url">
						<c:param name="action" value="showAllSalesOrder" />
						<c:param name="page" value="${i}" />
						<c:param name="companyId" value="${param.companyId}" />
						<c:param name="departmentId" value="${param.departmentId}" />
						<c:param name="contracted" value="${param.contracted}" />
						<c:param name="status" value="${param.status}" />
						<c:param name="showArchive" value="${param.showArchive}" />
					</c:url>
					<a href="${url}">${i}</a>&nbsp;
				</c:forEach>
				<span style="color: red;">${page + 1}</span>&nbsp;
				<c:forEach begin="${page + 2}" end="${totalpages}" step="1" var="i">
					<c:url value="admincorporate.do" var="url">
						<c:param name="action" value="showAllSalesOrder" />
						<c:param name="page" value="${i}" />
						<c:param name="companyId" value="${param.companyId}" />
						<c:param name="departmentId" value="${param.departmentId}" />
						<c:param name="contracted" value="${param.contracted}" />
						<c:param name="status" value="${param.status}" />
						<c:param name="showArchive" value="${param.showArchive}" />
					</c:url>
					<a href="${url}">${i}</a>&nbsp;
				</c:forEach>
			</td>
		</tr>
	</table>	
	</div>	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>This is where we can see all sales order approved by their approving officer.</li>
	<li>You can filter the sales orders by company, department, contracted and status.</li>
	</ul>
	</div>
	--><br/>
	
	<div id="messageadd"><br /></div>
	
<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>