
/* in order to get the form the form must be named by so_product_<id>*/
function submitSalesOrderForm(id)
{
	var form = document.getElementById('so_product_' + id);
	if (MyForm.validate(form) && checkZero(form.quantity))
	{
		form.submit();
	}
}

function checkSalesOrderForm(form)
{
	if (MyForm.validate(form) && checkZero(form.quantity))
	{
		return true;
	}
	return false;
}

function checkZero(element)
{
	if (element.value <= 0)
	{
		element.value = '';
		element.focus();
		element.select();
		alert("Please enter digint above 0.");
		return false;
	}
	return true;
}

function removeSalesOrderItem(productId)
{
	if (!confirm("Are you sure you want to remove the item?"))
		return;
	
	var total = document.getElementById('salesordertotal');
	var totalcount = document.getElementById('salesorderitemcount');
	
	SalesOrderAction.removeSalesOrderItem(productId, 
		{
			callback:function(item)
			{
				if (item != null)
				{
					total.innerHTML = item.total;
					//totalcount.innerHTML = item.count;
					MyTable.deleteRow('salesorderitemstable', 'so_tr_' + productId);
				}
			}
		}
	);
}

function removeSalesOrderItemWithIndex(productId, table, index)
{
	if (!confirm("Are you sure you want to remove the item?"))
		return;
	
	var total = document.getElementById('salesordertotal');
	var totalcount = document.getElementById('salesorderitemcount');
	
	SalesOrderAction.removeSalesOrderItem(productId, 
		{
			callback:function(item)
			{
				if (item != null)
				{
					total.innerHTML = item.total;
					//totalcount.innerHTML = item.count;
					if(item.count == 0){
						parent.location = 'catalog.do?action=cancelSalesOrder';
					}else{
						table.deleteRow(index);
					}
				}
			}
		}
	);
}

function editSalesOrderItem(productId)
{
	var static = document.getElementById('qt_st_' + productId);
	var qtedit = document.getElementById('qt_ed_' + productId);
	
	var edit = document.getElementById('edit_' + productId);
	var del = document.getElementById('del_' + productId);
	
	static.style.display = 'none';
	qtedit.style.display = '';
	
	edit.innerHTML = 'save';
	del.innerHTML = 'cancel';
	
	edit.onclick = function() {saveEditSalesOrderItem(productId, static, qtedit, edit, del);};
	del.onclick = function() {cancelEditSalesOrderItem(productId, static, qtedit, edit, del);};
}

function saveEditSalesOrderItem(productId, static, qtedit, edit, del)
{
	var form = document.getElementById('soitem_' + productId);
	var price = document.getElementById('price_' + productId);
	var subtotal = document.getElementById('subtotal_' + productId);
	var quantity = form.qt.value;
	var total = document.getElementById('salesordertotal');
	
	SalesOrderAction.changeSalesOrderItemQuantity(productId, quantity,
		{
			callback: function(item)
			{
				if (item != null)
				{
					static.innerHTML = item.item.quantity;
					price.innerHTML = item.item.priceString;
					subtotal.innerHTML = item.item.subTotalString;
					total.innerHTML = item.total;
				}
				cancelEditSalesOrderItem(productId, static, qtedit, edit, del);
			}
		}
	);
}

function cancelEditSalesOrderItem(productId, static, qtedit, edit, del)
{
	qtedit.style.display = 'none';
	static.style.display = '';
	
	fromEdit(productId, edit, del);
}

function fromEdit(productId, edit, del)
{
	del.innerHTML = 'delete';
	edit.innerHTML = 'edit';
	
	del.onclick = function() {removeSalesOrderItem(productId);};
	edit.onclick = function() {editSalesOrderItem(productId);};
}



function removeExistingSalesOrderItem(salesOrderId, productId)
{
	if (!confirm("Are you sure you want to remove the item?"))
		return;
	
	var total = document.getElementById('salesordertotal');
	var totalcount = document.getElementById('salesorderitemcount');
	
	SalesOrderAction.removeExistingSalesOrderItem(salesOrderId, productId, 
		{
			callback:function(item)
			{
				if (item != null)
				{
					MyTable.deleteRow('salesorderitemstable', 'so_tr_' + productId);
					total.innerHTML = item.total;
					totalcount.innerHTML = item.count;
				}
			}
		}
	);
}

function editExistingSalesOrderItem(salesOrderId, productId)
{
	var static = document.getElementById('qt_st_' + productId);
	var qtedit = document.getElementById('qt_ed_' + productId);
	
	var edit = document.getElementById('edit_' + productId);
	var del = document.getElementById('del_' + productId);
	
	static.style.display = 'none';
	qtedit.style.display = '';
	
	edit.innerHTML = 'save';
	del.innerHTML = 'cancel';
	
	edit.onclick = function() {saveExistingEditSalesOrderItem(salesOrderId, productId, static, qtedit, edit, del);};
	del.onclick = function() {cancelExistingEditSalesOrderItem(salesOrderId, productId, static, qtedit, edit, del);};
}

function saveExistingEditSalesOrderItem(salesOrderId, productId, static, qtedit, edit, del)
{
	var form = document.getElementById('soitem_' + productId);
	var price = document.getElementById('price_' + productId);
	var subtotal = document.getElementById('subtotal_' + productId);
	var quantity = form.qt.value;
	var total = document.getElementById('salesordertotal');
	
	SalesOrderAction.changeExistingSalesOrderItemQuantity(salesOrderId, productId, quantity,
		{
			callback: function(item)
			{
				if (item != null)
				{
					static.innerHTML = item.item.quantity;
					price.innerHTML = item.item.priceString;
					subtotal.innerHTML = item.item.subTotalString;
					total.innerHTML = item.total;
				}
				cancelExistingEditSalesOrderItem(salesOrderId, productId, static, qtedit, edit, del);
			}
		}
	);
}

function cancelExistingEditSalesOrderItem(salesOrderId, productId, static, qtedit, edit, del)
{
	qtedit.style.display = 'none';
	static.style.display = '';
	
	fromExistingEdit(salesOrderId, productId, edit, del);
}

function fromExistingEdit(salesOrderId, productId, edit, del)
{
	del.innerHTML = 'delete';
	edit.innerHTML = 'edit';
	
	del.onclick = function() {removeExistingSalesOrderItem(salesOrderId, productId);};
	edit.onclick = function() {editExistingSalesOrderItem(salesOrderId, productId);};
}