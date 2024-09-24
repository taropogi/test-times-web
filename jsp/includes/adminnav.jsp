<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<div id="header">
		<h2>Logged in as <strong>Administrator</strong> | <a href="adminsetting.do?action=showUserSetting" id="${(menu eq 'settings') ? 'active' : ''}">Settings</a> | <a href="login.do?action=logout" onclick="javascript: return confirm('Are you sure you want to logout?')">Logout</a>
		<br /><br /><br />
		<span class="loginlogotxt">Times Trading Website Back End Administration</span>
		</h2>


		<img src="images/admin/times_trading_logo.jpg" width="203" height="80" border="0" al="" align="left">
		
		<div class="clear"></div>
</div>
<div class="clear"></div>

<c:set var="permission" value="${userloggedin.usertype.permission}" />

<c:set var="corporateurl" value=""/>
<c:set var="canmanagecorporate" value="${false}" />

<c:if test="${permission.canManageSalesOrders}">
	<c:set var="corporateurl" value="admincorporate.do?action=showAllSalesOrder"/>
	<c:set var="canmanagecorporate" value="${true}" />
</c:if>
<c:if test="${permission.canManageFaqs}">
	<c:set var="corporateurl" value="adminfaq.do?action=adminShowAllFaq"/>
	<c:set var="canmanagecorporate" value="${true}" />
</c:if>
<c:if test="${permission.canManageCompanies}">
	<c:set var="corporateurl" value="admincorporate.do?action=showAllCompany"/>
	<c:set var="canmanagecorporate" value="${true}" />
</c:if>

<div id="navigation">
	<ul>
		<li><a href="dashboard.do?action=home" id="${(menu eq 'dashboard') ? 'active' : ''}">Dashboard</a></li>

		<c:if test="${permission.canManageProducts}">
			<li><a href="adminproduct.do?action=showAllProductsByCompany" id="${(menu eq 'products') ? 'active' : ''}">Products</a></li>
		</c:if>

		<c:if test="${permission.canManageWeb}">
			<li><a href="adminhome.do?action=adminShowGenericHome" id="${(menu eq 'manage') ? 'active' : ''}">Web</a></li>
		</c:if>
		
		<c:if test="${canmanagecorporate}">
			<li><a href="${corporateurl}" id="${(menu eq 'corporate') ? 'active' : ''}">Corporate</a></li>
		</c:if>
		
		<c:if test="${permission.canViewReports}">
			<li><a href="adminreports.do?action=showAvailableReport" id="${(menu eq 'reports') ? 'active' : ''}">Reports</a></li>
		</c:if>

		<%-- this part will always show
		<li style="float: right; margin-right: 30px;">
			<a href="login.do?action=logout" onclick="javascript: return confirm('Are you sure you want to logout?')">Logout</a>
		</li>

		<li style="float: right;">
			<a href="adminsetting.do?action=showUserSetting" id="${(menu eq 'settings') ? 'active' : ''}">Settings</a>
		</li>	 --%>

	</ul>
</div>

<c:if test="${menu eq 'dashboard'}">
<div id="subnavigation">
	<ul>
		<li></li>
	</ul>
</div>
</c:if>

<c:if test="${menu eq 'products'}">
<div id="subnavigation">
	<ul>
		<li><a href="adminproduct.do?action=showAllCategories" id="${(submenu eq 'categories') ? 'active' : ''}">Categories</a></li>

		<li><a href="adminproduct.do?action=showAllTypes" id="${(submenu eq 'types') ? 'active' : ''}">Types</a></li>

		<li><a href="adminproduct.do?action=showAllGroupings" id="${(submenu eq 'groupings') ? 'active' : ''}">Groupings</a></li>

		<li><a href="adminproduct.do?action=showAllProductsByCompany" id="${(submenu eq 'productitems') ? 'active' : ''}">Product Items</a></li>
		
		<li><a href="adminproduct.do?action=showAllBrands" id="${(submenu eq 'brands') ? 'active' : ''}">Brands</a></li>
		
		<li><a href="adminsearch.do?action=adminStartSearch" id="${(submenu eq 'search') ? 'active' : ''}">Search</a></li>
		
	</ul>
</div>
</c:if>

<c:if test="${menu eq 'manage'}">
<div id="subnavigation">
	<ul>
		<li><a href="adminhome.do?action=adminShowGenericHome" id="${(submenu eq 'home') ? 'active' : ''}">Home</a></li>
		
		<li><a href="adminsliderimage.do?action=showAllSliderImage" id="${(submenu eq 'sliderimage') ? 'active' : ''}">Slider Images</a></li>
		
		<li><a href="admincontactus.do?action=adminShowGenericContactUs" id="${(submenu eq 'contactus') ? 'active' : ''}">Contact Us</a></li>
		
		<li><a href="adminfaq.do?action=adminShowGenericFaqs" id="${(submenu eq 'faq') ? 'active' : ''}">FAQs</a></li>
		
		<li><a href="adminaboutus.do?action=adminShowAboutUs" id="${(submenu eq 'aboutus') ? 'active' : ''}">About Us</a></li>
	
		<li><a href="adminhistory.do?action=adminShowHistory" id="${(submenu eq 'history') ? 'active' : ''}">History</a></li>
	
		<li><a href="adminmanage.do?action=showAllNews" id="${(submenu eq 'news') ? 'active' : ''}">News</a></li>
		
		<li><a href="adminmanage.do?action=showAllTips" id="${(submenu eq 'tips') ? 'active' : ''}">Tips</a></li>
		
		<li><a href="adminmanage.do?action=findAllLatest" id="${(submenu eq 'latest') ? 'active' : ''}">Latest</a></li>
		
		<li><a href="adminmanage.do?action=showAllCareers" id="${(submenu eq 'careers') ? 'active' : ''}">Careers</a></li>
		
		<li><a href="adminmanage.do?action=showAllMailingList" id="${(submenu eq 'mailinglist') ? 'active' : '' }">Mailing List</a></li>
		
		<li><a href="adminservice.do?action=adminShowService" id="${(submenu eq 'service') ? 'active' : ''}">Services</a></li>
		
		<li><a href="adminmanage.do?action=createMailForMailingList" id="${(submenu eq 'sendmailinglist') ? 'active' : ''}">Create Email</a></li>
		
		<c:if test="${permission.canManageCMSUsers}">
			<li><a href="adminmanage.do?action=showAllUsers" id="${(submenu eq 'users') ? 'active' : ''}">CMS Users</a></li>
		</c:if>		
	</ul>
</div>
</c:if>

<c:if test="${menu eq 'corporate'}">
<div id="subnavigation">
	<ul>
		<li><img src="images/spacer.gif" width="0" height="1" border="0"></li>
		
		<c:if test="${permission.canManageCompanies}">
			<li><a href="admincorporate.do?action=showAllCompany" id="${(submenu eq 'companies') ? 'active' : ''}">Companies</a></li>
		</c:if>

		<c:if test="${permission.canManageCompanies}">
			<li><a href="admincorporate.do?action=showAllCorporateAdmins" id="${(submenu eq 'corporateadmin') ? 'active' : ''}">Administrators</a></li>
		</c:if>
		
		<c:if test="${permission.canManageSalesOrders}">		
			<li><a href="admincorporate.do?action=showAllSalesOrder" id="${(submenu eq 'salesorder') ? 'active' : ''}">Sales Orders</a></li>
			<li><a href="admincorporate.do?action=showAllSalesOrder&showArchive=true" id="${(submenu eq 'archivesalesorder') ? 'active' : ''}">Archive Sales Order</a></li>
		</c:if>
		
		<c:if test="${permission.canManageHome}">
			<li><a href="adminhome.do?action=adminShowAllHome" id="${(submenu eq 'home') ? 'active' : ''}">Home</a></li>
		</c:if>
		
		<c:if test="${permission.canManageContactUs}">
			<li><a href="admincontactus.do?action=adminShowAllContactUs" id="${(submenu eq 'contactus') ? 'active' : ''}">Contact Us</a></li>
		</c:if>
		
		<c:if test="${permission.canManageFaqs}">
			<li><a href="adminfaq.do?action=adminShowAllFaq" id="${(submenu eq 'faq') ? 'active' : ''}">FAQs</a></li>
		</c:if>
	</ul>
</div>
</c:if>

<c:if test="${menu eq 'settings'}">
<div id="subnavigation">
	<ul>
		<li><img src="images/spacer.gif" width="550" height="1" border="0"></li>
		<li><a href="#" id="active">Personal</a></li>
		<li><a href="http://www.times.com.ph/awstats/awstats.pl" target="_new">Web Statistics</a></li>
	</ul>
</div>
</c:if>

	<div id="headerinfobox">
		<span class="headerinfotxt">
		<c:out value="${pagemessage}"/>
		</span>
	</div>