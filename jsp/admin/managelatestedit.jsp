<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<!--<script type='text/javascript' src='fckeditor/fckeditor.js'></script>-->

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
	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
	  <tr>
	   <th colspan="2">
		<img src="images/admin/flag_green.png" width="16" height="16" border="0"> LATEST DETAILS
	   </th>
	  </tr>	
	  <tr class="bground">
	  	<td class="itemthumb">
  		<form action="adminmanage.do" onsubmit="return validate(this);" method="post">
  		<input type="hidden" name="action" value="saveLatest"/>
  		<input type="hidden" name="id" value="${latest.id}"/> 
  		Choose Company: 
	  	<select name="companyId" >
	  		<option value="">&nbsp</option>
	  		<c:forEach items="${companies}" var="company" varStatus="ctr">
	  		<option value="${company.id}" ${(company.id eq latest.company.id)? "selected": ""}>${company.name}</option>
	  		</c:forEach>
	  		
	  	</select>
  		
  		
  		
	  	<span class="formLabelText">Latest text</span><br/>
		<!--
	  	<textarea rows="2" cols="80" type="text" name="latest" /><c:out value="${latest.latest}" /></textarea><br />
		-->



		<span class="formLabelText">Latest text</span><br />
	  	<TEXTAREA NAME="latest" COLS=80 ROWS=3 WRAP=HARD><c:out value="${latest.latest}" /></TEXTAREA>
		
		
	  	<center>
		  	<span id="snake" style="display:none">
		  		<img src="images/indicator.gif" />
		  	</span>
		  	<input type="submit" class="buttonitem"  value="save"/>
		  	<input type="reset" class="buttonitem"  value="reset" />
	  	</center>
	 	 	</form>
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