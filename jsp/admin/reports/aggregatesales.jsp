<%@ include file="../../includes/adminheader.jsp"%>

<style type="text/css">@import url(css/calendar-blue.css);</style>
<script type="text/javascript" src="javascripts/calendar.js"></script>
<script type="text/javascript" src="javascripts/calendar-en.js"></script>
<script type="text/javascript" src="javascripts/calendar-setup.js"></script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script type='text/javascript' src='javascripts/companyreport.js'></script>

<body>

<c:set var="menu" value="reports"/>
<c:set var="submenu" value="reports"/>
<c:set var="reportname" value="aggragatesales"/>
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
						<th>Aggregate Sales Report</th>
					</tr>
					<tr class="bground">
						<td class="itemthumb">
						
						<form name="form2" action="adminreportsaggregatesales.do?action=generateAggregateSalesReport" method="post">
						<table cellspacing="0" cellpadding="3" border="0">
						<tr>
							<td>Company: </td>
							<td>
							<select name="company" id="company" onchange="populatecompany(this.value);">
								<c:forEach items="${companies}" var="company" varStatus="ctr">
									<option value="${company.id}">${company.name}</option>
								</c:forEach>
							</select>
							</td>
							</tr>
							<tr>
							<td>Year: </td>
							<td>
							<select name="year" id="year">
								<c:forEach begin="2005" end="${year}" var="cyear" varStatus="ctr">
									<option value="${cyear}">${cyear}</option>
								</c:forEach>
							</select>
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