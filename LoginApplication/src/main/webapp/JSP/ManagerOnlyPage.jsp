<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>This page is only accessible to Manager</title>
</head>
<% //In case, if Manager session is not set, redirect to Login page
if((request.getSession(false).getAttribute("Manager")== null) )
{
%>
<script>
   alert("You are not a manager. 你不是经理。");
   window.location= "Login.jsp";
</script>
<%}%>

<body>

<div class="langs">
<a href="?locale=en_US">English</a> |
<a href="?locale=zh_CN">中文</a>
<fmt:setLocale value="${param.locale}"/>
</div>

<center><h2><fmt:bundle basename="I18N/page">
	<fmt:message key = "manageronlylabel1.msg"></fmt:message>
	</fmt:bundle></h2></center>
	
<fmt:bundle basename="I18N/page">
	<fmt:message key = "manageronlylabel2.msg"></fmt:message>
	</fmt:bundle><%=request.getSession(false).getAttribute("Manager")%>
	
<center><fmt:bundle basename="I18N/page">
	<fmt:message key = "manageronlylabel3.msg"></fmt:message>
	</fmt:bundle></center>
	
<br/>
<button type="button" name="back" onclick="history.back()"><fmt:bundle basename="I18N/page">
	<fmt:message key = "manageronlylabel4.msg"></fmt:message>
	</fmt:bundle></button>
	
</body>
</html>