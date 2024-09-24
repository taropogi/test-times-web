<form name="news" ${(not empty editnews) ? 'method="post" action="adminmanage.do"' : 'onsubmit="return false;"'}>
<c:if test='${not empty editnews }'>
<input type="hidden" name="action" value="saveEditNews"/>
<input type="hidden" name="newsId" value="<c:out value='${editnews.id }'/>"/>
</c:if>
<table border="0" cellspacing="01" cellpadding="01" width="100%">
<tr>
	<td>
		<span class="itemname">Title:<span class="requiredfield">*</span></span>
	</td>
	<td>
		<input type="text" id="title*" name="title" <c:if test='${not empty editnews }'>value="<c:out value='${editnews.title }' />"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Subtitle:</span>
	</td>
	<td>
		<input type="text" name="subtitle" <c:if test='${not empty editnews }'>value="<c:out value='${editnews.subtitle }' />"</c:if> class="item"/>
	</td>
</tr>
<tr>
	<td>
		<span class="itemname">Sort Order:</span>
	</td>
	<td>
		<input type="text" name="sortOrder" <c:if test='${not empty editnews }'>value="<c:out value='${editnews.sortOrder }' />"</c:if> class="item"/>
	</td>
</tr>
<tr valign="top">
	<td>
		<span class="itemname">Body:</span>
	</td>
	<!--<td>
		<textarea name="body" rows="5" cols="40"></textarea>
	</td>-->
	<td>
	<FCK:editor instanceName="body_FCK" width="95%" height="350px" value="${editnews.body}" basePath="/FCKeditor" toolbarSet="Basic"/>
	</td>
</tr>
<tr>
	<td align="center" colspan="2">
		<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
		<c:if test='${empty editnews }'>
		<input type="button" class="buttonitem" name="submitb" value="add" onclick="addNewNews(this.form);" />
		<input type="button" class="buttonitem" name="cancelb" value="reset" onclick="this.form.reset();" />
		</c:if>
		<c:if test='${not empty editnews }'>
		<input type="submit" value="save" class="buttonitem"/>
		<input type="button" value="cancel" class="buttonitem" onclick="top.location.href='adminmanage.do?action=showAllNews';" class="buttonitem"/>
		</c:if>
	</td>
</tr>
</table>
</form>