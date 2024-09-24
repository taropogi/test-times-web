<script language="JavaScript" type="text/javascript">
function checkFormInput(form)
{
	if (!MyForm.validate(form))
	{
		return false;
	}
	return true;
}
</script>
<div class="sidenav">
	<div class="loginBox" id="sidenav">
		<c:if test="${empty companyuser}">
			<h1><img src="images/iLogin.gif" alt="Login" title="Login" align="absmiddle" /> Login</h1>
			<table border="0" cellspacing="5" cellpadding="0" align="center">
				<form name="corporatelogin" method="post" action="companylogin.do" onsubmit="return checkFormInput(this);">
				<input type="hidden" name="action" value="login" />
				<c:if test="${not empty errormessage }">
				<tr>
					<td colspan="3" style="color:rgb(200,0,0);">
						<c:out value="${errormessage}"/>
					</td>
				</tr>
				</c:if>
				<tr>
					<td>Username</td>
					<td>:</td>
					<td><input name="username" type="text" class="inputField" id="username*" /></td>
				</tr>
				<tr>
					<td>Password</td>
	               	<td>:</td>
	               	<td><input name="password" type="password" class="inputField" id="password*" /></td>
				</tr>
	            <tr>
	               	<td colspan="3" class="button"><a href="javascript:void(0);" onclick="document.getElementById('forgottd').style.display='';">Forgot password?</a> <input type="image" src="images/btnGo.gif" alt="Login" title="Login" align="absmiddle" /><br /><br /></td>
				</tr>
				</form>
				<tr>
					<td colspan="3" style="display:none; border-top: 1px solid #d9d9d9;" id="forgottd">
					<br />
						<span style="display:block;margin-bottom:10px;">We will send your account information and a new password to your registered email address.</span>
						
						<form name="forgotemail" action="companylogin.do" method="post" onsubmit="return checkFormInput(this);">
							<table border="0" cellspacing="5" cellpadding="0" align="center">
							<tr>
								<td>Email</td>
								<td>:</td>
								<td>
									<input type="hidden" name="action" value="forgotPassword"/>
									<input type="text" id="email@*" name="email" style="width: 140px;" />
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td align="right">
									<input type="submit" value="Submit" class="formButton"/>
									<input type="button" value="Cancel" onclick="this.form.reset();document.getElementById('forgottd').style.display='none';" class="formButton"/>
								</td>
							</tr>
							</table>
						</form>
						<c:if test="${not empty forgotemailmsg}">
						<br/><span class="errormessage">${forgotemailmsg}</span>
						</c:if>
					</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${not empty companyuser}">
			<h1><img src="images/iLogin.gif" alt="Login" title="Login" align="absmiddle" /> ${companyuser.usertype.name} [${companyuser.username}]</h1>
			<p><a href="catalog.do?action=showShoppingList">My Shopping List (<c:if test="${not empty salesorder}">${salesorder.itemQuantity}</c:if><c:if test="${empty salesorder}">0</c:if>)</a> | <a id="active" href="corporateuser.do?action=editUserSetting">Account Settings</a> | <a href="companylogin.do?action=logout" onclick="javascript: return confirm('Do you really want to log out?')">Logout</a></p>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="orderListing">
				<tr>
					<th colspan="2">Order Listing / Status</th>
				</tr>
				<tr>
					<!-- td>Saved</td-->
					<td>Draft</td>
					<td class="textRight"><strong><c:if test="${companyuser.savedOrders eq 0}">${companyuser.savedOrders}</c:if><c:if test="${companyuser.savedOrders gt 0}"><a href="salesorder.do?action=searchSalesOrder&page=1&dept_id=0&statusvalue=8" style="text-decoration:underline;">${companyuser.savedOrders}</a></c:if></strong></td>
				</tr>
				<tr class="even">
					<!-- td>Waiting Approval</td-->
					<td>Waiting for Approval</td>
					<td class="textRight"><strong><c:if test="${companyuser.waitingOrders eq 0}">${companyuser.waitingOrders}</c:if><c:if test="${companyuser.waitingOrders gt 0}"><a href="salesorder.do?action=searchSalesOrder&page=1&dept_id=0&statusvalue=1" style="text-decoration:underline;">${companyuser.waitingOrders}</a></c:if></strong></td>
				</tr>
				<tr>
					<!--td>Approved</td-->
					<td>In Process</td>
					<td class="textRight"><strong><c:if test="${companyuser.approvedOrders eq 0}">${companyuser.approvedOrders}</c:if><c:if test="${companyuser.approvedOrders gt 0}"><a href="salesorder.do?action=searchSalesOrder&page=1&dept_id=0&statusvalue=3" style="text-decoration:underline;">${companyuser.approvedOrders}</a></c:if></strong></td>
				</tr>
				<tr class="even">
					<!-- td>Rejected</td-->
					<td>Disapproved</td>
					<td class="textRight"><strong><c:if test="${companyuser.rejectedOrders eq 0}">${companyuser.rejectedOrders}</c:if><c:if test="${companyuser.rejectedOrders gt 0}"><a href="salesorder.do?action=searchSalesOrder&page=1&dept_id=0&statusvalue=2" style="text-decoration:underline;">${companyuser.rejectedOrders}</a></c:if></strong></td>
				</tr>
				<tr>
					<!-- td>Closed</td-->
					<td>Closed or Resolved</td>
					<td class="textRight"><strong><c:if test="${companyuser.closedOrders eq 0}">${companyuser.closedOrders}</c:if><c:if test="${companyuser.closedOrders gt 0}"><a href="salesorder.do?action=searchSalesOrder&page=1&dept_id=0&statusvalue=12" style="text-decoration:underline;">${companyuser.closedOrders}</a></c:if></strong></td>
				</tr>
				<tr>
					<td>Delivered</td>
					<td class="textRight"><strong><c:if test="${companyuser.deliveredOrders eq 0}">${companyuser.deliveredOrders}</c:if><c:if test="${companyuser.deliveredOrders gt 0}"><a href="salesorder.do?action=searchSalesOrder&page=1&dept_id=0&statusvalue=4" style="text-decoration:underline;">${companyuser.deliveredOrders}</a></c:if></strong></td>
				</tr>
	         </table>
         </c:if>
	</div><!--//loginBox-->
	<c:if test="${empty companyuser}">
	<div class="newsBox">
		<h1><img src="images/iMail.gif" alt="Join Our Mailing List" title="Join Our Mailing List" align="absmiddle" /> Join Our Mailing List</h1>
		<form name="joinmail" method="post" onsubmit="return checkFormInput(this);" action="mailing.do?action=addEmail">
			<table border="0" cellspacing="5" cellpadding="0" align="center">
				<tr>
					<td align="right">Name:</td>
					<td><input type="text" name="name" id="name*" class="inputField" /></td>
	            </tr>
	            <tr>
	            	<td align="right">Company:</td>
	            	<td><input type="text" name="company" id="company*" class="inputField" /></td>
	            </tr>
	            <tr>
	            	<td align="right">Email:</td>
	            	<td><input name="email" type="text" class="inputField" id="email*@" /></td>
	            </tr>
	            <tr>
	            	<td colspan="2" align="right"><img src="images/btnJoin.gif" alt="Join" title="Join" onclick="if(checkFormInput(joinmail))joinmail.submit();" /></td>
	            </tr>
			</table>
		</form>
	</div><!--//newsBox-->
	<div class="newsBox">
		<h1><img src="images/iNews.gif" alt="News" title="News" align="absmiddle" /> News</h1>
		<ul>
			<c:forEach items="${highlightnews}" var="newi" varStatus="counter">
			<c:url var="newsurl" value="news.do">
				<c:param name="action" value="showIndividualNews"/>
				<c:param name="newsId" value="${newi.id}"/>
			</c:url>
	        <li><a href="<c:out value='${newsurl}'/>"><c:out value="${newi.title}" /></a></li>
	        </c:forEach>
		</ul>									
	</div><!--//newsBox-->
	<div class="tipsBox">
		<h1>GREAT TIPS</h1>
		<ul>
			<c:forEach items="${(not empty company) ? highlighttipscorporate : highlighttips}" var="tip" varStatus="counter">
	        <li><a href="tips.do?action=showAllTips"><c:out value="${tip.title}"/></a></li>
	        </c:forEach>
		</ul>
	</div><!--//tipsBox-->
	</c:if>
	<c:if test="${not empty companyuser and pageName ne 'browse'}">
	<div class="newsBox">
		<h1><img src="images/iNews.gif" alt="Search" title="Search" align="absmiddle" /> Search By</h1>
		<form action="salesorder.do?action=searchSalesOrder" method="post" onsubmit="return checkFormInput(this);">
		<table border="0" cellspacing="5" cellpadding="0" align="center">
			<tr>
				<td>Order No.</td>
                <td>:</td>
                <td><input name="orderno" type="text" class="inputField" /></td>
			</tr>
			<tr>
                <td>Requestor</td>
                <td>:</td>
                <td><input name="requestor" type="text" class="inputField" /></td>
			</tr>
			<tr>
                <td colspan="3" class="button"><input type="image" src="images/btnGo.gif" alt="Go" title="Go" align="absmiddle" /></a></td>
			</tr>
			<tr>
				<td colspan="3"><a href="advancedsearch.do?action=showAdvancedSearch">Advanced Search</a></td>
			</tr>
		</table>
		</form>
	</div>
	</c:if>
	<c:if test="${not empty companyuser and pageName eq 'browse'}">
	<div class="newsBox">
		<h1><img src="images/iCatalog.gif" alt="Select" title="Select" align="absmiddle" /> Select Product Catalog</h1>
		<table border="0" cellspacing="5" cellpadding="0" align="center">
			<tr>
				<td><input name="" type="text" class="inputField" /></td>
				<td><img src="images/btnGo.gif" alt="Join" title="Join" /></td>
			</tr>
		</table>
	</div>
	<div class="newsBox">
		<h1><img src="images/iSearch.gif" alt="Search" title="Search" align="absmiddle" /> Item Search</h1>
		<table border="0" cellspacing="5" cellpadding="0" align="center">
			<tr>
				<td><input name="" type="text" class="inputField" /></td>
				<td><img src="images/btnGo.gif" alt="Join" title="Join" /></td>
			</tr>
			<tr>
				<td colspan="2"><a href="#">Advanced Search</a></td>
			</tr>
		</table>
	</div>
	<table>
	  <tr>
		<td valign="top">
		  <c:forEach begin="0" end="${fn:length(categories) > 0 ? fn:length(categories)-1 : 0}" var="i" step="1">
		    <div class="arrowlistmenu">
			  <h3 class="menuheader expandable"><c:out value="${categories[i].name}" /></h3>
			  <ul class="categoryitems">
			    <c:forEach begin="0" end="${fn:length(types) > 0 ? fn:length(types)-1 : 0}" var="j" step="1">
				  <c:if test="${categories[i].id eq types[j].category.id}">
				    <li><a href="catalog.do?action=showGroup&typeid=${types[j].id}&expandable=${i}">${types[j].name}</a></li>
				  </c:if>
			    </c:forEach>
			  </ul>
		    </div>
		  </c:forEach>
	    </td>
	  </tr>	
    </table>
	</c:if>
</div>