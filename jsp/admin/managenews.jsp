<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script type="text/javascript" src="javascripts/scriptaculous.js"></script>
<script type="text/javascript" src="javascripts/buffer.js"></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<script language="JavaScript" type="text/javascript">
<!--
	function addNewsRow(table, news)
	{
		var row = MyTable.createRow(table, -1, 'tr' + news.id, "bground");
		var cells = MyTable.createCells(row, 2, '');
		
		cells[0].innerHTML = '&nbsp;';
		cells[0].className = 'thumb';
		
		cells[1].innerHTML = prepareNewsCol(news);
		cells[1].className = 'itemthumb';
		cells[1].id = 'edit' + news.id;
	}
	
	function prepareNewsCol(news)
	{
		var buf = new Buffer();
		buf.append('<span class="formLabelText">Title:</span>\n');
		buf.append('<span class="projtitle">').append(news.title).append('</span><br />\n');
		buf.append('<span class="formLabelText">Sub title:</span>\n');
		buf.append('<span class="projinfo">').append(news.subtitle).append('</span><br />\n');
		buf.append('<span class="formLabelText">Body:</span>\n');
		buf.append('<span class="projdetails">').append(news.body).append('</span><br />\n');
		buf.append('<div align="right" valign="bottom">\n');
		buf.append('<img style="display:none;" src="images/indicator.gif" id="snake').append(news.id).append('" />\n');
		buf.append('<a href="adminmanage.do?action=editNews&newsid=').append(news.id).append('" class="editdel">edit</a>\n');
		buf.append('<span class="projdetails">|</span>\n');
		buf.append('<a href="javascript:void(0)" onclick="deleteNews(').append(news.id).append(');" class="editdel">delete</a>\n');
		buf.append('</div>\n');
		return buf.toString();
	}
	
	function prepareUploadForm(id)
	{
		var buf = new Buffer();
		buf.append('Use the "browse" button to select a picture file for upload.<br />\n');
		buf.append('<form name="uploadpictureform" action="<c:url value="adminmanage.do"><c:param name="action" value="uploadNewsPicture"/></c:url>');
		buf.append('&newsId=').append(id);
		buf.append('" enctype="multipart/form-data" method="post" onSubmit="return checkUpload(this)">\n');
		buf.append('<span class="formLabelText">File name:</span><input name="newspicture" type="file" size="40">&nbsp;&nbsp;<br />\n');
		buf.append('<input type="submit" value="upload picture" />&nbsp;&nbsp;\n');
		buf.append('<input type="button" name="removepicture" value="remove picture" onclick="removeNewsPicture(');
		buf.append(id).append(')" /></form><br />\n');
		return buf.toString();
	}
	
	function addNewNews(formed)
	{
		if (!MyForm.validate(formed))
			return;
		formed.snake.style.display = '';
		var newsa = MyForm.getValues(formed);
		
		AdminManageAction.saveNews(newsa,
			{
				callback:function(news)
				{
					addNewsRow($('newstable'), news);
					formed.snake.style.display = 'none';
					formed.reset();
				}
			}
		);
	}
	
	function deleteNews(id)
	{
		if (confirm('Are you sure you want to delete the News?'))
		{
			
			var snakeid = "snake" + id;
			var snake = $(snakeid);
			
			snake.style.display = '';
			AdminManageAction.deleteNews(id, {
				callback:function(isDeleted)
				{
					snake.style.display = 'none';
					if(isDeleted){
						MyTable.deleteRow('newstable', 'tr' + id);
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
	var hasedit = false;
	var editloading = false;
	
	function editNews(id)
	{
		if (editloading)
			return;
		if (hasedit)
		{
			currenteditform.focus();
			currenteditform.scrollIntoView();
			return;
		}
		var edit = $("edit" + id);
		var snake = $("snake" + id);
		var editform = $('addinput').innerHTML;
		var upform = prepareUploadForm(id);
		
		snake.style.display = '';
		
		AdminManageAction.getNews(id, 
		{
			callback:function(news)
			{
				snake.style.display = 'none';
				edit.innerHTML = editform + "<br />" + upform;
				var form = edit.getElementsByTagName('form')["news"];
				currenteditform = form;
				MyForm.setValues(form, news);
				
				form.submitb.value = "save";
				form.submitb.onclick = function() {saveEdit(edit, form, id)};
				form.cancelb.value = "cancel";
				form.cancelb.onclick = function() {hideEdit(edit, news);};
				
				hasedit = true;
				editloading = false;
			}
		});
	}
	
	function saveEdit(edit, form, id)
	{
		if (!MyForm.validate(form))
			return;
		
		if (form.snake)
			form.snake.style.display = '';
		
		var news = MyForm.getValues(form);
		
		AdminManageAction.updateNews(news, id, {
				callback:function(snow)
				{
					if (snow != null)
					{
						if (form.snake)
							form.snake.style.display = 'none';
							
						hideEdit(edit, snow);
					}
				}
			}
		);
	}
	
	function hideEdit(edit, news)
	{
		edit.innerHTML = prepareNewsCol(news);
		hasedit = false;
		currenteditform = null;
	}
	
	function checkUpload(theForm)
	{
		var filename = theForm.newspicture.value.toUpperCase();
	
		if(filename == "")
		{
			theForm.newspicture.focus();
			alert("Please specify a file for upload.");
			return false;
		}
		else if((filename.indexOf(".JPG") < (filename.length - (4)))
			&& (filename.indexOf(".JPEG") < (filename.length - (5))))
		{
			theForm.newspicture.focus();
			alert("Please specify a file in JPG format.");
			return false;
		}
		else
		{
			return true;
		}
	}
	
	function removeNewsPicture(id)
	{
		window.location.href = '<c:url value="adminmanage.do"><c:param name="action" value="removeNewsPicture"/></c:url>' + "&newsId=" + id;
	}
//-->
</script>

<body>
<c:set var="menu" value="manage"/>
<c:set var="submenu" value="news"/>
<c:set var="pagemessage" value="You can add, update and delete the information for the individual News items here."/>

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
	   <th colspan="2">
	   <img src="images/admin/world.png" width="16" height="16" border="0"> NEWS DETAILS
	   </th>
	  </tr>	
	  <c:forEach items="${news}" var="swen" varStatus="counter">  
		<tr id="tr<c:out value='${swen.id}'/>" class="bground">
			<td class="thumb">
			<c:if test='${not empty swen.imageExtension}'>
				<a target="_new" href="images/news_orig_image/news_<c:out value='${swen.id}'/><c:out value='${swen.imageExtension}'/>">
				<img class="itemimage" src="images/news_thumb_image/news_<c:out value='${swen.id}'/><c:out value='${swen.imageExtension}'/>"/>
				</a>
			</c:if>
			<c:if test='${empty swen.imageExtension}'>&nbsp</c:if></td>
		  <td class="itemthumb" id="edit<c:out value='${swen.id}'/>">
		  	<span class="formLabelText">Title:</span>
				<span class="projtitle"><c:out value='${swen.title}' /></span><br />
				<span class="formLabelText">Sub title:</span>
				<span class="projinfo"><c:out value='${swen.subtitle}' /></span><br />
				<span class="formLabelText">Sort Order:</span>
				<span class="projinfo"><c:out value='${swen.sortOrder}' /></span><br />
				<span class="formLabelText">Body:</span>
				<span class="projdetails"><c:out value='${swen.body}' escapeXml='false'/></span><br />
				<div align="right" valign="bottom">
					<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${swen.id}'/>" />
					<a href="adminmanage.do?action=editNews&newsid=<c:out value='${swen.id}'/>" class="editdel">edit</a>
					<span class="projdetails">|</span>
					<a href="javascript:void(0)" onclick="deleteNews(<c:out value='${swen.id}'/>);" class="editdel">delete</a>
				</div>
	  	</td>	   
	  </tr> 	
	  </c:forEach>
	  <!--<tr style="display: none" id="inserthere"></tr>-->
	</table>
	</div>	

	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>This section lists the news and activities for the company.</li>
	</ul>
	</div>

	--><div id="messageadd"><br />
	<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%">
		<tr>
			<td colspan="6">
				<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
					<tr>
						<th>
							<img src="images/admin/add.png" width="16" height="16" border="0"/> Add A News Item
						</th>
					</tr>
					<tr class="bground">
						<td class="itemthumb">
							<span id="addinput">
							<%@ include file="managenewsform.jsp"%>
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