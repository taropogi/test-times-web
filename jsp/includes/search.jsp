<script type="text/javascript" src="javascripts/adminforms.js"></script>


<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
<form method="post" action="<c:url value='search.do'><c:param name='action' value='search'/></c:url>"   onsubmit="return isEmpty(this.find.value);">
	<tr>
		<td><img src="images/spacer.gif" width="1" height="5" /></td>
	</tr>
	<!--dont show the quick search box if the user is not logged in-->
	<c:if test='${not empty companyuser }'>
	<tr>
		<td align="center">
		<div id="search2">
			<span class="blue">Product Search</span> 
			<img src="images/icon_search2.gif" width="14" height="16" align="absmiddle" /> 
			<input type="text" name="find" /> 
			<input type="image" src="images/button_go3.gif" width="38" height="26" align="absmiddle" />
			&nbsp;&nbsp;&nbsp;
			<c:if test="${company.allowedToCreateSalesOrder}">
				<span class="soticker">You currently have <strong><span id="salesorderitemcount">${ fn:length(salesorder.items) }</span></strong> items in your <a href="#currentsalesorder" class="soticker">Sales Order</a>.</span>
			</c:if>
			<a href="advancedsearch.do?action=showAdvancedSearch">Advanced Search</a>
		</div>
		</td>
	</tr>
	<tr>
		<td><img src="images/spacer.gif" width="1" height="5" /></td>
	</tr>
	</c:if>
 </form>
</table>