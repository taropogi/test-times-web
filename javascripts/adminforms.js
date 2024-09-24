/*
                                         By Pepe P. Tan                 August,2000

*/

//----------------------------------------------------------------------------------
// the following functions validates the data the user entered for each
// input box, otherwise ODBC errors will show up beacause of incompatible data types
//
//	usage:
//	<input type="text" name="firstname*" onblur="javascript: return validText(this);">
//----------------------------------------------------------------------------------


function validText(formElement){
	var data=formElement.value;
	var fieldName = formElement.name;
	//check if there's an * in the field name
	//if found we remove it for the alert display
	if(fieldName.indexOf("*") > -1){
		fieldName = fieldName.substring(0, fieldName.indexOf("*"));
	}

	if (parseFloat(data)==data){
		alert("Element \"" + fieldName + "\" should contain a name\n" +
		"or description, not a number !");
		//formElement.value=""; 
		formElement.focus();
		return false;
	}
			
	//do not allow single quote 
	/*if (data.indexOf("'")>-1){
		alert("Element \"" + fieldName + "\" cannot contain single quotes!");
		//formElement.value=""; 
		formElement.focus();
		return false;
	}*/
	
	//do not allow double quote 
	/*
	if (data.indexOf('"')>-1){
		alert("Element \"" + fieldName + "\" cannot contain double quotes!");
		//formElement.value=""; 
		formElement.focus();
		return false;
	}*/
	
	else {return true};
}

function validateCheckbox(checkbox){

	for (i = 0; i < checkbox.length; i++) {
		if(checkbox[i].checked == true){
			return true;
		}
	}
	
	alert('Please select at least one item.');
	return false;
}

function validInteger(thisForm){

	var data=thisForm.value;
	if (Math.round(parseFloat(data))==data){
		return true;
	}
	else {
		alert(thisForm.name + " should contain an integer !");
		thisForm.value=""; thisForm.focus();
		return false;
	} 
}

function validEmail(formElement){

	var data=formElement.value;
	//alert(formElement.value);
	//if ((data.indexOf(".") > 2) && (data.indexOf("@") > 0)){
	//	return true;
	//}
	//else {
	//	alert(formElement.name + " invalid email address !");
	//	formElement.select(); formElement.focus();
	//	return false;
	//}
	
	var emailFilter=/^.+@.+\..{2,3}$/;
    if (!(emailFilter.test(data))) { 
		alert("Invalid email address!");
		formElement.select(); 
		formElement.focus();
		return false;
    }
    else {
		//test email for illegal characters
       var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/
         if (data.match(illegalChars)) {
          alert("The email address contains illegal characters.");
		  formElement.select(); formElement.focus();
		return false;
       }
    }
	return true;


}



//checks if the user entered a valid float number
//usage: 
//	<input type="text" name="amount*" onblur="javascript: return validFloat(this);">
function validFloat(formElement){

	var data=formElement.value;

	if (parseFloat(data)==data || data=="" || data==null){
		return true;
	}
	else {
		var fieldName = formElement.name;
		//check if there's an * in the field name
		//if found we remove it for the alert display
		if(fieldName.indexOf("*") > -1){
			fieldName = fieldName.substring(0, fieldName.indexOf("*"));
		}

		alert("The \"" + fieldName + "\" field should contain \n only valid numbers!");
		//formElement.value="";
		formElement.focus();
		formElement.select();
		return false;
	}
}



//checks if user entered a Y or a N
function validYesNo(thisForm){
	thisForm.value=thisForm.value.toUpperCase();
	if (thisForm.value=="Y" || thisForm.value=="N"){
		return true;
	}
	else {
		alert(thisForm.name + " should contain only Y or N !");
		thisForm.value=""; thisForm.focus();
		return false;
	}
}



//----------------------------------------------------------------------------------
// this function checks to see if the user did not leave any input field blank
//----------------------------------------------------------------------------------
//
//	usage:
//		<input type="submit" value="register" onclick="javascript: return validate(this.form);">


function validate(thisForm){

	//eval("var thisForm = document." + thisForm);

	//pass an instance of our form
	var noOfElements=thisForm.elements.length;

	var strEmptyTextBox="" , strConfirm="";
	var intEmptyCount=0;
	var anyEmpty=false;
	var intFocusWhere=0;
	var noOfOptions;
	var blFocusNeeded=false;

	for (var i=0; i < noOfElements; i++){
	
	//checks to see if any input field is left blank, skip if theres a select list or buttons
	//checks only for fields with * in name field, this will only work is we place the * at the
	//last position of the form element name, e.g. firstname*, email*, occupation* et.

		if ((thisForm.elements[i].type=="text" ||
			thisForm.elements[i].type == "password" || 
			thisForm.elements[i].type == "textarea") &&
			(thisForm.elements[i].name.indexOf("*") > -1)){

			var asteriskPosition = thisForm.elements[i].name.indexOf("*");
			//show to the user the form element name without the asterisk
			var noAsteriskName = thisForm.elements[i].name.substring(0, asteriskPosition);

			if ((thisForm.elements[i].value==null) ||  (thisForm.elements[i].value=="")){
			
				if (!blFocusNeeded) {
					intFocusWhere=i; blFocusNeeded=true
				}
			
				if (thisForm.elements[i].type != "submit" || 
					thisForm.elements[i].type != "select-one" ||
					thisForm.elements[i].type != "reset" ||
					thisForm.elements[i].type != "button"){
			
					strEmptyTextBox += noAsteriskName + "\n";
					intEmptyCount += 1; 
					anyEmpty=true;
				}
			}
		}
	}
		

	if (anyEmpty){
		
		if (noOfElements == intEmptyCount){
			return false
		}
		else {
			strAlert= "The " + intEmptyCount + " required field(s) are empty : \n" 
			 + "----------------------------\n\n" 
			 + strEmptyTextBox + "\n"
			 + "----------------------------\n\n" 
			 + "Please enter the required data.\n\n" 
			 
			alert(strAlert);
			thisForm.elements[intFocusWhere].focus();

			return false;
		}
	} 
	
	else{
		//remove the asterisks in the form name before submission
		for (var i=0; i < noOfElements; i++){
			var aster=thisForm.elements[i].name.indexOf("*");

			if( aster > -1){
				thisForm.elements[i].name = thisForm.elements[i].name.substring(0, aster);
			}
		//alert(thisForm.elements[i].name + " " + i);
		}
		return true;
	}

}
		

//----------------------------------------------------------------------------------
// this function checks to see if the user really wants to delete ALL the entries in the form 
//----------------------------------------------------------------------------------
//
//	usage
//	<input type="reset" value="clear" onclick="javascript: return confirmReset(this.form);">

function confirmReset(thisForm){
	//pass an instance of the form
	var noOfElements=(thisForm.elements.length);
	var intEmptyCount=0;
	var intFocusWhere=0, blFocusNeeded=false;

	for (var i=0; i < noOfElements; i++){
		
		if (thisForm.elements[i].type=="text"){
		
			if ((thisForm.elements[i].value==null) ||  (thisForm.elements[i].value=="")){
			
				if (!blFocusNeeded) {
					intFocusWhere=i; 
					blFocusNeeded=true
				}
				
				intEmptyCount ++ ;
			}
				
			if (!document.all){
					thisForm.elements[intFocusWhere].focus()
			}
			
		}
	}
		
	if (noOfElements == intEmptyCount){
		return false
	}
									
	return  confirm (
			  "-------------------------------\n\n" 
			+ "Do you really want to undo ALL \n"
			+ "your entries and restore the \n"
			+ "previous data ? \n\n" 
			+ "-------------------------------\n"
			) 
}
	


	
//----------------------------------------------------------------------------------
// this function checks to see if the user selected at least one entry 
// and does not allow more than one selection
//----------------------------------------------------------------------------------
	
function validateOptions(){ 

	
	var noOfElements=document.forms[0].length;
	var noOfOptions;
	var noOfSelected=0;
	
	for (var i = 0; i<noOfElements; i++){
		
		if (document.forms[0].elements[i].type=="select-one"){
			noOfOptions=document.forms[0].elements[i].options.length;
			
			for (var j = 1; j<noOfOptions; j++){
				if (document.forms[0].elements[i].options[j].selected){noOfSelected += 1};
			}
		}//end of if select-one condition
	}//end of for loop
	
	switch (noOfSelected){
	case 0: {alert ("Please select one item !"); return false};
	case 1: {return true};
	}
	
	if (noOfSelected>1){alert ("Only one item can be chosen !"); return false};
		
}


//disable all buttons for demo purposes
function disableButtons(thisForm){
	//pass an instance of the form
	var noOfElements=(thisForm.elements.length);

	for (var i=0; i < noOfElements; i++){
		
		if ((thisForm.elements[i].type=="button" ||
			thisForm.elements[i].type=="submit" ||
			thisForm.elements[i].type=="reset") &&
			(thisForm.elements[i].value.indexOf("see all") < 0)){

			thisForm.elements[i].disabled=true;
		}
	}
}

//----------------------------------------------------------------------------------
// this function checks to see if the user selected at least one radio option 
//----------------------------------------------------------------------------------

	
function validateRadioOptions(){

	var noOfElements=document.forms[0].elements.length;
	var oneOfSelected=false
	
	for (var i = 0; i<noOfElements; i++){
		
		if (document.forms[0].elements[i].checked==true) {return true;}
				}
		alert("Please select one item!");
		return false;
	}
	
	
function formAction(formObject, actionName){
	//determines if this is an insert or an update
	formObject.action.value = actionName;
}
	
//function that validates if the password and confirm password matched.
function validateChangePassword(passwordField, confirmPasswordField){
	if(passwordField.value!=confirmPasswordField.value){
		alert('Password does not match');
		passwordField.select();
		passwordField.focus();
		return false;
	}

	return true;	
}

//----------------------------------------------------------------------------------
// this function confirms if user really want to exit pcbuilder and possibly lose some changes
//----------------------------------------------------------------------------------

	
function confirmExitPCBuilder(){

	return confirm('Are you sure you want to exit \nPCBuilder and lose your selections?')

}




	function isEmpty(inputStr) {
		if (inputStr == null || inputStr == "") {
			alert('Please provide something to search for.');
			return false;
		}
		return true;
	}





/* 
                                             Pare, hirap ng buhay, ayoko na mag-javascript!!!

*/