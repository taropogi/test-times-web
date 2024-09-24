<%@ include file="../includes/header.jsp"%>
</head>
<c:set var="pageName" value="faq" />
<body>
	<div class="wrapper">
		<div class="container">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top">
					<td class="sLeft">&nbsp;</td>
					<td class="content">
						<div class="timesTrading">
							<%@ include file="../includes/logo.jsp"%>
							<%@ include file="../includes/menu.jsp"%>
						</div>
						
						<div class="innerMasthead">
							<c:choose>
								<c:when test="${not empty faqsHeader}">
									<img src="${faqsHeader}" />
								</c:when>
								<c:otherwise>
									<img src="images/mastheadFAQ.jpg"/>
								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="mainContent">
							<h1>Frequently Asked Questions</h1>
							<table width="100%" border="0" cellspacing="5" cellpadding="0" class="productsTable">
								<c:forEach items="${faqs}" var="faq" varStatus="ctr">
									
									<tr>
										<td valign="top">${ctr.count}.</td>
										<td valign="top">
											<a href="#" style="text-align: justify; text-decoration:none; font-weight:bold; color:#282828;"><c:out value="${faq.question}"/></a>
											<div style="padding:0 15px 0 0; text-align:justify; font-weigt:normal; color:#282828;">
												<c:out value="${faq.answer}"/>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2" bgcolor="#EFF3F3" width="1" height="2"></td>
									</tr>
									
									<!--
									<tr>
										<td><strong>Question #${ctr.count}:</strong></td>
										<td><c:out value="${faq.question}"/></td>
									</tr>
									<tr>
										<td><strong>Answer:</strong></td>
										<td><c:out value="${faq.answer}"/></td>
									</tr>-->
									
								</c:forEach>
							</table>
						</div>
						
						<%-- <%@ include file="../includes/sidenav.jsp"%>--%>
						
						<div class="clear"></div>
<%--
<table width="700" height="312" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="43" colspan="3" background="images/bg_breadcrumb.gif">
			<table width="100%" border="0" cellspacing="0" cellpadding="10">
				<tr>
					<td class="breadcrumb">
						<img src="images/icon_folder2.gif" width="14" height="11" /> 
						<a href="faq.do?action=showAllFaq">FAQs</a>
					</td>
					<td align="right">
						<%@ include file="../includes/miniicons.jsp"%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	<tr valign="top">
		<td width="3" height="265" bgcolor="#EFF3F3">
			<img src="images/breadcrumb_left.gif" width="3" height="265" />
		</td>
		<td width="600" height="265" bgcolor="#EFF3F3">
		<table valign="top" border="0">
			<c:forEach items="${faqs}" var="faq" varStatus="ctr">
				<tr>
					<td align="left" width="50"  valign="top">
						<p id="pagetitle">Q.</p>
					</td>
					<td align="left" width="700">
						<span class="listvalue"><c:out value="${faq.question}"/><br/></span>
					</td>
				</tr>
				<tr>
					<td align="left" width ="50" valign="top">
						<p id="pagetitle">A.</p>
					</td>
					<td align="left" width="700">
						<span class="listusers"><c:out value="${faq.answer}"/><br/></span>
					</td>
				</tr>	
				<tr>
					<td bgcolor="#EFF3F3">
						<img src="images/spacer.gif" width="1" height="10" border="0" alt="">
					</td>
				</tr>
			</c:forEach>
		</table>
		</td>

		<td width="4" bgcolor="#EFF3F3" valign="top"><img src="images/breadcrumb_right.gif" width="4"	height="265" /></td>
	</tr>
	<tr>
		<!-- buttom -->
		<td height="4" colspan="3"><img src="images/breadcrumb_bottom.gif" width="700" height="4" /></td>
	</tr>
</table>

<br>
<%@ include file="../includes/producthighlights.jsp"%>
--%>
						<%@ include file="../includes/footer.jsp"%>
					</td>
					<td class="sRight">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>