<%@ include file="../includes/adminheader.jsp"%>

<link type="text/css" rel="stylesheet" href="css/calendar-blue.css" />

<script type="text/javascript" src="javascripts/calendar.js"></script>
<script type="text/javascript" src="javascripts/calendar-en.js"></script>
<script type="text/javascript" src="javascripts/calendar-setup.js"></script>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>

<script language="JavaScript" type="text/javascript">
<!--
	var col1 = '<span class="itemname">position:</span> <span class="itemdescription">';
	var col2 = '<span class="itemname">description:</span> <span class="itemdescription">';
	var col3 = '<span class="itemname">valid until:</span> <span class="itemdescription">';
	var colterm = '</span><br>';
	
	var linkSnakeA = '<img style="display:none;" src="images/indicator.gif" id="snake';
	var linkSnakeB = '">';
	
	var linkEditDelStart = '<a class="errormsg" href="javascript:void(0)" ';
	var linkEditEnd = 'edit</a>';
	var linkDelEnd = 'delete</a>';
	var linkEditDelSep = '\n<span class="projdetails">|</span>\n';
	var linkDiv = '<div align="right" valign="bottom">';
	var linkDivEnd = '</div>';

	var tda = '<td class="itemthumb">';
	var tdb = '</td>';
	
	var newItemBegin = "<tr class='bground'"; // id will be inserted after this
	var newItemEnd = "</tr>";

	function Career()
	{
		this.position = "";
		this.description = "";
		this.validUntilStr = "";
	}
	
	function getCareerInput(formed)
	{
		var career = new Career();
		career.position = formed.position.value;
		career.description = FCKeditorAPI.GetInstance('description_FCK').GetXHTML(true);
		career.validUntilStr = formed.validUntil.value;
		return career;
	}
	
	function copyCareerForm(formed, tip)
	{
		formed.position.value = getStr(tip.position);
		// formed.description_FCK.value = getStr(tip.description);
		FCKeditorAPI.GetInstance('description_FCK').SetHTML(tip.description);
		formed.validUntil.value = getStr(tip.validUntilStr);
	}
	
	var datere = /^\d+\/\d+\/\d+$/;
	function checkInput(formed)
	{
		var valid = formed.validUntil.value;
		if (valid == '' || valid.match(datere) == null)
		{
			alert("Please enter a date");
			formed.validUntil.setFocus();
			return false;
		}
		return true;
	}
	
	function prepareCareerColumn(buf, career)
	{
		buf.append(col1).append(career.position).append(colterm);
	  buf.append(col2).append(career.description).append(colterm);
	  buf.append(col3).append(career.validUntilPrint).append(colterm);
	  buf.append(linkDiv);
	  buf.append(linkSnakeA).append(career.id).append(linkSnakeB);
	  buf.append(linkEditDelStart).append('onclick="editCareer(').append(career.id).append(');">').append(linkEditEnd).append(linkEditDelSep);
	  buf.append(linkEditDelStart).append('onclick="deleteCareer(').append(career.id).append(');">').append(linkDelEnd);
	  buf.append(linkDivEnd);
	}
	
	function addNewCareer(formed)
	{
		if (!checkInput(formed))
			return;
		formed.snake.style.display = '';
		var car = getCareerInput(formed);
		
		AdminManageAction.saveCareer(car,
			{
				callback:function(car)
				{
						var buf = new Buffer();
						
						buf.append(newItemBegin).append('id="tr').append(car.id).append('">');
						buf.append(tda);
						prepareCareerColumn(buf, car);
						buf.append(tdb);
						buf.append(newItemEnd);
	
					  new Insertion.Before('inserthere', buf.toString());
						formed.snake.style.display = 'none';
						formed.reset();
				}
			}
		);
	}
	
	function deleteCareer(id)
	{
		if (confirm('Are you sure you want to delete the Career?'))
		{
			AdminManageAction.deleteCareer(id, {
				callback:function(isDeleted)
				{
					if(isDeleted){
						Element.remove("tr" + id);
						//Effect.SlideUp("tr"+id,{duration: 0.4, fps: 100});
					}
					else{
						alert('Error deleting news!');
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
	
	var currenteditform;
	var hasedit = false;
	
	function editCareer(id)
	{
		if (hasedit)
		{
			currenteditform.focus();
			currenteditform.scrollIntoView();
			return;
		}
		
		var trid = "tr" + id;
		var row = $(trid);
		
		
		var snakeid = "snake" + id;
		var snake = $(snakeid);
		
		snake.style.display = '';
		
		var edid = "edit" + id;
		var innerml = $('addinput').innerHTML;
		var uploadform = '';
		
		//alert(uploadform);
		
		new Insertion.After(trid, '<tr id="' + edid + '"><td colspan="2">' + uploadform
														  + innerml + '</td></tr>');
		
		var edititem = $(edid);
		edititem.style.display = "none";
		edititem.className = row.className;
		// There must be only one form inside the catedit
		var formed = edititem.getElementsByTagName('form')[0];
		
		//set the form
		AdminManageAction.getCareer(id, {
				callback:function(car)
				{
					// now we set the variables
					copyCareerForm(formed, car);
					
					row.style.display = "none";
					snake.style.display = 'none';
					edititem.style.display='';
		
					currenteditform = formed;
					hasedit = true;
				}
			}
		);
		
		var validId = "valid" + id;
		var triggerId = "trigger" + id;
		formed.validUntil.id = validId;
		formed.trigger.id = triggerId;
		
		Calendar.setup(
			{
						inputField: validId,
						ifFormat : "%m/%e/%Y", // the date format
						button : triggerId // ID of the button
			}
		);
		
		formed.submitb.value = "save";
		formed.submitb.onclick = function() {saveEdit(trid, edid, formed, id)};
		formed.cancelb.onclick = function() {cancelEdit(trid, edid);};
	}
	
	function saveEdit(trid, edid, formed, id)
	{
		if (formed.snake)
			formed.snake.style.display = '';
		var car = getCareerInput(formed);
		
		AdminManageAction.updateCareer(car, id, {
				callback:function(car)
				{
					if (car != null)
					{
						var buf = new Buffer();
						buf.append(newItemBegin).append('id="').append(trid).append('">');
						buf.append(tda);
						prepareCareerColumn(buf, car);
						buf.append(tdb);
						buf.append(newItemEnd);
						
						var row = $(trid);
						var color = row.bgColor;
						
						Element.remove(trid);
						new Insertion.Before(edid, buf.toString());
						if (formed.snake)
							formed.snake.style.display = 'none';
						hideEdit(trid, edid);
					}
				}
			}
		);
	}
	
	function cancelEdit(trid, edid)
	{
		hideEdit(trid, edid);
	}
	
	function hideEdit(trid, edid)
	{
		hasedit = false;
		currenteditform = null;
		var row = $(trid);
		row.style.display = '';
		Element.remove(edid);
	}
//-->
</script>

<body<c:if test='${not empty editProductItem}'> onload="editProduct(<c:out value='${editProductItem}'/>)"</c:if>>
<c:set var="menu" value="manage"/>
<c:set var="submenu" value="careers"/>
<c:set var="pagemessage" value="You can add, update and delete the information for the individual Career items here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
	  <tr>
	  	<br />

		<c:if test="${not empty careersHeader}">
			<img src="${careersHeader}" />
		</c:if>
	  	<br />
	  	
	  	<form method="post" action="careers.do?action=uploadCareerHeader" enctype="multipart/form-data">
	  		<input type="file" name="file" />
	  		<input type="submit" value="Upload Careers Header" />
	  	</form>
	  	
	  	<br />
	  	<br />
	  </tr>
	  <tr>
	   <th colspan="2">
	   <img src="images/admin/rainbow.png" width="16" height="16" border="0"> CAREER DETAILS
	   </th>
	  </tr>	
	  <c:forEach items="${careers}" var="career" varStatus="counter">  
		<tr id="tr<c:out value='${career.id}'/>" class="bground">
		  <td class="itemthumb">
				<span class="itemname">position: </span>
				<span class="itemdescription"><c:out value='${career.position}' /></span>&nbsp;&nbsp;&nbsp;
				<%--
				<span class="itemname">description: </span>
				<span class="projdetails"><c:out value='${career.description}' /></span><br>
				 --%>
				<span class="itemname">valid until: </span>
				<span class="itemdescription"><c:out value='${career.validUntilPrint}' /></span><br>
				<div align="right" valign="bottom">
					<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${career.id}'/>" />
					<a href="javascript:void(0)" onclick="editCareer(<c:out value='${career.id}'/>);" class="errormsg">edit</a>
					<span class="projdetails">|</span>
					<a href="javascript:void(0)" onclick="deleteCareer(<c:out value='${career.id}'/>);" class="errormsg">delete</a>
				</div>
	  	</td>	   
	  </tr> 	
	  </c:forEach>
	  <tr style="display: none" id="inserthere"></tr>
	</table>
	</div>	

	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>We can show here the open positions in the company.</li>
	<li>Be sure to list detailed qualifications for the various positions listed.</li>
	<li>The Career Item will be automatically removed from the web site after the valid date.</li>
	</ul>
	</div>

	
	--><div id="messageadd"><br>
	<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%">
		<tr>
			<td colspan="6">
				<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
					<tr>
					<th>
						<img src="images/admin/add.png" width="16" height="16" border="0"> Add A New Career Item
					</th>
					</tr>
					<tr class="bground">
					<td class="itemthumb">
						<span id="addinput">
							<%@ include file="managecareersform.jsp"%>
						</span>
						<script language="JavaScript">
						Calendar.setup(
							{
								inputField: "validadd",
								ifFormat : "%m/%e/%Y", // the date format
								button : "trigadd" // ID of the button
							}
						);
						</script>
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