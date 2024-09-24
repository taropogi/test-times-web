<%@ include file="../includes/adminheader.jsp"%>

<script type='text/javascript' src='dwr/interface/AdminProductAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='javascripts/buffer.js'></script>
<script type="text/javascript" src="javascripts/admin.js"></script>

<script language="javascript" type="text/javascript">
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
	
	function Type()
	{
		this.id = null;
		this.name = "";
		this.description = "";
		this.parentId = null;
		this.parentName = "";
	}
	
	function getForm(formed)
	{
		var type = new Type();
		type.parentId = formed.allcategories.value;
		type.name = formed.name.value;
		type.description = formed.description.value;
		return type;
	}
	
	function setForm(formed, type)
	{
		formed.allcategories.value = type.parentId;
		formed.name.value = type.name;
		formed.description.value = getStr(type.description);
	}
	
	function prepareTypeItem(type)
	{
		var buf = new Buffer();
		
		buf.append(newItemBeginA).append(type.id).append(newItemBeginB).append(tda);
		buf.append(col1).append(type.name).append(col1term).append(colterm);
	  buf.append(col2).append(type.parentName).append(col2term).append(colterm);
	  buf.append(linkDiv);
	  buf.append(linkSnakeA).append(type.id).append(linkSnakeB);
	  buf.append(linkEditDelStart).append('onclick="editType(').append(type.id).append(linkEditDelStartB).append(linkEditEnd).append(linkEditDelMiddle);
	  buf.append(linkEditDelStart).append('onclick="deleteType(').append(type.id).append(linkEditDelStartB).append(linkDeleteEnd);
	  buf.append(linkDivEnd);
	  buf.append(tdb).append(newItemEnd);

		return buf;
	}
	
	function checkForm(formed)
	{
		if (formed.allcategories.value == -1) // not selected
		{
			alert("Please selected a category.");
			formed.allcategories.focus();
			return false;
		}
		if (formed.name.value == null || formed.name.value == '')
		{
			alert("Please enter the name of the type.");
			formed.name.focus();
			return false;
		}
		return true;
	}
	
	function addNewType(formed){
		if (!checkForm(formed))
			return;
		formed.snake.style.display = '';
		var type = getForm(formed);
		
		AdminProductAction.saveNewType(type, {
			callback:function(newType){

				 	var buf = prepareTypeItem(newType);

				  new Insertion.Before('inserthere', buf.toString());
					formed.snake.style.display = 'none';
					formed.reset();
			}
		});
	}
	
	function deleteType(id){
		if (confirm('Are you sure you want to delete the TYPE?')){
					AdminProductAction.deleteType(id,{
					callback:function(isDeleted){
									if(isDeleted){
										Element.remove("tr"+id);
										//Effect.SlideUp("tr"+id,{duration: 0.4, fps: 100});
									}
									else{
										alert('Error deleting type!');
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
	
	function editType(id)
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
		
		var typid = "typedit" + id;
		var innerml = $('addinput').innerHTML;
		
		new Insertion.After(trid, formTr + typid + formTrb + innerml + formTrTerm);
														  
		var typedit = $(typid);
		typedit.style.display="none";
		typedit.bgColor = row.bgColor;

		var formed = typedit.getElementsByTagName('form')["type"];
		
		currenteditform = formed;
		hasedit = true;
		
		AdminProductAction.getType(id, {
				callback:function(typed)
				{					
					setForm(formed, typed);
		
					row.style.display = "none";
					snake.style.display = 'none';
					typedit.style.display='';
				}
			}
		);
		
		formed.submitb.value = "save";
		formed.submitb.onclick = function() {saveEdit(trid, typid, formed, id)};
		formed.cancelb.onclick = function() {cancelEdit(trid, typid);};
	}
	
	function saveEdit(trid, typid, formed, id)
	{
		if (!checkForm(formed))
			return;
		if (formed.snake)
			formed.snake.style.display = '';
		var ntype = getForm(formed);
		ntype.id = id;
		
		AdminProductAction.updateType(ntype, {
				callback:function(typed)
				{
					if (typed != null)
					{
						var buf = prepareTypeItem(typed);

						Element.remove(trid);

						new Insertion.Before(typid, buf.toString());

						trid = "tr" + typed.id;
						if (formed.snake)
							formed.snake.style.display = 'none';
						hideEdit(trid, typid);
					}
				}
			}
		);
	}
	
	function cancelEdit(trid, typid)
	{
		hideEdit(trid, typid);
	}
	
	function hideEdit(trid, typid)
	{
		hasedit = false;
		currenteditform = null;
		var row = $(trid);
		row.style.display = '';
		Element.remove(typid);
	}
	
//-->
</script>

<body>

<c:set var="menu" value="products"/>
<c:set var="submenu" value="types"/>
<c:set var="pagemessage" value="You can add, update and delete the various product types here."/>

<%@ include file="../includes/adminnav.jsp"%>
<div id="containerdash">
<table border="0" cellpadding="1" cellspacing="1">
	<tr><td align="left">
		<%@ include file="../includes/error.jsp"%>
		<span class="showcategoryselect">
		Show Only Product Types for Category:
		<select name="allcategories" onchange="window.location.href=this.value;" class="listings">
			<option value="<c:url value="adminproduct.do"><c:param name="action" value="showAllTypes"/></c:url>">All Product Categories</option>
			<c:forEach items="${productcategories}" var="category" varStatus="counter">
			<option value="<c:url value="adminproduct.do"><c:param name="action" value="showAllTypes"/><c:param name="catid" value="${category.id}"/></c:url>"<c:if test="${category.id == catid}"> selected</c:if>><c:out value="${category.name}"/></option><%
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
			<img src="images/admin/tag_yellow.png" width="16" height="16" border="0"> PRODUCT TYPE DETAILS</th>
		  </tr>
		  <c:forEach items="${producttypes}" var="type" varStatus="counter">
			<tr class="bground" id="tr<c:out value='${type.id}'/>">
			<td class="itemthumb">
					<span class="projtitle"><c:out value='${type.name}' /></span><br>
					<span class="projdetails"><c:out value='${type.category.name}' /></span><br>
					<div align="right" valign="bottom">
						<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${type.id}'/>" />
						<a class="editdel" href="javascript:void(0)" onclick="editType(<c:out value='${type.id}'/>);">edit</a>
						<span class="projdetails">|</span>
						<a class="editdel" href="javascript:void(0)" onclick="deleteType(<c:out value='${type.id}'/>);">delete</a>
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
	<li>This is another level for organizing our product items.</li>
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
						<img src="images/admin/add.png" width="16" height="16" border="0"> Add A New Product Type Item
					</th>
					</tr>
					<tr class="bground">
					<td class="itemthumb">
						<span id="addinput">
						<%@ include file="adminproducttypesform.jsp"%>
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