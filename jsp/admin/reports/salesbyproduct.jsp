<%@ include file="../../includes/adminheader.jsp"%>

<style type="text/css">@import url(css/calendar-blue.css);</style>
<script type="text/javascript" src="javascripts/calendar.js"></script>
<script type="text/javascript" src="javascripts/calendar-en.js"></script>
<script type="text/javascript" src="javascripts/calendar-setup.js"></script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script type='text/javascript' src='javascripts/companyreport.js'></script>

<script language="javascipt" type="text/javascript">
<!--

function init()
{
	Calendar.setup(
		{
				inputField : "from", // ID of the input field
				ifFormat : "%m/%e/%Y", // the date format
				button : "trigger1" // ID of the button
		}
	);
	Calendar.setup(
		{
				inputField : "to", // ID of the input field
				ifFormat : "%m/%e/%Y", // the date format
				button : "trigger2" // ID of the button
		}
	);
}

//-->
</script>

<body onload="init();">

<c:set var="menu" value="reports"/>
<c:set var="submenu" value="reports"/>
<c:set var="reportname" value="salesByProduct"/>
<c:set var="pagemessage" value="You can generate reports here."/>

<%@ include file="../../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="730">
	<tr><td align="left">
		<%@ include file="../../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="left" valign="top">
				<br/>
				<%@include file="reportmenu.jsp" %>
				<br/><br/>
				<table id="table" border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
					<tr>
						<th>
							Generate Reports
						</th>
					</tr>
					<tr>
						<th>Sales by Product</th>
					</tr>
					<tr>
						<td>
							<form name="form1" action="adminreportssalesbyproduct.do?action=generateSalesReportByProduct" method="post">
								<table>
									<tr>
										<td>Company: </td>
										<td>
											<select name="companyId" id="company" onchange="populatecompany(this.value);">
												<option value="">All Companies</option>
												<c:forEach items="${companies}" var="company" varStatus="ctr">
													<option value="${company.id}">${company.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											Filter Products
										</td>
										<td>
											<select name="contracted">
												<option value="">All</option>
												<option value="true">Contracted</option>
												<option value="false">Non-Contracted</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>From the period: </td>
										<td>
											<input type="text" class="fldshrt" id="from" name="from" readonly /> 
											<input type="image" id="trigger1" width="20" height="20" valign="bottom" src="images/calendar_icon.gif"/> 
										</td>
									</tr>
									<tr>
										<td>To the period: </td>
										<td>
											<input type="text" class="fldshrt" id="to" name="to" readonly /> 
											<input type="image" id="trigger2" width="20" height="20" valign="bottom" src="images/calendar_icon.gif"/> 
										</td>
									</tr>
									<tr>
										<td>
											Show all products?
										</td>
										<td>
											<input type="checkbox" name="showall" />
										</td>
									</tr>
									<tr>
										<td>
											Report format:
										</td>
										<td>
											<input type="radio" name="format" value="pdf" checked/>PDF
											&nbsp;
											<input type="radio" name="format" value="excel" />Excel
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<input type="submit" />
											<input type="reset" />
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</td>
			<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
		</tr>
	</table>		
	</div>
	
	<!--<div id="messagenews">
	<%@ include file="../../includes/tips.jsp"%>
	<ul>
	<li>This page is to generate the reports.</li>
	</ul>
	</div>
	--><br>
	
	<div id="messageadd">
	</div>

<%@ include file="../../includes/adminfooter.jsp"%>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
</body>
</html>