<%@ include file="includes/header.jsp"%>
</head>
<c:set var="pageName" value="news" />
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
						<div class="mainContent">
							<!--<c:if test="${empty companyuser}">
							<div class="masthead"><img src="images/mastheadHome.jpg" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" /></div>
							</c:if>-->
			            	<h2>News and Events - <c:out value='${news.title}'/></h2>
			            	<table width="100%" border="0" cellspacing="0" cellpadding="10" align="middle">
						        <tr>
						        	<td width="84%" valign="top">
										<c:if test='${news.imageExtension != null}'>
											<img align="left" class="pictureborder" src="images/news_front_image/news_<c:out value='${news.id}' /><c:out value='${news.imageExtension}' />"/><br />
										</c:if>
									</td>
								</tr>
								<tr>
									<td>
										<strong><c:out value='${news.title}' /></strong><br />
										<em><c:out value='${news.subtitle}' /></em>
									<span id="newsdetails">
						          		<c:out value='${news.body}' escapeXml='false' />
									</span>
									</td>
								</tr>
								<tr>
									<td align="right">
										<span id="newstitle">
											<a href="news.do?action=showAllNews">see all news items</a>
										</span>
									</td>
								</tr>
							</table>
						</div>
						<%--@ include file="includes/sidenav.jsp"--%>
						<div class="clear"></div>
<%--
<table width="700" align="center" cellspacing="0" cellpadding="0" border="0">
	<tr><!-- top -->
    <td height="43" colspan="3" background="images/bg_breadcrumb.gif">
    	<table width="100%" cellpadding="10" cellspacing="0" border="0">
    		<tr>
		    	<td class="breadcrumb"><img src="images/icon_folder2.gif" width="14" height="11" />
		    	<a href="news.do?action=showAllNews">News and Events</a> 
					<span class="breadcrumbseparator">&gt;&gt;</span> <a><c:out value='${news.title}'/></a>
		    	<td align="right">
					<%@ include file="includes/miniicons.jsp"%>
					</td>
				</tr>
    	</table>
    </td>
  </tr>
  <tr valign="top"> <!-- middle -->
  	<td width="3" bgcolor="#EFF3F3" valign="top">
  		<img src="images/breadcrumb_left.gif" width="3" height="265" />
  	</td>
	<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="10" align="middle">
        <tr>
        	<td width="84%" valign="top">
				<c:if test='${news.imageExtension != null}'>
					<img align="left" class="pictureborder" src="images/news_front_image/news_<c:out value='${news.id}' /><c:out value='${news.imageExtension}' />"/><br />
				</c:if>
			</td>
		</tr>
		<tr>
			<td>
			<span id="newstitle">
				<c:out value='${news.title}' /><br />
				<span class="smalltext"><em><c:out value='${news.subtitle}' /></em></span>
			</span>
			<span id="newsdetails">
          		<c:out value='${news.body}' escapeXml='false' />
			</span>
			</td>
		</tr>
		<tr>
			<td align="right">
				<span id="newstitle">
					<a href="news.do?action=showAllNews">see all news items</a>
				</span>
			</td>
		</tr>
		</table>
	</td>
  	<td width="4" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_right.gif" width="4" height="265" /></td>
	</tr>
  <tr><!-- buttom -->
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
<%@ include file="includes/producthighlights.jsp" %>
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