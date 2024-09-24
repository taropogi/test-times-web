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
	
	function addCorporteAdminRow(table, admin)
	{
		var row = MyTable.createRow(table, -1, 'tr' + admin.id, "bground");
		var cells = MyTable.createCells(row, 1, 'itemthumb');
		
		cells[0].innerHTML = prepareAdminCol(admin);
		cells[0].className = 'thumb';
		cells[0].id = 'td' + admin.id;
	}
	
	function prepareAdminCol(admin)
	{
		var buf = new Buffer();
		
		buf.append('<form id="form').append(admin.id).append('">\n');
		buf.append('<span class="itemname">Company:</span>\n');
		buf.append('<span class="itemdescription" id="companyID_').append(admin.id).append('">\n');
		buf.append(admin.companyName).append('\n');
		buf.append('</span>&nbsp;&nbsp;&nbsp;\n');

		buf.append('<span class="itemname">Login URL:</span>\n');
		buf.append('<span class="itemdescription">\n');
		buf.append(admin.companyURL).append(admin.companyURL != "${genericURL}" ? '.${genericURL}\n' : '\n');
		buf.append('</span>\n');

		buf.append('<br />\n');
		buf.append('<span class="itemname">Username:</span>\n');
		buf.append('<span class="itemdescription" id="username_').append(admin.id).append('">').append(admin.username).append('</span>&nbsp;&nbsp;&nbsp;\n');
		buf.append('<span class="itemname">Email:</span>\n');
		buf.append('<span class="itemdescription" id="email_').append(admin.id).append('">').append(admin.email).append('</span>\n');
		buf.append('<br />\n');
		buf.append('<span class="itemname">First Name:</span>\n');
		buf.append('<span class="itemdescription" id="firstname_').append(admin.id).append('">').append(admin.firstname).append('</span>&nbsp;&nbsp;&nbsp;\n');
		buf.append('<span class="itemname">Last Name:</span>\n');
		buf.append('<span class="itemdescription" id="lastname_').append(admin.id).append('">').append(admin.lastname).append('</span><br />\n');
		buf.append('<div align="right">\n');
		buf.append('  <img style="visibility:hidden" src="images/indicator.gif" id="snake').append(admin.id).append('" />\n');
		buf.append('  <a class="editdel" href="javascript:void(0);" onclick="resetCorporateAdminPassword(').append(admin.id).append(')">reset password</a>\n');
		buf.append('  <span class="projdetails">|</span>\n');
		buf.append('  <a class="editdel" href="javascript:void(0);" id="edit').append(admin.id).append('" onclick="editAdmin(').append(admin.id).append(')">edit</a>\n');
		buf.append('  <span class="projdetails">|</span>\n');
		buf.append('  <a class="editdel" href="javascript:void(0);" id="del').append(admin.id).append('" onclick="deleteAdmin(').append(admin.id).append(')">delete</a>\n');
		buf.append('</div>\n');
		buf.append('</form>\n');
		
<%--		buf.append('<span class="itemname">Company:</span>\n');
		buf.append('<span class="itemdescription">').append(admin.companyName).append('</span><br />\n');

		buf.append('<span class="itemname">Department:</span>\n');
		buf.append('<span class="itemdescription">').append(admin.departmentName).append('</span><br />\n');

		buf.append('<span class="itemname">Username:</span>\n');
		buf.append('<span class="itemdescription">').append(admin.username).append('</span><br />\n');
		buf.append('<span class="itemname">Email address:</span>\n');
		buf.append('<span class="itemdescription">').append(admin.email).append('</span><br />\n');
		buf.append('<span class="itemname">First name:</span>\n');
		buf.append('<span class="itemdescription">').append(admin.firstname).append('</span><br />\n');
		buf.append('<span class="itemname">Last name:</span>\n');
		buf.append('<span class="itemdescription">').append(admin.lastname).append('</span><br />\n');
		buf.append('<div align="right">\n');
		buf.append('<img style="visibility:hidden" src="images/indicator.gif" id="snake').append(admin.id).append('" />\n');
		buf.append('<a class="editdel" href="javascript:void(0);" onclick="deleteAdmin(').append(admin.id).append(')">delete</a>\n');
		buf.append('</div>\n');--%>
		return buf.toString();
	}
<%--	
	function populateDepartment(id, form)
	{
		populateDepartment(id, form, null);
	}
	
	function populateDepartment(id, form, value)
	{

		if(id==0) return false;		
		
		form.depindc.style.visibility = 'visible';
		AdminCompany.getCompany(id,
		{
			callback: function(company)
			{
				var seldept = form.departmentId;
				
				seldept.options.length = 0;
				
				var depts = company.departments;
				for (var i = 0; i < depts.length; i++)
				{
					var opt = new Option(depts[i].name, depts[i].id);
					seldept.options[seldept.options.length] = opt;
				}
				
				if (value)
					seldept.value = value;
				
				form.depindc.style.visibility = 'hidden';
			}
		});
	}
--%>	
	function addCorporateAdmin(form)
	{
		if (!MyForm.validate(form))
			return;
		
		form.snake.style.visibility = 'visible';
		
		var admin = MyForm.getValues(form);
		
		AdminCompany.saveNewCompanyAdmin(admin,
		{
			callback: function(newadmin)
			{
				addCorporteAdminRow($('table'), newadmin);
				form.snake.style.visibility = 'hidden';
				form.reset();
			},
			errorHandler: function(errorString, exception)
			{
				alert(errorString);
				form.snake.style.visibility = 'hidden';
			}
		});
	}
	
	function deleteAdmin(id)
	{
		if (confirm('Are you sure you want to delete the company administrator?'))
		{
			AdminCompany.deleteCompanyAdmin(id,{
				callback:function(isDeleted)
				{
					if(isDeleted){
						MyTable.deleteRow('table', 'tr' + id);
						//Effect.SlideUp("tr"+id,{duration: 0.4, fps: 100});
					}
					else{
						alert('Error deleting product!');
					}
				}
			});
			return true;
		}
		else
			{
			return false;
		}
	}

	var fields = new Array("companyID", <%--"departmentId",--%> "email", "firstname", "lastname");
	var properties = new Array('companyName', <%--'departmentName',--%> 'email', 'firstname', 'lastname');
	
	function editAdmin(id)
	{
		var form = $('form' + id);
		var edit = $('edit' + id);
		var del = $('del'+ id);
		var snake = $('snake' + id);
		
		snake.style.visibility = 'visible';
		
		AdminCompany.getCompanyAdmin(id,
		{
			callback: function(admin)
			{
				if (admin)
				{
					SpanForm.create(id, fields, $("addCompanyAdmin"));
					MyForm.setValues(form, admin);
					<%--
					populateDepartment(admin["companyID"], form, admin["departmentId"]);
					--%>
					edit.innerHTML = "save";
					edit.onclick = function() {saveEdit(id, snake, form, edit, del);};
					del.innerHTML = "cancel";
					del.onclick = function() {fromEdit(id, admin, edit, del);};
					snake.style.visibility = 'hidden';
				}
				else
				{
					top.location.href = top.location.href;
				}
			}
		});
	}
	
	function fromEdit(id, admin, edit, del)
	{
		SpanForm.restoreUsingProperties(id, fields, admin, properties);
		edit.innerHTML = "edit";
		edit.onclick = function() {editAdmin(id);};
		del.innerHTML = "delete";
		del.onclick = function() {deleteAdmin(id);};
	}
	
	function saveEdit(id, snake, form, edit, del)
	{
		if (!MyForm.validate(form))
		{
			return;
		}
		snake.style.visibility = 'visible';
		var user = MyForm.getValues(form);
		user["id"] = id;
		
		AdminCompany.updateCompanyAdmin(user,
		{
			callback:function(cuser)
			{
				if (cuser != null)
				{
					fromEdit(id, cuser, edit, del);
					snake.style.visibility = 'hidden';
				}
				else
				{
					top.location.href = top.location.href;
				}
			}
		});
	}
	
	function resetCorporateAdminPassword(id)
	{
		if (!confirm('Are you sure you want to reset the password for this account?'))
			return;
		var snake = $('snake' + id);
		AdminCompany.resetCorporateAdminPassword(id,
		{
			callback:function(result)
			{
				if (result != null)
				{
					snake.style.visibility = 'hidden';
					alert(result);
				}
				else
				{
					top.location.href = top.location.href;
				}
			}
		});
	}
//-->
</script>

<body>

<c:set var="menu" value="corporate" />
<c:set var="submenu" value="corporateadmin" />
<c:set var="pagemessage" value="You can add, update and delete the company profile here." />
<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr>
		<td align="left"><%@ include file="../includes/error.jsp"%></td>
	</tr>
</table>

<div id="containerdash">
<div id="messagearea">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td align="left" valign="top">
		<table id="table" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
			<tr>
				<th colspan="2">COMPANY ADMINISTRATOR DETAILS</th>
			</tr>
			<c:forEach items="${admins}" var="admin" varStatus="counter">
			<tr class="bground" id="tr<c:out value='${admin.id}'/>">
				<td class="itemthumb" id="td<c:out value='${admin.id}'/>">
					<form action="admincorporate.do?action=updateCorporateAdmin" method="post" id="form<c:out value='${admin.id}'/>" name="form<c:out value='${admin.id}'/>">
					<input type="hidden" name="id" value="${admin.id}" />
					<span class="itemname">Company:</span>
					<span class="itemdescription" id="companyID_<c:out value='${admin.id}'/>">
						<select id="companyID*" class="item" name="companyID" alt="Company">
						<option value="">-- select company --</option>
						<c:forEach items="${companies}" var="company">
						<option value="${company.id}"<c:if test="${admin.company ne null and company.id eq admin.company.id}"> selected="selected"</c:if>>${company.name}</option>
						</c:forEach>
						</select>
					</span>&nbsp;&nbsp;&nbsp;

					<span class="itemname">Login URL:</span>
					<span class="itemdescription">
					<c:out value='${admin.company.companyUrl}' /><c:if test="${admin.company.companyUrl ne genericURL}">.times.com.ph</c:if>
					</span>

					<br />
					<span class="itemname">Username:</span>
					<span class="itemdescription" id="username_<c:out value='${admin.id}'/>"><c:out value='${admin.username}'/></span>&nbsp;&nbsp;&nbsp;
					<span class="itemname">Email:</span>
					<span class="itemdescription" id="email_<c:out value='${admin.id}'/>"><input id="email*@" class="item" type="text" size="12" name="email" alt="Email address" value="${admin.email}" /></span>
					<br />
					<span class="itemname">First Name:</span>
					<span class="itemdescription" id="firstname_<c:out value='${admin.id}'/>"><input id="firstname" class="item" type="text" size="12" name="firstname" alt="First name" value="${admin.firstname}" /></span>&nbsp;&nbsp;&nbsp;
					<span class="itemname">Last Name:</span>
					<span class="itemdescription" id="lastname_<c:out value='${admin.id}'/>"><input id="lastname" class="item" type="text" size="12" name="lastname" alt="Last name" value="${admin.lastname}" /></span><br />
					<div align="right">
						<img style="visibility:hidden" src="images/indicator.gif" id="snake<c:out value='${admin.id}'/>" />
						<a class="editdel" href="javascript:void(0);" onclick="resetCorporateAdminPassword(<c:out value='${admin.id}'/>)">reset password</a>
						<span class="projdetails">|</span>
						<a class="editdel" href="javascript:void(0);" id="edit<c:out value='${admin.id}'/>" onclick="document.form<c:out value='${admin.id}'/>.submit()">save</a>
						<span class="projdetails">|</span>
						<a class="editdel" href="javascript:void(0);" id="del<c:out value='${admin.id}'/>" onclick="deleteAdmin(<c:out value='${admin.id}'/>)">delete</a>
					</div>
					</form>
				</td>
			</tr>
			</c:forEach>
		</table>

		</td>
		<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8">
			<img src="images/spacer.gif" width="1" height="1" border="0"/>
		</td>
	</tr>
</table>
<fmt:formatNumber var="totalPage" value="${adminCount/maxResults}" maxFractionDigits="0"/>
<c:if test="${totalPage > 1}">
<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr align="center">
		<td class="sodesc" align="center">
			<c:set var="currentUrl" value="admincorporate.do?action=showAllCorporateAdmins" />
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

<!--<div id="messagenews"><%@ include file="../includes/tips.jsp"%>
<ul>
	<li>The system will generate a password and this password will be sent to the company administrator's email.</li>
	<li>The company administrator can change his password after sucessfully logging into the Times web site.</li>
</ul>
</div>
--><br/>
<div id="messageadd"><br/>
<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%">
	<tr>
		<td>
		<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
			<tr>
				<th><img src="images/admin/add.png" width="16" height="16" border="0"/> Add A New Company Administrator </th>
			</tr>
			<tr class="bground">
				<td class="itemthumb">
				<div id="addinput">
					<form name="companyAdmin" id="addCompanyAdmin" onsubmit="return false;">
						<table border="0" cellpadding="0" cellspacing="01" width="100%">
							<tr class="bground">
								<td class="itemname">Company:<span class="requiredfield">*</span></td>
								<td>
									<select class="item" id="companyID*" name="companyID" alt="Company"><%--								onchange="populateDepartment(this.value, this.form);" --%>
										<option value="">-- select company --</option>
										<c:forEach items="${companies}" var="company" varStatus="varCounter">
										<option value="<c:out value="${company.id}"/>"><c:out value="${company.name}"/></option>
										</c:forEach>
									</select>
									<img name="depindc" src="images/indicator.gif" style="visibility:hidden;" />
								</td>
							</tr>
<%--					<tr>
								<td class="itemname">Department:<!--<span class="requiredfield">*</span>--></td>
								<td>
									<select class="item" id="departmentId" name="departmentId" alt="Department">
										<option value="">-- select department --</option>
									</select>
								</td>
							</tr>--%>
							<tr>
								<td class="itemname">Username:<span class="requiredfield">*</span></td>
								<td>
									<input class="item" size="12" type="text" id="username*" name="username" alt="Username"/>
								</td>
							</tr>
							<tr>
								<td class="itemname">Email:<span class="requiredfield">*</span></td>
								<td>
									<input class="item" size="12" type="text" id="email*@" name="email" alt="Email address"/>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span class="itemnote">NOTE: The system will generate a password and it will be sent to the above email.</span>
								</td>
							</tr>
							<tr>
								<td class="itemname">First Name:</td>
								<td>
									<input class="item" size="12" type="text" id="firstname" name="firstname" alt="First name"/>
								</td>
							</tr>
							<tr>
								<td class="itemname">Last Name:</td>
								<td>
									<input class="item" size="12" type="text" id="lastname" name="lastname" alt="Username"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<img name="snake" src="images/indicator.gif" style="visibility:hidden;" />
									<input class="buttonitem" type="button" name="submitb" value="Add this new company administrator" onclick="addCorporateAdmin(this.form);" class="item"/>
									<input class="buttonitem" type="button" name="resetb" value="Reset" onclick="this.form.reset();" class="item"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>

<%@ include file="../includes/adminfooter.jsp"%></div>
</body>
</html>
