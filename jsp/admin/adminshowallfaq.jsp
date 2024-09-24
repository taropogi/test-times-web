<%@ include file="../includes/adminheader.jsp"%>

<script type="text/javascript" src="dwr/interface/AdminCompanyAction.js"></script>
<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>

<script language="javascript">
<%@ include file="/javascripts/adminforms.js" %>
</script>


<body>
<c:set var="menu" value="corporate"/>
<c:set var="submenu" value="faq"/>
<c:set var="pagemessage" value="You can add, update and delete frequently asked questions here."/>
<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea" style="margin-bottom:20px;">
	
		<table  border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			  	<br />
		
				<c:if test="${not empty faqsHeader}">
					<img src="${faqsHeader}" />
				</c:if>
			  	<br />
			  	
			  	<form method="post" action="adminfaq.do?action=uploadFaqsHeader" enctype="multipart/form-data">
			  		<input type="file" name="file" />
			  		<input type="submit" value="Upload FAQs Header" />
			  	</form>
			  	
			  	<br />
			  	<br />
		    </tr>
			
			<tr>
				<td>
					<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles" >
						<tr>
							<th colspan="2">Frequently Asked Questions</th>
						</tr>
						
						<c:forEach items="${companyList}" var="company">
							<c:if test="${not company.generic}">
							<c:url var="url" value="adminfaq.do" >
								<c:param name="action" value="adminShowCompanyFaqs"/>
								<c:param name="companyId" value="${company.id}"/>
							</c:url>
							<tr class="bground">						
								<td width="100%" class="itemthumb">
									<span style="font-weight:bold;"><c:out value="${company.name}"/></span>
									<br/>
									<c:if test="${not empty company.faqs}">
										<div style="margin-top:5px;max-width:650px;max-height:100px;overflow-x:auto;">
											<c:forEach items="${company.faqs}" var="faq" varStatus="counter">
												<span style="display:block;" id="faq${faq.id}">
													<a style="color:rgb(0,0,0);" href="adminfaq.do?action=adminShowFaq&faqId=${faq.id}">${counter.count}. 
														<c:out value="${faq.question}"/>
													</a>
												</span>
											</c:forEach>
										</div>
									</c:if>
									<div align="right">
									<a class="editdel" href="<c:out value="${url}"/>">Edit FAQs</a>
										<span class="projdetails">|</span>
									<a class="editdel" href="adminfaq.do?action=adminDeleteFaqs&companyId=${company.id}" onclick="return confirm('Are you sure you want to delete the FAQs of ${company.name}?')">Remove FAQs</a>
									</div>
								</td>
							</tr>
							</c:if>
						</c:forEach>
					</table>
				</td>
				<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"></td>
			</tr>
		</table>
					
		<form method="post" action="adminfaq.do" onsubmit="return validate(this);">
			<input type="hidden" name="action" value="adminAddFaq">
			<table border="0" cellpadding="0" cellspacing="0" width="99%" class="projfiles" >
				<tr>
					<th><img src="images/admin/add.png" width="16" height="16" border="0"/>Add a New Frequently Asked Question</th>
				</tr>
				<tr class="bground">
					<td class="itemthumb">
						<table>
								<%@ include file="../includes/error.jsp"%>
								<tr>
									<td>
										<span class="itemname">Company:<span class="requiredfield">*</span></span>
									</td>
									<td>
										<c:if test="${not empty companyList}">
										<select name="companyId" class="item">
											<c:forEach items="${companyList}" var="company">
											<c:if test="${not company.generic}">
											<option value="${company.id}">${company.name}</option>
											</c:if>
											</c:forEach>
										</select>
										</c:if>
									</td>
								</tr>
								<tr>
									<td>Question:<span class="requiredfield">*</span></td>
									<td><textarea name="question*" cols="60" rows="3" maxlength="500"><c:out value='${singlefaq.question}'/></textarea>
									</td>
				
								</tr>
								<tr>
									<td>
									Answer:<span class="requiredfield">*</span></td>
									<td><textarea name="answer*" cols="60" rows="6" maxlength="500"><c:out value='${singlefaq.answer}'/></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
										<input class="buttonitem" type="submit" value="add new faq"/>
										<input class="buttonitem" type="button" value="reset" onclick="this.form.reset();"/>
									</td>
								</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<!--<div id="messagenews"><%@ include file="../includes/tips.jsp"%>
		<ul>
			<li>You can add, edit and delete frequently asked questions here.</li>
		</ul>
	</div>
	--><br>

	<%@ include file="../includes/adminfooter.jsp"%>

</body>
</html>