<h1>
	<a href="home.do">
		<img src="images/times-trading-co-inc.gif" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" />
		<%-- <c:if test="${empty company or empty company.imageExtension}">
		<img src="images/times-trading-co-inc.gif" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" />
		</c:if>
		<c:if test="${not empty company and not empty company.imageExtension}">
		<img class="itemimage" src="images/companies_orig_image/company_<c:out value='${company.id}'/><c:out value='${company.imageExtension}'/>" style="max-height:73px;min-height:73px;height:73px;"/>
		</c:if>  --%>
	</a>
</h1>
<h2>
	<form id="form1" name="form1" method="post" action="search.do?action=search" onsubmit="return isEmpty(this.find.value);">
	<table border="0" cellspacing="0" cellpadding="3" style="float: right;">
		<tr>
			<td><input name="find" type="text" class="searchField" style="padding:0"/></td>
			<td><img src="images/btnSearch.gif" onClick="if(isEmpty(form1.find.value))form1.submit();" /></td>
		</tr>
	</table>
	</form>
	<div class="clear"></div>
	<ul>
		<c:if test="${not empty companyuser}">
			<li><strong>Welcome ${companyuser.firstname}!</strong></li>
			<li><a href="catalog.do?action=showShoppingList">My Shopping List (<c:if test="${not empty salesorder}">${salesorder.itemQuantity}</c:if><c:if test="${empty salesorder}">0</c:if>)</a> |</li>
			<li><a id="active" href="corporateuser.do?action=editUserSetting">Account Settings</a> | </li>
			<li><a href="companylogin.do?action=logout" onclick="javascript: return confirm('Do you really want to log out?')">Logout</a>
		</c:if>
		
		<c:if test="${empty companyuser}">
			<li><a href="companylogin.do?action=loginPage">Login</a> |</li>
			<li><a href="contactus.do?action=showContactUsPage&register">Register</a> |</li>
			<%--<li><a href="#">Login</a> |</li>--%>
			<li><a href=<c:if test="${company ne null and company.contactUs ne null}">"contactus.do?action=showContactUsAddress"</c:if><c:if test="${company eq null or company.contactUs eq null}">"contactus.do?action=showContactUsPage"</c:if>>Contact Us</a></li>
		</c:if>
	</ul>
</h2>
<div class="clear"></div>
<%--
<c:if test='${not empty company}'>
	<c:if test='${not empty companyuser}'>
		Company <c:out value='${companyuser.usertype.name}'/> <strong><c:out value='${companyuser.firstname}'/> <c:out value='${companyuser.lastname}'/></strong> is logged in.
		<span class="smalltext">
			<a href="corporateuser.do?action=editUserSetting">User Settings</a>&nbsp;&nbsp;
			<a href="companylogin.do?action=logout" onclick="javascript: return confirm('Are you sure you want to log out?')">Log Out</a>
		</span>
		<c:if test="${not empty salesorderneedapprovecount}">
		<br/>
		${salesorderneedapprovecount} Sales Order(s) awaiting your approval.
		</c:if>
	</c:if>
</c:if>
--%>