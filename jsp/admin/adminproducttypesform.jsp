<form name="type" id="type" onsubmit="return false;">
<table border="0" cellspacing="0" cellpadding="3">
	<tr>
		<td width="120">
			<span class="formLabelText">Category<span class="requiredfield">*</span></span>
		</td>
		<td>:</td>
		<td>
			<select name="allcategories" width="250" style="width: 250px" class="listings">
				<c:forEach items="${productcategories}" var="category" varStatus="counter">
				<option value="<c:out value="${category.id}"/>"><c:out value="${category.name}"/></option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>
			<span class="formLabelText">Name<span class="requiredfield">*</span></span>
		</td>
		<td>:</td>
		<td>
			<input type="text" name="name" style="width: 250px" width="250" />
		</td>
	</tr>
	<tr>
		<td>
			<span class="formLabelText">Description</span>
		</td>
		<td>:</td>
		<td>
			<input type="text" name="description" style="width:250px" width="250" />
		</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td align="left">
			<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
			<input type="button" name="submitb" class="buttonitem" value="add" onclick="addNewType(this.form);" />
			<input type="button" name="cancelb" class="buttonitem" value="cancel" onclick="hideAdd();" />
		</td>
	</tr>
	<tr>
		<td colspan="3" align="left">
		<br />
		<span class="requiredfieldtext">* Required field(s).</span>
	</tr>
</table>
</form>