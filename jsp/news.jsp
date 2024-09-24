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
							<!-- <div class="masthead"><img src="images/mastheadHome.jpg" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" /></div>-->
				            <h1>News</h1>
				            <table width="100%" border="0" cellspacing="10" cellpadding="0" class="productsTable">
								<c:forEach items="${news}" var="newi" varStatus="counter">
								<c:url var="newsurl" value="news.do">
									<c:param name="action" value="showIndividualNews"/>
									<c:param name="newsId" value="${newi.id}"/>
								</c:url>
			
								<tr class="${counter.count mod 2 eq 0 ? 'even' : ''}">
									<td width="17%"><c:choose>
										<c:when test="${not empty newi.id}">
											<c:set value="${newi.id}" var="image" />
											<img src="images/news_thumb_image/news_<c:out value='${newi.id}' /><c:out value='${newi.imageExtension}' />"/>
										</c:when>
										<c:otherwise>
											<img src="images/defaultimage.jpg" alt="Image not available" title="Image not available" class="thumbnail"/>
										</c:otherwise>
									</c:choose></td>
									<td>
										<strong><c:out value="${newi.title}" /></strong>
										<br />
										<c:out value='${newi.bodyShort}' escapeXml='false' />
										<a href="<c:out value='${newsurl}'/>">read more &raquo;</a>
									</td>
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
				<td class="breadcrumb"><img src="images/icon_folder2.gif" width="14" height="11" />
				<a href="#">News and Events</a>
				<td align="right"><%@ include file="includes/miniicons.jsp"%></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr valign="top">
		<!-- middle -->
		<td width="3" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_left.gif" width="3"
			height="265" /></td>
		<td width="693" height="300">
		<table width="100%" border="0" cellspacing="0" cellpadding="10">
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<c:forEach items="${news}" var="newi" varStatus="counter">
						<c:url var="newsurl" value="news.do">
							<c:param name="action" value="showIndividualNews"/>
							<c:param name="newsId" value="${newi.id}"/>
						</c:url>

						<tr>
							<td width="16%" valign="top">
								<c:if test='${newi.imageExtension != null}'>
									<a href="<c:out value='${newsurl}'/>"><img class="pictureborder" src="images/news_thumb_image/news_<c:out value='${newi.id}' /><c:out value='${newi.imageExtension}' />" border="0"/></a>
								</c:if>
							</td>
							<td width="84%" valign="top">
								<p id="newstitle"><a href="<c:out value='${newsurl}'/>"><c:out value='${newi.title}' /></a><br />
								<em class="smalltext"><c:out value='${newi.subtitle}' /></em></p>
								<span id="newsdetails">
									<c:out value='${newi.bodyShort}' escapeXml='false' />
									<a class="newsdetailslink" href="<c:out value='${newsurl}'/>">Read more</a>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/space.gif" width="1" height="8" /></td>
						</tr>
						<tr>
							<td bgcolor="#CCCCCC" colspan="2"><img src="images/space.gif" width="1" height="1" /></td>
						</tr>
						<tr>
							<td colspan="2"><img src="images/space.gif" width="1" height="15" /></td>
						</tr>
					</c:forEach>
				</table>
				</td>
			</tr>
		</table>
		</td>
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