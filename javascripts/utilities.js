/*
form and table utilities...

Tested in Mozilla Firefox 1.5.0.1, IE 6

written by Lim Vincent Ray U.

updated on April 11, 2006
*/

/* methods that manipulates a form */
/**
	for validation:
		1) the id must have the following character to check corresponding functions:
			! - must not be read
			* - cannot be empty
			# - must be a valid integer w/out the sign, decimal is not accepted
			@ - must be a valid email
			% - must be a valid integer or decimal
		2) the alt attribute will be the text displayed when contains data or the name
			 field will be displayed
*/
var MyForm = {
	emailstr: /^.+@.+\..{2,3}$/,
	illegalemailchar: /[\(\)\<\>\,\;\:\'\"\\\[\]\/\s]/,
	decimal: /^\d+[.]?\d*$/,
	integer: /^\d+$/,
	usernamestr: /^[a-zA-Z_0-9]+$/,
	validate: function (thisform)
	{
		var elements = thisform.elements;
		var strEmptyFields = new Array();
		var focuselement = null;
		
		for (var i = 0; i < elements.length; i++)
		{
			var type = elements[i].type;
			var id = elements[i].id;
			var value = elements[i].value;
			
			if (id.indexOf("!") > -1)
				continue;
				
			if ((type == "text" || type == "password" || type == "textarea" || type == "select-one") 
				&& id.indexOf("*") > -1 && (value == null || value == ''))
			{
				if (focuselement == null)
				{
					focuselement = elements[i];
				}
				
				var name = elements[i].getAttribute("alt");
				if (name && name != '')
					strEmptyFields.push(name);
				else
					strEmptyFields.push(elements[i].name);
			}
			else if (type == "text" && id.indexOf("#") > -1 && !this.checkInteger(value, elements[i]))
				return false;
			else if (type == "text" && id.indexOf("@") > -1 && !this.checkEmail(value, elements[i]))
				return false;
			else if (type == "text" && id.indexOf("%") > -1 && !this.checkDecimal(value, elements[i]))
				return false;
		}
		
		if (strEmptyFields.length > 0)
		{
			if (focuselement != null)
			{
				focuselement.focus();
				if (focuselement.type == "text")
					focuselement.select();
			}
				
			var stralert = "The " + strEmptyFields.length + " required field(s) are empty : \n" 
				 + "----------------------------\n\n" 
				 + strEmptyFields.join('\n')
				 + "\n----------------------------\n\n" 
				 + "Please enter the required data.\n\n";
				 
				alert(stralert);
				
				return false;
		}
		return true;
	},
	getValues: function(theform)
	{
		var elements = theform.elements;
		var ob = new Object();
		
		for (var i = 0; i < elements.length; i++)
		{
			var type = elements[i].type;
			var name = elements[i].name;
			var id = elements[i].id;
			
			if (type != "button" && type != "submit" 
				&& type != "reset" && type != "image"
				&& type != "checkbox" && name != '')
			{
				if (id.indexOf('_FCK') > -1)
				{
					var name2 = id.substring(0, id.indexOf('_FCK'));
					var editor = FCKeditorAPI.GetInstance(id) ;
					ob[name2] = editor.GetXHTML(true);
				}
				else
				{
					ob[name] = elements[i].value;
				}
			}
			else if (type == "checkbox" && name != '')
			{
				ob[name] = elements[i].checked;
			}
		}
		return ob;
	},
	setValues: function(theform, ob)
	{
		var elements = theform.elements;
		
		for (var i = 0; i < elements.length; i++)
		{
			var type = elements[i].type;
			var name = elements[i].name;
			var id = elements[i].id;
			
			if (type != "button" && type != "submit" 
				&& type != "reset" && type != "image"
				&& type != "checkbox" && ob[name])
			{
				if (id.indexOf('_FCK') > -1)
				{
					var name2 = id.substring(0, id.indexOf('_FCK'));
					var editor = FCKeditorAPI.GetInstance(id) ;
					editor.SetHTML(ob[name2], true);
				}
				else
				{
					elements[i].value = ob[name];
				}
			}
			else if (type == "checkbox")
			{
				elements[i].checked = ob[name];
			}
		}
	},
	checkValidEmailFormat: function(email)
	{
		if (email && email.match(this.emailstr) != null)
			return true;
		return false;
	},
	checkIllegalEmailCharacter: function(email)
	{
		if (email && email.match(this.illegalemailchar) != null)
			return true;
		return false;
	},
	checkEmail: function (email, textbox)
	{
		if (email != '' && email != null)
		{
			if (MyForm.checkIllegalEmailCharacter(email))
			{
				textbox.focus();
				textbox.select();
				window.alert("The email contains invalid character(s).");
				return false;
			}
			
			if (!MyForm.checkValidEmailFormat(email))
			{
				textbox.focus();
				textbox.select();
				window.alert("The email input is invalid.");
				return false;
			}
		}
		return true;
	},
	checkNumber: function (value, input, expression)
	{
		if (value != '' && value != null)
		{
			if (value.match(expression) == null)
			{
				input.focus();
				input.select();
				var alt = input.getAttribute('alt');
				if (alt != null && alt != '')
					window.alert("Please enter the " + alt + " in correct format.");
				else
					window.alert("Please enter the number in correct format.");
				return false;
			}
		}
		return true;
	},
	checkInteger: function (value, input)
	{
		return this.checkNumber(value, input, this.integer);
	},
	checkDecimal: function (value, input)
	{
		return this.checkNumber(value, input, this.decimal);
	},
	checkUsername: function (value, input)
	{
		if (value.match(this.usernamestr) == null)
		{
			input.focus();
			input.select();
			var alt = input.getAttribute('alt');
			if (alt != null && alt != '')
				window.alert("Please enter the " + alt + " in correct format.");
			else
				window.alert("Please enter the username in correct format.");
			return false;
		}
		return true;
	}
};

/*
	if rowIndex is -1
	the row is inserted at the last of the table
*/

var MyTable = 
{
	createRow: function (table, rowIndex, id, className)
	{
		var row = table.insertRow(rowIndex);
		row.id = id;
		row.className = className;
		return row;
	},
	createRowAt: function(tableid, rowIndex, id, className)
	{
		var table = $(tableid);
		return this.createRow(table, rowIndex, id, className);
	},
	createRowBefore: function(tableid, locationid, id, className)
	{
		var rowIndex = $(locationid).rowIndex;
		return this.createRow($(tableid), rowIndex, id, className);
	},
	createRowAfter: function(tableid, locationid, id, className)
	{
		var rowIndex = $(locationid).rowIndex;
		return this.createRow($(tableid), rowIndex + 1, id, className);
	},
	createCellById: function(rowid, className)
	{
		var row = $(rowid);
		return this.createCell(row, className);
	},
	createCell: function(row, className)
	{
		return this.createCellByIndex(row, 0, className);
	},
	createCellByIndex: function(row, index, className)
	{
		var col = row.insertCell(index);
		col.className = className;
		return col;
	},
	createCells: function(row, numOfCell, className)
	{
		var cols = new Array(numOfCell);
		for (var i = 0; i < numOfCell; i++)
		{
				cols[i] = this.createCellByIndex(row, i, className);
		}
		return cols;
	},
	deleteRow: function(tableid, rowid)
	{
		var table = $(tableid);
		var row = $(rowid);
	
		if (table != null && row != null)
			table.deleteRow(row.rowIndex);
	}
};

var SpanForm = 
{
	/**
	id the unique id of the form
	fields array of name
	form the add form, containing the fields
	
	the span must be <fieldname>_<id>
	*/
	create: function(id, fields, form)
	{
		for (var i = 0; i < fields.length; i++)
		{
			var name = fields[i];
			var span = $(name + '_' + id);
			var input = form.elements[name];
			span.innerHTML = this.getHTMLCode(input);
		}
	},
	restore: function(id, fields, ob)
	{
		for (var i = 0; i < fields.length; i++)
		{
			var name = fields[i];
			var span = $(name + '_' + id);
			span.innerHTML = ob[name];
		}
	},
	restoreUsingProperties: function (id, fields, ob, properties)
	{
		for (var i = 0; i < fields.length; i++)
		{
			var name = fields[i];
			var property = properties[i];
			var span = $(name + '_' + id);
			if (property.indexOf('.') >= 0)
				eval(('span.innerHTML = ob.' + property));
			else
				span.innerHTML = ob[property];
		}
	},
	emptyTags:{
   "IMG":   true,
   "BR":    true,
   "INPUT": true,
   "META":  true,
   "LINK":  true,
   "PARAM": true,
   "HR":    true
	}, 
	getHTMLCode: function (elem) {
		if (document.all || elem.outerHTML) // if ie
		{
			return elem.outerHTML;
		}
		else // other browser
		{
			var attrs = elem.attributes;
			var str = "<" + elem.tagName;
			for (var i = 0; i < attrs.length; i++)
			  str += " " + attrs[i].name + "=\"" + attrs[i].value + "\"";
			
			if (this.emptyTags[elem.tagName])
			  return str + "/>";
			
			return str + ">" + elem.innerHTML + "</" + elem.tagName + ">";
		}
		return "";
	}
};