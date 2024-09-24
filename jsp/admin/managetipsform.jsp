<c:if test='${not empty edittips}'>
<form name="tip" method="post" action="adminmanage.do">
<input type="hidden" name="action" value="saveEditTips" />
<input type="hidden" name="tipsId" value="<c:out value='${edittips.id }'/>"/>
</c:if>
<c:if test='${empty edittips}'>
<form name="tip">
</c:if>
<table border="0" cellspacing="01" cellpadding="01" width="100%">
<tr>
	<td>
		<span class="formLabelText">Title:</span>
	</td>
	<td>
		<input type="text" name="title" style="width: 250px" width="250" <c:if test='${not empty edittips}'>value="<c:out value='${edittips.title}'/>"</c:if>/>
	</td>
</tr>
<tr>
	<td>
		<span class="formLabelText">Sort Order:</span>
	</td>
	<td>
		<input type="text" name="sortOrder" style="width: 250px" width="250" <c:if test='${not empty edittips}'>value="<c:out value='${edittips.sortOrder}'/>"</c:if>/>
	</td>
</tr>
<tr>
	<td>
		<span class="formLabelText">Show this tip for:</span>
	</td>
	<td>
		<input type="radio" name="showFor" value="0" ${(empty edittips || (not empty edittips && edittips.showFor == 0)) ? "checked" : ""}/> General Public
		<input type="radio" name="showFor" value="1" ${(not empty edittips && edittips.showFor == 1) ? "checked" : "" }/> Corporate
	</td>
</tr>
<tr valign="top">
	<td>
		<span class="formLabelText">Description:</span>
	</td>
<%--<td>
		<textarea name="description" rows="5" cols="40"></textarea>
</td>--%>
	<td>
		<FCK:editor instanceName="description_FCK" width="95%" height="350px" value="${edittips.description}" basePath="/FCKeditor" toolbarSet="Basic"/>
	</td>
</tr>
<tr>
	<td align="center" colspan="2">
		<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
		<c:if test='${empty edittips}'>
			<input type="button" class="buttonitem" name="submitb" value="add" onclick="addNewTip(this.form);" />
			<input type="button" class="buttonitem" name="cancelb" value="reset" onclick="this.form.reset();" />
		</c:if>
		<c:if test='${not empty edittips}'>
			<input type="submit" class="buttonitem" value="save" />
			<input type="button" class="buttonitem" value="cancel" onclick="top.location.href='adminmanage.do?action=showAllTips'" />
		</c:if>
	</td>
</tr>
</table>
</form>