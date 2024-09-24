<%@ include file="includes/header.jsp"%>
</head>
<c:set var="pageName" value="careers" />
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
					
					<div class="innerMasthead">
						<c:choose>
							<c:when test="${not empty careersHeader}">
								<img src="${careersHeader}" />
							</c:when>
							<c:otherwise>
								<img src="images/mastheadCareers.jpg"/>
							</c:otherwise>	
						</c:choose>
					</div>
					
					<div class="mainContent">
						<!-- <div class="masthead"><img src="images/mastheadHome.jpg" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" /></div> -->
			            <h1>Careers</h1>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="careersTable">
							<c:forEach items='${careers}' var='career' varStatus='counter'>
							<tr class="${counter.count mod 2 eq 0 ? 'even' : ''}">
								<td valign="top">
									<span id="newstitle"><strong><c:out value='${career.position}' /></strong></span>
									<span id="newsdetails">valid until (<fmt:formatDate value="${career.validUntil}" pattern="MMM dd, yyyy"/>)</span>
								</td>
							</tr>
							<tr class="${counter.count mod 2 eq 0 ? 'even' : ''}">
								<td><img src="images/space.gif" width="1" height="2" /></td>
							</tr>
							<tr class="${counter.count mod 2 eq 0 ? 'even' : ''}">
								<td>
									<span id="newsdetails"><c:out value='${career.description}' escapeXml='false' /></span>
								</td>
							</tr>
							<tr class="${counter.count mod 2 eq 0 ? 'even' : ''}">
								<td><img src="images/space.gif" width="1" height="10" /></td>
							</tr>
							<tr class="${counter.count mod 2 eq 0 ? 'even' : ''}">
								<td bgcolor="#CCCCCC" style="padding:0"><img src="images/space.gif" width="1" height="1" /></td>
							</tr>
							<tr class="${counter.count mod 2 eq 0 ? 'even' : ''}">
								<td><img src="images/space.gif" width="1" height="10" /></td>
							</tr>
							</c:forEach>
						</table>
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
					<img src="images/icon_folder2.gif" width="14" height="11" />
					<a href="#">Careers</a>
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
		<td width="3" bgcolor="#EFF3F3" valign="top">
			<img src="images/breadcrumb_left.gif" width="3" height="265" />
		</td>
		<td width="693">
		
		<table width="100%" border="0" cellspacing="0" cellpadding="10">
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<c:forEach items='${careers}' var='career' varStatus='counter'>
						<tr>
							<td valign="top">
								<span id="newstitle"><c:out value='${career.position}' /></span>
								<span id="newsdetails">valid until (<fmt:formatDate value="${career.validUntil}" pattern="MMM dd, yyyy"/>)</span>
							</td>
						</tr>
						<tr>
							<td><img src="images/space.gif" width="1" height="2" /></td>
						</tr>
						<tr>
							<td>
								<span id="newsdetails"><c:out value='${career.description}' /></span>
							</td>
						</tr>
						<tr>
							<td><img src="images/space.gif" width="1" height="10" /></td>
						</tr>
						<tr>
							<td bgcolor="#CCCCCC"><img src="images/space.gif" width="1" height="1" /></td>
						</tr>
						<tr>
							<td><img src="images/space.gif" width="1" height="10" /></td>
						</tr>
					</c:forEach>
				</table>
				</td>
			</tr>
		</table>
		<td width="4" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_right.gif" width="4"
			height="265" /></td>
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