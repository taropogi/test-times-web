<form name="product" id="addproduct" onsubmit="return false;">
<table border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td><span class="itemname">Highlight this product.</span></td>
		<td>:</td>
		<td><input type="checkbox" name="highlight"></td>
	</tr>
	<tr style="display: none;">
		<td><input type="checkbox" name="isContracted"></td>
		<td>:</td>
		<td><span class="itemname">This product is contracted.</span></td>
	</tr>
	<tr style="display: none;">
		<td><input type="checkbox" name="isShownOnlyToAddedCompany"></td>
		<td>:</td>
		<td><span class="itemname">This product will only be shown to companies added.</span></td>
	</tr>
	<tr style="display: none;">
		<td><input type="checkbox" name="isOutOfStock"></td>
		<td>:</td>
		<td><span class="itemname">This product is out of stock.</span></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
			<span class="itemname">Grouping<span class="requiredfield">*</span></span>
		</td>
		<td>:</td>
		<td>
			<select id="groupingId*" name="groupingId" alt="Grouping" class="listings">
				<c:forEach items="${productgroupings}" var="grp" varStatus="counter">
				<option value="<c:out value="${grp.id}"/>"><c:out value="${grp.name}"/></option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>
			<span class="itemname">Brand</span>
		</td>
		<td>:</td>
		<td>
			<select id="brand" name="brandId" class="listings">
				<option value="">&nbsp;</option>
				<c:forEach items="${productbrands}" var="brand" varStatus="counter">
					<option value="<c:out value="${brand.id}"/>"><c:out value="${brand.name}"/></option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>
			<span class="itemname">Name<span class="requiredfield">*</span></span>
		</td>
		<td>:</td>
		<td>
			<input type="text" id="name*" name="name" alt="Name" class="item" size="15"/>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<span class="itemname">Description</span>
		</td>
		<td valign="top">:</td>
		<td>
			<!--<input type="text" id="description" name="description" class="item" size="15"/>-->
			<textarea cols="40" rows="3" name="description" class="item"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			<span class="itemname">Code</span>
		</td>
		<td>:</td>
		<td>
			<input type="text" id="code" name="code" class="item" size="15"/>
		</td>
	</tr>
	<tr>
		<td>
			<span class="itemname">Unique Item Code</span>
		</td>
		<td>:</td>
		<td>
			<input type="text" id="uniqueItemCode" name="uniqueItemCode" class="item" size="15"/>
		</td>
	</tr>
	<tr>
		<td>
			<span class="itemname">Company Item Code</span>
		</td>
		<td>:</td>
		<td>
			<input type="text" id="companyItemCode" name="companyItemCode" class="item" size="15"/>
		</td>
	</tr>
	<tr>
		<td>
			<span class="itemname">UOFM</span>
		</td>
		<td>:</td>
		<td>
			<input type="text" id="UOFM" name="UOFM" class="item" size="15" />
		</td>
	</tr>
	<tr>
		<td>
			<span class="itemname">Price</span>
		</td>
		<td>:</td>
		<td>
			<input type="text" id="price%" name="price" alt="Price" class="item" size="15"/>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td align="left">
			<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
			<input type="button" name="submitb" id="submitb" value="add this new product" onclick="addNewProduct(this.form);" class="buttonitem"/>
			<input type="button" name="cancelb" value="reset" onclick="this.form.reset();" class="buttonitem" />
		</td>
	</tr>
	<tr>
		<td colspan="3" align="left">
			<span class="requiredfieldtext">* Required field(s).</span>
		</td>
	</tr>
</table>
</form>