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
<!--
			
	function generateTableRow(company)
	{
		var buffer = new Buffer();
		buffer.append('<span class="projtitle">Name:</span>\n');
		buffer.append('<span class="projdetails">').append(company.name).append('</span><br/>\n');
		buffer.append('<span class="projtitle">URL site:</span>\n');
		buffer.append('<span class="projdetails">').append(company.companyUrl).append('.times.com.ph</span><br />\n');
		buffer.append('<span class="projtitle">Address:</span>\n');
		buffer.append('<span class="projdetails">').append(company.address).append('</span><br/>\n');
		buffer.append('<span class="projtitle">Contact Number:</span>\n');
		buffer.append('<span class="projdetails">').append(company.phone).append('</span><br>\n');
		buffer.append('<span class="projtitle">Allowed To Create Sales Order:</span>\n');
		buffer.append('<span class="projdetails">');
		if (company.allowedToCreateSalesOrder)
			buffer.append('Yes');
		else
			buffer.append('No');
		buffer.append('</span><br />\n');
		buffer.append('<span class="projtitle">Total For Sales Orders That Do Not Need Officer Approval:</span>\n');
		buffer.append('<span class="projdetails">').append(company.totalSalesOrderWOutApproval).append('</span><br />\n');
		buffer.append('<span class="projtitle">Department(s):</span>\n');
		buffer.append('<span class="projdetails" style="padding-left: 20px;display:block;">');
		var dept = company.departments;
		if (dept != null)
		{
			for (var i = 0; i < dept.length; i++)
			{
				buffer.append('\n<br />').append(dept[i].name);	
			}
		}
		buffer.append('</span>');
		buffer.append('<div align="right" valign="bottom">\n');
		buffer.append('<img style="visibility:hidden;" src="images/indicator.gif" id="snake').append(company.id).append('" />\n');
		buffer.append('<a class="editdel" href="javascript:void(0)" onclick="editCompany(').append(company.id).append(');">edit</a>\n');
		buffer.append('<span class="projdetails">|</span>\n');
		buffer.append('<a class="editdel" href="javascript:void(0)" onclick="deleteCompany(').append(company.id).append(');">delete</a>\n');
		buffer.append('</div>\n')
		return buffer.toString();
	}
	
	var reg = /[^a-zA-Z0-9]/;
	function save(theform)
	{
		if (!MyForm.validate(theform))
			return false;
			
		if (theform.companyUrl.value.match(reg) != null)
		{
			theform.companyUrl.focus();
			theform.companyUrl.select();
			alert('The URL entered contains invalid character. Only valid characters are letters and numbers.');
			return false;
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
	
	var edit = false;
	
	function editCompany(id)
	{
		if (edit)
			return;
		edit = true;
		var tableid = 'table';
		var trid = 'tr' + id;
		var form = $('addinput').innerHTML;
		var indicator = $('snake' + id);
		var editid = 'edit' + id;
		
		indicator.style.visibility = 'visible';
		
		var row = MyTable.createRowAfter(tableid, trid, editid, 'bground');
		row.style.display = 'none';
		var cell = MyTable.createCell(row, 'itemthumb');
		cell.innerHTML = form;
		
		AdminCompany.getCompany(id, 
			{
				callback: function(company)
				{
					if (company)
					{
						var edit = $(editid);
						var form = edit.getElementsByTagName('form')["company"];
						var depf = edit.getElementsByTagName('form')["adddepartment"];
						var dept = edit.getElementsByTagName('table')["department"];
						
						MyForm.setValues(form, company);
						
						form.elements["companyUrl"].onkeyup = null;
						form.submitb.value = "Save";
						form.submitb.onclick = function() {updateCompany(form, id, editid, tableid);};
						form.resetb.value = "Cancel";
						form.resetb.onclick = function() {afterEdit(company, editid, tableid);};
						form.companyUrl.readOnly = true;
						
						depf.submitb.onclick = function() {addDepartment(depf, id, dept, company);};
						depf.resetb.onclick = function() {depf.reset();};
						
						showDepartmentTable(dept, company.departments);
						
						indicator.style.visibility = "hidden";
						MyTable.deleteRow(tableid, trid);
						row.style.display = '';
						depf.style.display = '';
						dept.style.display = '';
						
						form.elements[0].focus();
					}
					else
					{
						top.location.href = top.location.href;
					}
				}
			}
		);
	}
	
	function updateCompany(theform, id, editid, tableid)
	{
		if (!MyForm.validate(theform))
			return false;
		
		var ob = MyForm.getValues(theform);
		
		theform.indicator.style.visibility = "visible";
		
		ob.id = id;
		
		AdminCompany.updateCompany(ob,
			{
				callback: function(company)
				{
					if (company)
					{
						theform.indicator.style.visibility = 'hidden';
						afterEdit(company, editid, tableid);
					}
					else
					{
						top.location.href = top.location.href;
					}
				}
			}
		);
	}
	
	function afterEdit(company, editid, tableid)
	{
		var genrow = generateTableRow(company);
		var row = MyTable.createRowBefore(tableid, editid, 'tr' + company.id, 'bground');
		var cell = MyTable.createCell(row, 'itemthumb');
		cell.innerHTML = genrow;
		MyTable.deleteRow(tableid, editid);
		edit = false;
	}
	
	function showDepartmentTable(dept, departments)
	{
		for (var	 i = 0; i < departments.length; i++)
		{
			addDepartmentCol(dept, departments[i]);
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
	
	function addDepartmentCol(deptable, dept)
	{
		createDepartmentCol(deptable, dept, -1);
	}
	
	function createDepartmentCol(deptable, dept, rowIndex)
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
		del.onclick = function() {deleteDepartment(deptable, row, dept.id);};
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
	
	function deleteDepartment(deptable, row, id)
	{
		if (confirm('Are you sure you want to delete the Department?'))
		{
			AdminCompany.deleteDepartment(id,
			{
				callback: function(success)
				{
					if (success)
					{
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
		
		$('urlhere').innerHTML = "The company address will be " + arr.join('') + ".times.com.ph";
	}
//-->
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
		   <th colspan="2">EDIT COMPANY DETAIL</th>
		  </tr>
		  <tr class="bground" id="tr<c:out value='${company.id}'/>">
			<td class="itemthumb">
				<%@ include file="corporatecompanyform.jsp" %>
				
				<br />
											
				<table id="department" class="projfiles" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th colspan="2">Departments</th>
					</tr>
					<c:forEach items="${company.departments}" var='department'>
						<tr class="bground" id="dept<c:out value='${department.id}'/>">
							<td class="itemthumb">
							</td>
							<td class="itemthumb">
								<img style="visibility:hidden;" src="images/indicator.gif" id="snake"/>
								<a id="edit" class="editdel" href="javascript:void(0);" onclick="editDepartment(<c:out value='${department.id}'/>)">edit</a>
								<span class="projdetails"> | </span>
								<a id="delete" class="editdel" href="javascript:void(0);" onclick="deleteDepartment(<c:out value='${department.id}'/>)">delete</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<form id="adddepartment" name="adddepartment" onsubmit="return false;">
					<table class="projfiles" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th colspan="2">Add department</th>
						</tr>
						<tr>
							<td class="itemthumb">Name:</td>
							<td><input type="text" id="name*" name="name" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<img src="images/indicator.gif" name="indicator" style="visibility:hidden"/>
							<input type="button" value="add" name="submitb" />
							<input type="button" value="reset" name="resetb" />
							</td>
						</tr>
					</table>
					<br />
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
	<li>This page is to edit the detail of the corporate.</li>
	</ul>
	</div>
	--><br>
	
	<div id="messageadd">
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>