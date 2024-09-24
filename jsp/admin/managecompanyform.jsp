<form name="company" ${(not empty editcompany) ? 'method="post" action="adminmanage.do"' : 'onsubmit="return false;"'}>
<c:if test='${not empty editcompany}'>
<input type="hidden" name="action" value="saveEditCompany"/>
<input type="hidden" name="companyId" value="<c:out value='${editcompany.id }'/>"/>
</c:if>
<table border="0" cellspacing="01" cellpadding="01" width="100%">
<tr>
	<td>
		<span class="itemname">Company Name:<span class="requiredfield">*</span></span>
	</td>
	<td>
		<input type="text" id="Name*" name="name" <c:if test='${not empty editcompany}'>value="<c:out value='${editcompany.name}' />"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Company URL:</span>
	</td>
	<td>
		<span style="font-weight:bold;">${editcompany.companyUrl}</span>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Company Code:</span>
	</td>
	<td>
		<input type="number" id="Name*" name="code" <c:if test='${not empty editcompany}'>value="<c:out value='${editcompany.code}' />"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Address:</span>
	</td>
	<td>
		<textarea class="item" cols="20" rows="5" name="address"><c:if test='${not empty editcompany}'><c:out value='${editcompany.address}'/></c:if></textarea>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Company Number:</span>
	</td>
	<td>
		<input type="text" name="phone" <c:if test='${not empty editcompany}'>value="<c:out value='${editcompany.phone}' />"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Maximum amount for sales orders that do not need officer approval:</span>
	</td>
	<td>
		<input type="text" name="totalSalesOrderWOutApproval" <c:if test='${not empty editcompany}'>value="<c:out value='${editcompany.totalSalesOrderWOutApproval}' />"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Allowed to create sales order:</span>
	</td>
	<td>
		<input type="checkbox" name="allowedToCreateSalesOrder"<c:if test="${not empty editcompany and editcompany.allowedToCreateSalesOrder}"> checked="checked"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Has contracted products:</span>
	</td>
	<td>
		<input type="checkbox" name="hasContractItems"<c:if test="${not empty editcompany and editcompany.hasContractItems}"> checked="checked"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Send an email when sales orders are approved:</span>
	</td>
	<td>
		<input type="checkbox" name="sendEmailNotification"<c:if test="${not empty editcompany and editcompany.sendEmailNotification}"> checked="checked"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">When sales orders are approved, send the email to:</span>
	</td>
	<td>
		<input type="text" name="sendEmailNotificationTo" <c:if test='${not empty editcompany}'>value="<c:out value='${editcompany.sendEmailNotificationTo}' />"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td align="center" colspan="2">
		<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
		<c:if test='${not empty editcompany}'>
		<input type="submit" value="Save" class="buttonitem"/>
		<input type="button" value="Cancel" class="buttonitem" onclick="top.location.href='admincorporate.do?action=showAllCompany';" class="buttonitem"/>
		</c:if>
	</td>
</tr>
</table>
</form>