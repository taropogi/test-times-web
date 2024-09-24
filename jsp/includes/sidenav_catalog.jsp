<div class="sidenav">
<div class="newsBox">
		<h1><img src="images/iSearch.gif" alt="Search" title="Search" align="absmiddle" /> Item Search</h1>
		<form action="catalog.do" method="post">
		<input type="hidden" name="action" value="searchProduct" />
		<table border="0" cellspacing="5" cellpadding="0" align="center">
			<tr>
				<td><input name="keyword" type="text" class="inputField" /></td>
				<td><input type="image" src="images/btnGo.gif" alt="Search" title="Search" /></td>
			</tr>
			<tr>
				<td colspan="2"><a href="advancedsearch.do?action=showAdvancedSearch">Advanced Search</a></td>
			</tr>
		</table>
		</form>
	</div>
	
	<h1 style="font:bold 14px 'Trebuchet MS'; color:#464646; margin-bottom: 0px;"><img src="images/icon-catalog.jpg" alt="Catalog" title="Catalog" align="absmiddle" />&nbsp; Catalog</h1>
	<table>
	  <tr>
		<td valign="top">
		  <c:forEach begin="0" end="${fn:length(categories) > 0 ? fn:length(categories)-1 : 0}" var="i" step="1">
		    <div class="arrowlistmenu">
			  <h3 class="menuheader expandable"><c:out value="${categories[i].name}" /></h3>
			  <ul class="categoryitems">
			    <c:forEach begin="0" end="${fn:length(types) > 0 ? fn:length(types)-1 : 0}" var="j" step="1">
				  <c:if test="${categories[i].id eq types[j].category.id}">
				    <li><a href="catalog.do?action=showProduct&groupid=${groupMap[types[j].id]}&expandable=${i}">${types[j].name}</a></li>
				  </c:if>
			    </c:forEach>
			  </ul>
		    </div>
		  </c:forEach>
	    </td>
	  </tr>	
    </table>
</div><!--//sidenav-->