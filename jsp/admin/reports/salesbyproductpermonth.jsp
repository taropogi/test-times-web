<%@ include file="../../includes/adminheader.jsp"%>

<style type="text/css">@import url(css/calendar-blue.css);</style>
<script type="text/javascript" src="javascripts/calendar.js"></script>
<script type="text/javascript" src="javascripts/calendar-en.js"></script>
<script type="text/javascript" src="javascripts/calendar-setup.js"></script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script type='text/javascript' src='javascripts/companyreport.js'></script>

<script language="javascipt" type="text/javascript">
<!--

var map = 
{
	<c:forEach items="${companies}" var="company" varStatus="ctr">
	${company.id}: new Array(<c:forEach items="${company.departments}" var="department" varStatus="ctr2"><c:if test='${ctr2.index > 0}'>, </c:if>{name:"${department.name}", id:${department.id}}</c:forEach>)<c:if test='${not ctr.last}'>,</c:if>
	</c:forEach>
};

function init()
{
	var form1 = document.form1;
	populatecompany(map, form1.company.value, form1.department);
}

//-->
</script>

<body onload="init();">

<c:set var="menu" value="reports"/>
<c:set var="submenu" value="reports"/>
<c:set var="reportname" value="salesByProdPerMonth"/>
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
						<th>Sales by Product Per Month Report</th>
					</tr>
					<tr>
						<td>
							<form name="form1" action="adminreportssalesbyprodpermonth.do?action=generateSalesByProductPerMonth" method="post">
								<table>
									<tr>
										<td>Company: </td>
										<td>
											<select name="companyId" id="company" onchange="populatecompany(this.value, this.form.department);">
												<c:forEach items="${companies}" var="company" varStatus="ctr">
													<option value="${company.id}">${company.name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											Department: 
										</td>
										<td>
											<select name="department" id="department"></select>
										</td>
									</tr>
									<tr>
										<td>
											Filter Sales Orders
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