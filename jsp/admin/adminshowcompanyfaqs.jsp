<%@ include file="../includes/adminheader.jsp"%>

<script type="text/javascript" src="dwr/interface/AdminCompanyAction.js"></script>
<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>

<script language="javascript">
<%@ include file="/javascripts/adminforms.js" %>
</script>


<body>
<c:set var="menu" value="corporate"/>
<c:if test="${webmenu}">
<c:set var="menu" value="manage" />
</c:if>
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
							<th colspan="2"><c:if test="${company ne null}"><span style="text-decoration:underline;margin-right:10px;">${company.name}</span></c:if>Frequently Asked Questions</th>
						</tr>
						
						<c:if test="${company ne null}">
						<c:set var="faqs" value="${company.faqs}" />
						</c:if>
						
						<c:if test="${not empty faqs}">
						<c:forEach items="${faqs}" var="faq">
						<tr class="bground">						
							<td width="100%" class="itemthumb">
								<span style="display:block;font-weight:bold;margin-right:10px;" id="faq${faq.id}">Question:</span><span style="display:block;margin-bottom:5px;"><c:out value="${faq.question}"/></span>
								<span style="display:block;font-weight:bold;margin-right:10px;" id="faq${faq.id}">Answer:</span><c:out value="${faq.answer}"/>
								<span style="display:block;font-weight:bold;margin-right:10px;" id="faq${faq.id}">Sort Order:</span><c:out value="${faq.sortOrder}"/>
								<div align="right">
								<a class="editdel" href="adminfaq.do?action=adminShowFaq&faqId=${faq.id}&adminShowCompanyFaqs">Edit</a>
									<span class="projdetails">|</span>
								<a class="editdel" href="adminfaq.do?action=adminDeleteFaq&faqId=${faq.id}" onclick="return confirm('Are you sure you want to delete this FAQ?')">Delete</a>
								</div>
							</td>
						</tr>
						</c:forEach>
						</c:if>
					</table>
				</td>
				<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"></td>
			</tr>
		</table>
					
		<form method="post" action="adminfaq.do" onsubmit="return validate(this);">
			<c:if test="${company ne null}">
			<input type="hidden" name="action" value="adminAddFaq"/>
			<input type="hidden" name="companyId" value="${company.id}"/>
			</c:if>
			<c:if test="${company eq null}">
			<input type="hidden" name="action" value="adminAddGenericFaq"/>
			</c:if>
			<input type="hidden" name="adminShowCompanyFaqs"/>
			<table border="0" cellpadding="0" cellspacing="0" width="99%" class="projfiles" >
				<tr>
					<th><img src="images/admin/add.png" width="16" height="16" border="0"/>Add a New Frequently Asked Question</th>
				</tr>
				<tr class="bground">
					<td class="itemthumb">
						<table>
								<%@ include file="../includes/error.jsp"%>
								<c:if test="${company ne null}">
								<tr>
									<td>
										<span class="itemname">Company:</span>
									</td>
									<td>
										<span>${company.name}</span>
									</td>
								</tr>
								</c:if>
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
									<td>
										<span class="formLabelText">Sort Order:<span class="requiredfield">*</span></span>
									</td>
									<td>
										<input type="text" name="sortOrder*" style="width: 250px" width="250" value="<c:out value='${singlefaq.sortOrder}'/>" />
									</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
										<input class="buttonitem" type="submit" value="Add FAQ"/>
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