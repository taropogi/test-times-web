<%@ include file="../includes/adminheader.jsp"%>

<c:set var="pageName" value="productbrands" />

<body>

<c:set var="menu" value="products"/>
<c:set var="submenu" value="brands"/>
<c:set var="pagemessage" value="You can add, update and delete the different product brands here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="container">

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>