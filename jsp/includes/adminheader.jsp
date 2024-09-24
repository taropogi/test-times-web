<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="FCK" uri="http://java.fckeditor.net"%>
<%@ taglib prefix="un" uri="http://jakarta.apache.org/taglibs/unstandard-1.0" %> 
<%@ taglib prefix="ct" uri="http://devsphere.com/articles/calltag/CallTag.tld" %>

<un:useConstants className="com.ivant.cms.entity.type.SalesOrderStatus" var="SalesOrderStatus" />
<un:useConstants className="com.ivant.cms.entity.type.CMSUserTypes" var="CMSUserTypes" />

<c:set var="cmsusertype" value="${userloggedin.usertype}" />

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Ivant Technologies Content Management System</title>
	<link href="css/style_red.css" rel="stylesheet" type="text/css" />
	<link href="css/admin.css" rel="stylesheet" type="text/css" />	
<%--	<script type="text/javascript" src="javascripts/scriptaculous.js"></script>
	<script type="text/javascript" src="javascripts/prototype.js"></script>
--%>
</head>