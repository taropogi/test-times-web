<c:if test='${(company.allowedToCreateSalesOrder) && (not empty companyuser) && (not empty salesorder.items)}'>
<a name="currentsalesorder"></a>
<table border="0" cellpadding="0" cellspacing="0" align="center" width="700" id="salesorderitemstable">
	<tr>
		<td align="left" valign="middle" height="28" colspan="8">
			<span id="sobigtitle">Online Sales Order for <c:out value='${company.name }'/></span>
		</td>
	</tr>

	<tr>
		<td align="left" valign="top" bgcolor="#7CC0E5"><img src="images/so_leftcurve.gif" width="4" height="4" border="0" alt=""></td>
		<td align="center" valign="middle" width="5%" height="23" bgcolor="#7CC0E5">
			<span class="sotitle">Qty</span>
		</td>
		<td align="center" valign="middle" width="13%" height="23" bgcolor="#7CC0E5">
			<span class="sotitle">Code</span>
		</td>
		<td align="center" valign="middle" width="33%" height="23" bgcolor="#7CC0E5">
			<span class="sotitle">Name</span>
		</td>
		<td align="center" valign="middle" width="15%" height="23" bgcolor="#7CC0E5">
			<span class="sotitle">Price</span>
		</td>
		<td align="center" valign="middle" width="15%" height="23" bgcolor="#7CC0E5">
			<span class="sotitle">Subtotal</span>
		</td>
		<td align="center" valign="middle" width="12%" height="23" bgcolor="#7CC0E5">&nbsp;</td>
		<td align="right" valign="top" bgcolor="#7CC0E5">
			<img src="images/so_rightcurve.gif" width="4" height="4" border="0" alt=""></td>	
	</tr>

	<c:forEach items="${salesorder.items}" var="soitem" varStatus="ctr">
	<c:set var="bgcolor" value="" />
	<c:if test="${0 eq ctr.count % 2}">
		<c:set var="bgcolor" value='bgcolor="#EFEFEF"' />
	</c:if>
	<form name="soitem_<c:out value='${soitem.product.id}'/>" id="soitem_<c:out value='${soitem.product.id}'/>">
	<tr id="so_tr_<c:out value='${soitem.product.id}'/>">
		<td align="center" valign="middle" height="23" ${(0 eq ctr.count % 2) ? 'bgcolor="#EFEFEF"' : ''}>&nbsp;</td>
		<td align="center" valign="middle" height="23" <c:out value='${bgcolor}' escapeXml="false"/>>
			<span class="sodesc" id="qt_st_<c:out value='${soitem.product.id}'/>">
				<c:out value='${soitem.quantity}'/>
			</span>
			<span class="sodesc" style="display:none;" id="qt_ed_<c:out value='${soitem.product.id}'/>">
				<input type="text" class="addqty" name="qt" id="qt*#" value="<c:out value='${soitem.quantity}'/>"/>
			</span>
		</td>
		<td align="center" valign="middle" height="23" <c:out value='${bgcolor}' escapeXml="false"/>>
			<span class="sodesc" id="code_<c:out value='${soitem.product.id}'/>">
				<c:out value='${soitem.code}'/>
			</span>&nbsp;
		</td>
		<td align="left" valign="middle" height="23" <c:out value='${bgcolor}' escapeXml="false"/>>
			<span class="sodesc" id="productName_<c:out value='${soitem.product.id}'/>">
				<c:out value='${soitem.productName}'/>
			</span>
		</td>
		<td align="center" valign="middle" height="23" <c:out value='${bgcolor}' escapeXml="false"/>>
			<span class="sodesc" id="price_<c:out value='${soitem.product.id}'/>">
				<c:out value='${soitem.priceString}'/>
			</span>
		</td>
		<td align="center" valign="middle" height="23" <c:out value='${bgcolor}' escapeXml="false"/>>
			<span class="sodesc" id="subtotal_<c:out value='${soitem.product.id}'/>">
				<c:out value='${soitem.subTotalString}'/>
			</span>
		</td>
		<td align="center" valign="middle" height="23"  <c:out value='${bgcolor}' escapeXml="false"/>>
			<a class="usersadddel" href="javascript:void(0);" id="edit_<c:out value='${soitem.product.id}'/>" onclick="editSalesOrderItem(<c:out value='${soitem.product.id}'/>);">edit</a>&nbsp;&nbsp;&nbsp;
			<a class="usersadddel" href="javascript:void(0);" id="del_<c:out value='${soitem.product.id}'/>" onclick="removeSalesOrderItem(<c:out value='${soitem.product.id}'/>);">delete</a>
		</td>
		<td align="center" valign="middle" height="23" <c:out value='${bgcolor}' escapeXml="false"/>>&nbsp;</td>
	</tr>
	</form>
	</c:forEach>
	<tr>
		<td align="left" valign="top" colspan="5" bgcolor="#CACAFF">
			&nbsp;&nbsp;&nbsp;&nbsp;<span class="sotitle">TOTAL</span>
		</td>	
		<td align="center" valign="middle" bgcolor="#CACAFF">
			<span class="sotitle" id="salesordertotal">
				<c:choose>
					<c:when test='${not empty salesorder}'>
						<c:out value='${salesorder.total}'/>
					</c:when>
					<c:otherwise>
						0
					</c:otherwise>
				</c:choose>
			</span>
		</td>
		<td colspan="2" bgcolor="#CACAFF">&nbsp;</td>
	</tr>	
</table>
<form action="salesorder.do?action=finishSalesOrder" method="post">
	<table border="0" cellpadding="0" cellspacing="0" align="center" width="700" class="notedeptbrder">
		<c:if test="${UserTypes.STAFF eq companyuser.usertype}">
		<tr>
			<td class="sotitle" colspan="5">
				Orders above 
				<fmt:formatNumber value="${company.totalSalesOrderWOutApproval}" currencySymbol="" type="currency" maxFractionDigits="2" minFractionDigits="2"/>
				will be subject to Approving Officer's approval.
			</td>
		</tr>
		</c:if>
		<tr>
			<td width="90"><span class="sotitle">Department:</span></td>
			<td width="140">
				<select name="deptid" class="seldept">
					<c:forEach items="${companydepartments}" var="dept">
						<option value='${dept.id}'>${dept.name}</option>
					</c:forEach>
				</select>
			</td>
			<td width="20"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
			<td width="50"><span class="sotitle">Note:</span></td>
			<td width="350"><textarea name="note" class="notedept"></textarea></td>
		</tr>
	</table>
	<table border="0" cellpadding="0" cellspacing="0" align="center" width="700">
		<tr>
			<td width="50%">&nbsp;</td>
			<td width="50%" align="right" valign="middle" height="37">
				<input type="button" style="font-weight:bold;color:rgb(255,255,255);background-color:rgb(255,102,0);display:inline-block;text-align:center;width:70px;height:20px;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;" onclick="this.form.action='salesorder.do?action=saveSalesOrder';this.form.submit();" name="sosave" value="SAVE"/>
				<a href="<c:url value='${cancelsalesorderhref}'/>" onclick="return confirm('Are you sure you want to cancel this Sales Order?');"><img src="images/so_cancenlbtn.gif" width="70" height="22" border="0" alt="Cancel"></a>&nbsp;&nbsp;
				<input type="image" src="images/so_donebtn.gif" width="70" height="22" border="0" alt="Finish" onclick="return confirm('Are you sure you are finished with this Sales Order?');"/>
			</td>
		</tr>
	</table>
</form>
</c:if>