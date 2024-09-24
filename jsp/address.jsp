<%@ include file="includes/header.jsp"%>
</head>
<c:set var="pageName" value="address" />
<body>
	<div class="wrapper">
		<div class="container">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td class="sLeft">&nbsp;</td>
					<td class="content">
						<div class="timesTrading">
							<%@ include file="includes/logo.jsp"%>
							<%@ include file="includes/menu.jsp"%>
							<%--<%@ include file="includes/latest.jsp"%>--%>
							<%--<%@ include file="includes/search.jsp"%>--%>
						</div>
						
						<div class="innerMasthead"><img src="images/mastheadContactus.jpg"/></div>
						
						<div class="mainContent">
							<!--<c:if test="${empty companyuser}">
							<div class="masthead"><img src="images/mastheadHome.jpg" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" /></div>
							</c:if>-->
							<c:if test="${company ne null and not company.generic and not empty company.contactUs}">
							<h1>${company.contactUs.title}</h1>
							<h4>${company.contactUs.subtitle}</h4>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2"><img src="images/spacer.gif" width="1" height="5" /></td>
								</tr>
								<tr>
									<td colspan="2" id="newsdetails" style="padding:5px;">${company.contactUs.body}</td>
								</tr>
							</table>
							</c:if>
							<c:if test="${company ne null and not company.generic and empty company.contactUs and not empty company.address}">
							<h1>Address</h1>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2"><img src="images/spacer.gif" width="1" height="5" /></td>
								</tr>
								<tr>
									<td colspan="2" id="newsdetails" style="padding:5px;">${company.address}</td>
								</tr>
							</table>
							</c:if>
							<c:if test="${company eq null or company.generic or (empty company.contactUs and empty company.address)}">
							<h1>Tell us how we can help you:</h1>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<c:if test="${genericContactUs eq null}">
										If you have any questions or comments about our products or services, please fill out the following information or contact us at:<br>
										<p>
										<strong>Times Trading Co., Inc.</strong><br>
										525 Quintin Paredes St.<br>
										Metro Manila, Philippines 1006 <br>
										</p>
										<p>
										Tels 242-5741 to 50 &nbsp;&nbsp;&nbsp; <a href="mailto:info@times.com.ph?subject=inquiry%20from%20the%20website">email: info@times.com.ph</a>
										</p>
										</c:if>
										<c:if test="${genericContactUs ne null}">
										${genericContactUs.body}
										</c:if>
									</td>
								</tr>
							</table>
							</c:if>
						</div>
						<%--@ include file="includes/sidenav.jsp"--%>
						<div class="clear"></div>
<%--
<table width="700" align="center" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<!-- top -->
		<td height="43" colspan="3" background="images/bg_breadcrumb.gif">
		<table width="100%" cellpadding="10" cellspacing="0" border="0">
			<tr>
				<td class="breadcrumb">
					<img src="images/icon_folder2.gif" width="14" height="11" /> <a href="#">${company.contactUs.title}</a>
				</td>
				<td align="right">
					<%@ include file="includes/miniicons.jsp"%>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr valign="top">
		<!-- middle -->
		<td width="3" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_left.gif" width="3" height="265" /></td>
		<td width="693" height="300">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<c:if test="${not empty contactmsg }">
			<tr>
			<td id="newstitle">
				<c:out value="${contactmsg }"/>
			</td>
			</tr>
			</c:if>
			<tr>
				<td>
				<form method="post" action="contactus.do" name="contactus" onsubmit="return validate()"><input type="hidden" name="action" value="sendEmail">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" id="newstitle" style="padding:5px;">
							${company.contactUs.subtitle}
						</td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/spacer.gif" width="1" height="5" /></td>
					</tr>
					<tr>
						<td colspan="2" id="newsdetails" style="padding:5px;">
						${company.contactUs.body}
						</td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/spacer.gif" width="1" height="16" /></td>
					</tr>
					<tr>
						<td id="newsdetails">Name:</td>
						<td><input type="text" name="name" id="name" size="50"><span class="requiredField">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/space.gif" width="1" height="8" /></td>
					</tr>
					<tr>
						<td id="newsdetails">Company:</td>
						<td><input type="text" name="company" id="company" size="50"></td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/space.gif" width="1" height="8" /></td>
					</tr>
					<tr>
						<td id="newsdetails">Email:</td>
						<td><input type="text" name="email" id="email" size="50"><span class="requiredField">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/space.gif" width="1" height="8" /></td>
					</tr>
					<tr>
						<td id="newsdetails">Subject:</td>
						<td>
							<select name="subject">
								<option value="0" selected> -- Please select one -- </option>
								<option value="Create a new user account">Create a new user account.</option>
								<option value="Product catalog inquiry">Product catalog inquiry.</option>
								<option value="Sales dealership inquiry">Sales dealership inquiry.</option>
								<option value="Others">Others</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/space.gif" width="1" height="8" /></td>
					</tr>
					<tr id="middle">
						<td id="newsdetails" valign="top">Message:</td>
						<td id="middle">
							<textarea id="message" name="message" rows="5" cols="40"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/space.gif" width="1" height="8" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" id="submit" value="Send Message" onClick="return validate();">
						</td>
					</tr>
				</table>
				</form>
				</td>
			</tr>
		</table>
		<td width="4" bgcolor="#EFF3F3" valign="top">
			<img src="images/breadcrumb_right.gif" width="4" height="265" />
		</td>
	</tr>
	<tr>
		<!-- buttom -->
		<td height="4" colspan="3"><img src="images/breadcrumb_bottom.gif" width="700" height="4" /></td>
	</tr>
</table>

						<c:if test="${not empty salesorder}">
						<br />
						<c:url var="cancelsalesorderhref" value="salesorder.do">
						<c:param name="action" value="cancelSalesOrder" />
						</c:url>
						<%@ include file="includes/salesorder.jsp" %>
						</c:if>
						<%@ include file="includes/producthighlights.jsp"%>
						--%>
						<%@ include file="/jsp/includes/footer.jsp"%>
						<%@ include file="includes/analytics.jsp" %>
					</td>
					<td class="sRight">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>