<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<script type='text/javascript' src='fckeditor/fckeditor.js'></script>

<body>
<c:set var="menu" value="manage"/>
<c:set var="submenu" value="latest"/>
<c:set var="pagemessage" value="You can add, update and delete the information for the Latest item here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
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
							<th colspan="2">Latest Details</th>
						</tr>
						
						<c:forEach items="${latests}" var="latest" varStatus="counter">
							<c:url var="url" value="adminlatest.do" >
								<c:param name="action" value="showLatest"/>
								<c:param name="latestid" value="${latest.id}"/>
							</c:url>
							<tr class="bground">						
								<td width="100%" class="itemthumb">
									<c:out value="${counter.count}" />.&nbsp;
									<span class="itemname">Company:</span>
									<span class="itemdescription"> <c:out value='${latest.company.name}'/></span><br/>
									<span style="padding-left: 20px;display:block;" class="itemname"/>
											Latest Detail:</span><br/>
									<span style="padding-left: 20px;display:block;" class="itemdescription"> <c:out value='${latest.latest}' escapeXml="false"/></span>
									<br/><br/>

									<div align="right">
									<a class="editdel" href="adminmanage.do?action=setLatest&id=<c:out value="${latest.id}"/>">edit</a>
										<span class="projdetails">|</span>
									<a class="editdel" href="adminmanage.do?action=deleteLatest&id=<c:out value="${latest.id}"/>" onclick="return confirm('Are you sure you want to delete\n the #<c:out value='${counter.count}' /> detail?')">delete</a>
									</div>  
								</td>
							</tr>
						</c:forEach>
					</table>
				</td>
				<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0">
				</td>
			</tr>
		</table>
	
	
 	  <img src="images/spacer.gif" width="1" height="1" border="0"/>
		<table border="0" cellpadding="0" cellspacing="0" width="98%" class="projfiles">
		  <tr>
		   <th colspan="2">
				<img src="images/admin/add.png" width="16" height="16" border="0">
				 Add A Latest Detail
		   </th>
		  </tr>	
	  <tr class="bground">
	  	<td class="itemthumb">
	  	<form name="latest" action="adminmanage.do?action=addNewLatest" method="post">
	  	Choose Company: 
	  	<select name="companyId" >
	  		<option value="">&nbsp</option>
	  		<c:forEach items="${companies}" var="company" varStatus="ctr">
	  		<option value="${company.id}">${company.name}</option>
	  		</c:forEach>
	  	</select>
	  	<br/>
		<span class="formLabelText">Latest text</span><br />
	  	<TEXTAREA NAME="latest" COLS=80 ROWS=3 WRAP=HARD></TEXTAREA>
	  	<center>
		  	<span id="snake" style="display:none">
		  		<img src="images/indicator.gif" />
		  	</span>
		  	<input type="submit" class="buttonitem" value="save"/>
		  	<input type="reset" class="buttonitem" value="reset" />
	  	</center>
	 	</form>
	 	</td>
	  </tr>
	</table>
	</div>	

	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
		<li>List here a one liner message that will appear in all our web pages.</li>
	</ul>
	</div>
	--><br style="clear:left;" />

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>