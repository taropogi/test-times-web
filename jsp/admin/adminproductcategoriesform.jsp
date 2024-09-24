<form id="categoryform" name="category" onsubmit="return false;">
<input type="hidden" value="" />
<table border="0" cellspacing="0" cellpadding="3">
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td class="formLabelText"><input type="checkbox" name="highlight">highlight this category in the front page</td>
	</tr>
	<tr>
	<td>
		<span class="formLabelText">Name<span class="requiredfield">*</span>
	</td>
	<td>:</td>
	<td>
		<input type="text" name="name" id="name" style="width: 250px" width="250" />
	</td>
</tr>
<tr>
	<td>
		<span class="formLabelText">Description</span>
	</td>
	<td>:</td>
	<td>
		<input type="text" name="description" id="description" style="width: 250px" width="250" />
	</td>
</tr>
<tr>
	<td></td>
	<td></td>
	<td align="left">
		<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
		<input type="button" name="submitb" class="buttonitem" value="add" onclick="addNewCategory(this.form);" />
		<input type="button" name="cancelb" class="buttonitem" value="cancel" onclick="hideAdd();" />
	</td>
</tr>
<tr>
	<td colspan="2" align="left">
	<br />
		<span class="requiredfieldtext">* Required field(s).</span>
</tr>
</table>
</form>