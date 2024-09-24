<%@ include file="../includes/adminheader.jsp"%>

<%--<script type='text/javascript' src='dwr/interface/AdminSettingAction.js'></script>
<script type='text/javascript' src='dwr/util.js'> </script>
--%>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='javascripts/prototype.js'></script>
<script src="javascripts/scriptaculous.js" type="text/javascript"></script>
<script type='text/javascript' src='dwr/interface/UpdateDBAction.js'></script>

<script language="JavaScript" type="text/javascript">
<!--
	<%--function User()
	{
		this.password = "";
		this.firstname = "";
		this.lastname = "";
		this.recordPerPage= 0;
		this.salesOrderPerPage = 0;
	}
	function showAdd(){
		$('addinput').style.display="block";
		$('addtext').style.display="none";
	}
	function hideAdd(){
		$('addinput').style.display="none";
		$('addtext').style.display="block";
	}
	--%>
	function checkInput(formed)
	{
		var re = /^\d+[.]?\d*$/;
		if (formed.password.value == '' && formed.vpassword.value == '')
		{
			return true;
		}
		if (formed.password.value != formed.vpassword.value)
		{
			alert("The password and verify password are different!");
			formed.password.value = '';
			formed.vpassword.value = '';
			formed.password.focus();
			return false;
		}
		return true;
	}
	
	function updateDatabase(userId)
	{
		UpdateDBAction.updateDatabase(userId, {
			async: false,
			callback: function(data) {
				if(data)
					alert("Update Successful!");
				else
					alert("Update Failed!");
			}
		});
		
		
	}
	
	<%--function getUserInput(formed)
	{
		var user = new User();
		user.password = formed.password.value;
		user.firstname = formed.firstname.value;
		user.lastname = formed.lastname.value;
		user.recordPerPage = formed.recordPerPage.value;
		user.salesOrderPerPage = formed.salesOrderPerPage.value;
		return user;
	}
	
	function strget(str)
	{
		if (str == null)
			return "";
		return str;
	}
	
	function copyUserForm(formed, user)
	{
		formed.firstname.defaultValue = strget(user.firstname);
		formed.lastname.defaultValue = strget(user.lastname);
		formed.recordPerPage.defaultValue = strget(user.recordPerPage);
		formed.salesOrderPerPage.defaultValue = strget(user.salesOrderPerPage);
		formed.password.defaultValue = "";
		formed.vpassword.defaultValue = "";
	}
	
	function save(formed)
	{
		if (!checkInput(formed))
			return;
		formed.snake.style.display = '';
		var user = getUserInput(formed);
		
		AdminSettingAction.saveUser(user, formed.userId.value, {
				callback:function(suser)
				{
					if (suser != null)
					{
						copyUserForm(formed, suser);
						formed.reset();
					}
					else
					{
						alert("Error saving information!");
						formed.reset();
					}
					formed.snake.style.display = 'none';
				}
			}
		);
	}--%>
//-->
</script>

<body>
<c:set var="menu" value="settings"/>
<c:set var="submenu" value="personal"/>
<c:set var="pagemessage" value="You can add, update and delete the information for the individual product items here."/>

<%@ include file="../includes/adminnav.jsp"%>

<table border="0" cellpadding="1" cellspacing="1" align="center" width="775">
	<tr><td align="left">
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
				<img src="images/admin/user_orange.png" width="16" height="16" border="0"/> Account Details For <c:out value='${user.firstname}'/> <c:out value='${user.lastname}'/>
			</th>
		  </tr>	
		  <tr>
		  	<td class="itemthumb">
		  		<form name="edituser" onsubmit="return checkInput(this);" action="adminsetting.do?action=saveUserSetting" method="post">
		  		<input type="hidden" name="userId" value="<c:out value='${user.id}' />" />
		  		<table border="0" cellpadding="0" cellspacing="2" width="100%">
		  		<tr>
		  			<td>
						<img src="images/spacer.gif" width="50" height="1" border="0" alt=""/>
					</td>
		  			<td>
						<img src="images/spacer.gif" width="250" height="1" border="0" alt=""/>
					</td>
		  		</tr>
				<tr>
		  			<td>
						<span class="itemname">Username:</span>
					</td>
		  			<td>
						<span class="itemdescription"><c:out value='${user.username}' />
					</td>
		  		</tr>
		  		<tr>
		  			<td>
						<span class="itemname">First Name:</span>
					</td>
		  			<td>
						<input type="text" name="firstname" value="<c:out value='${user.firstname}' />" class="item" size="10"/>
					</td>
		  		</tr>
		  		<tr>
		  			<td>
						<span class="itemname">Last Name:</span>
					</td>
		  			<td>
						<input class="item" type="text" name="lastname" value="<c:out value='${user.lastname}' />" size="10"/>
					</td>
		  		</tr>
		  		<tr>
		  			<td>
						<span class="itemname">Products to show per page:</span>
					</td>
		  			<td>
						<!--<input class="input" type="text" name="recordPerPage" number value="<c:out value='${user.recordPerPage}' />" />-->
						<select class="input" name="recordPerPage">
							<option value="5" <c:if test='${user.recordPerPage eq 5}'>selected</c:if>>5</option>
							<option value="8" <c:if test='${user.recordPerPage eq 8}'>selected</c:if>>8</option>
							<option value="10" <c:if test='${user.recordPerPage eq 10}'>selected</c:if>>10</option>
							<option value="15" <c:if test='${user.recordPerPage eq 15}'>selected</c:if>>15</option>
							<option value="20" <c:if test='${user.recordPerPage eq 20}'>selected</c:if>>20</option>
							<option value="30" <c:if test='${user.recordPerPage eq 30}'>selected</c:if>>30</option>
							<option value="50" <c:if test='${user.recordPerPage eq 50}'>selected</c:if>>50</option>
						</select>
					</td>
		  		</tr>
		  		<tr>
		  			<td>
		  				<span class="itemname">Sales Orders to show per page:</span>
		  			</td>
		  			<td>
		  				<select class="input" name="salesOrderPerPage">
			  				<option value="5" <c:if test='${user.salesOrderPerPage eq 5}'>selected</c:if>>5</option>
								<option value="8" <c:if test='${user.salesOrderPerPage eq 8}'>selected</c:if>>8</option>
								<option value="10" <c:if test='${user.salesOrderPerPage eq 10}'>selected</c:if>>10</option>
								<option value="15" <c:if test='${user.salesOrderPerPage eq 15}'>selected</c:if>>15</option>
								<option value="20" <c:if test='${user.salesOrderPerPage eq 20}'>selected</c:if>>20</option>
								<option value="30" <c:if test='${user.salesOrderPerPage eq 30}'>selected</c:if>>30</option>
								<option value="50" <c:if test='${user.salesOrderPerPage eq 50}'>selected</c:if>>50</option>
		  				</select>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td colspan="2">&nbsp;</td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" class="itemnote">Leave the password fields blank if you don't want to change your old password. Otherwise, input a new password.
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
						<span class="itemname">New Password:</span>
					</td>
		  			<td>
						<input class="item" type="password" name="password" size="10" />
					</td>
		  		</tr>
		  		<tr>
		  			<td>
						<span class="itemname">Verify New Password:</span>
					</td>
		  			<td>
						<input class="item" type="password" name="vpassword" size="10" />
					</td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="center">
		  				<img type="image" id="snake" name="snake" onclick="void(0);" src="images/indicator.gif" style="display:none" />
			  			<input type="submit" value="update user info" class="buttonitem"/>
			  			<input type="reset" value="reset changes" class="buttonitem"/>
					</td>
		  		</tr>
		  		<tr>
					<td colspan="2" align="center">
						<input type="button" onclick="updateDatabase(${user.id });" value="Update Database" 
							class="buttonitem" />
					</td>
				</tr>
		  		</table>
		  		</form>
		  </tr>
	  	<tr style="display: none" id="inserthere"><td colspan="2">&nbsp;</tr>
		</table>
		</td>
   	<td align="left" valign="top" background="images/sidebg.jpg" style="background-repeat: repeat-y;" width="8"><img src="images/spacer.gif" width="1" height="1" border="0"/></td>
  	</tr>
	</table>		
	</div>	
	
	<!--<div id="messagenews">
	<%@ include file="../includes/tips.jsp"%>
	<ul>
	<li>Manage here your various account information.</li>
	<li>Leave the password fields blank if you don't want to change them.</li>
	</ul>
	</div>
	--><br/>
	
	<div id="messageadd">
	</div>

<%@ include file="../includes/adminfooter.jsp"%>
</div>
</body>
</html>