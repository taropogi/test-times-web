<%@ include file="../includes/adminheader.jsp"%>

<c:set var="pageName" value="productcategories" />

<script type='text/javascript' src='dwr/interface/AdminProductAction.js'></script>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type="text/javascript" src="javascripts/buffer.js"></script>
<script type="text/javascript" src="javascripts/admin.js"></script>

<script language="javascript">
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
	
	var newItemBegin = '<tr class="bground" '; // id will be inserted after this
	var newItemEnd = '</tr>';
	
	var formTr = '<tr class="bground" id="';// id insert by script
	var formTrb = '"><td class="itemthumb">';
	var formTrTerm = '</td></tr>';
	
	var linkEditDelStart = '<a class="editdel" href="javascript:void(0)" '; // insert after
	var linkEditDelMiddle = '\n<span class="projdetails">|</span>\n';
	var linkEditEnd = 'edit</a>';
	var linkDeleteEnd = 'delete</a>';
	var linkDiv = '<div align="right" valign="bottom">';
	var linkDivEnd = '</div>';
	
	var linkSnakeA = '<img style="display:none;" src="images/indicator.gif" id="snake';
	var linkSnakeB = '">';
	
	var hasedit = false;
	var currenteditform;
	
	function Category()
	{
		this.name = "";
		this.description = "";
		this.id = null;
		this.highlight = false;
	}
	
	function getForm(formed)
	{
		var cat = new Category();
		cat.name = formed.name.value;
		cat.description = formed.description.value;
		cat.highlight = formed.highlight.checked;
		return cat;
	}
	
	function setForm(formed, cat)
	{
		formed.name.value = getStr(cat.name);
		formed.description.value = getStr(cat.description);
		formed.highlight.checked = cat.highlight;
	}
	
	function prepareCategoryItem(cat)
	{
		var buf = new Buffer();
		buf.append(newItemBegin).append('id="tr').append(cat.id).append('">').append(tda);
		buf.append(col1).append(cat.name).append(col1term).append(colterm);
		buf.append(col2).append(cat.description).append(col2term).append(colterm);
		buf.append(linkDiv);
		buf.append(linkSnakeA).append(cat.id).append(linkSnakeB);
	  buf.append(linkEditDelStart).append('" onclick="editCategory(').append(cat.id).append(');">').append(linkEditEnd).append(linkEditDelMiddle);
	  buf.append(linkEditDelStart).append('" onclick="deleteCategory(').append(cat.id).append(');">').append(linkDeleteEnd);
		buf.append(linkDivEnd).append(tdb).append(newItemEnd);
		
		return buf;
	}
	
	function editCategory(id)
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
		
		var catid = "catedit" + trid;
		var innerml = $('addinput').innerHTML;
		
		new Insertion.After(trid, formTr + catid + formTrb + innerml + formTrTerm);
		
		var catedit = $(catid);
		catedit.style.display="none";
		
		// var formed = catedit.getElementsByTagName('form')["category"];
				
		var formed = document.getElementById('categoryform');				
		currenteditform = formed;				
		hasedit = true;
				
		AdminProductAction.getCategory(id, {
				callback:function(category)
				{
					setForm(formed, category);
					
					row.style.display = "none";
					snake.style.display = 'none';
					catedit.style.display='';
				}
			}
		);		
		
		formed.submitb.value = "save";		
		formed.submitb.onclick = function() {saveEdit(trid, catid, formed, id)};		
		formed.cancelb.onclick = function() {cancelEdit(trid, catid);};		
	}
	
	function saveEdit(trid, catid, formed, id)
	{
		if (!checkForm(formed))
			return;
		
		if (formed.snake)
			formed.snake.style.display = '';
		
		var cat = getForm(formed);
		cat.id = id;
		
		AdminProductAction.saveCategory(cat, {
				callback:function(category)
				{
					if (category != null)
					{
						var item = prepareCategoryItem(category);
						
						Element.remove(trid);
						
						new Insertion.After(catid, item.toString());
						
						if (formed.snake)
							formed.snake.style.display = 'none';
						hideEdit(trid, catid);
					}
				}
			}
		);
	}
	
	function cancelEdit(trid, catid)
	{
		hideEdit(trid, catid);
	}
	
	function hideEdit(trid, catid)
	{
		hasedit = false;
		currenteditform = null;
		var row = $(trid);
		row.style.display = '';
		Element.remove(catid);
	}

 	function addNewCategory(theform){
 		if (!checkForm(theform))
 			return;
		theform.snake.style.display = '';
		var cat = getForm(theform);
		
		AdminProductAction.saveNewCategory(cat, {
			callback:function(newCategory){
				  
					var buf = prepareCategoryItem(newCategory);
				  new Insertion.Before('inserthere', buf.toString());
				  
				  theform.snake.style.display = 'none';
					theform.reset();
			}
		});
	}
		
	function deleteCategory(id){
		if (confirm('Are you sure you want to delete the CATEGORY?')){
					AdminProductAction.deleteCategory(id,{
					callback:function(isDeleted){
								if(isDeleted){
									Element.remove("tr"+id);
									//Effect.SlideUp("tr"+id,{duration: 0.4, fps: 100});
								}
								<%--else if (isDeleted == 2) {
									alert("Cannot delete category, it contain type(s)!");
								}--%>
								else{
									alert('Error deleting category!');
								}
							}
					});
			return true;
		}
		else{
			return false;
		}
	}
	
	function checkForm(theform)
	{
		if (theform.name.value == "")
		{
			alert("Please enter a name.");
			return false;
		}
		return true;
	}
//-->
</script>

<body>

<c:set var="menu" value="products"/>
<c:set var="submenu" value="categories"/>
<c:set var="pagemessage" value="You can add, update and delete the different product categories here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td>
	<%@ include file="../includes/error.jsp"%>
	</td></tr>
</table>

<div id="containerdash">
	<div id="messagearea">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
 	 <tr>
   <td align="left" valign="top">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="projfiles">
		  <tr>
		   <th colspan="2"> 
			<img src="images/admin/tag_red.png" width="16" height="16" border="0"> CATEGORY DETAILS</th>
		  </tr>	
		  <c:forEach items="${productcategories}" var="category" varStatus="counter"> <c:set var="page" value="#cat${category.id}" />
			<tr class="bground" id="tr<c:out value='${category.id}'/>">
				<td class="itemthumb">
					<span class="projtitle"><c:out value='${category.name}' /></span><br>
					<span class="projdetails"><c:out value='${category.description}' /></span><br>
					<div align="right" valign="bottom">
						<img style="display:none;" src="images/indicator.gif" id="snake<c:out value='${category.id}'/>" />
						<a class="editdel" href="javascript:void(0)" onclick="editCategory(<c:out value='${category.id}'/>);">edit</a>
						<span class="projdetails">|</span>
						<a class="editdel" href="javascript:void(0)" onclick="deleteCategory(<c:out value='${category.id}'/>);">delete</a>
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
			<li>This is the first level for organizing our product items.</li>
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
						<img src="images/admin/add.png" width="16" height="16" border="0"> Add A New Category Item
					</th>
					</tr>
					<tr class="bground">
					<td class="itemthumb">
						<span id="addinput">
						<%@ include file="adminproductcategoriesform.jsp"%>
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