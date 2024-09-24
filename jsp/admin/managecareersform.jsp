<form name="career" onsubmit="return false;">
<table border="0" cellspacing="01" cellpadding="01" width="100%">
<tr>
	<td>
		<span class="itemname">Position</span>
	</td>
	<td>
		<input type="text" name="position" class="item" size="16" />
	</td>
</tr>
<tr valign="top">
	<td>
		<span class="itemname">Description</span>
	</td>
	<td>
		<FCK:editor instanceName="description_FCK" width="95%" height="350px" basePath="/FCKeditor" toolbarSet="Basic"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Valid Until</span>
	</td>
	<td>
		<input type="text" name="validUntil" id="validadd" style="width: 250px" width="250" />
		<input type="button" name="trigger" id="trigadd" value="select date" class="item"/>
	</td>
</tr>
<tr valign="top">
	<td colspan="2">
		<span class="itemnote">NOTE: This Career Item will be removed from the web site after the above date.</span>
	</td>
</tr>
<tr>
	<td align="center" colspan="2">
		<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
		<input type="button" class="buttonitem" name="submitb" value="add the new career item" onclick="addNewCareer(this.form);" class="item"/>
		<input type="button" class="buttonitem" name="cancelb" value="cancel" onclick="hideAdd();" class="item"/>
	</td>
</tr>
</table>
</form>