<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<head>
	<title>Admin Login Page</title>
	<link rel="stylesheet" href="css/style_cms.css" type="text/css">	

	<script language="javascript">
	<!--
	<%@ include file="/javascripts/adminforms.js" %>
	-->
	</script>
</head>

<body onload="javascript: document.loginform.elements[1].focus();">
<div id="wrapper">
	<div id="loginbox">
		<form name="loginform" action="login.do" method="post">
		<input type="hidden" name="action" value="login">
		<table border="0" cellpadding="5" cellspacing="0" width="337">
		  <tr>
		   <td colspan="3" align="center"><img src="images/admin/times_trading_logo.jpg" width="203" height="80" border="0" alt=""></td>
		   <!--td width="380"><span class="loginlogotxt">Laptop King Online</span></td-->   
		  </tr>   
		  <tr>
		   <td colspan="3" class="gryline"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
		  </tr> 
		  <c:if test="${not empty errormessage}">
			  <tr>
			   <td colspan="3" class="errormsg">
				Error:&nbsp;<c:out value="${errormessage}"/>
			   </td>
			  </tr>  
		  </c:if>		  
		  <tr>
		   <td colspan="3" height="13"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
		  </tr>    
		  <tr>
		   <td><span class="frmuserpass">Username</span></td>
		   <td><span class="frmuserpass">:</span></td>
		   <td><input type="text" name="username*" class="userpassfrm" /></td>
		  </tr>
		  <tr>
		   <td><span class="frmuserpass">Password</span></td>
		   <td><span class="frmuserpass">:</span></td>
		   <td><input type="password" name="password*" class="userpassfrm"></td>
		  </tr>
		  <tr>
		   <td align="right" colspan="3"><input type="submit" value="Login" onclick="javascript: return validate(this.form);" class="loginbtn"></td>
		  </tr>
		  <tr>
		   <td colspan="3" height="13"><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
		  </tr>
		  <tr>
		   <td align="right" colspan="3" style="text-align: right;"><a href="#" class="forgotpswd">Forgot your password?</a></td>
		  </tr>  
		</table>
		</form>
	</div>
</div>

</body>
</html>
