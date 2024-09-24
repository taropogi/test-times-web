<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script type="text/javascript" src="javascripts/scriptaculous.js"></script>
<script type="text/javascript" src="javascripts/buffer.js"></script>
<script type="text/javascript" src="javascripts/admin.js"></script>
<script type="text/javascript" src="javascripts/utilities.js"></script>
<script type="text/javascript" src="FCKeditor/fckeditor.js"></script>

<script type="text/javascript">
<!--
	function checkUpload(theForm)
	{
		var filename = theForm.newspicture.value.toUpperCase();
	
		if(filename == "")
		{
			theForm.newspicture.focus();
			alert("Please specify a file for upload.");
			return false;
		}
		else if((filename.indexOf(".JPG") < (filename.length - (4)))
			&& (filename.indexOf(".JPEG") < (filename.length - (5))))
		{
			theForm.newspicture.focus();
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
<c:set var="submenu" value="news"/>
<c:set var="pagemessage" value="You can update the information for the individual News items here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="newstable" class="projfiles">
	  <tr>
	   <th>
	   <img src="images/admin/world.png" width="16" height="16" border="0"/>EDIT CONTACT US DETAILS
	   </th>
	  </tr>
	  <tr class="bground">
	  	<td class="itemthumb">
		  	<c:if test='${not empty editnews.imageExtension}'>
		  	<a target="_new" href="images/news_orig_image/news_<c:out value='${editnews.id}'/><c:out value='${editnews.imageExtension}'/>">
				<img class="itemimage" src="images/news_thumb_image/news_<c:out value='${editnews.id}'/><c:out value='${editnews.imageExtension}'/>"/>
			</a>
			</c:if>

		  	<c:url value="adminmanage.do" var="action">
		  		<c:param name="action" value="uploadNewsPicture"/>
		  		<c:param name="newsId" value="${editnews.id}"/>
	  		</c:url>
	  		<c:url value="adminmanage.do" var="removeaction">
		  		<c:param name="action" value="removeNewsPicture"/>
		  		<c:param name="newsId" value="${editnews.id}"/>
	  		</c:url>

	  		<form name="uploadpictureform" action="<c:out value='${action}'/>" enctype="multipart/form-data" method="post" onSubmit="return checkUpload(this)">
	  		Use the "browse" button to select a picture file for upload.<br/>
				<span class="itemname">File:</span>
				<input name="newspicture" type="file" size="15" class="buttonitem"/>&nbsp;
				<input type="submit" value="upload picture" class="buttonitem"	/>&nbsp;
				<a href="<c:out value='${removeaction }'/>" class="editdel">remove picture</a>
			</form>
		  	<%@ include file="managenewsform.jsp" %>
		  	<br />
	  	</td>
	  </tr>
	</table>
	</div>
	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>This section lists the news and activities for the company.</li>
	</ul>
	</div>
	
	--><div id="messageadd"></div>
<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>