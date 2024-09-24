<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminManageAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/utilities.js'></script>

<script language="JavaScript" type="text/javascript">
<!--
//-->
</script>


<body>
<c:set var="menu" value="manage" />
<c:set var="submenu" value="sliderimage" />
<c:set var="pagemessage" value="Modify the Images in the Slider." />

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr>
		<td align="left"><%@ include file="../includes/error.jsp"%></td>
	</tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	
	<h3 style="background-color: #BEBEBC;"><p>SLIDER IMAGES<p></h3>
	
	<c:if test="${ not empty error}">
		<em><strong style="color: red;">- ${ error }</strong></em>
	</c:if>
	<c:if test="${ empty sliderImage.id }">
		<table cellpadding="0" cellspacing="0" width="100%" id="slider" class="projfiles" style="min-height: 300px;">
			<tr>
				<th>Image</th>
				<th>Title</th>
				<th>Sort Order</th>
				<th>Action</th>
			</tr>
			
			<c:forEach items="${ sliderImageList }" var="si">
				<tr>
					<td style="max-height: 100px" width="50%">
						<img src="images/slider/${si.imageUrl}"/>
					</td>
					<td>${ si.title }</td>
					<td>${ si.sortOrder }</td>
					<td>
						<a href="adminsliderimage.do?action=edit&sliderImageId=${ si.id }">edit</a> |
						<a href="adminsliderimage.do?action=delete&sliderImageId=${ si.id }" 
								onclick="return confirm('Are you sure you want to delete ${si.title}?')">delete</a> 
					</td>
				</tr>
			</c:forEach>
			
			<c:if test="${ empty sliderImageList }">
				<tr>
					<td colspan="3" style="text-align: center;"><em>No data found</em></td>
				</tr>
			</c:if>
		</table>
	</c:if>
	</div>
	
	<div class="clear"></div><br>
	<h4 style="background-color: #BEBEBC;"><p>ADD NEW SLIDER IMAGE<p></h3>
	<span class="imgDimensions">Image size: 625 x 230 px </span>
	<%@ include file="../includes/sliderimageform.jsp"%>
	</div>
	
	<br />
	
	<div id="messageadd" style="padding-top: 2px">
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>