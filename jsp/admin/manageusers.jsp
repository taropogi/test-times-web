<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/buffer.js"></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<script language="JavaScript" type="text/javascript"><!--

	var col1 = '<span class="projtitle">';
	var col2 = '<span class="projdetails">';
	var colterm = '</span><br>';


	function addUserRow(table, user)
	{
		var row = MyTable.createRow(table, -1, 'tr' + user.id, "bground");
		var cells = MyTable.createCells(row, 1, 'itemthumb');
		
		cells[0].innerHTML = prepareUserCol(user);
		cells[0].className = 'itemthumb';
		cells[0].id = 'edit' + user.id;
	}
	
	function prepareUserCol(user)
	{
		var buffer = new Buffer();
		buffer.append('<form id="user_').append(user.id).append('">\n');
		buffer.append('<span class="itemname">Username: </span>\n');
		buffer.append('<span class="itemdescription" id="username_').append(user.id).append('">').append(user.username).append('</span>\n');
		buffer.append('&nbsp;&nbsp;&nbsp;\n');
		buffer.append('<span class="itemname">First Name: </span>\n');
		buffer.append('<span class="itemdescription" id="firstname_').append(user.id).append('">').append(user.firstname).append('</span>\n');
		buffer.append('&nbsp;&nbsp;&nbsp;\n');
		buffer.append('<span class="itemname">Last Name: </span>\n');
		buffer.append('<span class="itemdescription" id="lastname_').append(user.id).append('">').append(user.lastname).append('</span>\n');
		buffer.append('<br/>\n');
		buffer.append('<span class="itemname">User Type: </span>\n');
		buffer.append('<span class="itemdescription" id="usertypeno_').append(user.id).append('">').append(user.usertype.name).append('</span>\n');
		buffer.append('<br/>\n');
		buffer.append('<div align="right" valign="buttom">\n');
		buffer.append('<img style="visibility:hidden" src="images/indicator.gif" id="snake_').append(user.id).append('"/>\n');
		buffer.append('<a class="errormsg" href="javascript:void(0);" onclick="resetUserPassword(').append(user.id).append(');">Reset password</a>\n');
		buffer.append('<span class="projdetails">|</span>\n');
		buffer.append('<a class="errormsg" href="adminmanage.do?action=editUser&id=').append(user.id).append('">edit</a>\n');
		//buffer.append('<a class="errormsg" href="javascript:void(0);" onclick="editUser(').append(user.id).append(');" id="edit_').append(user.id).append('">edit</a>\n');
		buffer.append('<span class="projdetails">|</span>\n');
		buffer.append('<a class="errormsg" href="javascript:void(0);" onclick="deleteUser(').append(user.id).append(');" id="del_').append(user.id).append('">delete</a>\n');
		buffer.append('</div>\n');
		buffer.append('</form>\n');
		return buffer.toString();
	}

	function addNewUser(formed)
	{
		if (!MyForm.validate(formed) || !MyForm.checkUsername(formed.username.value, formed.username))
			return;
		
		formed.snake.style.display = '';
		
		var user = MyForm.getValues(formed);
		getCompanies(user, formed); 
		//document.write(user["companyIds"].toString());
  
		
		AdminManageAction.saveNewUser(user,
			{
				callback:function(ret)
				{
					if (ret != null)
					{
						addUserRow($("userstable"), ret);
						formed.reset();
						
					}
					else
					{
						top.href.location = top.href.location;
					}	
					formed.snake.style.display = 'none';
				},
				errorHandler: function(errorString, exception)
				{
					alert(errorString);
					formed.snake.style.display = 'none';
				}
			}
		);
	}
	
	function deleteUser(id)
	{
		if (confirm('Are you sure you want to delete the User?'))
		{
			AdminManageAction.deleteUser(id, {
				callback:function(isDeleted)
				{
					if(isDeleted){
						MyTable.deleteRow("userstable", "tr" + id);
						//Element.remove("tr" + id);
						//Effect.SlideUp("tr"+id,{duration: 0.4, fps: 100});
					}
					else{
						alert('Error deleting user!');
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
	
	var fields = new Array('usertypeno', 'firstname', 'lastname', 'comps');
	var properties = new Array('usertype.name', 'firstname', 'lastname', '');
	
	function editUser(id)
	{
		var form = $('user_' + id);
		var snake = $('snake_' + id);
		var edit = $('edit_' + id);
		var del = $('del_' + id);
		
		snake.style.visibility = 'visible';
		
		AdminManageAction.getUser(id,
		{
			callback: function(user)
			{
				if (user != null)
				{
					SpanForm.create(id, fields, $('adduser'));
					MyForm.setValues(form, user);
					
					edit.innerHTML = 'save';
					del.innerHTML = 'cancel';
					edit.onclick = function() {saveEdit(id, snake, form, edit, del);};
					del.onclick = function() {fromEdit(id, user, edit, del);};			
					addCompanyOptions(user);
					snake.style.visibility = 'hidden';
				}
				else
				{
					top.location.href = top.location.href;
				}
			}
		});
	}
	
	function addCompanyOptions(user){
		AdminManageAction.getCompanies({
			callback:function(companies){
				
				switch(user.usertypeno){
					case 2:
					case 4:
						//break;
					case 3:
						var select = document.createElement("select");
						select.id = "comps_" + user.id;
						DWRUtil.addOptions(select, companies, "id","name");
						$('companies_' + user.id).innerHTML = "";
						$('companies_' + user.id).appendChild(select);
						
						break;
					default:
						alert("here default");
						
						break;
				
				}
				
			}
		});
					
	}
	
	function fromEdit(id, user, edit, del)
	{
		SpanForm.restoreUsingProperties(id, fields, user, properties);
		edit.innerHTML = 'edit';
		del.innerHTML = 'delete';
		edit.onclick = function() {editUser(id);};
		del.onclick = function() {deleteUser(id);};
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
		
		AdminManageAction.updateUser(user,
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
	
	function resetUserPassword(id)
	{
		if (!confirm('Are you sure you want to reset the password of the User?'))
			return;
		var snake = $('snake_' + id);
		AdminManageAction.resetUserPassword(id,
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
	
	
		function ShowCompany(select, dep_check, dep_select)
	{
		var dsel = $(dep_select);
		var dchk = $(dep_check);
		if (select.value == 1)
		{
			dchk.style.display = 'none';
			dsel.style.display = 'none';
		}
		if (select.value == 2)
		{
			dchk.style.display = '';
			dsel.style.display = 'none';
		}		
		if (select.value == 3)
		{
			dchk.style.display = '';
			dsel.style.display = 'none';
		}
		if (select.value == 4)
		{
			dchk.style.display = '';
			dsel.style.display = 'none';
		}				
	}

	function getCompanies(user, form)
	{
		var companies = new Array();
		if ((user.usertypeno == 2) ||  (user.usertypeno == 3) ||  (user.usertypeno == 4))//  manager and encoder and sales staff
		{
			var check = form.company_check_Id;
			if (check)
			{
				if(check.length)
				{
					for (var i = 0; i < check.length; i++)
					{
						if (check[i].checked)
						{
							addCompany(companies, check[i].value);
						}
					}
				}
				else if (check.type == "checkbox")	
				{
					if (check.checked)
					{
						addCompany(companies, check.value);
					}
				}
			}
		}
//		else if (user.usertypeno == 3) // sales staff
//		{
//			addCompany(companies, form.company_select_Id.value);
//		}
		user["companyIds"] = companies;
	}


	function addCompany(companies, value)
	{
		companies.push(value);
	}


	function setCompanies(form, companies, usertypeno)
	{
		if (!companies)
			return;

		if (usertypeno == 2   || usertypeno == 3 || usertypeno == 4) // manager & encoder & staff
		{
			var check = form.company_check_Id;
			if (check)
			{
				if(check.length)
				{
					for (var i = 0; i < check.length; i++)
					{
						for (var j = 0; j < companies.length; j++)
						{
							if (check[i].value == companies[j])
							{
								check[i].checked = true;
							}
						}
					}
				}
				else if (check.type == "checkbox"  && companies.length == 0)	
				{
					if (check.value == companies[0])
						check.checked = true;
				}
			}
		}
//		else if (usertypeno == 3 && companies.length > 0) // sales staff
//		{
//			form.company_select_Id.value = companies[0];
//		}
	}






//
--></script>

<body>
<c:set var="menu" value="manage" />
<c:set var="submenu" value="users" />
<c:set var="pagemessage" value="You can add, update and delete the information for the individual CMS users here." />

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr>
		<td align="left"><%@ include file="../includes/error.jsp"%></td>
	</tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table id="userstable" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
		<tr>
			<th colspan="2">
				<img src="images/admin/group.png" width="16" height="16" border="0"> CMS USERS DETAILS
			</th>
		</tr>
		<c:forEach items="${users}" var="user" varStatus="counter">
			<tr id="tr<c:out value='${user.id}'/>" class="bground">
				<td class="itemthumb">
					<form id="user_<c:out value='${user.id}'/>">
					<span class="itemname">Username: </span>
					<span class="itemdescription" id="username_<c:out value='${user.id}'/>"><c:out value='${user.username}'/></span>
					&nbsp;&nbsp;&nbsp;
					<span class="itemname">First Name: </span>
					<span class="itemdescription" id="firstname_<c:out value='${user.id}'/>"><c:out value='${user.firstname}'/></span>
					&nbsp;&nbsp;&nbsp;
					<span class="itemname">Last Name: </span>
					<span class="itemdescription" id="lastname_<c:out value='${user.id}'/>"><c:out value='${user.lastname}'/></span>
					<br/>
					<span class="itemname">User Type: </span>
					<span class="itemdescription" id="usertypeno_<c:out value='${user.id}'/>"><c:out value='${user.usertype.name}'/></span>
					<br />
					<c:if test="${user.usertype.name eq 'Manager' || user.usertype.name eq 'Encoder' || user.usertype.name eq 'Staff' }">					
					<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<span class="listusers">Companies:&nbsp;</span>
											</td>
											<td>
												<span class="listvalue" id="companies_<c:out value='${user.id}'/>">
												<c:forEach items='${user.companies}' var="comp" varStatus="ctr">
													<c:out value='${comp.name}'/>&nbsp;&nbsp;&nbsp;&nbsp;
												</c:forEach>
												</span>
											</td>
										</tr>
					</table>
					
					</c:if>

										
					<br/>
					<div align="right" valign="buttom">
						<img style="visibility:hidden" src="images/indicator.gif" id="snake_<c:out value='${user.id}'/>"/>
						<a class="errormsg" href="javascript:void(0);" onclick="resetUserPassword(<c:out value='${user.id}'/>);">Reset password</a>
						<span class="projdetails">|</span>
						<!--<a class="errormsg" href="javascript:void(0);" onclick="editUser(<c:out value='${user.id}'/>);" id="edit_<c:out value='${user.id}'/>">edit</a>
						-->
						<a class="errormsg" href="adminmanage.do?action=editUser&id=${user.id}">edit</a>
						<span class="projdetails">|</span>
						<a class="errormsg" href="javascript:void(0);" onclick="deleteUser(<c:out value='${user.id}'/>);" id="del_<c:out value='${user.id}'/>">delete</a>
					</div>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<div style="width: 100%;text-align: center;">
						<c:forEach items="${alphalist}" var="letter" varStatus="ctr">
							<c:if test="${alphakey eq letter }">	
								<a style="color: #555555; font-size: 20pt; text-decoration: underline;" href="adminmanage.do?action=showAllUsersByAlphakey&alphakey=${letter}">${letter}</a>&nbsp;
							</c:if>
							<c:if test="${alphakey ne letter }">	
								<a style="color: #555555; font-size: 10pt; text-decoration: none;" href="adminmanage.do?action=showAllUsersByAlphakey&alphakey=${letter}">${letter}</a>&nbsp;
							</c:if>	
						</c:forEach>
							
						<br /> <br />
						<c:forEach begin="0" end="${totalpages}" step="1" var="i">
							<c:if test="${page == i+1}">
								<a style="color: #555555; font-size: 20pt; text-decoration: underline;" href="adminmanage.do?action=${method}&page=${i+1}&alphakey=${alphakey}">${i+1}</a>&nbsp;
							</c:if>
							<c:if test="${page ne i+1}">
								<a style="color: #0066cc; text-decoration: none; font-size: 16px;" href="adminmanage.do?action=${method}&page=${i+1}&alphakey=${alphakey}">${i+1}</a>&nbsp;						</c:if>
					</c:forEach>
	</div>
	</div>
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>Only the administrator type of Content Management System (CMS) user can create other CMS users.</li>
	<li>initially, the newly created CMS user will have the same password as his username, which is also case sensitive. This user can later log onto the CMS and change his password under the "Settings" tab.</li>
	</ul>
	</div>
	
	--><div id="messageadd" style="padding-top: 2px"><br />
	<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
		<tr>
			<th><img src="images/admin/add.png" width="16" height="16" border="0"> Add A New User</th>
		</tr>
		<tr class="bground">
			<td id="addinput" class="itemthumb">
			
			<form name="adduser" id="adduser" method="post" action="adminmanage.do?action=saveNewUser">
				<table border="0" cellpadding="0" cellspacing="2" width="100%">
					<tr>
						<td>
							<span class="itemname">Username<span class="requiredfield">*</span></span>
						</td>
						<td><input type="text" id="username*" name="username" size="15" class="item"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<span class="itemnote">The initial password will be the same as the username. <br/>This password is case sensitive and can be changed later once the user has logged in.</span>
						</td>
					</tr>
					<tr>
						<td><span class="itemname">User Type<span class="requiredfield">*</span></span></td>
						<td>
							<select id="usertypeno*" name="usertypeno" alt="User Type" class="item" onchange="ShowCompany(this, 'company_check', 'company_select');">
								<option value="1">Administrator</option>
								<option value="2">Manager</option>
								<option value="3">Sales Staff</option>
								<option value="4">Encoding Staff</option>
							</select>
						</td>
					</tr>
					<tr>
						<td valign="top"><span class="itemname">Companies<span class="requiredfield">*</span></span></td>
					
						<td>
							<div id="company_check" style="display:none;">	
								<c:forEach items="${allcompanies}" var="company" varStatus="counter">
									<input type="checkbox" id="company_check_Id!" name="company_check_Id" value="<c:out value='${company.id}'/>"/>							
									<span class="listusers"><c:out value="${company.name}"/></span>&nbsp;&nbsp;&nbsp;
									<c:if test='${ctr.count % 4 == 0}'>
									<br/>
									</c:if>									
								</c:forEach>
							</div>						
							<div id="company_select" style="display:none;">
								<select id="company_select_Id!" name="company_select_Id" alt="Company" class="formText">
								<c:forEach items="${allcompanies}" var="company" varStatus="ctr">
									<option value="<c:out value="${company.id}"/>"><c:out value="${company.name}"/></option>
								</c:forEach>	
								</select>						
							</div>						
						</td>					
					</tr>
					<tr>
						<td>
							<span class="itemname">First Name<span class="requiredfield">*</span></span>
						</td>
						<td><input type="text" id="firstname*" name="firstname" size="15" class="item"/></td>
					</tr>
					<tr>
						<td>
							<span class="itemname">Last Name</span><span class="requiredfield">*</span>
						</td>
						<td><input type="text" id="lastname*" name="lastname" size="15" class="item"/></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
							<input type="submit" value="Add New User" class="buttonitem"/> 
							<!--input type="button" value="cancel" onclick="hideAdd();" class="buttonitem"/-->
						</td>
					</tr>
					<tr>
						<td colspan="2" align="left">
						<span class="requiredfieldtext">* Required field(s).</span>
					</tr>
				</table>
			</form>

			</td>
		</tr>
	</table>
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>
