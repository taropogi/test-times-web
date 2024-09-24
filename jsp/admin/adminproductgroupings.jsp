<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminProductAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/buffer.js"></script>
<script type="text/javascript" src="javascripts/admin.js"></script>

<script language="JavaScript" type="text/javascript">
<!--
	var col1 = '<span class="projtitle">';
	var col2 = '<span class="projdetails">';
	
	var col1term = '';
	var col2term = '';
	var colterm = '</span><br />';
	
	var tda = '<td class="itemthumb">';
	var tdb = '</td>';
	
	var linkEditDelStart = '<a class="editdel" href="#'; // insert after
	var linkEditDelMiddle = ' <span class="projdetails">&nbsp;|&nbsp;</span> ';
	var linkEditEnd = ' edit </a> &nbsp; ';
	var linkDeleteEnd = ' &nbsp; delete </a>';
	
	var newItemBeginA = '<tr class="bground" id="tr'; // id will be inserted after this
	var newItemBeginB = '">';
	var newItemEnd = '</tr>';
	
	var formTr = '<tr class="bground" id="';// id insert by script
	var formTrb = '"><td class="itemthumb">';
	var formTrTerm = '</td></tr>';
	
	var linkEditDelStart = '<a class="editdel" href="javascript:void(0)" '; // insert after
	var linkEditDelMiddle = '\n<span class="projdetails">|</span>\n';
	var linkEditDelStartB = ');"/>';
	var linkEditEnd = 'edit</a>';
	var linkDeleteEnd = 'delete</a>';
	var linkDiv = '<div align="right" valign="bottom">';
	var linkDivEnd = '</div>';

	var linkSnakeA = '<img style="display:none;" src="images/indicator.gif" id="snake';
	var linkSnakeB = '">';
	
	function Grouping()
	{
		this.name = "";
		this.description = "";
		this.id = null;
		this.parentId = "";
	}
	
	function getForm(formed)
	{
		var grouping = new Grouping();
		grouping.name = formed.name.value;
		grouping.description = formed.description.value;
		grouping.parentId = formed.alltypes.value;
		return grouping;
	}
	
	function setForm(formed, grouping)
	{
		formed.name.value = getStr(grouping.name);
		formed.description.value = getStr(grouping.description);
		formed.alltypes.value = getStr(grouping.parentId);
	}
	
	function prepareGroupingItem(grouping)
	{
		var buf = new Buffer();
		
		buf.append(newItemBeginA).append(grouping.id).append(newItemBeginB).append(tda);
		buf.append(col1).append(grouping.name).append(col1term).append(colterm);
	  buf.append(col2).append(grouping.parentName).append(col2term).append(colterm);
	  buf.append(linkDiv);
	  buf.append(linkSnakeA).append(grouping.id).append(linkSnakeB);
	  buf.append(linkEditDelStart).append('onclick="editGrouping(').append(grouping.id).append(');"/>').append(linkEditEnd).append(linkEditDelMiddle);
	  buf.append(linkEditDelStart).append('onclick="deleteGrouping(').append(grouping.id).append(');"/>').append(linkDeleteEnd);
	  buf.append(linkDivEnd);
	  buf.append(tdb).append(newItemEnd);
	  return buf;
	}
	
	function checkForm(formed)
	{
		if (formed.alltypes.value == -1) // not selected
		{
			alert("Please selected a type");
			formed.alltypes.focus();
			return false;
		}
		if (formed.name.value == null || formed.name.value == '')
		{
			alert("Please enter the name of the grouping.");
			formed.name.focus();
			return false;
		}
		return true;
	}
	
	function addNewGrouping(formed)
	{
		if (!checkForm(formed))
			return;
		
		formed.snake.style.display = '';
		var grouping = getForm(formed);
		
		AdminProductAction.saveNewGrouping(grouping, {
			callback:function(newGrouping){

				var buf = prepareGroupingItem(newGrouping); 

				new Insertion.Before('inserthere', buf.toString());
		
				formed.snake.style.display = 'none';
				formed.reset();
			}
		});
	}
	
	function deleteGrouping(id){
		if (confirm('Are you sure you want to delete the Grouping?')){
					AdminProductAction.deleteGrouping(id,{
					callback:function(isDeleted){
									if(isDeleted){
										Element.remove("tr"+id);
										//Effect.SlideUp("tr"+id,{duration: 0.4, fps: 100});
									}
									else{
										alert('Error deleting grouping!');
									}
								}
					});
			return true;
		}
		else{
			return false;
		}
	}
	
	var currenteditform;
	var hasedit = false;
	
	function editGrouping(id)
	{
		if (hasedit)
		{
			currenteditform.focus();
			currenteditform.scrollIntoView();
			return;
		}
		var trid = "tr" + id;
		var row = $(trid);
		
		var snakeid = "snake" + id;
		var snake = $(snakeid);
		
		snake.style.display = '';
		
		var grpid = "grpedit" + id;
		var innerml = $('addinput').innerHTML;
		
		new Insertion.After(trid, formTr + grpid + formTrb + innerml + formTrTerm);
														  
		var grpedit = $(grpid);
		grpedit.style.display = "none";
		grpedit.bgColor = row.bgColor;
		// There must be only one form inside the catedit
		// var formed = grpedit.getElementsByTagName('form')["grouping"];
		
		var formed = document.getElementById('groupingform');
		
		// now we set the variables
		currenteditform = formed;
		hasedit = true;
		
		//set the form
		AdminProductAction.getGrouping(id, {
				callback:function(grped)
				{
					setForm(formed, grped);
		
					row.style.display = "none";
					snake.style.display = 'none';
					grpedit.style.display='';
				}
			}
		);
		
		formed.submitb.value = "save";
		formed.submitb.onclick = function() {saveEdit(trid, grpid, formed, id)};
		formed.cancelb.onclick = function() {cancelEdit(trid, grpid);};
	}
	
	function saveEdit(trid, grpid, formed, id)
	{
		if (!checkForm(formed))
			return;
		
		if (formed.snake)
			formed.snake.style.display = '';
		
		var grouping = getForm(formed);
		grouping.id = id;
		
		AdminProductAction.updateGrouping(grouping, {
				callback:function(group)
				{
					if (group != null)
					{
						var buf = prepareGroupingItem(group);
						
						Element.remove(trid);
						
						new Insertion.Before(grpid, buf.toString());
						
						trid = "tr" + group.id;
						if (formed.snake)
							formed.snake.style.display = 'none';
						hideEdit(trid, grpid);
					}
				}
			}
		);
	}
	
	function cancelEdit(trid, grpid)
	{
		hideEdit(trid, grpid);
	}
	
	function hideEdit(trid, grpid)
	{
		hasedit = false;
		currenteditform = null;
		var row = $(trid);
		row.style.display = '';
		Element.remove(grpid);
	}
//-->
</script>

<body>

<c:set var="menu" value="products"/>
<c:set var="submenu" value="groupings"/>
<c:set var="pagemessage" value="You can add, update and delete the different product groupings here."/>

<%@ include file="../includes/adminnav.jsp"%>
<div id="containerdash">
<table border="0" cellpadding="1" cellspacing="1">
	<tr><td>
		<%@ include file="../includes/error.jsp"%>
		<span class="showcategoryselect">
		Show Only Product Groupings For Type:
		<select name="allcategories" onchange="window.location.href=this.value;" class="listings">
			<option value="<c:url value="adminproduct.do"><c:param name="action" value="showAllGroupings"/></c:url>">All Product Types</option>
			<c:forEach items="${producttypes}" var="type" varStatus="counter">
			<option value="<c:url value="adminproduct.do"><c:param name="action" value="showAllGroupings"/><c:param name="typid" value="${type.id}"/></c:url>"<c:if test="${type.id == typid}"> selected</c:if>><c:out value="${type.name}"/></option><%
			%></c:forEach>
		</select>
		</span>
	</td></tr>
</table>
</div>
<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
 	 <tr>
   <td align="left" valign="top">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
		  <tr>
		   <th colspan="2">
			<img src="images/admin/tag_green.png" width="16" height="16" border="0"> PRODUCT GROUPING DETAILS
			</th>
		  </tr>
		  <c:forEach items="${productgroupings}" var="grouping" varStatus="counter">
		  <tr class="bground" id="tr<c:out value='${grouping.id}'/>">
		  <td class="itemthumb">
					<span class="projtitle"><c:out value='${grouping.name}' /></span><br />
					<span class="projdetails"><c:out value='${grouping.type.name}' /></span><br />
					<div align="right" valign="bottom">
						<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${grouping.id}'/>" />
						<a class="editdel" href="javascript:void(0)" onclick="editGrouping(<c:out value='${grouping.id}'/>);">edit</a>
						<span class="projdetails">|</span>
						<a class="editdel" href="javascript:void(0)" onclick="deleteGrouping(<c:out value='${grouping.id}'/>);">delete</a>
					</div>
				</td>	   
		  </tr> 	
	  	</c:forEach>
	  	<tr style="display: none" id="inserthere"><td colspan="2">&nbsp</tr>
		</table>
		
		</td>
   	<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"></td>
  	</tr>
	</table>		
	</div>	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>This is the final level for organizing our product items.</li>
	</ul>
	</div>
	--><br>
	
	<div id="messageadd"><br>
	<table border="0" cellpadding="1" cellspacing="1" align="center" width="100%">
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" class="projfiles" width="100%">
					<tr>
					<th>
						<img src="images/admin/add.png" width="16" height="16" border="0"> Add A New Grouping Item
					</th>
					</tr>
					<tr class="bground">
					<td class="itemthumb">
						<span id="addinput">
						<%@ include file="adminproductgroupingsform.jsp"%>
						</span>
					</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>