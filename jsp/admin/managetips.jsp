<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/buffer.js"></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<script language="JavaScript" type="text/javascript">
<!--
	function addTipsRow(table, tips)
	{
		var row = MyTable.createRow(table, -1, 'tr' + tips.id, "bground");
		var cells = MyTable.createCells(row, 2, '');
		
		cells[0].innerHTML = '&nbsp;';
		cells[0].className = 'thumb';
		
		cells[1].innerHTML = prepareTipsCol(tips);
		cells[1].className = 'itemthumb';
		cells[1].id = 'edit' + tips.id;
	}
	
	function prepareTipsCol(tip)
	{
		var buf = new Buffer();
		buf.append('<span class="formLabelText">Title:</span>\n');
		buf.append('<span class="projtitle">').append(tip.title).append('</span><br />\n');
		buf.append('<span class="formLabelText">Sort Order: </span>\n');
		buf.append('<span class="projtitle">').append(tip.sortOrder).append('</span><br />\n');
		buf.append('<span class="formLabelText">Show this tip for: </span>\n');
		buf.append('<span class="projtitle">').append(tip.showForValue).append('</span><br />\n');
		buf.append('<span class="formLabelText">Description:</span>\n');
		buf.append('<span class="projdetails">').append(tip.description).append('</span><br />\n');
		buf.append('<div align="right" valign="bottom">\n');
		buf.append('<img style="display:none;" src="images/indicator.gif" id="snake').append(tip.id).append('" />\n');
		buf.append('<a href="adminmanage.do?action=editTips&tipsid=').append(tip.id).append('" class="editdel">edit</a>\n');
		buf.append('<span class="projdetails">|</span>\n');
		buf.append('<a href="#" onclick="deleteTip(').append(tip.id).append(');" class="editdel">delete</a>\n');
		buf.append('</div>\n');
		return buf.toString();
	}
	
	function prepareUploadForm(id)
	{
		var buf = new Buffer();
		buf.append('Use the "browse" button to select a picture file for upload.<br />\n');
		buf.append('<form name="uploadpictureform" action="<c:url value="adminmanage.do"><c:param name="action" value="uploadTipPicture"/></c:url>');
		buf.append('&tipId=').append(id);
		buf.append('" enctype="multipart/form-data" method="post" onSubmit="return checkUpload(this)">\n');
		buf.append('<span class="formLabelText">File name: &nbsp</span><input name="tippicture" type="file" size="40">&nbsp;&nbsp;<br />\n');
		buf.append('<input type="submit" value="upload picture" />&nbsp;&nbsp;\n');
		buf.append('<input type="button" name="removepicture" value="remove picture" onclick="removeTipPicture(');
		buf.append(id).append(')" /></form><br />\n');
		return buf.toString();
	}
	
	function addNewTip(formed)
	{
		if (!MyForm.validate(formed))
			return;
		formed.snake.style.display = '';
		var tip = MyForm.getValues(formed);
		
		AdminManageAction.saveTip(tip,
			{
				callback:function(tip)
				{
					addTipsRow($('tiptable'), tip);
				  formed.snake.style.display = 'none';
					formed.reset();
				}
			}
		);
	}
	
	function deleteTip(id)
	{
		if (confirm('Are you sure you want to delete the Tip?'))
		{
			AdminManageAction.deleteTip(id, {
				callback:function(isDeleted)
				{
					if(isDeleted){
						MyTable.deleteRow('tiptable', 'tr' + id);
						//Element.remove("tr" + id);
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
	var editloading = false;
	var hasedit = false;
	
	function editTip(id)
	{
		if (editloading)
			return;
		if (hasedit)
		{
			currenteditform.focus();
			currenteditform.scrollIntoView();
			return;
		}
		editloading = true;
		var edit = $("edit" + id);
		var snake = $("snake" + id);
		snake.style.display = '';
		var editform = $('addinput').innerHTML;
		var upform = prepareUploadForm(id);
		
		AdminManageAction.getTip(id,
		{
			callback:function(tip)
			{
				snake.style.display = 'none';
				edit.innerHTML = editform + "<br />" + upform;
				var form = edit.getElementsByTagName('form')["tip"];
				MyForm.setValues(form, tip);
				currenteditform = form;

				form.submitb.value = "save";
				form.submitb.onclick = function() {saveEdit(edit, form, id)};
				form.cancelb.value = "cancel";
				form.cancelb.onclick = function() {hideEdit(edit, tip);};
				
				editloading = false;
				hasedit = true;
			}
		});
	}

	function saveEdit(edit, form, id)
	{
		if (!MyForm.validate(form))
			return;
		
		if (form.snake)
			form.snake.style.display = '';
		
		var tip = MyForm.getValues(form);

		AdminManageAction.updateTip(tip, id, 
		{
			callback:function(tip)
			{
				if (tip != null)
				{
					if (form.snake)
						form.snake.style.display = 'none';
					hideEdit(edit, tip);
				}
			}
		});
	}
	
	function hideEdit(edit, tip)
	{
		edit.innerHTML = prepareTipsCol(tip);
		hasedit = false;
		currenteditform = null;
	}
	
	function checkUpload(theForm)
	{
		var filename = theForm.productpicture.value.toUpperCase();
	
		if(filename == "")
		{
			theForm.productpicture.focus();
			alert("Please specify a file for upload.");
			return false;
		}
		else if((filename.indexOf(".JPG") < (filename.length - (4)))
			&& (filename.indexOf(".JPEG") < (filename.length - (5))))
		{
			theForm.productpicture.focus();
			alert("Please specify a file in JPG format.");
			return false;
		}
		else
		{
			return true;
		}
	}
	
	function removeTipPicture(id)
	{
		window.location.href = '<c:url value="adminmanage.do"><c:param name="action" value="removeTipPicture"/></c:url>' + "&tipId=" + id;
	}
//-->
</script>

<body>
<c:set var="menu" value="manage"/>
<c:set var="submenu" value="tips"/>
<c:set var="pagemessage" value="You can add, update and delete the information for the individual Tips items here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="tiptable" class="projfiles">
	  <tr>
	   <th colspan="2">
		<img src="images/admin/wand.png" width="16" height="16" border="0"> TIPS DETAILS
	   </th>
	  </tr>	
	  <c:forEach items="${tips}" var="tip" varStatus="counter">  
		<tr id="tr<c:out value='${tip.id}'/>" class="bground">
			<td class="thumb">
			<c:if test='${not empty tip.imageExtension}'>
				<a target="_new" href="images/tips_orig_image/tip_<c:out value='${tip.id}'/><c:out value='${tip.imageExtension}'/>">
				<img class="itemimage" src="images/tips_thumb_image/tip_<c:out value='${tip.id}'/><c:out value='${tip.imageExtension}'/>"/>
				</a>
			</c:if><c:if test='${empty tip.imageExtension}'>&nbsp;</c:if></td>
		  <td class="itemthumb" id="edit<c:out value='${tip.id}'/>">
		  	<span class="formLabelText">Title:</span>
				<span class="projtitle"><c:out value='${tip.title}' /></span><br />
				<span class="formLabelText">Sort Order: </span>
				<span class="projtitle"><c:out value='${tip.sortOrder}'/></span><br />
				<span class="formLabelText">Show this tip for: </span>
				<span class="projtitle"><c:out value='${tip.showForValue}'/></span><br />
				<span class="formLabelText">Description:</span>
				<span class="projdetails"><c:out value='${tip.description}' escapeXml="false" /></span><br />
				<div align="right" valign="bottom">
					<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${tip.id}'/>" />
					<a href="adminmanage.do?action=editTips&tipsid=<c:out value='${tip.id}'/>" class="editdel">edit</a>
					<span class="projdetails">|</span>
					<a href="javascript:void(0);" onclick="deleteTip(<c:out value='${tip.id}'/>);" class="editdel">delete</a>
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
	<li>We can list here the tips and advices that will be helpful to our web users.</li>
	</ul>
	</div>
	
	--><div id="messageadd"><br>
	<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%">
		<tr>
			<td colspan="6">
				<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
					<tr>
						<th>
							<img src="images/admin/add.png" width="16" height="16" border="0"> Add A New Tip Item
						</th>
					</tr>
					<tr class="bground">
						<td class="itemthumb">
							<span id="addinput">
							<%@ include file="managetipsform.jsp"%>
							</span>
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