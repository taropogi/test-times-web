<%@ include file="../includes/adminheader.jsp"%>

<script type="text/javascript" src="FCKeditor/fckeditor.js"></script>

<script language="javascript">
<%@ include file="/javascripts/adminforms.js" %>
</script>


<body>
<c:set var="menu" value="corporate"/>
<c:set var="submenu" value="home"/>
<c:set var="pagemessage" value="You can add, update and delete Home pages here."/>
<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	
		<table  border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td>
					<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles" >
						<tr>
							<th colspan="2">Home Page</th>
						</tr>
						
						<c:forEach items="${homeList}" var="home" varStatus="counter">
							<c:if test="${not home.company.generic}">
							<c:url var="url" value="adminhome.do" >
								<c:param name="action" value="adminShowHome"/>
								<c:param name="homeId" value="${home.id}"/>
							</c:url>
							<tr class="bground">						
								<td width="100%" class="itemthumb">
									<span>${home.company.name}</span>
									<div align="right">
									<a class="editdel" href="<c:out value="${url}"/>">edit</a>
										<span class="projdetails">|</span>
									<a class="editdel" href="adminhome.do?action=adminDeleteHome&id=<c:out value="${home.id}"/>" onclick="return confirm('Are you sure you want to delete\n the #<c:out value='${counter.count}' /> page?')">delete</a>
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
					
		<form method="post" action="adminhome.do" onsubmit="return validate(this);">
			<input type="hidden" name="action" value="adminAddHome">
			<table border="0" cellpadding="0" cellspacing="0" width="99%" class="projfiles" >
				<tr>
					<th><img src="images/admin/add.png" width="16" height="16" border="0"/>Add New Home Page</th>
				</tr>
				<tr class="bground">
					<td class="itemthumb">
						<%@ include file="../includes/error.jsp"%>
						<table border="0" cellspacing="01" cellpadding="01" width="100%">
							<tr>
								<td>
									<span class="itemname">Title:<span class="requiredfield">*</span></span>
								</td>
								<td>
									<input type="text" id="title*" name="title*" class="item"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Subtitle:</span>
								</td>
								<td>
									<input type="text" name="subtitle" class="item"/>
								</td>
							</tr>
							<tr>
								<td>
									<span class="itemname">Company:<span class="requiredfield">*</span></span>
								</td>
								<td>
									<c:if test="${not empty companyList}">
									<select name="company_id" class="item">
										<c:forEach items="${companyList}" var="company">
										<c:if test="${not company.generic and company.home eq null}">
										<option value="${company.id}"<c:if test="${company.id eq param.companyId}">selected="selected"</c:if>>${company.name}</option>
										</c:if>
										</c:forEach>
									</select>
									</c:if>
								</td>
							</tr>
							<tr valign="top">
								<td>
									<span class="itemname">Body:</span>
								</td>
								<td colspan="3">
								<FCK:editor instanceName="body_FCK" width="95%" height="350px" value="" basePath="/FCKeditor" toolbarSet="Basic"/>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="4">
									<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
									<input type="submit" class="buttonitem" name="submitb" value="add" />
									<input type="button" class="buttonitem" name="cancelb" value="reset" onclick="this.form.reset();" />
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
			<li>You can add, edit and delete Home pages here.</li>
		</ul>
	</div>
	--><br>

	<%@ include file="../includes/adminfooter.jsp"%>

</body>
</html>