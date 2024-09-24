<ul class="nav">
	<c:choose>
	<c:when test="${pageName eq 'home' or pageName eq 'aboutus' or pageName eq 'history'}">
	<li>
		<a class="active" href="home.do">
			
			<c:if test="${company eq null or company.generic}">
			<strong>Welcome</strong>
			</c:if>
			<c:if test="${company ne null and not company.generic}">
			<strong>Welcome</strong>
			</c:if>
		</a>
	</li>
	</c:when>
	<c:otherwise>
	<li>
		<a href="home.do">
			<c:if test="${company eq null or company.generic}">
			<strong>Welcome</strong>
			</c:if>
			<c:if test="${company ne null and not company.generic}">
			<strong>Welcome</strong>
			</c:if>
		</a>
	</li>
	</c:otherwise>
	</c:choose>
	
	<c:if test="${company eq null or company.generic}">
	<c:choose>
	<c:when test="${pageName eq 'products' or pageName eq 'featured' or pageName eq 'brands' or pageName eq 'cataloglogin' or pageName eq 'productsmail' or pageName eq 'services'}">
	<li>
		<a class="active" href="featuredproducts.do?action=showProducts"><strong>Products & Services</strong></a>
	</li>
	</c:when>
	<c:otherwise>
	<li>
	<a href="featuredproducts.do?action=showProducts"><strong>Products & Services</strong></a>
	</li>
	</c:otherwise>
	</c:choose>
	</c:if>
	
	<c:if test="${not empty companyuser and company ne null}">
	<c:choose>
	<c:when test="${pageName eq 'salesorders' or pageName eq 'browse' or pageName eq 'salesorder' or pageName eq 'shoppinglist'}">
	<li>
		<a class="active" href="catalog.do?action=showProducts&expandable=0" onClick="ddaccordion.collapseall('expandable')"><strong>Products Catalog</strong></a>
	</li>
	</c:when>
	<c:otherwise>
	<li>
	<a href="catalog.do?action=showProducts&expandable=0" onClick="ddaccordion.collapseall('expandable')"><strong>Products Catalog</strong></a>
	</li>
	</c:otherwise>
	</c:choose>
	</c:if>
	
	<c:if test="${company eq null or company.generic}">
	<c:choose>
	<c:when test="${pageName eq 'newsandtips' or pageName eq 'news' or pageName eq 'tips'}">
	<li><a class="active" href="news.do?action=showAllNews"><strong>News & Tips</strong></a></li>
	</c:when>
	<c:otherwise>
	<li><a href="news.do?action=showAllNews"><strong>News & Tips</strong></a></li>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${pageName eq 'careers'}">
	<li><a class="noSubActive" href="careers.do?action=showAllCareers"><strong>Careers</strong></a></li>
	</c:when>
	<c:otherwise>
	<li><a class="noSub" href="careers.do?action=showAllCareers"><strong>Careers</strong></a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
	
	<c:if test="${company ne null and not company.generic}">
	<c:choose>
		<c:when test="${pageName eq 'myaccount' or pageName eq 'profile' or pageName eq 'preferences' or pageName eq 'changepassword'}">
			<li><a class="active" href="corporateuser.do?action=showProfile"><strong>My Account</strong></a></li>
		</c:when>
		<c:otherwise>
			<li><a href="corporateuser.do?action=showProfile"><strong>My Account</strong></a></li>
		</c:otherwise>
	</c:choose>
	</c:if>
	<c:choose>
		<c:when test="${pageName eq 'faq'}">
			<li><a class="noSubActive" href="faq.do?action=showAllFaq"><strong>FAQs</strong></a></li>
		</c:when>
		<c:otherwise>
			<li><a class="noSub" href="faq.do?action=showAllFaq"><strong>FAQs</strong></a></li>
		</c:otherwise>
	</c:choose>
	
	<c:if test='${not empty companyuser and companyuser.usertype.value == 1}'>
	<c:choose>
		<c:when test="${pageName eq 'users'}">
			<li><a class="noSubActive" href="corporateuser.do?action=showAllUsersAlphabetically"><strong>Users</strong></a></li>
		</c:when>
		<c:otherwise>
			<li><a class="noSub" href="corporateuser.do?action=showAllUsersAlphabetically"><strong>Users</strong></a></li>
		</c:otherwise>
	</c:choose>
	</c:if>
	
	<c:choose>
	<c:when test="${pageName eq 'contactus' or pageName eq 'address' or pageName eq 'contactusmail' or pageName eq 'message'}">
	<li><a class="active" href=<c:if test="${company ne null and not company.generic and company.contactUs ne null}">"contactus.do?action=showContactUsAddress"</c:if><c:if test="${company eq null or company.generic or company.contactUs eq null}">"contactus.do?action=showContactUsPage"</c:if>><strong>Contact Us</strong></a></li>
	</c:when>
	<c:otherwise>
	<li><a href=<c:if test="${company ne null and not company.generic and company.contactUs ne null}">"contactus.do?action=showContactUsAddress"</c:if><c:if test="${company eq null or company.generic or company.contactUs eq null}">"contactus.do?action=showContactUsPage"</c:if>><strong>Contact Us</strong></a></li>
	</c:otherwise>
	</c:choose>

	<%--
	<c:if test='${not empty companyuser }'>
		<c:choose>
			<c:when test="${pageName eq 'catalog'}">
				<li><a href="catalog.do?action=showProducts" id="active">Catalog</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="catalog.do?action=showProducts">Catalog</a></li>
			</c:otherwise>
		</c:choose>
	</c:if>
	
	<c:if test='${not empty companyuser }'>
		<c:choose>
			<c:when test='${companyuser.usertype.value == 1}'>
				<li><a href="corporateuser.do?action=showAllUsersAlphabetically" ${(pageName eq 'corporate')? 'id="active"' : ""}>Corporate</a></li>
			</c:when>
			<c:when test='${companyuser.company.allowedToCreateSalesOrder}'>
				<li><a href="salesorder.do?action=showAllSalesOrder" ${(pageName eq 'corporate')? 'id="active"' : ""}>Corporate</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="corporateuser.do?action=editUserSetting" ${(pageName eq 'corporate')? 'id="active"' : ""}>Corporate</a></li>
			</c:otherwise>
		</c:choose>
	</c:if>
	<%--//end comment out
	<li style="float: right;"><img src="images/mright_blue.jpg" width="16" height="44" /></li>
	--%>
</ul>

<ul class="subnav">
	<c:if test="${pageName eq 'home' or pageName eq 'aboutus' or pageName eq 'history'}">
	
	<c:if test="${company eq null or company.generic}">
	<c:choose>
	<c:when test="${pageName eq 'aboutus'}">
	<li><a class="active" href="aboutus.do">About Us</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="aboutus.do">About Us</a></li>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${pageName eq 'history'}">
	<li class="last"><a class="active" href="history.do">History</a></li>
	</c:when>
	<c:otherwise>
	<li class="last"><a href="history.do">History</a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
	
	<c:if test="${company ne null and not company.generic}">
	<%--<li class="last"><a href="corporateuser.do?action=editUserSetting">Welcome <strong>${companyuser.firstname} ${companyuser.lastname}</strong>!</a></li>--%>
	<li class="last"><a href="home.do">Home Page</a></li>
	</c:if>
	</c:if>
	
	<c:if test="${pageName eq 'products' or pageName eq 'featured' or pageName eq 'brands' or pageName eq 'cataloglogin' or pageName eq 'productsmail' or pageName eq 'services'}">
	
	<c:if test="${(company eq null and empty companyuser) or company.generic}">
	<c:choose>
	<c:when test="${pageName eq 'featured'}">
	<li><a class="active" href="featuredproducts.do?action=showProducts">Featured Products</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="featuredproducts.do?action=showProducts">Featured Products</a></li>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${pageName eq 'brands'}">
	<li><a class="active" href="brand.do?action=showBrands">Our Brands</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="brand.do?action=showBrands">Our Brands</a></li>
	</c:otherwise>
	</c:choose>
	
	<c:if test="${empty companyuser}">
	<c:choose>
	<c:when test="${pageName eq 'cataloglogin'}">
	<li><a class="active" href="companylogin.do?action=loginPage">Catalog Login</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="companylogin.do?action=loginPage">Catalog Login</a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
	
	<c:if test="${empty companyuser or company eq null or company.generic}">
	<c:choose>
	<c:when test="${pageName eq 'productsmail'}">
	<li><a class="active" href="mailing.do?action=showMailingList">Mailing List</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="mailing.do?action=showMailingList">Mailing List</a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
	
	<c:choose>
	<c:when test="${pageName eq 'services'}">
	<li class="last"><a class="active" href="services.do">Our Services</a></li>
	</c:when>
	<c:otherwise>
	<li class="last"><a href="services.do">Our Services</a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
	</c:if>
	
	<c:if test="${pageName eq 'browse' or pageName eq 'salesorder' or pageName eq 'shoppinglist' or pageName eq 'salesorders'}">
	<c:if test="${not empty companyuser and company ne null}">
	<c:choose>
	<c:when test="${pageName eq 'browse'}">
	<li><a class="active" href="catalog.do?action=showProducts&expandable=0">Browse Items</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="catalog.do?action=showProducts&expandable=0">Browse Items</a></li>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${pageName eq 'salesorders'}">
	<li><a class="active" href="salesorder.do?action=searchSalesOrder&page=1&department=0">Order Status / Listing</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="salesorder.do?action=searchSalesOrder&page=1&department=0">Order Status / Listing</a></li>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${pageName eq 'shoppinglist'}">
	<li class="last"><a class="active" href="catalog.do?action=showShoppingList">My Shopping List</a></li>
	</c:when>
	<c:otherwise>
	<li class="last"><a href="catalog.do?action=showShoppingList">My Shopping List</a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
	</c:if>
	
	<c:if test="${pageName eq 'newsandtips' or pageName eq 'news' or pageName eq 'tips'}">
		<%-- <c:if test="${(company eq null or company.generic) and empty companyuser}"> --%>
			<c:choose>
				<c:when test="${pageName eq 'news'}">
					<li><a class="active" href="news.do?action=showAllNews">News</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="news.do?action=showAllNews">News</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${pageName eq 'tips'}">
					<li class="last"><a class="active" href="tips.do?action=showAllTips">Tips</a></li>
				</c:when>
				<c:otherwise>
					<li class="last"><a href="tips.do?action=showAllTips">Tips</a></li>
				</c:otherwise>
			</c:choose>
		<%-- </c:if> --%>
	</c:if>
	
	<c:if test="${pageName eq 'contactus' or pageName eq 'address' or pageName eq 'contactusmail' or pageName eq 'message'}">
	<c:if test="${company eq null or company.generic or not empty company.contactUs or not empty company.address}">
	<c:choose>
	<c:when test="${pageName eq 'address'}">
	<li><a class="active" href="contactus.do?action=showContactUsAddress">Address</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="contactus.do?action=showContactUsAddress">Address</a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
	
	
	<%-- <c:if test="${company eq null or company.generic}">
	<c:choose>
	<c:when test="${pageName eq 'contactusmail'}">
	<li><a class="active" href="mailing.do?action=showMailingList">Mailing List</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="mailing.do?action=showMailingList">Mailing List</a></li>
	</c:otherwise>
	</c:choose>
	</c:if> --%>
	
	<c:choose>
	<c:when test="${pageName eq 'message'}">
	<li class="last"><a class="active" href="contactus.do?action=showContactUsPage">Leave a Message</a></li>
	</c:when>
	<c:otherwise>
	<li class="last"><a href="contactus.do?action=showContactUsPage">Leave a Message</a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
	
	<%--<c:if test="${not empty companyuser and (pageName eq 'myaccount' or pageName eq 'profile' or pageName eq 'preferences' or pageName eq 'changepassword')}">--%>
	<c:if test="${pageName eq 'myaccount' or pageName eq 'profile' or pageName eq 'preferences' or pageName eq 'changepassword'}">
	<c:choose>
	<c:when test="${pageName eq 'profile'}">
	<li><a class="active" href="corporateuser.do?action=showProfile">My Profile</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="corporateuser.do?action=showProfile">My Profile</a></li>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${pageName eq 'preferences'}">
	<li><a class="active" href="corporateuser.do?action=showPreferences">Preferences</a></li>
	</c:when>
	<c:otherwise>
	<li><a href="corporateuser.do?action=showPreferences">Preferences</a></li>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${pageName eq 'changepassword'}">
	<li class="last"><a class="active" href="corporateuser.do?action=changePassword">Change Password</a></li>
	</c:when>
	<c:otherwise>
	<li class="last"><a href="corporateuser.do?action=changePassword">Change Password</a></li>
	</c:otherwise>
	</c:choose>
	</c:if>
</ul>
<div class="clear"></div>