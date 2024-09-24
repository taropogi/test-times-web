<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="un" uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %> 
<%@ taglib prefix="ct" uri="http://devsphere.com/articles/calltag/CallTag.tld" %>

<un:useConstants className="com.ivant.cms.entity.type.UserTypes" var="UserTypes" />

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Times Trading Co., Inc. - Since 1945</title>
	<style type="text/css">
		@import url(css/css.css);
	</style>
 	
	<script type="text/JavaScript" src="javascripts/javascript.js"></script>
	<script type="text/javascript" src="javascripts/utilities.js"></script>
	<script type="text/javascript" src="javascripts/adminforms.js"></script>	
	
	<c:if test="${pageName ne 'browse'}">
	  <script type="text/javascript" src="javascripts/prototype.js"></script>
	</c:if>

	<c:if test='${not empty companyuser}'>
		<script type="text/javascript" src="dwr/interface/SalesOrderAction.js"></script>
		<script type='text/javascript' src='dwr/engine.js'></script>
		<script type='text/javascript' src='dwr/util.js'> </script> 		
		<script type="text/javascript" src="javascripts/salesorder.js"></script>		
	</c:if>
	 
<style type="text/css">
@import url(css/menu.css);
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="javascripts/ddaccordion.js">
/***********************************************
* Accordion Content script- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* Visit http://www.dynamicDrive.com for hundreds of DHTML scripts
* This notice must stay intact for legal use
***********************************************/
</script>

<script type="text/javascript">
ddaccordion.init({ //top level headers initialization
	headerclass: "expandable", //Shared CSS class name of headers group that are expandable
	contentclass: "categoryitems", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
	defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
	onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", "openheader"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["prefix", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
});
</script>

<script src="javascripts/slider/jquery.js"></script>
<script src="javascripts/slider/amazingslider.js"></script>
<script src="javascripts/slider/initslider-1.js"></script>	
</head>