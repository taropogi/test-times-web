<%@ include file="../includes/adminheader.jsp"%>

<c:set var="pageName" value="productbrands" />

<script type='text/javascript' src='dwr/interface/AdminProductAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/buffer.js"></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<script language="javascript">
<!--
	function addBrandRow(table, brand)
	{
		var row = MyTable.createRow(table, -1, 'tr' + brand.id, "bground");
		var cells = MyTable.createCells(row, 2, '');
		
		cells[0].innerHTML = '&nbsp;';
		cells[0].className = 'thumb';
		
		cells[1].innerHTML = prepareBrandCol(brand);
		cells[1].className = 'itemthumb';
		cells[1].id = 'edit' + brand.id;
	}
	
	function prepareBrandCol(brand)
	{
		var buf = new Buffer();
		buf.append('<span class="itemname">Name:</span>\n');
		buf.append('<span class="itemdescription">').append(brand.name).append('</span><br />\n');
		buf.append('<span class="itemname">Description:</span>\n');
		buf.append('<span class="itemdescription">').append(brand.description).append('</span><br />\n');
		buf.append('<div align="right" valign="bottom">\n');
		buf.append('<img style="display:none;" src="images/indicator.gif" id="snake').append(brand.id).append('" />\n');
		buf.append('<a class="editdel" href="javascript:void(0)" onclick="editBrand(').append(brand.id).append(');">edit</a>\n');
		buf.append('<span class="projdetails">|</span>\n');
		buf.append('<a class="editdel" href="javascript:void(0)" onclick="deleteBrand(').append(brand.id).append(');">delete</a>\n');
		buf.append('</div>');
		return buf.toString();
	}
	
	function prepareUploadForm(id)
	{
		var buf = new Buffer();

		buf.append('<form name="uploadbrandform" action="');
		buf.append('<c:url value="adminproduct.do"><c:param name="action" value="uploadBrandPicture"/></c:url>');
		buf.append('&brandid=').append(id).append('" enctype="multipart/form-data" method="post" onSubmit="return checkUpload(this)">');
		buf.append('Use the "browse" button to select a picture file for upload.<br />');
		buf.append('<span class="itemname">File: </span><input name="brandpicture" type="file" size="10" class="buttonitem">&nbsp;');
		buf.append('<input type="submit" value="upload" class="buttonitem"/>&nbsp;');
		buf.append('<input type="button" onclick="javascript: removeBrandPicture(').append(id).append(')" value="remove photo" class="buttonitem"/>');
		buf.append('</form>\n');
		return buf.toString();
	}

	function addNewBrand(theform){
		if (!MyForm.validate(theform))
			return;
		
		theform.snake.style.display = '';
		var brand = MyForm.getValues(theform);
		
		AdminProductAction.saveNewBrand(brand, {
			callback:function(newBrand){

				addBrandRow($('brandtable'), newBrand);
				theform.reset();
				theform.snake.style.display = 'none';
			}
		});
	}
		
	function deleteBrand(id){
		if (confirm('Are you sure you want to delete the BRAND?')){
					AdminProductAction.deleteBrand(id,{
					callback:function(isDeleted){
									if(isDeleted){
										MyTable.deleteRow("brandtable", "tr" + id);
										//Element.remove("tr"+id);
										//Effect.SlideUp("tr"+id,{duration: 0.4, fps: 100});
									}
									else{
										alert('Error deleting brand!');
									}
								}
					});
			return true;
		}
		else{
			return false;
		}
	}
	
	var hasedit = false;
	var editloading = false;
	var currenteditform;
	
	function editBrand(id)
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
		var uploadform = prepareUploadForm(id);
				
		AdminProductAction.getBrand(id, 
		{
			callback:function(brand)
			{
				snake.style.display = 'none';
				edit.innerHTML = uploadform + editform;
				// var form = edit.getElementsByTagName('form')["brand"];

				var form = document.getElementById('brandform');
				
				currenteditform = form;
				MyForm.setValues(form, brand);
				
				form.submitb.value = "save";
				form.submitb.onclick = function() {saveEdit(edit, form, id);};
				form.cancelb.value = "cancel";
				form.cancelb.onclick = function() {hideEdit(edit, brand);};
				
				hasedit = true;
				editloading = false;
			}
		});
	}
	
	function saveEdit(edit, form, id)
	{
		if (!MyForm.validate(form))
			return;
		
		form.snake.style.display = '';
		var gbrand = MyForm.getValues(form);
		gbrand.id = id;
			
		AdminProductAction.updateBrand(gbrand, 
		{
			callback:function(brand)
			{
				form.snake.style.display = 'none';
				hideEdit(edit, brand);
			}
		});
	}
	
	function hideEdit(edit, brand)
	{
		edit.innerHTML = prepareBrandCol(brand);
		currenteditform = null;
		hasedit = false;
	}
	
	function checkUpload(theForm)
	{
	
		var filename = theForm.brandpicture.value.toUpperCase();
	
		if(filename == "")
		{
			theForm.brandpicture.focus();
			alert("Please specify a file for upload.");
			return false;
		}
		else if((filename.indexOf(".JPG") < (filename.length - (4)))
			&& (filename.indexOf(".JPEG") < (filename.length - (5))))
		{
			theForm.brandpicture.focus();
			alert("Please specify a file in JPG format.");
			return false;
		}
		else
		{
			return true;
		}
	}
	
	function removeBrandPicture(id)
	{
		if(confirm("Are you sure you want to remove the picture?")){
			window.location.href = '<c:url value="adminproduct.do"><c:param name="action" value="removeBrandPicture"/></c:url>' + "&brandid=" + id;
		}
	}

	var newWindow = '';
	function popitup(url) {
		if (newWindow.location && !newWindow.closed) {
			newWindow.location.href = url;
			newWindow.focus(); }
		else {
			newWindow=window.open(url,'htmlname','width=404,height=316,resizable=1');}
	}
//-->
</script>

<body>

<c:set var="menu" value="products"/>
<c:set var="submenu" value="brands"/>
<c:set var="pagemessage" value="You can add, update and delete the different product brands here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
 	 <tr>
   <td align="left" valign="top">
		<table id="brandtable" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
		  <tr>
		   <th colspan="2">
			<img src="images/admin/tag_purple.png" width="16" height="16" border="0"> BRAND DETAILS
		   </th>
		  </tr>	
		  <c:forEach items="${productbrands}" var="brand" varStatus="counter">
			<tr class="bground" id="tr<c:out value='${brand.id}'/>">
				<td class="thumb">
				<c:if test='${not empty brand.imageExtension}'>
					<a href="javascript:popitup('images/brand_orig_image/brand_<c:out value='${brand.id}'/><c:out value='${brand.imageExtension}'/>')" >
					<img class="itemimage" src="images/brand_thumb_image/brand_<c:out value='${brand.id}'/><c:out value='${brand.imageExtension}'/>"/>
					</a>
				</c:if>
				</td>
				<td class="itemthumb" id="edit<c:out value='${brand.id}'/>">
					<span class="itemname">Name:</span>
					<span class="itemdescription"><c:out value='${brand.name}' /></span><br />
					<span class="itemname">Description:</span>
					<span class=""><c:out value='${brand.description}' escapeXml="false"/></span><br />
					<span class="itemname">Hidden:</span>
					<span class="itemdescription"><c:out value='${brand.isHidden}' /></span><br />
					<span class="itemname">Sort Order:</span>
					<span class="itemdescription"><c:out value='${brand.sortOrder}' /></span><br />
					<div align="right" valign="bottom">
						<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${brand.id}'/>" />
						<a class="editdel" href="javascript:void(0)" onclick="editBrand(<c:out value='${brand.id}'/>);">edit</a>
						<%-- <a class="editdel" href="adminproduct.do?action=editBrand&brandId=${ brand.id }">edit</a> --%>
						<span class="projdetails">|</span>
						<a class="editdel" href="javascript:void(0)" onclick="deleteBrand(<c:out value='${brand.id}'/>);">delete</a>
					</div>
				</td>	   
		  </tr> 	
	  	</c:forEach>
	  	<tr style="display: none" id="inserthere"><td colspan="2">&nbsp</tr>
		</table>
		</td>
   	<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
  	</tr>
	</table>		
	</div>
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>Be sure to tag each product with its brand.</li>
	<li>It would be best to have a logo picture for each brand item.</li>
	</ul>
	</div>

	
	--><div id="messageadd">
	<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%">
		<tr>
			<td>
			<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
				<tr>
					<th>
						<img src="images/admin/add.png" width="16" height="16" border="0"> Add A New Brand Item
					</th>
				</tr>
				<tr class="bground">
				<td class="itemthumb">
					<span id="addinput">
					<%@ include file="adminproductbrandsform.jsp"%>
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