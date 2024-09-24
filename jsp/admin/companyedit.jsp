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
function checkUpload(theForm)
{
	var filename = theForm.companypicture.value.toUpperCase();

	if(filename == "")
	{
		theForm.companypicture.focus();
		alert("Please specify a file for upload.");
		return false;
	}
	else
	{
		return true;
	}
}

function addDepartment(depf, id, dept)
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
	if (confirm('Are you sure you want to delete the company department?'))
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
</script>

<body>
<c:set var="menu" value="corporate"/>
<c:set var="submenu" value="company"/>
<c:set var="pagemessage" value="You can update the information for the individual Company items here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="newstable" class="projfiles">
	  <tr>
	   <th>
	   <img src="images/admin/world.png" width="16" height="16" border="0"/>EDIT COMPANY DETAILS
	   </th>
	  </tr>
	  <tr class="bground">
	  	<td class="itemthumb">
		  	<c:if test='${not editcompany.generic and not empty editcompany.imageExtension}'>
		  	<a target="_new" href="images/companies_orig_image/company_<c:out value='${editcompany.id}'/><c:out value='${editcompany.imageExtension}'/>">
				<img class="itemimage" src="images/companies_thumb_image/company_<c:out value='${editcompany.id}'/><c:out value='${editcompany.imageExtension}'/>"/>
			</a>
			</c:if>

		  	<c:url value="adminmanage.do" var="action">
		  		<c:param name="action" value="uploadCompanyPicture"/>
		  		<c:param name="companyId" value="${editcompany.id}"/>
	  		</c:url>
	  		<c:url value="adminmanage.do" var="removeaction">
		  		<c:param name="action" value="removeCompanyPicture"/>
		  		<c:param name="companyId" value="${editcompany.id}"/>
	  		</c:url>
			<c:if test="${not editcompany.generic}">
	  		<form name="uploadpictureform" action="<c:out value='${action}'/>" enctype="multipart/form-data" method="post" onSubmit="return checkUpload(this)">
	  		Use the "browse" button to select a picture file for upload.<br/>
				<span class="itemname">File:</span>
				<input name="companypicture" type="file" size="15" class="buttonitem"/>&nbsp;
				<input type="submit" value="upload picture" class="buttonitem"	/>&nbsp;
				<a href="<c:out value='${removeaction }'/>" class="editdel">remove picture</a>
			</form>
			</c:if>
		  	<%@ include file="managecompanyform.jsp" %>
		  	<br/>
		  	<table width="80%" cellspacing="0" cellpadding="0" border="0" class="projfiles" id="department" style="margin-top:10px;">
				<tbody>
					<tr>
						<th colspan="2">Company Departments</th>
					</tr>
					<c:forEach items="${editcompany.departments}" var="department" varStatus="status">
					<tr id="dept${department.id}" class="bground">
						<td class="itemthumb">${department.name}</td>
						<td class="itemthumb" style="text-align: right;">
							<img id="snake${department.id}" src="images/indicator.gif" style="visibility:hidden;"><a id="edit${department.id}" href="javascript:void(0);" onclick="editDepartment(document.getElementById('department'), document.getElementById('dept${department.id}'), ${department.id}, document.getElementById('snake${department.id}'))" class="editdel">edit</a>
							<span class="projdetails"> | </span>
							<a id="delete" href="javascript:void(0);" onclick="deleteDepartment(document.getElementById('department'), document.getElementById('dept${department.id}'), ${department.id})" class="editdel">delete</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<table width="80%" cellspacing="0" cellpadding="0" border="0" class="projfiles" style="margin-bottom:10px;">
				<tbody>
					<tr>
						<th colspan="2">Add a new department</th>
					</tr>
					<tr>
						<td class="itemthumb">Name:</td>
						<td>
							<form id="department_add" name="department_add">
								<input type="text" size="8" style="width:50%" class="item" name="name" id="name*" />
								<img style="visibility:hidden" name="indicator" src="images/indicator.gif" />
								<input type="button" class="item" name="submitb" onclick="addDepartment(document.getElementById('department_add'), ${editcompany.id}, document.getElementById('department'))" value="Add Department" />
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		  	<br />
		  	<c:if test="${not editcompany.generic}">
			<span class="itemname" style="display:block;margin-top:5px;">Pages:</span>
			<span id="pages${editcompany.id}">
				<span id="home${editcompany.id}" class="itemdescription" style="display:inline-block;padding-left:20px;margin-right:10px;"><a href=<c:if test="${editcompany.home ne null}">"adminhome.do?action=adminShowHome&homeId=${editcompany.home.id}"</c:if><c:if test="${editcompany.home eq null}">"adminhome.do?action=adminShowAllHome&companyId=${editcompany.id}"</c:if>>Home</a></span>
				<span id="contactUs${editcompany.id}" class="itemdescription" style="display:inline-block;padding-left:20px;margin-right:10px;"><a href=<c:if test="${editcompany.contactUs ne null}">"admincontactus.do?action=adminShowContactUs&contactusid=${editcompany.contactUs.id}"</c:if><c:if test="${editcompany.contactUs eq null}">"admincontactus.do?action=adminShowAllContactUs&companyId=${editcompany.id}"</c:if>>Contact Us</a></span>
				<span id="faqs${editcompany.id}" class="itemdescription" style="display:inline-block;padding-left:20px;margin-right:10px;"><a href="adminfaq.do?action=adminShowCompanyFaqs&companyId=${editcompany.id}">FAQs</a></span>
			</span>
			</c:if>
	  	</td>
	  </tr>
	</table>
	</div>
	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>This section list the details for the company.</li>
	</ul>
	</div>
	
	--><div id="messageadd"></div>
<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>