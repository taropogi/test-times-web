<div class="footer">
	<ul>
		<li><a href="home.do">Home</a> |</li>
		<li><a href="careers.do">Careers</a> |</li>
		<li><a href=<c:if test="${company ne null and company.contactUs ne null}">"contactus.do?action=showContactUsAddress"</c:if><c:if test="${company eq null or company.contactUs eq null}">"contactus.do?action=showContactUsPage"</c:if>>Contact Us</a></li>
	</ul>
	<p>Copyright &copy; 2011. Times Trading Co., Inc. All Rights Reserved.<br /><a href="http://www.webtogo.com.ph" target="_blank">Web Design by WebToGo Philippines</a>.</p>
</div>
<%--
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="footer">&nbsp;</td>
    <td align="right" class="footer">&nbsp;</td>
  </tr>
  <tr>
    <td width="606" class="footer"><a href="home.do">Home</a> | <a href="aboutus.do">About Us</a> | <a href="news.do?action=showAllNews">News</a><c:if test='${not empty companyuser }'> | <a href="catalog.do?action=showProducts">Product Catalog</a></c:if> | <a href="brand.do?action=showBrands">Brands</a> | <a href="tips.do?action=showAllTips">Tips</a><c:if test='${empty company }'> | <a href="careers.do?action=showAllCareers">Careers</a></c:if> | <a href="#">Contact Us</a>
    <c:if test='${not empty companyuser }'> | 
    <c:choose>
    <c:when test='${companyuser.usertype.value == 1}'>
			<a href="corporateuser.do?action=showAllUsers">Corporate</a>
		</c:when>
		<c:when test='${companyuser.company.allowedToCreateSalesOrder}'>
			<a href="salesorder.do?action=showAllSalesOrder">Corporate</a>
		</c:when>
		<c:otherwise>
			<a href="corporateuser.do?action=editUserSetting">Corporate</a>
		</c:otherwise>
		</c:choose>
		</c:if>
	<br />
    Copyright &copy; 2006 Times Trading Co. All Rights Reserved.</td>
    <td width="94" align="right" class="footer"><img src="images/ivant.gif" width="34" height="23" /></td>
  </tr>
</table>
--%>