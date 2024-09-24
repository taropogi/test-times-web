<form id="addcompanyform" name="company" onsubmit="return false;">
	<table border="0" cellspacing="0" cellpadding="3" width="100%">
		<tr>
			<td height="1">
				<img src="images/spacer.gif" width="10" height="1" border="0" alt="">
			</td>
			<td></td>
			<td height="1">
				<img src="images/spacer.gif" width="200" height="1" border="0" alt="">
			</td>
		</tr>
		<tr>
			<td align="left" class="itemname" width="190px" valign="top">Company Name<span class="requiredfield">*</span></td>
			<td valign="top">:</td>
			<td align="left">
				<input type="text" class="item" id="name*" size="15" name="name" <c:if test='${not empty company}'>value="<c:out value='${company.name}'/>"</c:if> />
			</td>
		</tr>
		<tr>
			<td  valign="top"align="left" class="itemname">Company URL<span class="requiredfield">*</span></td>
			<td valign="top">:</td>
			<td align="left">
				<input class="item" type="text" id="companyUrl*" size="15" name="companyUrl" <c:choose><c:when test='${not empty company}'>value="<c:out value='${company.companyUrl}'/>" readonly="true"</c:when><c:otherwise>onkeyup="setURL(this);"</c:otherwise></c:choose>/>
				&nbsp;&nbsp;<input type="checkbox" id="useGenericURL" onClick="setGenericURL(this)" />Use Generic URL
			</td>
		</tr>
		<tr>
			<td  valign="top"align="left" valign="top" class="itemname">Company Code</td>
			<td valign="top">:</td>
			<td align="left">
				<input type="number" class="item" id="code*" size="15" name="code" <c:if test='${not empty company}'>value="<c:out value='${company.code}'/>"</c:if> />
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<div class="itemnote" id="urlhere"></div>
			</td>
		</tr>
		<tr>
			<td  valign="top"align="left" valign="top" class="itemname">Address</td>
			<td valign="top">:</td>
			<td align="left">
				<textarea class="item" cols="20" rows="5" id="address" name="address"><c:if test='${not empty company}'><c:out value='${company.address}'/></c:if></textarea>
			</td>
		</tr>
		<tr>
			<td  valign="top"align="left" class="itemname">Phone</td>
			<td>:</td>
			<td align="left">
				<input type="text" class="item" id="phone" size="10" name="phone" <c:if test='${not empty company}'>value="<c:out value='${company.phone}'/>"</c:if>/>
			</td>
		</tr>
		<tr>
			<td align="left" class="itemname"  valign="top">Maximum amount for sales orders<br/> that do not need officer approval</td>
			<td valign="top">:</td>
			<td align="left">
				<input type="text" id="totalSalesOrderWOutApproval" class="item" size="10" name="totalSalesOrderWOutApproval" <c:if test='${not empty company}'>value="<c:out value='${company.totalSalesOrderWOutApproval}'/>"</c:if>/>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<img src="spacer.gif" height="5px"/>
			</td>
		</tr>
		<tr>
			<td align="left">
				&nbsp;
			</td>
			<td></td>
			<td align="left" class="itemname">
				<input type="checkbox" id="allowedToCreateSalesOrder" name="allowedToCreateSalesOrder" <c:if test='${not empty company and company.allowedToCreateSalesOrder}'>checked="checked"</c:if>/>
				allow this company to create sales orders
			</td>
		</tr>
		<tr>
			<td align="left" class="itemname">
				&nbsp;
			</td>
			<td></td>
			<td align="left" class="itemname">
				<input type="checkbox" name="hasContractItems" id="hasContractItems" ${((empty company) || (not empty company && company.hasContractItems)) ? "checked" : ""}/>
				This company has contracted products.
			</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td align="left" class="itemname">
				<input type="checkbox" name="sendEmailNotification" id="sendEmailNotification" />
				Should the system send an email when sales orders are approved?
			</td>
		</tr>
		<tr>
			<td align="left" class="itemname"  valign="top">When sales orders are approved, <br/> send the email to</td>
			<td valign="top">:</td>
			<td>
				<input type="text" class="item" width="200" name="sendEmailNotificationTo" id="sendEmailNotificationTo" value="${company.sendEmailNotificationTo}"/>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<img src="spacer.gif" height="5px"/>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<img src="images/indicator.gif" name="indicator" style="visibility:hidden"/>
				<input class="buttonitem" type="button" value="Create Company" name="submitb" onclick="save(this.form)" class="item"/>
				<input class="buttonitem" type="button" value="Reset" name="resetb" onclick="this.form.reset();" class="item"/>
			</td>
		</tr>
	</table>
</form>
