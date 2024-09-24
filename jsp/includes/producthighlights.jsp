<table width="701" height="220" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="10"><img src="images/space.gif" width="1" height="1" /></td>
	</tr>
	<tr>
		<td width="701" valign="top" background="images/bg_quick.jpg" style="background-repeat:no-repeat">
			<table width="674" height="183" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td height="42">
						<span class="quick">
							<c:if test='${not empty companyuser}'>Product Highlights</c:if>
							<c:if test='${empty companyuser}'>News</c:if>
						</span>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="398" height="141" valign="top">
						<c:if test='${not empty companyuser}'>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="30" colspan="2" align="right" valign="top">
									<img src="images/space.gif" width="1" height="1" />
									<span class="newarrival">
										<a href="catalog.do?action=showProducts" class="moreproduct">More Products</a>
										<img src="images/icon_arror2.gif" width="14" height="8" align="absmiddle" />
									</span>
								</td>
							</tr>
							<tr>
								<td colspan="2" valign="top">
									<table width="414" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<c:forEach items="${highlightproducts}" var="product" varStatus="Counter">
											<c:url var="url" value="catalog.do">
												<c:param name="action" value="showProductDetail"/>
												<c:param name="productid" value="${product.id}"/>
											</c:url>
											<td valign="top" class="newarrival">
												<c:if test='${not empty product.imageExtension}'>
												<img src="images/product_thumb_image/<c:out value='${product.filePicture}'/>" width="95" class="pictureborder"/> <br />
												</c:if>              			
												<a href="<c:out value='${url}'/>"><c:out value="${product.name}"/></a>
											</c:forEach>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						</c:if>
						<c:if test='${empty companyuser}'>
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="11" colspan="2"><img src="images/space.gif" width="1" height="1" /></td>
								</tr>
								<c:forEach items="${highlightnews}" var="newi" varStatus="counter">
									<c:url var="newsurl" value="news.do">
										<c:param name="action" value="showIndividualNews"/>
										<c:param name="newsId" value="${newi.id}"/>
									</c:url>
								<tr width="95%">
									<td>
									<p id="newstitle"><a href="<c:out value='${newsurl}'/>"><c:out value='${newi.title}' /></a><br />
									<em class="smalltext"><c:out value='${newi.subtitle}' /></em></p>
									<span id="newsdetails">
										<c:out value='${newi.bodyShort}' escapeXml='false' />
										<a href="<c:out value='${newsurl}'/>">Read more</a>
									</span>
									</td>
								</tr>
								</c:forEach>
							</table>
						</c:if>
					</td>
					<td width="276" align="right" valign="top">
						<table width="232" border="0" cellpadding="10" cellspacing="1" bgcolor="#FFCC99">
							<tr>
								<td align="left" valign="top" bgcolor="#FFFFCC"><span class="creambox">About Times Trading </span>
									<table width="204" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td colspan="2" class="smalltext">
												We are one of the Philippines' <strong>premier distributor of school and office products</strong>, representing some of the most well known brands in the country.
											</td>
										</tr>
									</table>
									<img src="images/logindivider.gif" width="212" height="1" vspace="8" /><br />
									<c:if test='${not empty companyuser}'>
									<table width="204" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td colspan="2" class="smalltext">
												<p id="pagedetail">
												User <strong><c:out value='${companyuser.firstname}'/> <c:out value='${companyuser.lastname}'/></strong> is logged in.
												<br/><a href="companylogin.do?action=logout" onclick="javascript: return confirm('Are you sure you want to log out?')"><strong>Log out</strong></a>.
												</p>
											</td>
										</tr>
									</table>
									<img src="images/logindivider.gif" width="212" height="1" vspace="8" /><br />
									</c:if>
									<table width="204" border="0" align="center" cellpadding="3" cellspacing="0">
										<tr>
											<td width="189" class="login"><img src="images/tx_needhelp.gif" width="15" height="18" align="absmiddle" /> <span class="creambox">Need Help Now?</span> <br />
												<span class="smalltext"><a href="mailto:info@times.com.ph?subject=inquiry from the website">Email us</a> right away for assistance.</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>