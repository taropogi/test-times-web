<%@ include file="includes/header.jsp"%>
</head>
<c:set var="pageName" value="aboutus" />
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
							<c:choose>
								<c:when test="${not empty companyuser and company ne null and company.home ne null}">																	
									<h1>${company.home.title}</h1>
			            			${company.home.body}
								</c:when>
								
								<c:otherwise>
									<div class="innerMasthead">
										<c:if test="${not empty aboutus.imageUrl}">
											<img src="${ fn:replace(aboutus.imageUrl, '\\', '/') }"/>
										</c:if>
										<c:if test="${empty aboutus.imageUrl}">
											<img src="images/mastheadAbout.jpg"/>
										</c:if>
									</div>
									<h1>About Us</h1>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>									
											<td width="520px" valign="top">
											<p id="pagedetail">${aboutus.details}</p>
											</td>											
										</tr>
									</table>
								</c:otherwise>
							</c:choose>
						
			            	<%-- <c:if test="${not empty companyuser and company ne null}">
			            	<h1><c:if test="${company ne null and company.home ne null}">${company.home.title}</c:if></h1>
			            	${company.home.body}
			            	</c:if>
			            	<c:if test="${empty companyuser or company eq null}">
			            	<!-- <div class="masthead"><img src="images/mastheadHome.jpg" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" /></div>-->
							<h1>About Us</h1>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%" valign="top">
									<p id="pagetitle"><img src="images/maped.jpg" align="right" border="0" alt="" class="pictureborder">Company Profile</p>
									<p id="pagedetail">
									${aboutus.details}</p>
									<br>
									<p id="pagetitle">We live by our motto:</p>
									<p id="pagedetail"><b>Customers are first!<br>
									We do our best to give you the best.</b></p>
									</td>
								</tr>
							</table>
							</c:if>--%>
						</div>
						<%--@ include file="includes/sidenav.jsp"--%>
						<div class="clear"></div>
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