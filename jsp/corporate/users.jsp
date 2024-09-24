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
<script type="text/javascript">
function getUserTable()
{
	return $('userstable');
}

function addNewCompanyUserRow(companyUser)
{
	var table = getUserTable();
	var row = MyTable.createRow(table, -1, 'tr' + companyUser.id, "");
	var cells = MyTable.createCells(row, 3, '');
	
	cells[0].innerHTML = '<img src="images/spacer.gif" width="1" height="1" border="0" alt="">';
	
	cells[1].innerHTML = prepareAdminCol(companyUser);
	cells[1].id = 'edit' + companyUser.id;
	
	cells[2].innerHTML = '<img src="images/spacer.gif" width="1" height="1" border="0" alt="">';
	
	if (row.rowIndex % 2 != 0) // 0 based not 1
	{
		for (var i = 0; i < cells.length; i++)
		{
			cells[i].setAttribute("bgcolor", "#ECF5FE");
			cells[i].style.cssText = "background-color: #ECF5FE;";
		}
	}
	
}

function prepareDepartmentText(user)
{
	var buffer = new Buffer();
	if (user.departments)
	{
		var depts = user.departments;
		for (var i = 0; i < depts.length; i++)
		{
			buffer.append(depts[i].name).append(' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
		}
	}
	return buffer.toString();
}

function prepareAdminEditCol(user)
{
	var buffer = new Buffer();
	buffer.append('<img style="visibility:hidden" src="images/indicator.gif" id="snake').append(user.id).append('"/>\n');
	buffer.append('<a href="javascript:void(0);" class="usersadddel" onclick="resetUserPassword(').append(user.id).append(');">Reset password</a>\n');
	buffer.append('&nbsp;&nbsp;|&nbsp;&nbsp;\n');
	buffer.append('<a href="javascript:void(0);" class="usersadddel" id="editlnk').append(user.id).append('" onclick="editCompanyUser(').append(user.id).append(');">Edit</a>\n');
	buffer.append('&nbsp;&nbsp;|&nbsp;&nbsp;\n');
	buffer.append('<a href="javascript:void(0);" class="usersadddel" id="dellnk').append(user.id).append('" onclick="deleteCompanyUser(').append(user.id).append(');">Delete</a>\n');
	return buffer.toString();
}

function prepareAdminCol(user)
{
	var buffer = new Buffer();
	
	buffer.append('<form id="form_').append(user.id).append('">\n');
	buffer.append('<span class="listusers">Username:</span>\n');
	buffer.append('<span class="listvalue" id="username_').append(user.id).append('">\n');
	buffer.append(user.username);
	buffer.append('</span>\n');
	buffer.append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n');
	buffer.append('<span class="listusers">First Name:</span>\n');
	buffer.append('<span class="listvalue" id="firstname_').append(user.id).append('">\n');
	buffer.append(user.firstname);
	buffer.append('</span>\n');
	buffer.append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n');
	buffer.append('<span class="listusers">Last Name:</span>\n');
	buffer.append('<span class="listvalue" id="lastname_').append(user.id).append('">\n');
	buffer.append(user.lastname);
	buffer.append('</span>\n');
	buffer.append('<br />\n');
	buffer.append('<span class="listusers">Email:</span>\n');
	buffer.append('<span class="listvalue" id="email_').append(user.id).append('">\n');
	buffer.append(user.email);
	buffer.append('</span>\n');
	buffer.append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n');
	buffer.append('<span class="listusers">User Type:</span>\n');
	buffer.append('<span class="listvalue" id="usertypeno_').append(user.id).append('">\n');
	buffer.append(user.usertype.name);
	buffer.append('</span>\n');
	buffer.append('<br/>\n');
	buffer.append('<table border="0" cellpadding="0" cellspacing="0">\n');
	buffer.append('<tr>\n');
	buffer.append('<td>\n');
	buffer.append('<span class="listusers">Department:&nbsp;</span>\n');
	buffer.append('</td>\n');
	buffer.append('<td>\n');
	buffer.append('<span class="listvalue" id="departmentId_').append(user.id).append('">\n');
	buffer.append(prepareDepartmentText(user));
	buffer.append('</span>\n');
	buffer.append('</td>\n');
	buffer.append('</tr>\n');
	buffer.append('</table>\n');
	buffer.append('</form>\n');
	
	buffer.append('<div style="text-align: right; vertical-align: middle;">\n');
	buffer.append(prepareAdminEditCol(user));
	buffer.append('</div>\n');

	return buffer.toString();
}

function addDepartment(departments, value)
{
	departments.push(value);
}

function getDepartments(user, form)
{
	var departments = new Array();
	if (user.usertypeno == 2) // app off
	{
		var check = form.department_check_Id;
		if (check)
		{
			if(check.length)
			{
				for (var i = 0; i < check.length; i++)
				{
					if (check[i].checked)
					{
						addDepartment(departments, check[i].value);
					}
				}
			}
			else if (check.type == "checkbox")	
			{
				if (check.checked)
				{
					addDepartment(departments, check.value);
				}
			}
		}
	}
	else if (user.usertypeno == 3) // staff
	{
		addDepartment(departments, form.department_select_Id.value);
	}
	user["departmentIds"] = departments;
}

function setDepartments(form, departments, usertypeno)
{
	if (!departments)
		return;

	if (usertypeno == ${UserTypes.APPROVING_OFFICER.value}) // app off
	{
		var check = form.department_check_Id;
		if (check)
		{
			if(check.length)
			{
				for (var i = 0; i < check.length; i++)
				{
					for (var j = 0; j < departments.length; j++)
					{
						if (check[i].value == departments[j])
						{
							check[i].checked = true;
						}
					}
				}
			}
			else if (check.type == "checkbox"  && departments.length == 0)	
			{
				if (check.value == departments[0])
					check.checked = true;
			}
		}
	}
	else if (usertypeno == ${UserTypes.STAFF.value} && departments.length > 0) // staff
	{
		form.department_select_Id.value = departments[0];
	}
}

function addNewCompany()
{
	var form = document.getElementById("adduser");
	if (!MyForm.validate(form) || !MyForm.checkUsername(form.username.value, form.username))
		return false;
	else
		form.submit();
	
	/*form.snake.style.visibility = 'visible';
	var user = MyForm.getValues(form);
	getDepartments(user, form);
	
	CorporateUser.addNewCompanyUser(user,
	{
		callback: function(nuser)
		{
			if (nuser != null)
			{
				addNewCompanyUserRow(nuser);
				form.snake.style.visibility = 'hidden';
				form.reset();
				// ShowDepartment(form.usertypeno, 'department_check', 'department_select');
				window.location.reload();
			}
			else
			{
				top.location.href = top.location.href;
			}
		},
		errorHandler: function(errorString, exception)
		{
			alert(errorString);
			form.snake.style.visibility = 'hidden';
		}
	});*/
}

function createDepartmentDiv(id, dep_sel, dep_chk)
{
	var buf = new Buffer();
	buf.append('<div id="department_check_').append(id).append('" style="display:none">\n');
	buf.append(dep_chk);
	buf.append('</div>\n');
	buf.append('<div id="department_select_').append(id).append('" style="display:none">\n');
	buf.append(dep_sel);
	buf.append('</div>\n');
	return buf.toString();
}

var fields = new Array(<%--'departmentId', --%>'usertypeno', 'email', 'firstname', 'lastname');
var properties = new Array(<%--''departmentName', --%>'usertype.name', 'email', 'firstname', 'lastname');

function editCompanyUser(id)
{
	var form = $('form_' + id);
	var snake = $('snake' + id);
	var edit = $('editlnk' + id);
	var del = $('dellnk' + id);
	var deptSpan = $('departmentId_' + id);
	var department_select = $('department_select').innerHTML;
	var department_check = $('department_check').innerHTML;
	snake.style.visibility = 'visible';

	CorporateUser.getCompanyUser(id,
	{
		callback:function(cuser)
		{
			if (cuser != null)
			{
				SpanForm.create(id, fields, $('adduser'));
				deptSpan.innerHTML = createDepartmentDiv(id, department_select, department_check);
				MyForm.setValues(form, cuser);

				ShowDepartment(form.usertypeno, 'department_check_' + id, 'department_select_' + id);
				setDepartments(form, cuser.departmentIds, cuser.usertypeno);

				snake.style.visibility = 'hidden';
				form.usertypeno.onchange = function() {ShowDepartment(form.usertypeno, 'department_check_' + id, 'department_select_' + id);};
				edit.innerHTML = 'save';
				edit.onclick = function() {saveEdit(id, snake, form, edit, del);};
				del.innerHTML = 'cancel';
				del.onclick = function() {fromEdit(id, cuser, edit, del);};
			}
			else
			{
				top.location.href = top.location.href;
			}
		}
	});
}

function saveEdit(id, snake, form, edit, del)
{
	if (!MyForm.validate(form))
	{
		return;
	}
	snake.style.visibility = 'visible';
	var user = MyForm.getValues(form);
	getDepartments(user, form);
	user["id"] = id;
	CorporateUser.updateCompanyUser(user,
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

function submitForm(id)
{
	var form = document.getElementById("form_" + id);
	if (!MyForm.validate(form))
	{
		return false;
	}else{
		form.submit();
	}
}

function fromEdit(id, user, edit, del)
{
	SpanForm.restoreUsingProperties(id, fields, user, properties);
	var department = $('departmentId_' + id);
	department.innerHTML = prepareDepartmentText(user);
	edit.innerHTML = 'Edit';
	edit.onclick = function() {editCompanyUser(id);};
	del.innerHTML = 'Delete';
	del.onclick = function() {deleteCompanyUser(id);};
}

function deleteCompanyUser(id)
{
	if (confirm('Are you sure you want to delete the User?'))
	{
		
		var snakeid = "snake" + id;
		var snake = $(snakeid);
		
		snake.style.visibility = 'visible';
		CorporateUser.deleteCompanyUser(id, {
			callback:function(isDeleted)
			{
				snake.style.visibility = 'hidden';
				if(isDeleted){
					MyTable.deleteRow('userstable', 'tr' + id);
					//Element.remove("tr" + id);
					//Effect.SlideUp("tr"+id,{duration: 0.4, fps: 100});
				}
				else{
					alert('Error deleting users!');
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

function resetUserPassword(id)
{
	if (confirm('Are you sure you want to reset the password of the User?'))
	{
		var snakeid = "snake" + id;
		var snake = $(snakeid);
		
		snake.style.visibility = 'visible';
		CorporateUser.resetUserPassword(id, {
			callback:function(success)
			{
				snake.style.visibility = 'hidden';
			}
		});
		return true;
	}
	else
	{
		return false;
	}
}

function ShowDepartment(select, dep_check, dep_select)
{
	var dsel = $(dep_select);
	var dchk = $(dep_check);
	if (select.value == 2)
	{
		dchk.style.display = '';
		dsel.style.display = 'none';
	}
	else if (select.value == 3)
	{
		dchk.style.display = 'none';
		dsel.style.display = '';
	}
}
</script>
</head>
<c:set var="pageName" value="users" />
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
						</div>
						<div class="mainContent">
							<c:if test="${not empty errorMessage}">
							<h4><span style="color:red;">${errorMessage}</span></h4>
							</c:if>
							<h2>Users of <c:out value='${company.name}'/></h2>
							<c:if test="${not empty users}">
							<table id="userstable" border="0" cellpadding="8" cellspacing="0" width="100%">
							<c:forEach items="${users}" var="user" varStatus="ctr">
								<c:set var="bground" value=''/>
								<c:if test='${0 eq (ctr.count % 2)}'>
									<c:set var="bground" value='bgcolor="#ECF5FE"'/>
								</c:if>
								<tr id="tr<c:out value='${user.id}'/>">
									<td align="left" valign="top" <c:out value='${bground}' escapeXml="false"/>><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
									<td align="left" valign="top" <c:out value='${bground}' escapeXml="false"/>>
										<form action="corporateuser.do?action=updateCompanyUser" method="post" id="form_<c:out value='${user.id}'/>">
										<div style="float: right;">
											<img style="visibility:hidden" src="images/indicator.gif" id="snake${user.id}"/>
											<a href="javascript:void(0);" class="usersadddel" onclick="resetUserPassword(${user.id});">Reset password</a>
											&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);" class="usersadddel" id="editlnk${user.id}" onclick="submitForm(${user.id});">Save</a>
											&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);" class="usersadddel" id="dellnk${user.id}" onclick="deleteCompanyUser(${user.id});">Delete</a>
										</div>
										<input type="hidden" name="userId" value="${user.id}" />
										<table cellspacing="0" cellpadding="4">
										<tr>											
											<td>											
												<span class="listusers">Username</span>
											</td>
											<td>:</td>
											<td  style="color: #000; font-weight: bold;">
												<span class="listvalue" id="username_<c:out value='${user.id}'/>">
													<c:out value='${user.username}'/>
												</span>
											</td>
										</tr>
										<tr>
											<td><span class="listusers">First Name</span></td>
											<td>:</td>
											<td style="color: #000;">
											<%--
											<span class="listvalue" id="firstname_<c:out value='${user.id}'/>">
												<c:out value='${user.firstname}'/>
											</span>
											--%>
											<input type="text" name="firstname" value="${user.firstname}" />
											</td>
										</tr>
										<tr>
											<td>
											<span class="listusers">Last Name</span>
											</td>
											<td>:</td>
											<td style="color: #000;">
											<%--
											<span class="listvalue" id="lastname_<c:out value='${user.id}'/>">
												<c:out value='${user.lastname}'/>
											</span>
											--%>
											<input type="text" name="lastname" value="${user.lastname}" />
											</td>
										</tr>
										<tr>
											<td>
											<span class="listusers">Email</span>
											</td>
											<td>:</td>
											<td style="color: #000;">
											<%--
											<span class="listvalue" id="email_<c:out value='${user.id}'/>">
												<c:out value='${user.email}'/>
											</span>
											--%>
											<input type="text" name="email" value="${user.email}" />
											</td>
										</tr>
										<tr>
											<td><span class="listusers">User Type</span></td>
											<td>:</td>
											<td style="color: #000;">
											<%--
											<span class="listvalue" id="usertypeno_<c:out value='${user.id}'/>">
												<c:out value='${user.usertype.name}'/>
											</span>
											--%>
											<select name="usertypeno">
												<option value="${UserTypes.APPROVING_OFFICER.value}"<c:if test="${user.usertype.value eq UserTypes.APPROVING_OFFICER.value}"> selected="selected"</c:if>>${UserTypes.APPROVING_OFFICER.name}</option>
												<option value="${UserTypes.STAFF.value}"<c:if test="${user.usertype.value eq UserTypes.STAFF.value}"> selected="selected"</c:if>>${UserTypes.STAFF.name}</option>
											</select>
											</td>
										</tr>
										<tr>
											<td><span class="listusers">Department(s)</span></td>													
											<td>:</td>
											<td style="color: #000;">
											<%--
											<span class="listvalue" id="departmentId_<c:out value='${user.id}'/>">
											<c:forEach items='${user.departments}' var="dept" varStatus="ctr">
												<c:out value='${dept.name}'/>&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
											</span>
											--%>
											<c:choose>
											<c:when test="${user.usertype.value eq UserTypes.APPROVING_OFFICER.value}">
											<c:forEach items='${company.departments}' var="dept">
											<input type="checkbox" name="department_check_Id" value="${dept.id}"<c:if test="${not empty user.departmentMap[dept.id]}"> checked="checked"</c:if> /> ${dept.name}
											<br />
											</c:forEach>
											</c:when>
											<c:otherwise>
											<select name="department_select_Id">
											<c:forEach items='${company.departments}' var="dept">
											<option value="${dept.id}"<c:if test="${not empty user.departmentMap[dept.id]}"> selected="selected"</c:if>>${dept.name}</option>
											</c:forEach>
											</select>
											</c:otherwise>
											</c:choose>
											</td>
										</tr>
										</form>
										</table>
									</td>
									<td align="left" valign="top" <c:out value='${bground}' escapeXml="false"/>><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
								</tr>
							</c:forEach>
							</table>
							
							<br />
							<div style="width: 100%; font: normal 11px Arial; text-align: center;">
								<%--
								<c:forEach items="${alphalist}" var="letter" varStatus="ctr">
								<c:if test="${alphakey eq letter }">	
								<a style="color: #555555; text-decoration: underline;" href="corporateuser.do?action=showAllUsersByAlphakey&alphakey=${letter}">${letter}</a>&nbsp;
								</c:if>
								<c:if test="${alphakey ne letter }">	
								<a style="color: #555555; text-decoration: none;" href="corporateuser.do?action=showAllUsersByAlphakey&alphakey=${letter}">${letter}</a>&nbsp;
								</c:if>
								</c:forEach>
								<br /><br />
								--%>
								<c:forEach begin="0" end="${totalpages-1}" step="1" var="i">
								<c:if test="${page == i+1}">
								<a style="color: #555555; text-decoration: underline;" href="corporateuser.do?action=${method}&page=${i+1}&alphakey=${alphakey}">${i+1}</a>&nbsp;
								</c:if>
								<c:if test="${page ne i+1}">
								<a style="color: #0066cc; text-decoration: none; " href="corporateuser.do?action=${method}&page=${i+1}&alphakey=${alphakey}">${i+1}</a>&nbsp;
								</c:if>
								</c:forEach>
							</div>
							</c:if>
							<br />
							<form action="corporateuser.do?action=addNewUser" method="post" name="user" id="adduser" >
								<input type="hidden" name="companyID" value="<c:out value="${company.id}" />" />
								<table border="0" cellpadding="3" cellspacing="0" width="100%" align="center" id="userlist">
									<tr>
										<td align="left" valign="middle" colspan="5" height="28" bgcolor="#7CC0E5" style="padding: 0 12px; color: #000;">
											<span id="categories">Add A New User for <strong><c:out value='${company.name}'/></strong></span>
										</td>
									</tr>
									<tr>
										<td align="left" valign="middle" colspan="5" height="8"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
									</tr>  
									<tr>
										<td align="left" valign="top">	
											<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
										</td>
										<td align="left" valign="middle" width="100px"><span class="listusers">Username*</span></td>
										<td>:</td>
										<td colspan="3"><input type="text" id="username*" name="username" size="8" class="inputField"/></td>
									</tr>
									<tr>
										<td align="left" valign="top">
											<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
										</td>
										<td align="left" valign="middle"><span class="listusers">First Name</span></td>
										<td>:</td>
										<td><input type="text" id="firstname" name="firstname" size="8" class="inputField"/></td>
									</tr>
									<tr>
										<td align="left" valign="top">
											<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
										</td>
										<td><span class="listusers">Last Name</span></td>
										<td>:</td>
										<td><input type="text" id="lastname" name="lastname" size="8" class="inputField"/></td>
									</tr>
									<tr>
										<td align="left" valign="top">	
											<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
										</td>
										<td align="left" valign="top">	
											<span class="listusers">Email*</span>
										</td>
										<td>:</td>
										<td colspan="3"><input type="text" id="email@*" name="email" alt="Email Address" size="8" class="inputField"/></td>
									</tr>
									<tr>
										<td align="left" valign="top">
											<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
										</td>
										<td>
											<span class="listusers">User Type*</span>
										</td>
										<td>:</td>
										<td  colspan="3">
											<select name="usertypeno" id="usertypeno*" alt="User type" onchange="ShowDepartment(this, 'department_check', 'department_select');" class="inputField">
												<option value="${UserTypes.APPROVING_OFFICER.value}" selected="selected">${UserTypes.APPROVING_OFFICER.name}</option>
												<option value="${UserTypes.STAFF.value}">${UserTypes.STAFF.name}</option>
											</select>
										</td>
									</tr>
									<tr>
										<td align="left" valign="top">
											<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
										</td>
										<td colspan="4">
											<table cellpadding="2" cellspacing="0" border="0" id="adddepartment" width="100%">
												<tr>
													<td width="100px">
														<span class="listusers">Department(s)*</span>
													</td>
													<td>:</td>
													<td>
														<div id="department_check">
															<c:forEach items="${company.departments}" var="dep" varStatus="ctr">
																<input type="checkbox" id="department_check_Id!" name="department_check_Id" value="<c:out value='${dep.id}'/>"<c:if test="${not empty user.departmentIds and user.departmentIds[dep.id] ne null}"> checked="checked" </c:if>/>
																<span class="listusers"><c:out value="${dep.name}"/></span>&nbsp;&nbsp;&nbsp;
																<br/>
															</c:forEach>
														</div>
														<div id="department_select" style="display:none;">
															<select id="department_select_Id!" name="department_select_Id" alt="Department" class="inputField">
																<c:forEach items="${company.departments}" var="dep" varStatus="ctr">
																	<option value="<c:out value="${dep.id}"/>"><c:out value="${dep.name}"/></option>
																</c:forEach>
															</select>
														</div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td align="left" valign="top">	
											<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
										</td>
										<td align="left" valign="middle" colspan="4">
											<span class="listusers" style="font-style: italic;">
											NOTE: 
											<ol type="1">
											<li>* are required to be filled up.</li>
											<li>The system will generate password and send to the user&rsquo;s email.</li>
											<li>An Approving Officer user has access to multiple Departments, while a Staff user is only limited to one Department. Make sure there is <strong>at least one</strong> Approving Officer for each Department in your company.</li>
											</ol>
											</span>
										</td>
									</tr> 
									<tr>
										<td align="left" valign="top"><img src="images/spacer.gif" width="35" height="1" border="0"></td>
										<td align="right" valign="top" colspan="4">
											<img name="snake" src="images/indicator.gif" style="visibility:hidden;" />
											<a class="formButton" href="javascript:void(0);" class="sofinishcancel" onclick="addNewCompany();">Add this new user</a>&nbsp;&nbsp;&nbsp;
											
											<%-- <input type="submit" value="add this new user"/>   --%>
										</td>		   		   
									</tr>
								</table>
							</form>
						</div>
						<%-- <%@ include file="../includes/sidenav.jsp"%>--%>
						<div class="clear"></div>
<%--
<table width="700" height="312" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="43" colspan="3" background="images/bg_breadcrumb.gif">
		<table width="100%" border="0" cellspacing="0" cellpadding="10">
			<tr>
				<td class="breadcrumb">
					<img src="images/icon_folder2.gif" width="14" height="11" /> 
					<a href="#">All users of <c:out value='${company.name}'/></a>
				</td>
				<td align="right">
					<%@ include file="../includes/miniicons.jsp"%>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr valign="top">
		<td width="3" height="265" bgcolor="#EFF3F3">
			<img src="images/breadcrumb_left.gif" width="3" height="265" />
		</td>
		<td width="693">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
					<table id="userstable" border="0" cellpadding="0" cellspacing="0" width="693">
						<c:forEach items="${users}" var="user" varStatus="ctr">
							<c:set var="bground" value=''/>
							<c:if test='${0 eq (ctr.count % 2)}'>
								<c:set var="bground" value='bgcolor="#ECF5FE"'/>
							</c:if>
							<tr id="tr<c:out value='${user.id}'/>">
								<td align="left" valign="top" <c:out value='${bground}' escapeXml="false"/>><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
								<td align="left" valign="top" <c:out value='${bground}' escapeXml="false"/>>
									<form id="form_<c:out value='${user.id}'/>">
									<span class="listusers">Username:</span>
									<span class="listvalue" id="username_<c:out value='${user.id}'/>">
										<c:out value='${user.username}'/>
									</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="listusers">First Name:</span>
									<span class="listvalue" id="firstname_<c:out value='${user.id}'/>">
										<c:out value='${user.firstname}'/>
									</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="listusers">Last Name:</span>
									<span class="listvalue" id="lastname_<c:out value='${user.id}'/>">
										<c:out value='${user.lastname}'/>
									</span>
									<br/>
									<span class="listusers">Email:</span>
									<span class="listvalue" id="email_<c:out value='${user.id}'/>">
										<c:out value='${user.email}'/>
									</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="listusers">User Type:</span>
									<span class="listvalue" id="usertypeno_<c:out value='${user.id}'/>">
										<c:out value='${user.usertype.name}'/>
									</span>
									<br/>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<span class="listusers">Department(s):&nbsp;</span>
											</td>
											<td>
												<span class="listvalue" id="departmentId_<c:out value='${user.id}'/>">
												<c:forEach items='${user.departments}' var="dept" varStatus="ctr">
													<c:out value='${dept.name}'/>&nbsp;&nbsp;&nbsp;&nbsp;
												</c:forEach>
												</span>
											</td>
										</tr></form>
									</table>
									<div style="text-align: right; vertical-align: middle;">
										<img style="visibility:hidden" src="images/indicator.gif" id="snake${user.id}"/>
										<a href="javascript:void(0);" class="usersadddel" onclick="resetUserPassword(${user.id});">Reset password</a>
										&nbsp;&nbsp;|&nbsp;&nbsp;
										<a href="javascript:void(0);" class="usersadddel" id="editlnk${user.id}" onclick="editCompanyUser(${user.id});">Edit</a>
										&nbsp;&nbsp;|&nbsp;&nbsp;
										<a href="javascript:void(0);" class="usersadddel" id="dellnk${user.id}" onclick="deleteCompanyUser(${user.id});">Delete</a>
									</div>
								</td>
								<td align="left" valign="top" <c:out value='${bground}' escapeXml="false"/>><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
							</tr>
						</c:forEach>
					</table>
					</td>
				</tr>
			</table>
		</td>
		<td width="4" bgcolor="#EFF3F3">
			<img src="images/breadcrumb_right.gif" width="4" height="265" />
		</td>
	</tr>
	<tr>
		<td height="4" colspan="3">
			<img src="images/breadcrumb_bottom.gif" width="700" height="4" />
		</td>
	</tr>
</table>
<br />
	<div style="width: 100%;text-align: center;">
	<c:forEach items="${alphalist}" var="letter" varStatus="ctr">
		<c:if test="${alphakey eq letter }">	
			<a style="color: #555555; font-size: 20pt; text-decoration: underline;" href="corporateuser.do?action=showAllUsersByAlphakey&alphakey=${letter}">${letter}</a>&nbsp;
		</c:if>
		<c:if test="${alphakey ne letter }">	
			<a style="color: #555555; font-size: 10pt; text-decoration: none;" href="corporateuser.do?action=showAllUsersByAlphakey&alphakey=${letter}">${letter}</a>&nbsp;
		</c:if>		
		
	</c:forEach>
	
	<br /><br />
						<c:forEach begin="0" end="${totalpages-1}" step="1" var="i">
							<c:if test="${page == i+1}">
								<a style="color: #555555; font-size: 20pt; text-decoration: underline;" href="corporateuser.do?action=${method}&page=${i+1}&alphakey=${alphakey}">${i+1}</a>&nbsp;
							</c:if>
							<c:if test="${page ne i+1}">
								<a style="color: #0066cc; text-decoration: none; font-size: 16px;" href="corporateuser.do?action=${method}&page=${i+1}&alphakey=${alphakey}">${i+1}</a>&nbsp;
							</c:if>
					</c:forEach>
	</div>


<form name="user" id="adduser" >
<input type="hidden" name="companyID" value="<c:out value="${company.id}" />" />
<table border="0" cellpadding="0" cellspacing="0" width="700" align="center" id="userlist">
	<tr>
		<td align="left" valign="middle" colspan="5" height="28" bgcolor="#7CC0E5">
			<span id="categories">Add A New User for <c:out value='${company.name}'/></span>
		</td>
	</tr>
	<tr>
		<td align="left" valign="middle" colspan="5" height="8"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
	</tr>  
	<tr>
		<td align="left" valign="top">	
			<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
		</td>
		<td align="left" valign="middle">
			<span class="listusers">Username*:</span>
		</td>
		<td colspan="3"><input type="text" id="username*" name="username" size="8" class="formtext"/></td>
	</tr>
//comment out <tr>
		<td align="left" valign="top">	
			<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
		</td>
		<td align="left" valign="middle" colspan="4">
			<span class="listusers" style="font-style: italic;">
			NOTE: The initial password for this user will be the <strong>same as the username</strong>. It can be changed later once the user has logged into <strong><c:out value='${company.companyUrl}'/>.times.com.ph</strong>.
			</span>
		</td>
	</tr>
//end comment out
	<tr>
		<td align="left" valign="middle" colspan="5"><img src="images/spacer.gif" width="1" height="10" border="0" alt=""></td>
	</tr>  
	<tr>
		<td align="left" valign="top">
			<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
		</td>
		<td align="left" valign="middle">
			<span class="listusers">First Name:</span>
		</td>
		<td><input type="text" id="firstname" name="firstname" size="8" class="formtext"/></td>
		<td>
			<span class="listusers">Last Name:</span>
		</td>
		<td><input type="text" id="lastname" name="lastname" size="8" class="formtext"/></td>
	</tr>
	<tr>
		<td align="left" valign="top">	
			<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
		</td>
		<td align="left" valign="top">	
			<span class="listusers">Email*:</span>
		</td>
		<td colspan="3"><input type="text" id="email@*" name="email" alt="Email Address" size="8" class="formtext"/></td>
	</tr>
	<tr>
		<td align="left" valign="middle" colspan="5"><img src="images/spacer.gif" width="1" height="10" border="0" alt=""></td>
	</tr> 
	<tr>
		<td align="left" valign="top">
			<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
		</td>
		<td>
			<span class="listusers">User Type*:</span>
		</td>
		<td  colspan="3">
			<select name="usertypeno" id="usertypeno*" alt="User type" onchange="ShowDepartment(this, 'department_check', 'department_select');" class="formtext">
				<option value="${UserTypes.APPROVING_OFFICER.value}" selected="selected">${UserTypes.APPROVING_OFFICER.name}</option>
				<option value="${UserTypes.STAFF.value}">${UserTypes.STAFF.name}</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="left" valign="top">
			<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
		</td>
		<td colspan="4">
			<table cellpadding="0" cellspacing="0" border="0" id="adddepartment">
				<tr>
					<td>
						<span class="listusers">Department(s)*: </span>
					</td>
					<td>
						<div id="department_check">
							<c:forEach items="${company.departments}" var="dep" varStatus="ctr">
								<input type="checkbox" id="department_check_Id!" name="department_check_Id" value="<c:out value='${dep.id}'/>"/>
								<span class="listusers"><c:out value="${dep.name}"/></span>&nbsp;&nbsp;&nbsp;
								<c:if test='${ctr.count % 4 == 0}'>
									<br/>
								</c:if>
							</c:forEach>
						</div>
						<div id="department_select" style="display:none;">
							<select id="department_select_Id!" name="department_select_Id" alt="Department" class="formtext">
								<c:forEach items="${company.departments}" var="dep" varStatus="ctr">
									<option value="<c:out value="${dep.id}"/>"><c:out value="${dep.name}"/></option>
								</c:forEach>
							</select>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" valign="top">	
			<img src="images/spacer.gif" width="1" height="1" border="0" alt="">
		</td>
		<td align="left" valign="middle" colspan="4">
			<span class="listusers" style="font-style: italic;">
			NOTE: 
			<ol type="1">
			<li>* are required to be filled up.</li>
			<li>The system will generate password and send to the user&rsquo;s email.</li>
			<li>An Approving Officer user has access to multiple Departments, while a Staff user is only limited to one Department. Make sure there is <strong>at least one</strong> Approving Officer for each Department in your company.</li>
			</ol>
			</span>
		</td>
	</tr> 
	<tr>
		<td align="left" valign="top"><img src="images/spacer.gif" width="35" height="1" border="0"></td>
		<td align="right" valign="top" colspan="4">
			<img name="snake" src="images/indicator.gif" style="visibility:hidden;" />
			<a href="javascript:void(0);" class="sofinishcancel" onclick="addNewCompany($('adduser'));">Add this new user</a>&nbsp;&nbsp;&nbsp;
			
			//comment out <input type="submit" value="add this new user"/>   //end comment out
		</td>		   		   
	</tr>
	<tr>
 		<td align="left" valign="top"><img src="images/spacer.gif" width="35" height="1" border="0"></td>
		<td align="left" valign="top"><img src="images/spacer.gif" width="100" height="1" border="0"></td>
		<td align="left" valign="top"><img src="images/spacer.gif" width="230" height="1" border="0"></td>
		<td align="left" valign="top"><img src="images/spacer.gif" width="100" height="1" border="0"></td>
		<td align="left" valign="top"><img src="images/spacer.gif" width="235" height="1" border="0"></td>
	</tr>
</table>
</form>

<%@ include file="../includes/producthighlights.jsp"%>
--%>
						<%@ include file="/jsp/includes/footer.jsp"%>					
					</td>
					<td class="sRight">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>