<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/buffer.js"></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>

<script language="JavaScript" type="text/javascript">
<!--
	function checkUpload(theForm)
	{
		var filename = theForm.tippicture.value.toUpperCase();
	
		if(filename == "")
		{
			theForm.productpicture.focus();
			alert("Please specify a file for upload.");
			return false;
		}
		else if((filename.indexOf(".JPG") < (filename.length - (4)))
			&& (filename.indexOf(".JPEG") < (filename.length - (5))))
		{
			theForm.productpicture.focus();
			alert("Please specify a file in JPG format.");
			return false;
		}
		else
		{
			return true;
		}
	}
//-->
</script>

<body>
<c:set var="menu" value="manage"/>
<c:set var="submenu" value="tips"/>
<c:set var="pagemessage" value="You can add, update and delete the information for the individual Tips items here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="tiptable" class="projfiles">
	  <tr>
	   <th colspan="2">
		<img src="images/admin/wand.png" width="16" height="16" border="0" /> TIPS DETAILS
	   </th>
	  </tr>
	  <tr class="bground">
	  	<td class="itemthumb">
	  	<c:if test='${not empty edittips.imageExtension}'>
				<a target="_new" href="images/tips_orig_image/tip_<c:out value='${edittips.id}'/><c:out value='${edittips.imageExtension}'/>">
				<img class="itemimage" src="images/tips_thumb_image/tip_<c:out value='${edittips.id}'/><c:out value='${edittips.imageExtension}'/>"/>
				</a>
				<br />
	 		</c:if>

	  	<br />
	  	<c:url value="adminmanage.do" var="uploadaction">
	  		<c:param name="action" value="uploadTipPicture"/>
	  		<c:param name="tipId" value='${edittips.id }'/>
	  	</c:url>
	  	<c:url value="adminmanage.do" var="removeaction">
	  		<c:param name="action" value="removeTipPicture"/>
	  		<c:param name="tipId" value='${edittips.id }'/>
	  	</c:url>

			<form name="uploadpictureform" action="<c:out value='${uploadaction }'/>" enctype="multipart/form-data" method="post" onsubmit="return checkUpload(this)">
				Use the "browse" button to select a picture file for upload.<br/>
				<span class="formLabelText">File name: </span>
				<input name="tippicture" class="buttonitem" type="file" size="15"/>
				<input type="submit" class="buttonitem" value="upload picture" />
				<a class="editdel" href="<c:out value='${removeaction }'/>">remove picture</a>
			</form>

	  	<%@ include file="managetipsform.jsp"%>
	  	<br />

	  	</td>
	  </tr>
	  </table>
	</div>	
	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>We can list here the tips and advices that will be helpful to our web users.</li>
	</ul>
	</div>
	
	--><div id="messageadd"><br />
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>