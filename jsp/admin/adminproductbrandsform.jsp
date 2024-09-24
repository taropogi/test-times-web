<form id="brandform" name="brand" action="adminproduct.do" method="POST">
	<input type="hidden" name="id" value="${ brand.id }" />
	<input type="hidden" name="action" value="saveBrand" />
<table border="0" cellspacing="0" cellpadding="3">
<tr>
	<td>
		<span class="itemname">Name<span class="requiredfield">*</span></span>
	</td>
	<td>:</td>
	<td>
		<input type="text" id="name*" name="name" alt="Name" class="item" size="15" value="${ brand.name }"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Description</span>
	</td>
	<td>:</td>
	<td width="800px">
		<FCK:editor instanceName="description" width="90%" height="350px" basePath="/FCKeditor" value="${brand.description}" toolbarSet="Basic"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Hidden</span>
	</td>
	<td>:</td>
	<td>
		<input type="checkbox" name="hidden" value="true" />
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Sort Order</span>
	</td>
	<td>:</td>
	<td>
		<input type="number" name="sortOrder" value="${brand.sortOrder}" />
	</td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td align="left">
		<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
		<%--input type="button" name="submitb" value="add" onclick="addNewBrand(this.form);" class="buttonitem"/--%>
		<input type="submit" name="submitb" value="save" onclick="return validate();" class="buttonitem"/>
		<input type="button" name="cancelb" value="reset" onclick="this.form.reset();" class="buttonitem"/>
	</td>
</tr>
<tr>
	<td colspan="3" align="left">
	<br /><br />
		<span class="requiredfieldtext">* Required field(s).</span>
	</td>
</tr>
</table>
</form>

<script type="text/javascript">
function validate()
{
	var name = document.getElementById('name*').value;
	
	if(name.replace(' ', '').length == 0)
	{
		alert('Please input a valid name.');
		return false;
	}
	
	return true;
}
</script>