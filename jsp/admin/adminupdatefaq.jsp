<%@ include file="../includes/adminheader.jsp"%>

<script type="text/javascript" src="dwr/interface/AdminCompanyAction.js"></script>
<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>

<script language="javascript">
<%@ include file="/javascripts/adminforms.js" %>
</script>

<c:set var="menu" value="corporate"/>
<c:if test="${singlefaq.generic}">
<c:set var="menu" value="manage" />
</c:if>
<c:set var="submenu" value="faq"/>
<c:set var="pagemessage" value="You can add, update and delete frequently asked questions here."/>
<%@ include file="../includes/adminnav.jsp"%>


<body>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>


<div id="containerdash">
	<div id="messagearea">
	
	<form action="adminfaq.do" onsubmit="return validate(this);" method="post">
		<input type="hidden" name="action" value="adminUpdateFaq"/>
		<input type="hidden" name="faqId" value='<c:out value='${singlefaq.id}'/>'/>
		<c:if test="${not singlefaq.generic}">
		<input type="hidden" name="companyId" value='<c:out value='${singlefaq.company.id}'/>'/>
		</c:if>
		<c:if test="${adminShowCompanyFaqs ne null}"><input type="hidden" name="adminShowCompanyFaqs"/></c:if>
	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles" >
		<tr>
			<th colspan="2">Edit FAQ</th>
		</tr>
		
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles" >
					<tr class="bground">
						<td class="itemthumb">
							<table>
									<%@ include file="../includes/error.jsp"%>
									<c:if test="${not singlefaq.generic}">
									<tr>
										<td>Company:</td>
										<td>${singlefaq.company.name}</td>
									</tr>
									</c:if>	
									<tr>
										<td>Question:<span class="requiredfield">*</span></td>
										<td><textarea name="question*" cols="60" rows="3" maxlength="500"><c:out value='${singlefaq.question}'/></textarea>
										</td>
									</tr>
									<tr>
										<td>Answer:<span class="requiredfield">*</span></td>
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
											<input class="buttonitem" type="submit" value="Update FAQ"/>
											<input class="buttonitem" type="button" value="reset" onclick="this.form.reset();"/>
										</td>
									</tr>
							</table>
						</td>
					</tr>
			</table>
		</td>
	</tr>
	</form>
	</table>
	</div>
   
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>You can add, edit and delete frequently asked questions here.</li>
	<li>Another Tip.</li>
	</ul>
	</div>
	--><br>

	<%@ include file="../includes/adminfooter.jsp"%>
	</div>
</div>
</body>
</html>
