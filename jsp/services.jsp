<%@ include file="includes/header.jsp"%>
</head>
<c:set var="pageName" value="services" />
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
						</div>
						
						<div class="innerMasthead">
							<c:if test="${not empty service.imageUrl}">
								<img src="${ fn:replace(service.imageUrl, '\\', '/') }"/>
							</c:if>
							<c:if test="${empty service.imageUrl}">
								<img src="images/mastheadServices.jpg"/>
							</c:if>
						</div>
						
						<div class="mainContent">
							<!-- <div class="masthead"><img src="images/mastheadHome.jpg" alt="Times Trading Co., Inc. - Since 1945" title="Times Trading Co., Inc. - Since 1945" /></div>-->
							<h1>Our Services</h1>
							<p id="pagedetail">
								${ service.details }
							</p>
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