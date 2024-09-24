<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminCompany.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<script language="javascript" type="text/javascript">	
	function generateTableRow(company)
	{
		var buffer = new Buffer();		
		buffer.append('<form id="companyform_').append(company.id).append('">\n');
		buffer.append('<span class="itemname">Company Name:</span>\n');
		buffer.append('<span class="itemdescription" id="name_').append(company.id).append('">\n');
		buffer.append(company.name);
		buffer.append('</span><br />\n');
		buffer.append('<span class="itemname">Company URL:</span>\n');
		buffer.append('<span class="itemdescription" id="companyUrl_').append(company.id).append('">\n');
		buffer.append(company.companyUrl).append(company.companyUrl != "${genericURL}" ? '.${genericURL}\n' : '\n');
		buffer.append('</span><br />\n');
		/*buffer.append('<span class="itemname" style="vertical-align:top;">Address:</span>\n');
		buffer.append('<span class="itemdescription" id="address_').append(company.id).append('">\n');
		buffer.append(company.address);
		buffer.append('</span><br />\n');
		buffer.append('<span class="itemname">Contact Number:</span>\n');
		buffer.append('<span class="itemdescription" id="phone_').append(company.id).append('">\n');
		buffer.append(company.phone);
		buffer.append('</span><br />\n');

		buffer.append('<span class="itemname">Maximum amount for sales orders that do not need officer approval:</span>\n');
		buffer.append('<span class="itemdescription" id="totalSalesOrderWOutApproval_').append(company.id).append('">\n');
		buffer.append(company.totalSalesOrderWOutApproval);
		buffer.append('</span><br />\n');
		
		buffer.append('<span class="itemname">Allowed To Create Sales Order:</span>\n');
		buffer.append('<span class="itemdescription" id="allowedToCreateSalesOrder_').append(company.id).append('">\n');
		if (company.allowedToCreateSalesOrder)
			buffer.append('Yes');
		else
			buffer.append('No');
		buffer.append('</span><br />\n');
		
		buffer.append('<span class="itemname">This company has contracted product:</span>\n');
		buffer.append('<span class="itemdescription" id="hasContractItems_').append(company.id).append('">\n');
		if (company.hasContractItems)
			buffer.append('Yes');
		else
			buffer.append('No');
		buffer.append('</span><br />\n');

		buffer.append('<span class="itemname">Should the system send an email when sales orders are approved?</span>\n');
		buffer.append('<span class="itemdescription" id="sendEmailNotification_').append(company.id).append('">\n');
		if (company.sendEmailNotification)
			buffer.append('Yes');
		else
			buffer.append('No');
		buffer.append('</span><br />\n');
		
		buffer.append('<span class="itemname">When sales orders are approved, send the email to:</span>\n');
		buffer.append('<span class="itemdescription" id="sendEmailNotificationTo_').append(company.id).append('">\n');
		buffer.append(company.sendEmailNotificationTo);
		buffer.append('</span><br/>\n');
		
		buffer.append('</form>\n');
		
		buffer.append('<span id="department_show_').append(company.id).append('">\n');
		buffer.append('<span class="itemname">Department(s):</span>\n');
		buffer.append('<span class="itemdescription" style="padding-left: 20px;display:block;" id="department_').append(company.id).append('">\n');
		buffer.append(generateDepartmentText(company.departments));
		buffer.append('</span>\n');
		buffer.append('</span>\n');
		
		buffer.append('<span id="department_table_').append(company.id).append('" style="display:none;">\n');
		buffer.append('</span>\n');

		buffer.append('<form id="department_add" name="department_add">\n');
		buffer.append('<span id="department_add_').append(company.id).append('" style="display:none;">\n');
		buffer.append('</span>\n');
		buffer.append('</form>\n');*/
		
		buffer.append('<div align="right" valign="bottom">\n');
		buffer.append('<img style="visibility:hidden;" src="images/indicator.gif" id="snake').append(company.id).append('" />\n');
		buffer.append('<a class="editdel" href="adminmanage.do?action=editCompany&companyid=').append(company.id).append('">edit</a>\n');
		buffer.append('<span class="projdetails">|</span>\n');
		buffer.append('<a class="editdel" href="javascript:void(0)" onclick="deleteCompany(').append(company.id).append(');" id="del_').append(company.id).append('">delete</a>\n');
		buffer.append('</div>\n');
		
		return buffer.toString();
	}
	
	function generateDepartmentText(dept)
	{
		var buffer = new Buffer();
		if (dept != null)
		{
			for (var i = 0; i < dept.length; i++)
			{
				buffer.append(dept[i].name).append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n');	
			}
		}
		return buffer.toString();
	}
	
	var reg = /[^a-zA-Z0-9]/;
	function save(theform)
	{
		if (!MyForm.validate(theform))
			return false;

		if(!$('useGenericURL').checked)
		{
			if (theform.companyUrl.value.match(reg) != null)
			{
				theform.companyUrl.focus();
				theform.companyUrl.select();
				alert('The URL entered contains invalid character. Only valid characters are letters and numbers.');
				return false;
			}
		}
		
		var ob = MyForm.getValues(theform);
		
		theform.indicator.style.visibility = "visible";
		
		AdminCompany.saveNewCompany(ob, 
			{
				callback:function(company)
				{
					if (company)
					{
						var rowid = 'tr' + company.id;
						var gen = generateTableRow(company);
						var row = MyTable.createRowAt('table', -1, rowid, 'bground');
						var col = MyTable.createCell(row, 'itemthumb');
						col.innerHTML = gen;
						var col2 = MyTable.createCell(row, 'itemthumb');
						col2.innerHTML = "&nbsp;";
						$('companyUrl*').disabled = false;
						theform.reset();
						theform.indicator.style.visibility = "hidden";
					}
					else
					{
						top.location.href = top.location.href;
					}
				}
			}
		);
	}
	
	function deleteCompany(id)
	{
		if (confirm('Are you sure you want to delete the Company?'))
		{
			AdminCompany.deleteCompany(id,
			{
				callback: function(success)
				{
					if (success)
					{
						MyTable.deleteRow('table', 'tr' + id);
					}
				}
			});
		}
	}
	
	var fields = new Array("name", <%--"companyUrl", --%>"address", "phone", "allowedToCreateSalesOrder", "totalSalesOrderWOutApproval", "hasContractItems", "sendEmailNotification", "sendEmailNotificationTo");
	var properties = new Array("name", <%--"companyUrl", --%>"address", "phone", "allowedToCreateSalesOrder", "totalSalesOrderWOutApproval", "hasContractItems", "sendEmailNotification", "sendEmailNotificationTo");
	
	function editCompany(id)
	{
		var tr = $('tr' + id);
		var form = $('companyform_' + id);
		var indicator = $('snake' + id);
		var dtable = $('department_span').innerHTML;
		var dadd = $('newdepartment').innerHTML;
		var depshow = $('department_show_' + id);
		var deptable = $('department_table_' + id);
		var depadd = $('department_add_' + id);
		var editlnk = $('edit_' + id);
		var dellnk = $('del_' + id);
		
		indicator.style.visibility = 'visible';
		
		deptable.innerHTML = dtable;
		depadd.innerHTML = dadd;
		
		var depf = tr.getElementsByTagName('form')["department_add"];
		var dept = tr.getElementsByTagName('table')["department"];
		
		AdminCompany.getCompany(id,
		{
			callback:function (company)
			{
				if (company)
				{
					SpanForm.create(id, fields, $("addcompanyform"));
					
					MyForm.setValues(form, company);
					
					depshow.style.display = 'none';
					depadd.style.display = '';
					deptable.style.display = '';
					
					depf.submitb.onclick = function() {addDepartment(depf, id, dept, company);};
					depf.resetb.onclick = function() {depf.reset();};
					
					editlnk.innerHTML = "save";
					editlnk.onclick = function() {updateCompany(form, indicator, id, editlnk, dellnk, depshow, deptable, depadd);};
					dellnk.innerHTML = "cancel";
					dellnk.onclick = function() {afterEdit(form, company, id, editlnk, dellnk, depshow, deptable, depadd);};
					
					showDepartmentTable(dept, company, company.departments);
				}
				else
				{
					top.location.href = top.location.href;
				}
				indicator.style.visibility = 'hidden';
			}
		});
	}
	
	function updateCompany(form, indicator, id, editlnk, dellnk, depshow, deptable, depadd)
	{
		if (!MyForm.validate(form))
			return false;
			
		var ob = MyForm.getValues(form);
		
		indicator.style.visibility = 'visible';
		
		ob.id = id;
		
		AdminCompany.updateCompany(ob,
		{
			callback:function (company)
			{
				if (company)
				{
					afterEdit(form, company, id, editlnk, dellnk, depshow, deptable, depadd);
					indicator.style.visibility = 'hidden';
				}
				else
				{
					top.location.href = top.location.href;
				}
			}
		});
	}
	
	function afterEdit(form, company, id, editlnk, dellnk, depshow, deptable, depadd)
	{
		depadd.style.display = 'none';
		deptable.style.display = 'none';
		depshow.style.display = '';
		var depspan = $('department_' + id);
		depspan.innerHTML = generateDepartmentText(company.departments);
		SpanForm.restoreUsingProperties(id, fields, company, properties);
		$('allowedToCreateSalesOrder_' + id).innerHTML = (company.allowedToCreateSalesOrder) ? "Yes" : "No";
		$('hasContractItems_' + id).innerHTML = (company.hasContractItems) ? "Yes" : "No";
		$('sendEmailNotification_' + id).innerHTML = (company.sendEmailNotification) ? "Yes" : "No";
		editlnk.innerHTML = "edit";
		editlnk.onclick = function() {editCompany(id);};
		
		dellnk.innerHTML = "delete";
		dellnk.onclick = function() {deleteCompany(id);};
	}
	
	function showDepartmentTable(dept, company, departments)
	{
		for (var	 i = 0; i < departments.length; i++)
		{
			addDepartmentCol(dept, departments[i], company);
		}
	}
	
	function addDepartment(depf, id, dept, company)
	{
		if (!MyForm.validate(depf))
			return false;
		
		depf.indicator.style.visibility = 'visible';
		
		var department = MyForm.getValues(depf);
		department.companyID = id;
		
		AdminCompany.addDepartment(department,
			{
				callback: function(deprtmt)
				{
					addDepartmentCol(dept, deprtmt);
					company.departments.push(deprtmt);
					depf.reset();
					depf.indicator.style.visibility = 'hidden';
				}
			}
		);
	}
	
	function addDepartmentCol(deptable, dept, company)
	{
		createDepartmentCol(deptable, dept, -1, company);
	}
	
	function createDepartmentCol(deptable, dept, rowIndex, company)
	{
		var row = MyTable.createRow(deptable, rowIndex, 'dept' + dept.id, 'bground');
		var cell = MyTable.createCell(row, 'itemthumb');
		cell.innerHTML = dept.name;
		var cell2 = MyTable.createCellByIndex(row, 1, 'itemthumb');
		cell2.innerHTML = '<img style="visibility:hidden;" src="images/indicator.gif" id="snake"><a class="editdel" href="javascript:void(0);" id="edit">edit</a>\n<span class="projdetails"> | </span>\n<a class="editdel" href="javascript:void(0);" id="delete">delete</a>';
		cell2.style.textAlign = 'right';
		var snake = cell2.getElementsByTagName('img')["snake"];
		var edit = cell2.getElementsByTagName('a')["edit"];
		var del = cell2.getElementsByTagName('a')["delete"];
		edit.onclick = function() {editDepartment(deptable, row, dept.id, snake);};
		del.onclick = function() {deleteDepartment(deptable, row, dept.id, company);};
	}
	
	var editdept = false;
	
	function editDepartment(deptable, row, id, snake)
	{
		if (editdept)
			return;
		editdept = true;
		snake.style.visibility = 'visible';
		
		AdminCompany.getDepartment(id, {
			callback: function(dept)
			{
				if (dept)
				{
					var rowIndex = row.rowIndex;
					deptable.deleteRow(rowIndex);
					
					var editRow = MyTable.createRow(deptable, rowIndex, 'deptedit' + id, 'bground');
					var cells = MyTable.createCells(editRow, 2, 'itemthumb');
					var input = document.createElement('input');
					input.setAttribute("value", dept.name);
					input.setAttribute("type", "text");
					cells[0].appendChild(input);
					
					cells[1].innerHTML = '<img style="visibility:hidden;" src="images/indicator.gif" id="snake"><a class="editdel" href="javascript:void(0);" id="save">save</a>\n<span class="projdetails"> | </span>\n<a class="editdel" href="javascript:void(0);" id="cancel">cancel</a>';
					cells[1].style.textAlign = 'right';
					var snake = cells[1].getElementsByTagName('img')["snake"];
					var save = cells[1].getElementsByTagName('a')["save"];
					var cancel = cells[1].getElementsByTagName('a')["cancel"];
					save.onclick = function() {updateDepartment(deptable, id, rowIndex, input, snake);};
					cancel.onclick = function() {afterEditDep(deptable, dept, rowIndex);};
				}
				else
				{
					top.location.href = top.location.href;
				}
			}
		});
	}
	
	function updateDepartment(deptable, id, rowIndex, input, snake)
	{
		if (input.value == '')
		{
			input.focus();
			input.select();
			alert('The name of the department cannot be empty.');
		}
		
		snake.style.visibility = "visible";
		
		var department = new Object();
		department["name"] = input.value;
		department["id"] = id;
		
		AdminCompany.updateDepartment(department, {
			callback: function(dept)
			{
				afterEditDep(deptable, dept, rowIndex);
			}
		});
	}
	
	function afterEditDep(deptable, dept, rowIndex)
	{
		deptable.deleteRow(rowIndex);
		createDepartmentCol(deptable, dept, rowIndex);
		editdept = false;
	}
	
	function deleteDepartment(deptable, row, id, company)
	{
		if (confirm('Are you sure you want to delete the company department?'))
		{
			AdminCompany.deleteDepartment(id,
			{
				callback: function(success)
				{
					if (success)
					{
						var arr = new Array();
						var departments = company.departments;
						for (var i = 0; i < departments.length; i++)
						{
							if (departments[i].id != id)
							{
								arr.push(departments[i]);
							}
						}
						company.departments = arr;
						deptable.deleteRow(row.rowIndex);
					}
				}
			});
		}
	}
	
	function setURL(edit)
	{
		var splits = edit.value.split(reg);
		var arr = new Array();
		for(var i = 0; i < splits.length; i++)
		{
			arr.push(splits[i]);
		}
		
		$('urlhere').innerHTML = "NOTE: The web URL for this company will be <strong>" + arr.join('') + ".${genericURL}</strong>. This can <strong>not</strong> be changed later.";
	}

	function setGenericURL(checkbox)
	{
		var companyURL = $('companyUrl*');
		if(checkbox.checked)
		{
			companyURL.disabled = true; 
			companyURL.value = "${genericURL}";
			$('urlhere').innerHTML = "NOTE: The web URL for this company will be <strong>" + companyURL.value + "</strong>. This can <strong>not</strong> be changed later.";
		}
		else
		{
			companyURL.disabled = false;
			companyURL.value = "";
			$('urlhere').innerHTML = "";
		}		
	}
</script>

<body>

<c:set var="menu" value="corporate"/>
<c:set var="submenu" value="companies"/>
<c:set var="pagemessage" value="You can add, update and delete the company profile here."/>

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
		   <th colspan="2">COMPANY DETAILS</th>
		  </tr>
		  <c:forEach items="${companies}" var="company" varStatus="counter">
			<tr class="bground" id="tr<c:out value='${company.id}'/>">
			<td align="center" valign="middle" width="20%">
				<c:if test="${not empty company.imageExtension}">
				<img class="itemimage" src="images/companies_thumb_image/company_<c:out value='${company.id}'/><c:out value='${company.imageExtension}'/>"/>
				</c:if>
 	 		</td>
			<td class="itemthumb" width="80%">
					<form id="companyform_<c:out value='${company.id}'/>">
					<span class="itemname">Company Name:</span>
					<span class="itemdescription" id="name_<c:out value='${company.id}'/>">
						<c:out value='${company.name}' />
					</span><br />
					<span class="itemname">Company URL:</span>
					<span class="itemdescription" id="companyUrl_<c:out value='${company.id}'/>">
						<c:out value='${company.companyUrl}' /><c:if test="${genericURL ne company.companyUrl}">.${genericURL}</c:if> <!-- .times.com.ph -->
					</span><br />
					<!--<span class="itemname" style="vertical-align:top;">Address:</span>
					<span class="itemdescription" id="address_<c:out value='${company.id}'/>">
						<c:out value='${company.address}' />
					</span><br />
					<span class="itemname">Contact Number:</span>
					<span class="itemdescription" id="phone_<c:out value='${company.id}'/>">
						<c:out value='${company.phone}'/>
					</span><br />
					
					<span class="itemname">Maximum amount for sales orders that do not need officer approval:</span>
					<span class="itemdescription" id="totalSalesOrderWOutApproval_<c:out value='${company.id}'/>">
						<c:out value='${company.totalSalesOrderWOutApproval}'/>
					</span><br />
					
					<span class="itemname">Allowed To Create Sales Order:</span>
					<span class="itemdescription" id="allowedToCreateSalesOrder_<c:out value='${company.id}'/>">
					<c:choose>
						<c:when test='${company.allowedToCreateSalesOrder}'>Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose></span><br />

					<span class="itemname">This company has contracted products:</span>
					<span class="itemdescription" id="hasContractItems_<c:out value='${company.id}'/>">
					<c:choose>
						<c:when test='${company.hasContractItems}'>Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose></span><br />
					
					<span class="itemname">Should the system send an email when sales orders are approved?</span>
					<span class="itemdescription" id="sendEmailNotification_<c:out value='${company.id}'/>">
					<c:choose>
						<c:when test='${company.sendEmailNotification}'>Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose></span><br />
					
					<span class="itemname">When sales orders are approved, send the email to:</span>
					<span class="itemdescription" id="sendEmailNotificationTo_${company.id}">
						${company.sendEmailNotificationTo}
					</span><br/>
					
					</form>
					
					<span id="department_show_<c:out value='${company.id}'/>">
						<span class="itemname">Department(s):</span>
						<span class="itemdescription" style="padding-left: 20px;display:block;" id="department_<c:out value='${company.id}'/>">
						<c:forEach items="${company.departments}" var="department" varStatus="counter2">
							<c:out value='${department.name}' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						</span>
					</span>
					<c:if test="${not company.generic}">
					<span class="itemname" style="display:block;margin-top:5px;">Pages:</span>
					<span id="pages${company.id}">
						<span id="home${company.id}" class="itemdescription" style="display:block;padding-left:20px;"><a href=<c:if test="${company.home ne null}">"adminhome.do?action=adminShowHome&homeId=${company.home.id}"</c:if><c:if test="${company.home eq null}">"adminhome.do?action=adminShowAllHome&companyId=${company.id}"</c:if>>Home</a></span>
						<span id="contactUs${company.id}" class="itemdescription" style="display:block;padding-left:20px;"><a href=<c:if test="${company.contactUs ne null}">"admincontactus.do?action=adminShowContactUs&contactusid=${company.contactUs.id}"</c:if><c:if test="${company.contactUs eq null}">"admincontactus.do?action=adminShowAllContactUs&companyId=${company.id}"</c:if>>Contact Us</a></span>
						<span id="faqs${company.id}" class="itemdescription" style="display:block;padding-left:20px;"><a href="adminfaq.do?action=adminShowCompanyFaqs&companyId=${company.id}">FAQs</a></span>
					</span>
					</c:if>-->
					
					<span id="department_table_<c:out value='${company.id}'/>" style="display:none;">
					</span>
	
					<form id="department_add" name="department_add">
					<span id="department_add_<c:out value='${company.id}'/>" style="display:none;">
					</span>
					</form>
					
					<div align="right" valign="bottom">
						<img style="visibility:hidden;" src="images/indicator.gif" id="snake<c:out value='${company.id}'/>" />
						<%--
						<a class="editdel" href="javascript:void(0)" onclick="editCompany(<c:out value='${company.id}'/>);" id="edit_<c:out value='${company.id}'/>">edit</a>
						--%>
						<a class="editdel" href="adminmanage.do?action=editCompany&companyid=${company.id}">edit</a>
						<span class="projdetails">|</span>
						<a class="editdel" href="javascript:void(0)" onclick="deleteCompany(<c:out value='${company.id}'/>);" id="del_<c:out value='${company.id}'/>">delete</a>
					</div>
			</td>	   
		  </tr> 	
	  	</c:forEach>
		</table>
		
		</td>
   		<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
  	</tr>
	</table>
	<fmt:formatNumber var="totalPage" value="${companyCount/maxResults}" maxFractionDigits="0"/>
	<c:if test="${totalPage ge 1}">
	<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
		<tr align="center">
			<td class="sodesc" align="center">
				<c:set var="currentUrl" value="admincorporate.do?action=showAllCompany" />
				<c:forEach begin="1" end="${page}" step="1" var="i">
				<a href="${currentUrl}&page=${i-1}">${i}</a>&nbsp;
				</c:forEach>
				<span style="color: red;">${page + 1}</span>&nbsp;
				<c:forEach begin="${page + 2}" end="${totalPage}" step="1" var="i">
				<a href="${currentUrl}&page=${i-1}">${i}</a>&nbsp;
				</c:forEach>
			</td>
		</tr>
	</table>
	</c:if>
	</div>	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>You can add, edit and delete a company here.</li>
	<li>Don&rsquo;t forget to add a company administrator at the accounts tab so that the user of the company can log-in.</li>
	</ul>
	</div>
	--><br>
	
	<div id="messageadd"><br />
	<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%">
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
				<tr>
					<th><img src="images/admin/add.png" width="16" height="16" border="0" />Add A New Company</th>
				</tr>
				<tr class="bground">
					<td class="itemthumb">
					<%@ include file="corporatecompanyform.jsp"%>

					<div	id="department_span" style="display:none">
					 <br />
						<table id="department" class="projfiles" width="80%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th colspan="2">Company Departments</th>
							</tr>
						</table>
					</div>
		
					<div id="newdepartment" style="display:none">
						<br />
						<table class="projfiles" width="80%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th colspan="2">Add a new department</th>
							</tr>
							<tr>
								<td class="itemthumb">Name:</td>
								<td>
									<input type="text" id="name*" name="name" class="item" size="8" />
									<img src="images/indicator.gif" name="indicator" style="visibility:hidden" />
									<input type="button" value="add this new department" name="submitb" class="item" />
									<input type="button" value="reset" name="resetb" class="item" />
								</td>
							</tr>
						</table>
						<br />
					</div>
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