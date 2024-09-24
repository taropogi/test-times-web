function addProductRow(table, prod)
{
	var row = MyTable.createRow(table, -1, 'tr' + prod.id, "bground");
	var cells = MyTable.createCells(row, 2, '');
	
	cells[0].innerHTML = '&nbsp;';
	cells[0].className = 'thumb';
	
	cells[1].innerHTML = prepareProductCol(prod);
	cells[1].className = 'itemthumb';
	cells[1].id = 'edit' + prod.id;
}

function prepareProductCol(product)
{
	var buf = new Buffer();
	
	buf.append('<span id="uploadform_').append(product.id).append('" style="display:none"></span>\n');
	
	buf.append('<form id="product_').append(product.id).append('" name="product_').append(product.id).append('">\n');
	
	buf.append('<span class="itemname">Highlight this product: </span>\n');
	buf.append('<span class="itemdescription" id="highlight_').append(product.id).append('">\n');
	if (product.highlight)
		buf.append('Yes');
	else
		buf.append('No');
	buf.append('</span><br />\n');
	
	buf.append('<span style="display:none;">');
	buf.append('<span class="itemname">This product is contracted: </span>\n');
	buf.append('<span class="itemdescription" id="isContracted_').append(product.id).append('">\n');
	if (product.isContracted)
		buf.append('Yes');
	else
		buf.append('No');
	buf.append('</span><br />\n');
	buf.append('</span>');
	
	buf.append('<span class="itemname">This product is shown only to added companies: </span>\n');
	buf.append('<span class="itemdescription" id="isShownOnlyToAddedCompany_').append(product.id).append('">\n');
	if (product.isShownOnlyToAddedCompany)
		buf.append('Yes');
	else
		buf.append('No');
	buf.append('</span><br />\n');
	
	buf.append('<span class="itemname">This product is out of stock: </span>\n');
	buf.append('<span class="itemdescription" id="isOutOfStock_').append(product.id).append('">\n');
	if (product.isOutOfStock)
		buf.append('Yes');
	else
		buf.append('No');
	buf.append('</span><br />\n');
	
	buf.append('<span class="itemname">Grouping:</span>\n');
	buf.append('<span class="itemdescription" id="groupingId_').append(product.id).append('">').append(product.groupingName).append('</span><br />\n');
	
	buf.append('<span class="itemname">Brand:</span>\n');
	buf.append('<span class="itemdescription" id="brandId_').append(product.id).append('">').append(product.brandName).append('</span><br />\n');
	
	buf.append('<span class="itemname">Name:</span>\n');
	buf.append('<span class="itemdescription" id="name_').append(product.id).append('">').append(product.name).append('</span><br />\n');
	
	buf.append('<span class="itemname">Description:</span>\n');
	buf.append('<span class="itemdescription" id="description_').append(product.id).append('">').append(product.description).append('</span><br />\n');
	
	buf.append('<span class="itemname">Code: </span>\n');
	buf.append('<span class="itemdescription" id="code_').append(product.id).append('">').append(product.code).append('</span><br />\n');
	
	buf.append('<span class="itemname">Unique Item Code: </span>\n');
	buf.append('<span class="itemdescription" id="uniqueItemCode_').append(product.id).append('">').append(product.uniqueItemCode).append('</span><br />\n');
	
	buf.append('<span class="itemname">Company Item Code: </span>\n');
	buf.append('<span class="itemdescription" id="companyItemCode_').append(product.id).append('">').append(product.companyItemCode).append('</span><br />\n');
	
	buf.append('<span class="itemname">UOFM: </span>\n');
	buf.append('<span class="itemdescription" id="UOFM_').append(product.id).append('">').append(product.UOFM).append('</span><br />\n');
	
	buf.append('<span class="itemname">Price: </span>\n');
	buf.append('<span class="itemdescription" id="price_').append(product.id).append('">').append(product.price).append('</span><br />\n');

	buf.append('<div align="left" valign="bottom">\n');
	/*for(var i=0; i<product.companyProducts.length; i++)	{
		buf.append('<a href=\"adminproduct.do?action=adminCompanyProduct&productid=').append(product.companyProducts[i].id);
					
		buf.append("<c:if test='${not empty grpid}'>grpid=<c:out value='${grpid}'/></c:if>&page=<c:out value='${currentpage}'/>&itempage=<c:out value='${itempage}'/>&mode=edit\" class='editdel'>").append(product.companyProducts[i].company.name);
		
		if(i!=product.companyProducts.length-1){
			buf.append("</a><span class='projdetails'>| </span>");
		}
	}*/
	buf.append('</div>');

	buf.append('<div align="right" valign="bottom">\n');
	buf.append('<img style="display:none;" src="images/indicator.gif" id="snake').append(product.id).append('" />\n');
	buf.append('<a href="javascript:void(0)" onclick="editProduct(').append(product.id).append(');" class="editdel" id="edit_').append(product.id).append('">edit</a>\n');
	buf.append('<span class="projdetails">|</span>\n');
	buf.append('<a href="javascript:void(0)" onclick="deleteProduct(').append(product.id).append(');" class="editdel" id="del_').append(product.id).append('">delete</a>\n');
	buf.append('<span class="projdetails">|</span>\n');
	buf.append('<a href="adminproduct.do?action=adminCompanyProduct&productid=').append(product.id).append('<c:if test='${not empty grpid}'>&grpid=<c:out value='${grpid}'/></c:if>&page=<c:out value='${currentpage}'/>&itempage=<c:out value='${itempage}'/>&mode=add" class="editdel">add company</a>\n');
	buf.append('</div>\n');
	
	return buf.toString();
}

function prepareUploadForm(id)
{
	var buf = new Buffer();

	buf.append('<form name="uploadpictureform" action="');
	buf.append('<c:url value="adminproduct.do"><c:param name="action" value="uploadProductPicture"/><c:if test='${not empty grpid}'><c:param name="grpid" value="${grpid}"/></c:if><c:param name="page" value='${currentpage}' /><c:param name="itempage" value='${itempage}'/></c:url>');
	buf.append('&prodid=').append(id).append('" enctype="multipart/form-data" method="post" onSubmit="return checkUpload(this)">\n');
	buf.append('Use the "browse" button to select a picture file for upload.<br/>\n');
	buf.append('<span class="itemname">File:</span>\n');
	buf.append('<input class="buttonitem" name="productpicture" type="file" size="10" class="buttonitem">&nbsp;\n');
	buf.append('<input class="buttonitem" type="submit" value="upload" class="buttonitem"/>&nbsp;\n');
	buf.append('<input class="buttonitem" type="button" class="buttonitem" onclick="removeProductPicture(');
	buf.append(id).append(');" value="remove photo"/>\n').append('</form>\n<br />\n');
	return buf.toString();
}

function addNewProduct(formed)
{
	if (!MyForm.validate(formed))
		return;
				
	formed.snake.style.display = '';
	
	var prod = MyForm.getValues(formed);
	
	AdminProductAction.saveNewProduct(prod, 
		{
			callback:function(newprod)
			{
				addProductRow($("productTable"), newprod);

				formed.snake.style.display = 'none';
				formed.reset();
			},
			errorHandler: function(errorString, exception)
			{
				alert(errorString);
				form.snake.style.visibility = 'hidden';
			}
		}
	);
}

function deleteProduct(id)
{
	if (confirm('Are you sure you want to delete the Product?'))
	{
		AdminProductAction.deleteProduct(id,{
			callback:function(isDeleted)
			{
				if(isDeleted){
					MyTable.deleteRow('productTable', 'tr' + id);
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

var fields = new Array('highlight', 'isContracted', 'isShownOnlyToAddedCompany', 'isOutOfStock', 'groupingId', 'brandId', 'name', 'description', 'code', 'uniqueItemCode', 'companyItemCode', 'UOFM', 'price');
var properties = new Array('highlight', 'isContracted', 'isShownOnlyToAddedCompany', 'isOutOfStock', 'groupingName', 'brandName', 'name', 'description', 'code', 'uniqueItemCode', 'companyItemCode', 'UOFM', 'price');

function editProduct(id)
{
	var addform = $('addproduct');
	var form = $('product_' + id);
	var upload = $('uploadform_' + id);
	var edit = $('edit_' + id);
	var del = $('del_' + id);
	var snake = $('snake' + id);
	
	snake.style.display = '';
	
	AdminProductAction.getProduct(id, 
	{
		callback: function(prod)
		{
			if (prod)
			{
				SpanForm.create(id, fields, addform);
				MyForm.setValues(form, prod);
				
				upload.innerHTML = prepareUploadForm(id);
				upload.style.display = '';
				
				if (!prod.containCompanyProduct)
				{
					form.isContracted.disabled = true;
				}
				
				del.innerHTML = 'cancel';
				edit.innerHTML = 'save';
				
				edit.onclick = function() {saveEdit(id, snake, form, upload, edit, del);};
				del.onclick = function() {fromEdit(id, prod, upload, edit, del);};
				
				snake.style.display = 'none';
			}
		}
	});
}

function saveEdit(id, snake, form, upload, edit, del)
{
	if (!MyForm.validate(form))
		return;
	
	var product = MyForm.getValues(form);
	product['id'] = id;
	
	snake.style.display = '';
	
	AdminProductAction.updateProduct(product, 
	{
		callback: function(prod)
		{
			if (prod)
			{
				snake.style.display = 'none';
				
				fromEdit(id, prod, upload, edit, del);
			}
		}
	});
}

function fromEdit(id, prod, upload, edit, del)
{
	SpanForm.restoreUsingProperties(id, fields, prod, properties);
	upload.style.display = 'none';
	
	convertToYesNo(id, 'highlight', prod['highlight']);
	convertToYesNo(id, 'isShownOnlyToAddedCompany', prod['isShownOnlyToAddedCompany']);
	convertToYesNo(id, 'isOutOfStock', prod['isOutOfStock']);
	
	edit.innerHTML = 'edit';
	edit.onclick = function() {editProduct(id);};
	
	del.innerHTML = 'delete';
	del.onclick = function() {deleteProduct(id);};
}

function convertToYesNo(id, field, value)
{
	var text = $(field + '_' + id);
	text.innerHTML = (value) ? 'Yes' : 'No';
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
		formed.name.focus();
		alert("Please specify a file in JPG format.");
		return false;
	}
	else
	{
		return true;
	}
}

function removeProductPicture(id)
{
	if (confirm("Are you sure you want to remove the picture?"))
	{
		top.location.href = '<c:url value="adminproduct.do"><c:param name="action" value="removeProductPicture"/><c:if test='${not empty grpid}'><c:param name="grpid" value="${grpid}"/></c:if><c:param name="page" value='${currentpage}' /><c:param name="itempage" value='${itempage}'/></c:url>' + "&prodid=" + id;
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